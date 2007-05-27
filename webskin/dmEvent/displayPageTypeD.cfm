<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2003, http://www.daemon.com.au $
$License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php$

|| VERSION CONTROL ||
$Header: /cvs/farcry/farcry_mollio/webskin/dmEvent/displayPageTypeD.cfm,v 1.1 2006/04/04 06:03:54 gstewart Exp $
$Author: gstewart $
$Date: 2006/04/04 06:03:54 $
$Name:  $
$Revision: 1.1 $

|| DESCRIPTION || 
$Description: dmHTML -- landing page $
$TODO: $

|| DEVELOPER ||
$Developer: Ben Bishop (ben@daemon.com.au) $
--->
<!--- @@displayname: d.2 columns - Main + Right Sidebar --->
<!--- @@author: Gavin Stewart --->
<cfsetting enablecfoutputonly="yes">

<cfimport taglib="/farcry/core/tags/container" prefix="con">
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cfmodule template="/farcry/projects/#application.applicationname#/webskin/includes/dmHeader.cfm"
	layoutClass="type-d"
	pageTitle="#stObj.title#">

<cfoutput>
	<div id="content">
		<div id="breadcrumb">
			</cfoutput><skin:breadcrumb separator=" / "><cfoutput>
		</div>
		<h1>#stObj.title#</h1>
		<p>
		<strong>Where:</strong> #stObj.location#<br />
		<strong>When:</strong> #dateformat(stobj.startDate)# #timeformat(stobj.startDate)#<cfif year(stObj.endDate) neq 2050> <!--- hack to see if event has expire date aka y2050 bug :) --->until #dateformat(stObj.endDate)# #timeformat(stObj.endDate)#</cfif>
		</p>
			#stObj.body#
		</cfoutput>
		<con:container label="#stobj.objectID#_bottom">
		<cfinclude template="/farcry/projects/#application.applicationname#/webskin/includes/dmUtility.cfm">	
		<cfinclude template="/farcry/projects/#application.applicationname#/webskin/includes/dmSideBar.cfm">					
		<cfoutput>
	</div>		
</cfoutput>
<cfmodule template="/farcry/projects/#application.applicationname#/webskin/includes/dmFooter.cfm">
<cfsetting enablecfoutputonly="no">