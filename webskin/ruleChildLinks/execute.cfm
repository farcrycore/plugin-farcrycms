<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Display page child links --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfset oNav = CreateObject("component", application.stcoapi.dmNavigation.packagepath) /> 


<!--- assumes existance of request.navid  --->
<cfparam name="request.navid">


<!--- get the children of this object --->
<cfset qGetChildren = application.factory.oTree.getChildren(objectid=request.navid) />

<!--- if the intro text exists - append to aInvocations to be output as HTML --->
<cfif len(stObj.intro) GT 0>
	<cfoutput>#stObj.intro#</cfoutput>
</cfif>

<cfif qGetChildren.recordcount GT 0>
	<!--- loop over children --->
	<cfloop query="qGetChildren">
	
		<!--- get child nav details --->
		
		<!--- <q4:contentobjectget objectid="#qGetChildren.objectID#" r_stobject="stCurrentNav"> --->
		<cfset stCurrentNav = oNav.getData(objectid=qGetChildren.objectID) />
		
		<!--- check for sim link --->
		<cfif len(stCurrentNav.externalLink)>
			<!--- get sim link details --->
			<cftry>
				<cfset stCurrentNav = oNav.getData(objectid=stCurrentNav.externalLink) />
				<!--- <q4:contentobjectget objectid="#stCurrentNav.externalLink#" r_stobject="stCurrentNav"> --->
				<cfcatch></cfcatch>
			</cftry>
		</cfif>
		
		<cfquery datasource="#application.dsn#" name="qNavPages">
		SELECT * FROM dmNavigation_aObjectIDs
		where parentid = '#stCurrentNav.objectid#'
		order by seq
		</cfquery>
		<!--- loop over child/sim link nav node --->	
		<cfloop query="qNavPages">
			<cfset o = createObject("component", application.stcoapi[qNavPages.typename].packagepath) />
			<cfset stObjTemp = o.getData(objectid=qNavPages.data) />				
			<!--- <q4:contentobjectget objectid="#stCurrentNav.aObjectIds[idIndex]#" r_stobject="stObjTemp"> --->
			
			<!--- request.lValidStatus is approved, or draft, pending, approved in SHOWDRAFT mode --->
			<cfif StructKeyExists(stObjTemp,"status") AND ListContains(request.mode.lValidStatus, stObjTemp.status) AND StructKeyExists(stObjTemp,"displayMethod")>
			
				<!--- if in draft mode grab underlying draft page --->			
				<cfif IsDefined("stObjTemp.versionID") AND request.mode.showdraft>
					<cfquery datasource="#application.dsn#" name="qHasDraft">
						SELECT objectID,status from #application.dbowner##stObjTemp.typename# where versionID = '#stObjTemp.objectID#' 
					</cfquery>
					
					<cfif qHasDraft.recordcount gt 0>
						<cfset stObjTemp = o.getData(objectid=qHasDraft.objectid) />
					</cfif>
				</cfif>
				<!--- <cfdump var="#stObjTemp#" /><cfexit /> --->
				<skin:view stObject="#stObjTemp#" webskin="#stObj.displaymethod#" />

				<cfbreak>
			</cfif>
		</cfloop>
		
		
	</cfloop>
	
</cfif>

<cfsetting enablecfoutputonly="false" />