<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2003, http://www.daemon.com.au $
$License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php$

|| VERSION CONTROL ||
$Header: /cvs/farcry/farcry_mollio/webskin/dmNews/displayPageTypeA.cfm,v 1.1 2006/04/04 06:03:54 gstewart Exp $
$Author: gstewart $
$Date: 2006/04/04 06:03:54 $
$Name:  $
$Revision: 1.1 $

|| DESCRIPTION || 
$Description: template for home page
|| DEVELOPER ||
$Developer: Gavin Stewart (gavin@daemon.com.au)$
--->
<!--- @@displayname: a.1 column --->
<!--- @@author: Gavin Stewart (gavin@daemon.com.au)--->

 <cfsetting enablecfoutputonly="yes">

<!--- tag libraries --->
<cfimport taglib="/farcry/core/tags/container" prefix="con">
<!--- header --->
<cfmodule template="/farcry/#application.applicationname#/webskin/includes/dmHeader.cfm"
	layoutClass="type-a"
	pageTitle="#stObj.title#">

<cfoutput>	
	<div id="content">
	
	<h1>#stObj.title#</h1>
		#stObj.body#
		 </cfoutput><con:container label="#stobj.objectID#_bottom">
		 <!--- bottom util nav --->
		<cfinclude template="/farcry/#application.applicationname#/webskin/includes/dmUtility.cfm">
	<cfoutput>						
	</div>		
</cfoutput>
<!--- footer --->
<cfmodule template="/farcry/#application.applicationname#/webskin/includes/dmFooter.cfm">
<cfsetting enablecfoutputonly="no">