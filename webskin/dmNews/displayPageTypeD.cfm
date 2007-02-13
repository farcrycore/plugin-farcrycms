<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2003, http://www.daemon.com.au $
$License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php$

|| VERSION CONTROL ||
$Header: /cvs/farcry/farcry_mollio/webskin/dmNews/displayPageTypeD.cfm,v 1.1 2006/04/04 06:03:54 gstewart Exp $
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

<cfmodule template="/farcry/#application.applicationname#/webskin/includes/dmHeader.cfm"
	layoutClass="type-d"
	pageTitle="#stObj.title#">

<cfoutput>
	<div id="content">
		<div id="breadcrumb">
			</cfoutput><skin:breadcrumb separator=" / "><cfoutput>
		</div>
		<h1>#stObj.title#</h1>
			#stObj.body#
		</cfoutput>
		<con:container label="#stobj.objectID#_bottom">
		<cfinclude template="/farcry/#application.applicationname#/webskin/includes/dmUtility.cfm">	
		<cfinclude template="/farcry/#application.applicationname#/webskin/includes/dmSideBar.cfm">					
		<cfoutput>
	</div>		
</cfoutput>
<cfmodule template="/farcry/#application.applicationname#/webskin/includes/dmFooter.cfm">
<cfsetting enablecfoutputonly="no">