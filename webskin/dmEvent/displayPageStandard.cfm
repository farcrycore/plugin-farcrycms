<cfsetting enablecfoutputonly="yes">
<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2003, http://www.daemon.com.au $
$License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php$

|| VERSION CONTROL ||
$Header: /home/cvsuser/cvs/agora/webskin/dmEvent/displayPageStandard.cfm,v 1.3 2006/02/14 23:21:57 daniela Exp $
$Author: daniela $
$Date: 2006/02/14 23:21:57 $
$Name: HEAD $
$Revision: 1.3 $

|| DESCRIPTION || 
$Description: dmEvent -- standard event listing$
$TODO: $

|| DEVELOPER ||
$Developer: Brendan Sisson (brendan@daemon.com.au) $
--->
<!--- @@displayname: Standard Page --->
<!--- @@author: Brendan Sisson --->

<cfimport taglib="/farcry/farcry_core/tags/webskin" prefix="skin">
<cfimport taglib="/farcry/farcry_core/tags/container" prefix="con">

<cfmodule 
	template="/farcry/#application.applicationname#/webskin/includes/agoraHeader.cfm"
	pageTitle="#stObj.title#"
	layoutClass="type-a">

<cfoutput>
<div id="content">
	<div id="breadcrumb">
		</cfoutput><skin:breadcrumb separator=" / " includeSelf=0 here="#stobj.title#"><cfoutput>
	</div>
	<h1>#stObj.Title#</h1>

	
	<strong>Where:</strong> #stObj.location#<br />
	<strong>When:</strong> #dateformat(stobj.startDate)# #timeformat(stobj.startDate)#<cfif year(stObj.endDate) neq 2050> <!--- hack to see if event has expire date aka y2050 bug :) --->until #dateformat(stObj.endDate)# #timeformat(stObj.endDate)#</cfif><br />
	<strong>Details:</strong><br /><br />
	#stObj.Body#

</cfoutput>


<cfinclude template="/farcry/#application.applicationname#/webskin/includes/agoraBottomNav.cfm">
<cfinclude template="/farcry/#application.applicationname#/webskin/includes/agoraFooter.cfm">

<cfsetting enablecfoutputonly="no">