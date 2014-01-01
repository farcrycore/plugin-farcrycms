<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: Daemon Pty Limited 2002-2013, http://www.daemon.com.au --->
<!--- @@displayname: XML Feed Rule execute --->
<!--- @@Cachestatus: 1 --->
<!--- @@cachetimeout: 15 --->

<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cftry>
	<!--- go get the feed --->
	<cffeed action="read" source="#stObj.xmlFeedURL#" name="stFeed">

	<!--- set maximum rows --->
	<cfset maxItems = arrayLen(stFeed.item)>
	<cfif maxItems gt stobj.maxRecords>
		<cfset maxItems = stobj.maxRecords>
	</cfif>

	<!--- Display the feed --->
	<cfoutput>
		<div class="feed">
			#stObj.intro#
				<!--- <cfdump var="#stfeed.item[1]#"> --->
	</cfoutput>

	<!--- loop over teaser view: allows display to be overridden in the project --->
	<cfloop from="1" to="#maxItems#" index="i">
		<skin:view stobject="#stobj#" webskin="displayTeaserStandard" item="#stFeed.item[i]#" />
	</cfloop>

	<cfoutput>
		</div>
	</cfoutput>

	<cfcatch type="any">
		<cfoutput>
			<div class="alert alert-error">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<h4>Problem with RSS Feed: #stobj.XMLFeedURL#</h4>
			#cfcatch.message# 
			</div>
		</cfoutput>
	</cfcatch>
</cftry>

<cfsetting enablecfoutputonly="false" />