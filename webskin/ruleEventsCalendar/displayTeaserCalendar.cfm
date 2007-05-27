<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2003, http://www.daemon.com.au $
$License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php$

|| VERSION CONTROL ||
$Header: /cvs/farcry/farcry_mollio/webskin/dmEvent/displayTeaserCalendar.cfm,v 1.1 2006/04/04 06:03:54 gstewart Exp $
$Author: gstewart $
$Date: 2006/04/04 06:03:54 $
$Name:  $
$Revision: 1.1 $

|| DESCRIPTION || 
$Description: Calendar Template
|| DEVELOPER ||
$Developer: Gavin Stewart (gavin@daemon.com.au)$
--->
<!--- @@displayname: Calendar --->
<!--- @@author: Gavin Stewart (gavin@daemon.com.au)--->

 <cfsetting enablecfoutputonly="yes">

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cfparam name="arguments.stParam" default="#structNew()#" />

<cfset earliestyear = year(now())>

<cfoutput>
<script language="javascript">
	function changedate(){
		var mymonth=document.calendarform.month.options[document.calendarform.month.selectedIndex].value;
		var myyear=document.calendarform.year.options[document.calendarform.year.selectedIndex].value;
		window.location="?objectid=#url.Objectid#&year="+myyear+"&month="+mymonth;
	}
</script>
</cfoutput>
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
		<form name="calendarform">
		<th colspan="7">
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
		</th>
		</form>
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
									<em><span class="title"><a href="#application.url.conjurer#?objectid=#qDayEvents.objectid#">#qDayEvents.title#</a></span>
									<span class="loc">#qDayEvents.location#</span></em>	
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