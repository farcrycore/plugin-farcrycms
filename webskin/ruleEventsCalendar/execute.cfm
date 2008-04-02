<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Events calendar rule execute --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />



<cfif len(trim(stobj.metadata))>

	<cfset oCat = createObject("component", "farcry.core.packages.types.category") />
	<cfset q = oCat.getDataQuery(lCategoryIDs="#stObj.metadata#"
		,typename="dmEvent"
		,bMatchAll="#stobj.bMatchAllKeywords#"
		,lFields="title, location, startDate, endDate"
		,sqlWhere="publishdate <= #now()# and expirydate >= #now()#"
		,sqlOrderBy="startDate ASC, label ASC"
		) />

<cfelse>
	<!--- don't filter on categories --->
	<cfquery datasource="#arguments.dsn#" name="q">
		SELECT objectid, title, location, startDate, endDate
		FROM #application.dbowner#dmEvent
		WHERE status IN ('#ListChangeDelims(request.mode.lValidStatus,"','",",")#')
		AND publishdate <= #now()#
		AND expirydate >= #now()#
		ORDER BY startDate ASC, label ASC
	</cfquery>
</cfif>


<cfif len(trim(stObj.intro)) AND qGetEvents.recordCount>
	#stObj.intro#
</cfif>

<cfif q.recordcount>
	<skin:view objectid="#stObj.objectid#" webskin="#stObj.displaymethod#" aEvents="#arrayNew(1)#" qEvents="#q#" />
</cfif>

<cfsetting enablecfoutputonly="false" />