<cfsetting enablecfoutputonly="yes">
<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2003, http://www.daemon.com.au $
$License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php$

|| VERSION CONTROL ||
$Header: /home/cvsuser/cvs/agora/webskin/dmEvent/displayTeaserCalendarSmall.cfm,v 1.2 2003/06/27 04:54:04 brendan Exp $
$Author: brendan $
$Date: 2003/06/27 04:54:04 $
$Name: HEAD $
$Revision: 1.2 $

|| DESCRIPTION || 
$Description: dmEvent -- calendar listing$
$TODO: $

|| DEVELOPER ||
$Developer: Brendan Sisson (brendan@daemon.com.au) $
--->
<!--- @@displayname: Small Calendar --->
<!--- @@author: Brendan Sisson --->

<cfimport taglib="/farcry/farcry_core/tags/webskin" prefix="skin">

<!--- work out position in aInvocations --->
<cfloop from="1" to="#arrayLen(request.aInvocations)#" index="num">
	<cfif isStruct(request.aInvocations[num]) and structKeyExists(request.aInvocations[num],"stEvents")>
		<cfset ruleLocation = num>
		<cfbreak>
	</cfif>
</cfloop>

<!--- set up base table --->
<cfoutput>
<table border="0" cellpadding="10" cellspacing="10">
<tr>
</cfoutput>

<!--- loop over number of months to display --->
<cfloop from="0" to="#request.aInvocations[ruleLocation].months-1#" index="displayMonth">
	<!--- work out year and month --->
	<cfset month = "#Month(dateadd("m",displayMonth,now()))#">
	<cfset year = "#Year(dateadd("m",displayMonth,now()))#">

	<!---Find the start day  the month--->
	<cfset start_day = DayOfWeek(createdate("#year#","#month#","1"))>
	
	<!---Find the total no of days in the month--->
	<cfset total_days_in_month = DaysInMonth(createdate("#year#","#month#","1"))>
	
	<!---Find the end day of the month--->
	<cfset end_day = DayOfWeek(createdate("#year#","#month#","#total_days_in_month#"))>
	
	<!--- show calendar --->
	<cfoutput><td>
	<table id="calendar" cellspacing="0">
		<tr id="title">
			<th id="thismonth" align=center colspan=7>#monthasstring(month)#</th>
		</tr>
		<!--- show days of week --->
		<tr id="days">
			<cfloop from="1" to="7" index="d">
				<th class="#lcase(left(dayofweekasstring(d),3))#"><cfoutput>#left(dayofweekasstring(d),3)#</cfoutput></th>
			</cfloop>
		</tr>
		</cfoutput>
		<cfset week_day = start_day>
		<cfset display_day = 1>
		<cfset week=1>
		<!--- loop through calendar month --->
		<cfloop condition = "#display_day# LTE #total_days_in_month#">
			<!--- check if first or last week --->
			<cfoutput><tr <cfif week eq 1>id="firstWeek"<cfelseif total_days_in_month-display_day lt 7>id="lastweek"</cfif>></cfoutput>
				<!--- loop through week --->
				<cfloop condition = "#week_day# LTE 7">
					<cfloop condition = "#start_day# NEQ 1">
						<!--- date is in previous month --->
						<cfoutput><td class="#lcase(left(dayofweekasstring(week_day),3))# prevMonth small">&nbsp;</td></cfoutput>
						<cfset start_day = start_day - 1>
					</cfloop>
					<cfif display_day LTE total_days_in_month>
						<cfset currentDate = DateFormat(createdate("#year#","#month#","#display_day#"))>
						<!--- check for event --->
						<cfset eventDisplayed = 0>
						<cfset eventTitles = "">
						<cfloop collection="#request.aInvocations[ruleLocation].stEvents#" item="eventItem">
							<cfif dateFormat(request.aInvocations[ruleLocation].stEvents[eventItem].eventDate) eq currentDate>
								<!--- check if first event for day --->
								<cfif len(eventTitles)>
									<cfset eventTitles = eventTitles & "#chr(13)##chr(13)##request.aInvocations[ruleLocation].stEvents[eventItem].title##chr(13)##request.aInvocations[ruleLocation].stEvents[eventItem].location#">
								<cfelse>
									<cfset eventTitles = eventTitles & "#request.aInvocations[ruleLocation].stEvents[eventItem].title##chr(13)##request.aInvocations[ruleLocation].stEvents[eventItem].location#">
								</cfif>
								<cfset eventDisplayed = 1>
							</cfif>
						</cfloop>
						<!--- check if display day as event or empty --->
						<cfif eventDisplayed>
							<!--- change background colour and display event details as rollovers --->
							<cfoutput><td class="#lcase(left(dayofweekasstring(week_day),3))# small" <cfif currentdate eq dateformat(now())>id="today"</cfif> nowrap title="#eventTitles#" style="background-color:##ffcc99"></cfoutput>
						<cfelse>
							<!--- empty day --->
							<cfoutput><td class="#lcase(left(dayofweekasstring(week_day),3))# small" <cfif currentdate eq dateformat(now())>id="today"</cfif> nowrap></cfoutput>
						</cfif>
							<!--- display date --->
							<cfoutput><div class="date">#display_day#</div>
						</td></cfoutput>
					<cfelse>
						<cfloop condition="#end_day# NEQ 7">
							<!--- date is in next month --->
							<cfset end_day = end_day + 1>
							<cfoutput><td class="#lcase(left(dayofweekasstring(end_day),3))# nextMonth,small">&nbsp;</td></cfoutput>
						</cfloop>	
					</cfif>
					<cfset week_day = week_day + 1>
					<cfset display_day = display_day + 1>
				</cfloop>
			<cfoutput></tr></cfoutput>
			<cfset week_day = 1>
			<cfset week = week + 1>
		</cfloop>
	<cfoutput>
	</table>
	<p></p>
	</td></cfoutput>
		
	<!--- need to start a new row? --->
	<cfif evaluate(displayMonth+1) mod 3 eq 0>
		<cfoutput></tr><tr></cfoutput>
	</cfif>
	
</cfloop>

<!--- close table --->
<cfoutput>
</tr>
</table>
</cfoutput>

<cfsetting enablecfoutputonly="no">