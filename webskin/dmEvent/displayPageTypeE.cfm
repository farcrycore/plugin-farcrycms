<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2003, http://www.daemon.com.au $
$License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php$

|| VERSION CONTROL ||
$Header: /cvs/farcry/farcry_mollio/webskin/dmEvent/displayPageTypeE.cfm,v 1.1 2006/04/04 06:03:54 gstewart Exp $
$Author: gstewart $
$Date: 2006/04/04 06:03:54 $
$Name:  $
$Revision: 1.1 $

|| DESCRIPTION || 
$Description: Template for Landing Page
|| DEVELOPER ||
$Developer: Gavin Stewart (gavin@daemon.com.au)$
--->
<!--- @@displayname: e.2 columns - Main + Right hand nav --->
<!--- @@author: Gavin Stewart (gavin@daemon.com.au)--->

<cfsetting enablecfoutputonly="yes">

<cfimport taglib="/farcry/core/tags/container" prefix="con">
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cfmodule template="/farcry/#application.applicationname#/webskin/includes/dmHeader.cfm"
	layoutClass="type-e"
	pageTitle="#stObj.title#">

<cfoutput>	
	<div id="content">
		<div id="breadcrumb">
			</cfoutput><skin:breadcrumb separator=" / "><cfoutput>
		</div>
		<div id="utility">
		</cfoutput>
		<!--- secondary navigation --->
		<skin:genericNav navID="#request.navid#"
                functionArgs="status=""#request.mode.lvalidstatus#"""
                id="nav-secondary"
                startlevel="3"
                bActive="true">
		<cfoutput>
		</div>
		<h1>#stObj.title#</h1>
		<p>
		<strong>Where:</strong> #stObj.location#<br />
		<strong>When:</strong> #dateformat(stobj.startDate)# #timeformat(stobj.startDate)#<cfif year(stObj.endDate) neq 2050> <!--- hack to see if event has expire date aka y2050 bug :) --->until #dateformat(stObj.endDate)# #timeformat(stObj.endDate)#</cfif>
		</p>
			#stObj.body#
		</cfoutput>
		<con:container label="#stobj.objectID#_bottom">
		<cfinclude template="/farcry/#application.applicationname#/webskin/includes/dmUtility.cfm">									
		<cfoutput>
	</div>		
</cfoutput>
<cfmodule template="/farcry/#application.applicationname#/webskin/includes/dmFooter.cfm">
<cfsetting enablecfoutputonly="no">
	