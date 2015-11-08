<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: Daemon Pty Limited 2002-2013, http://www.daemon.com.au --->
<!--- @@displayname: News Rule --->

<!--- import tag library --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<!--- environment variables --->
<cfparam name="request.mode.lValidStatus" default="approved">


<!--- If paginated archive: Get Maximum Rows in New Table --->
<cfif stObj.bArchive>
	<cfquery datasource="#application.dsn#" name="qCount">
		SELECT count(objectID) as total
		FROM #application.dbowner#dmNews
	</cfquery>
	<cfset maximumRows = qCount.total>
<cfelse>
	<cfset maximumRows = stObj.numItems>
</cfif>

<!--- check if filtering by categories --->
<cfif not len(trim(stobj.metadata))><!--- don't filter on categories --->
	<cfset q=application.fapi.getContentObjects(typename="dmNews", publishdate_lte=now(), expirydate_gte=now(), orderby="publishdate DESC",maxRows=maximumRows)>
<cfelseif stobj.bMatchAllKeywords><!--- require all categories --->
	<cfset q=application.fapi.getContentObjects(typename="dmNews", publishdate_lte=now(), expirydate_gte=now(), catNews_eq=stObj.metadata, orderby="publishdate DESC",maxRows=maximumRows)>
<cfelse><!--- any categories --->
	<cfset q=application.fapi.getContentObjects(typename="dmNews", publishdate_lte=now(), expirydate_gte=now(), catNews_in=stObj.metadata, orderby="publishdate DESC",maxRows=maximumRows)>
</cfif>


<!--- show introduction if available --->
<cfif len(trim(stObj.intro)) AND q.recordCount>
	<cfoutput>#stObj.intro#</cfoutput>
</cfif>


<!--- THIS MEANS PAGINATE --->
<skin:pagination 
	query="#q#" typename="dmNews" 
	r_stObject="stNews" paginationID="ruleNews" 
	recordsPerPage="#stObj.numItems#" pageLinks="#stObj.numPages#">
	<skin:view objectID="#stNews.objectID#" typename="dmNews" webskin="#stObj.displaymethod#" />
</skin:pagination>


<!--- show suffix if available --->
<cfif len(trim(stObj.suffix)) AND q.recordCount>
	<cfoutput>#stObj.suffix#</cfoutput>
</cfif>

<cfsetting enablecfoutputonly="false" />