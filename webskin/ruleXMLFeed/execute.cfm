<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: XML Feed Rule execute --->

<!--- go get the feed --->
<cfhttp url="#stObj.xmlFeedURL#" method="get" throwonerror="yes" timeout="10" />

<cfset rss = createobject("component", "#application.packagepath#.farcry.rss") />
<cfset aItems = rss.getItemsAsArray(cfhttp.filecontent) />
<cfset count = arrayLen(aItems) />
<cfif count gt stobj.maxrecords>
	<cfset count = stobj.maxrecords />
</cfif>

<!--- Display the feed --->
<cfoutput>
	<div class="xmlfeed">
		#stObj.intro#
</cfoutput>

<cfloop from="1" to="#count#" index="i">
	<cfoutput>
		<div class="xmlitem">
			<a href="#aItems[i].link#">#aItems[i].title#</a> #application.thisCalendar.i18nDateFormat(aItems[i]["dc:date"],session.dmProfile.locale,application.longF)# 
			<br />
			#aItems[i].description#
		</div>
	</cfoutput>
</cfloop>

<cfoutput>
	</div>
</cfoutput>

<cfsetting enablecfoutputonly="false" />