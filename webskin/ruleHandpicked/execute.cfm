<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: Daemon Pty Limited 2002-2013, http://www.daemon.com.au --->
<!--- @@displayname: Handpicked Rule --->

<!--- import tag library --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />


<cfif arrayLen(stobj.aObjects)>
	<cfloop from="1" to="#arrayLen(stobj.aObjects)#" index="i">
		<cfset viewObjectid = stobj.aObjects[i].data />
		<cfif request.mode.showdraft>
			<cfset stobject = application.fapi.getContentObject(objectid=stobj.aObjects[i].data, typename=stobj.aObjects[i].typename)>

		 	<cfif structKeyExists(stObject,"status") AND structKeyExists(application.stcoapi[stObject.typename],"versionID")>
				<cfquery datasource="#application.dsn#" name="qHasDraft">
					SELECT objectID,status from #application.dbowner##stObject.typename# where versionID = '#stObject.objectID#'
				</cfquery>
				<cfif qHasDraft.recordcount gt 0>
					<cfset stDraftObject = application.fapi.getContentObject(objectid=qHasDraft.objectid, typename=qHasDraft.typename)>

					<!--- pass draft objectid to view --->
					<cfset viewObjectid = stDraftObject.objectid />
				</cfif>
			</cfif>
		</cfif>

		<skin:view objectID="#viewObjectid#" typename="#stobj.aObjects[i].typename#" webskin="#stobj.aObjects[i].webskin#" alternateHTML="<p>WEBSKIN NOT AVAILABLE</p>" />

	</cfloop>
</cfif>

<cfsetting enablecfoutputonly="false" />