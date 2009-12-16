<cfsetting enablecfoutputonly="true" />
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
<!--- @@displayname: ruleLinks execute --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />


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
	
	<skin:pagination 
		paginationID="ruleLinks"
		qRecordSet="#q#"
		typename="dmLink"
		pageLinks="10"
		recordsPerPage="#stobj.numitems#" 
		Top="true" 
		Bottom="false"
		renderType="inline"
		r_stObject="st"> 
	
		<skin:view objectid="#st.objectid#" typename="dmLink" webskin="#stObj.displaymethod#" />
		
	</skin:pagination>

<cfelse>

	<cfloop query="q">
		<skin:view objectid="#q.objectid#" typename="dmLink" webskin="#stObj.displaymethod#" />
	</cfloop>
	

</cfif>

<cfif len(trim(stObj.suffix)) AND q.recordCount>
	<cfoutput>#stObj.suffix#</cfoutput>
</cfif>

<cfsetting enablecfoutputonly="false" />