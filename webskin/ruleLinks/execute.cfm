<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: ruleLinks execute --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />


<cfparam name="request.mode.lValidStatus" default="approved">


<!--- If Archive: Get Maximum Rows in New Table --->
<cfif stObj.bArchive>
	<cfquery datasource="#arguments.dsn#" name="qCount">
		SELECT count(objectID) as total
		FROM #application.dbowner#dmLink
	</cfquery>
	<cfset maximumRows = qCount.total>
<cfelse>
	<cfset maximumRows = stObj.numItems>
</cfif>

<!--- check if filtering by categories --->
<cfif len(trim(stobj.metadata))>

	<cfset oCat = createObject("component", "farcry.core.packages.types.category") />
	<cfset q = oCat.getDataQuery(lCategoryIDs="#stObj.metadata#"
		,typename="dmLink"
		,maxRows="#maximumRows#"
		,bMatchAll="#stobj.bMatchAllKeywords#"
		,sqlWhere=""
		,sqlOrderBy="title asc"
		) />

<cfelse>
	<!--- don't filter on categories --->
	<cfquery datasource="#arguments.dsn#" name="q" maxrows="#maximumRows#">
		SELECT objectid
		FROM #application.dbowner#dmLink
		WHERE status IN ('#ListChangeDelims(request.mode.lValidStatus,"','",",")#')
		ORDER BY title asc
	</cfquery>
</cfif>



<cfif len(trim(stObj.intro)) AND q.recordCount>
	<cfoutput>#stObj.intro#</cfoutput>
</cfif>

<cfif stObj.bArchive>
	<!--- THIS MEANS PAGINATE --->
	<ft:pagination 
		paginationID="ruleLinks"
		qRecordSet="#q#"
		typename="dmLink"
		pageLinks="10"
		recordsPerPage="#stobj.numitems#" 
		Top="true" 
		Bottom="false"
		renderType="inline"> 
	
		<ft:paginateLoop r_stObject="st" >
			<skin:view objectid="#st.objectid#" typename="dmLink" webskin="#stObj.displaymethod#" />
		</ft:paginateLoop>
		
	</ft:pagination>

<cfelse>

	<cfloop query="q">
		<skin:view objectid="#q.objectid#" typename="dmLink" webskin="#stObj.displaymethod#" />
	</cfloop>
	

</cfif>

<cfif len(trim(stObj.suffix)) AND q.recordCount>
	<cfoutput>#stObj.suffix#</cfoutput>
</cfif>

<cfsetting enablecfoutputonly="false" />