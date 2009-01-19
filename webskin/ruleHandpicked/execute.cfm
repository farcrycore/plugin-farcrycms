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
<!--- @@displayname: Handpicked rule execute --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />
<cfimport taglib="/farcry/core/packages/fourq/tags/" prefix="q4">

<cfif arrayLen(stobj.aObjects)>
	<cfloop from="1" to="#arrayLen(stobj.aObjects)#" index="i">
		<cfset viewObjectid = stobj.aObjects[i].data />
		<cfif request.mode.showdraft>
			<q4:contentobjectget objectid="#stobj.aObjects[i].data#" r_stobject="stObject">
		 	<cfif structKeyExists(stObject,"status")>
				<cfquery datasource="#application.dsn#" name="qHasDraft">
					SELECT objectID,status from #application.dbowner##stObject.typename# where versionID = '#stObject.objectID#'
				</cfquery>
				<cfif qHasDraft.recordcount gt 0>
					<q4:contentobjectget objectid="#qHasDraft.objectid#" r_stobject="stDraftObject">
					<!--- pass draft objectid to view --->
					<cfset viewObjectid = stDraftObject.objectid />
				</cfif>
			</cfif>
		</cfif>

		<skin:view objectID="#viewObjectid#" typename="#stobj.aObjects[i].typename#" webskin="#stobj.aObjects[i].webskin#" alternateHTML="<p>WEBSKIN NOT AVAILABLE</p>" />

	</cfloop>
</cfif>

<cfsetting enablecfoutputonly="false" />