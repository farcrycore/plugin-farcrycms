<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2006, http://www.daemon.com.au $
$Community: FarCry CMS http://www.farcrycms.org $
$License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php$

|| VERSION CONTROL ||
$Header: $
$Author: $
$Date: $
$Name:  $
$Revision: $

|| DESCRIPTION || 
$Description: 
ruleChildLinks (FarCry Core)
List teasers for the current nodes children.  Children types are restricted to
dmHTML, dmLink and dmInclude content types.

Known Issues:
Teaser template listing is only from dmHTML.  But dmInclude is also a possible 
child object, so if a method is chosen that is not in dmInclude then it 
fails to display anything.
$

|| DEVELOPER ||
$Developer: Geoff Bowers (modius@daemon.com.au)$

--->

<cfcomponent displayname="Utility: Child Links Rule" extends="farcry.core.packages.rules.rules" 
	hint="List teaser displays for the current navigation folders children.  
		Children content types are restricted to dmHTML, dmLink and dmInclude. 
		This publishing rule is commonly used on section landing pages to 
		build a summary for the pages in the section.">

	<cfproperty name="displayMethod" type="string" hint="Teaser display method to render children links." required="yes" default="displayTeaser" />
	<cfproperty name="intro" hint="Intro text to child link listing; can be any relevant HTML code and content." type="string" required="false" default="" />
	
	<cffunction access="public" name="update" output="true">
		<cfargument name="objectID" required="Yes" type="uuid" default="">
		<cfargument name="label" required="no" type="string" default="">
		<cfset var stLocal = StructNew()> 
		<cfset var stObj = this.getData(arguments.objectid)> 
<cfsetting enablecfoutputonly="true">
		<cfimport taglib="/farcry/core/packages/fourq/tags/" prefix="q4">
		<cfimport taglib="/farcry/core/tags/navajo/" prefix="nj">
		
		<cfif isDefined("form.updateRuleChildLinks")>
			<cfset stObj.displayMethod = form.displayMethod>
			<cfset stObj.intro = form.intro>

			<q4:contentobjectdata typename="#application.rules.ruleChildLinks.rulePath#" stProperties="#stObj#" objectID="#stObj.objectID#">
			<cfset stLocal.successMessage = "#application.adminBundle[session.dmProfile.locale].updateSuccessful#">
		</cfif>
		
		<!--- get all the templates (displayTeaser*) --->
		<nj:listTemplates typename="dmHTML" prefix="displayTeaser" r_qMethods="qDisplayTypes">
		<nj:listTemplates typename="dmInclude" prefix="displayTeaser" r_qMethods="qIncludeDisplayTypes"> 
		<nj:listTemplates typename="dmLink" prefix="displayTeaser" r_qMethods="qLinkDisplayTypes"> 
		

		<!--- Join the two result sets --->
		<cfquery dbtype="query" name="qGetAllTemplates">
		SELECT * FROM qDisplayTypes UNION ALL
		SELECT * FROM qLinkDisplayTypes UNION ALL
		SELECT * FROM qIncludeDisplayTypes
		</cfquery> 
		<!--- Now we filter so we only get those that occur in both directories --->
		<cfquery dbtype="query" name="qGetUniqueTemplates">
		SELECT COUNT(methodName) AS methodCount,methodname,MIN(displayname) as displayname FROM qGetAllTemplates
		GROUP BY methodname
		HAVING methodCount = 3
		</cfquery> 

<cfoutput>
		<form name="editform" action="#cgi.script_name#?#cgi.query_string#" method="post" class="f-wrap-2" style="margin-top:-1.5em">
		<fieldset><cfif qGetUniqueTemplates.recordCount><cfif StructKeyExists(stLocal,"successmessage")>
			<p id="fading1" class="fade"><span class="success">#stLocal.successmessage#</span></p></cfif>
			<label for="displayMethod"><b>#application.adminBundle[session.dmProfile.locale].selectDisplayMethod#</b>			
				<select id="displayMethod" name="displayMethod"><cfloop query="qGetUniqueTemplates">
						<option value="#qGetUniqueTemplates.methodName#" <cfif qGetUniqueTemplates.methodName EQ stObj.displayMethod> selected="selected"</cfif>>#qGetUniqueTemplates.displayName#</option></cfloop>
				</select><br />
			</label>
			
			<label for="intro"><b>#application.adminBundle[session.dmProfile.locale].introText#</b>
				<textarea id="intro" name="intro">#stObj.intro#</textarea><br />
			</label>

		</fieldset>

		<div class="f-submit-wrap">
			<input type="Submit" name="updateRuleChildLinks" value="#application.adminBundle[session.dmProfile.locale].go#" class="f-submit" />		
		</div>
		
		<input type="hidden" name="ruleID" value="#stObj.objectID#"><cfelse>
		<fieldset>
			<p id="fading1" class="fade"><span class="error">#application.adminBundle[session.dmProfile.locale].atLeastOneCommonDisplay#</span></p>
		</fieldset></cfif>
		</form></cfoutput>
<cfsetting enablecfoutputonly="false">
	</cffunction> 
	
	<cffunction access="public" name="execute" output="true">
		<cfargument name="objectID" required="Yes" type="uuid" default="">
		<cfargument name="dsn" required="false" type="string" default="#application.dsn#">

		<cfset var stObj = this.getData(arguments.objectid)> 
		<cfset var oNav = CreateObject("component", application.stcoapi.dmNavigation.packagepath) /> 
		
		
		<!--- assumes existance of request.navid  --->
		<cfparam name="request.navid">
		
		
		<!--- get the children of this object --->
		<cfset qGetChildren = request.factory.oTree.getChildren(objectid=request.navid) />
		
		<!--- if the intro text exists - append to aInvocations to be output as HTML --->
		<cfif len(stObj.intro) GT 0>
			<cfscript>
				arrayAppend(request.aInvocations,stObj.intro);
			</cfscript>
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
						
						<cfset html =  o.getView(stobject=stObjTemp, template="#stObj.displayMethod#", alternateText="webskin does not exist") />
						<cfset arrayAppend(request.aInvocations,html) />
						<!--- 
						<cfscript>
							// populate the invoke structure for the container
						 	stInvoke = structNew();
							stInvoke.objectID = objID;
							stInvoke.typename = application.types[stObjTemp.typename].typePath;
							stInvoke.method = stObj.displayMethod; // nb. from rule
							// append to aInvocations
							arrayAppend(request.aInvocations,stInvoke);
						</cfscript> --->
						<cfbreak>
					</cfif>
				</cfloop>
				
				
			</cfloop>
			
		</cfif>
		
	</cffunction> 

</cfcomponent>
