<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2003, http://www.daemon.com.au $
$License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php$

|| VERSION CONTROL ||
$Header: /cvs/farcry/farcry_mollio/webskin/dmFacts/displayTeaserTypeA.cfm,v 1.1 2006/04/04 06:03:54 gstewart Exp $
$Author: gstewart $
$Date: 2006/04/04 06:03:54 $
$Name:  $
$Revision: 1.1 $

|| DESCRIPTION || 
$Description: teaser template
|| DEVELOPER ||
$Developer: Gavin Stewart (gavin@daemon.com.au)$
--->
<!--- @@displayname: a.Headline and associate teaser and thumbnail --->
<!--- @@author: Gavin Stewart (gavin@daemon.com.au)--->

 <cfsetting enablecfoutputonly="yes">

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">
<cfimport taglib="/farcry/core/tags/widgets" prefix="widge">

<cfoutput>
<h4>#stObj.Title#</h4>
<p>
</cfoutput>
	<cfif isdefined("stObj.imageID") and len(stObj.imageID)>
	<cfoutput>
	<span class="thumbnail">
		</cfoutput>
	         <widge:imageDisplay objectid="#stObj.imageID#" alt="#stObj.title#" ImageSize="thumb" bFailToTitle="false">
	    <cfoutput>
	</span>
	</cfoutput>
	</cfif>
	<cfoutput>
	#stObj.Body#
</p>
</cfoutput>
<cfsetting enablecfoutputonly="no">
