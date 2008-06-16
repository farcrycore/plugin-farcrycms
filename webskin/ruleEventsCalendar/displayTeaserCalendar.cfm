<!--- @@Copyright: Daemon Pty Limited 2002-2008, http://www.daemon.com.au --->
<!--- @@License:
    This file is part of FarCry CMS Plugin.

    FarCry CMS Plugin is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    FarCry CMS Plugin is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with FarCry CMS Plugin.  If not, see <http://www.gnu.org/licenses/>.
--->
<!--- 
|| DESCRIPTION || 
$Description: Calendar Template
|| DEVELOPER ||
$Developer: Gavin Stewart (gavin@daemon.com.au)$
--->
<!--- @@displayname: Calendar --->
<!--- @@author: Gavin Stewart (gavin@daemon.com.au)--->

 <cfsetting enablecfoutputonly="yes">

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">
<cfimport taglib="/farcry/core/tags/extjs" prefix="extjs">

<cfparam name="arguments.stParam" default="#structNew()#" />

<cfset earliestyear = year(now())>

<skin:htmlHead id="calendarchangedateJS">
<cfoutput>
<script language="javascript">
	function changedate(){
		var mymonth=document.calendarform.month.options[document.calendarform.month.selectedIndex].value;
		var myyear=document.calendarform.year.options[document.calendarform.year.selectedIndex].value;
		window.location="?objectid=#url.Objectid#&year="+myyear+"&month="+mymonth;
	}
</script>
</cfoutput>
</skin:htmlHead>

<cfparam name="month" default="#Month(now())#">
<cfparam name="year" default="#Year(now())#">

<!---Find the start day  the month--->
<cfset start_day = DayOfWeek(createdate("#year#","#month#","1"))>

<!---Find the total no of days in the month--->
<cfset total_days_in_month = DaysInMonth(createdate("#year#","#month#","1"))>

<!---Find the end day of the month--->
<cfset end_day = DayOfWeek(createdate("#year#","#month#","#total_days_in_month#"))>

<cfoutput>
<table class="table1 calendar">
	<thead>
		<tr>
		
		<th colspan="7">
			<form name="calendarform" style="margin:0px;">
			<select name="month" onchange="changedate()" size="1"> 
			<cfloop from="1" to="12" index="m">
				<option value="#m#" <cfif month is m> selected="selected"</cfif>>#monthasstring(m)#</option>
			</cfloop>
			</select>		
			<select name="year" onChange="changedate()" size="1">
				<cfloop from="#earliestyear#" to="#year(now())#" index="y">
					<option value="#y#" <cfif year is y> selected="selected"</cfif>>#y#</option>
				</cfloop>
			</select>
			</form>
		</th>
		
		</tr>
		<tr>
			<cfloop from="1" to="7" index="d">
				<th class="thalt">#left(dayofweekasstring(d),3)#</th>
			</cfloop>
		</tr>
	</thead>

	<cfset week_day = start_day>
	<cfset display_day = 1>
	<cfset week=1>

	<tbody>
		<!--- loop through calendar month --->
		<cfloop condition = "#display_day# LTE #total_days_in_month#">
			<!--- check if first or last week --->
			<tr>
				<!--- loop through week --->
				<cfloop condition = "#week_day# LTE 7">
					<cfloop condition = "#start_day# NEQ 1">
						<!--- date is in previous month --->
						<td>&nbsp;</td>
						<cfset start_day = start_day - 1>
					</cfloop>
					<cfif display_day LTE total_days_in_month>
						<cfset currentDate = DateFormat(createdate("#year#","#month#","#display_day#"))>
						<cfif currentdate eq dateformat(now())>
							<td class="#lcase(left(dayofweekasstring(week_day),3))#" id="today">
						 <cfelse>
							<td class="#lcase(left(dayofweekasstring(week_day),3))#">
						</cfif>
							<p><strong>#display_day#</strong>		
							<!--- check for event --->
							
							<cfif arguments.stParam.qEvents.recordCount>				
								<cfquery dbtype="query" name="qDayEvents" result="res">
								SELECT * FROM arguments.stParam.qEvents									
								WHERE startDate <= '#DateFormat(DateAdd("d", 1, currentDate))#'
								AND endDate >= '#currentDate#'
								</cfquery>
								
								<cfloop query="qDayEvents">									
									<cfset eventDisplayed = 1>
									<skin:view objectid="#qDayEvents.objectid#" typename="dmEvent" webskin="displayToolTip" r_html="eventTeaserHTML" />
									<extjs:toolTip toolTip="#eventTeaserHTML#"><em><span class="title"><skin:buildLink objectid="#qDayEvents.objectid#">#qDayEvents.title#</skin:buildLink></span></em></extjs:toolTip>
								</cfloop>
								
							</cfif>
							</p>
						</td>
					<cfelse>
						<cfloop condition="#end_day# NEQ 7">
							<!--- date is in next month --->
							<td>&nbsp;</td>
							<cfset end_day = end_day + 1>
						</cfloop>	
					</cfif>
					<cfset week_day = week_day + 1>
					<cfset display_day = display_day + 1>
				</cfloop>
			</tr>
			<cfset week_day = 1>
			<cfset week = week + 1>
		</cfloop>
	</tbody>
</table>
<p></p>
</cfoutput>

<cfsetting enablecfoutputonly="no">