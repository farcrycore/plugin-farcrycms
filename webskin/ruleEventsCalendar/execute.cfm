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
<!--- @@displayname: Events calendar rule execute --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />



<cfif len(trim(stobj.metadata))>

	<cfset oCat = createObject("component", "farcry.core.packages.types.category") />
	<cfset q = oCat.getDataQuery(lCategoryIDs="#stObj.metadata#"
		,typename="dmEvent"
		,bMatchAll="#stobj.bMatchAllKeywords#"
		,lFields="title, location, startDate, endDate"
		,sqlWhere="publishdate <= #now()# and (expirydate >= #now()# or expirydate is NULL)"
		,sqlOrderBy="startDate ASC, label ASC"
		) />

<cfelse>
	<!--- don't filter on categories --->
	<cfquery datasource="#arguments.dsn#" name="q">
		SELECT objectid, title, location, startDate, endDate
		FROM #application.dbowner#dmEvent
		WHERE status IN ('#ListChangeDelims(request.mode.lValidStatus,"','",",")#')
		AND publishdate <= #now()#
		AND (expirydate >= #now()# or expirydate is NULL)
		ORDER BY startDate ASC, label ASC
	</cfquery>
</cfif>


<cfif len(trim(stObj.intro)) AND q.recordCount>
	#stObj.intro#
</cfif>

<cfif q.recordcount>
	<skin:view objectid="#stObj.objectid#" webskin="#stObj.displaymethod#" aEvents="#arrayNew(1)#" qEvents="#q#" />
</cfif>

<cfsetting enablecfoutputonly="false" />