<cfsetting enablecfoutputonly="true" />

<!--- @@displayname: Tooltip --->
<!--- @@author: Matthew Bryant (mbryant@daemon.com.au)--->

<cfoutput>
<strong>#stObj.Title#</strong><br />
<div>#dateformat(stObj.startDate, "dd mmm yyy")# 
	<cfif showFarcryDate(stobj.endDate)>
		until #dateformat(stObj.endDate, "dd mmm yyy")#
	</cfif>
</div>
<div>#stObj.Teaser#</div>
</cfoutput>

<cfsetting enablecfoutputonly="false" />