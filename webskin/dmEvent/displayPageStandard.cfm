<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: Daemon Pty Limited 1995-2007, http://www.daemon.com.au --->
<!--- @@License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php --->
<!--- @@displayname: Event Page --->
<!--- @@Description: Full page display for an event. --->
<!--- @@Developer: Geoff Bowers (modius@daemon.com.au) --->

<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />
<cfimport taglib="/farcry/core/tags/container" prefix="con" />

<!--- header --->
<cfmodule template="/farcry/projects/#application.applicationname#/webskin/includes/dmHeader.cfm"
	layoutClass="type-a"
	pageTitle="#stObj.title#">

<cfoutput>	
	<div id="content">
	
	<h1>#stObj.title#</h1>
	<p>
	<strong>Where:</strong> #stObj.location#<br />
	<strong>When:</strong> #dateformat(stobj.startDate)# #timeformat(stobj.startDate)#<cfif year(stObj.endDate) neq 2050> <!--- hack to see if event has expire date aka y2050 bug :) --->until #dateformat(stObj.endDate)# #timeformat(stObj.endDate)#</cfif>
	</p>
	#stObj.body#
</cfoutput>
	 
	<!--- bottom container --->
	<con:container label="#stobj.objectID#_bottom">
	 
	 <!--- bottom util nav --->
	<cfinclude template="/farcry/projects/#application.applicationname#/webskin/includes/dmUtility.cfm" />

<cfoutput>						
	</div>		
</cfoutput>
<!--- footer --->
<cfmodule template="/farcry/projects/#application.applicationname#/webskin/includes/dmFooter.cfm" />

<cfsetting enablecfoutputonly="false" />