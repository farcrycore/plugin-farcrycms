<cfsetting enablecfoutputonly="true" />
<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2003, http://www.daemon.com.au $
$License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php$

|| VERSION CONTROL ||
$Header: /home/cvsuser/cvs/agora/webskin/dmNews/displayPageStandard.cfm,v 1.1 2006/02/15 00:15:51 daniela Exp $
$Author: daniela $
$Date: 2006/02/15 00:15:51 $
$Name: HEAD $
$Revision: 1.1 $

|| DESCRIPTION || 
$Description: dmNews -- standard listing $
$TODO: $

|| DEVELOPER ||
$Developer: Daniela Milton (daniela@daemon.com.au) $
--->
<!--- @@displayname: Standard Page --->

<cfimport taglib="/farcry/farcry_core/tags/webskin" prefix="skin">
<cfimport taglib="/farcry/farcry_core/tags/container" prefix="con">

<!--- include standard header --->
<cfmodule 
	template="/farcry/#application.applicationname#/webskin/includes/dmHeader.cfm"
	pageTitle="#stObj.title#"
	layoutClass="type-b">

<cfoutput>
<div id="content">
	<div id="breadcrumb">
		</cfoutput><skin:breadcrumb separator=" / " includeSelf=0 here="#stobj.title#"><cfoutput>
	</div>
	<h1>#stObj.Title#</h1>
	#stObj.Body#
</cfoutput>

<!--- include standard footers --->
<cfinclude template="/farcry/#application.applicationname#/webskin/includes/dmFooter.cfm">

<cfsetting enablecfoutputonly="false" />