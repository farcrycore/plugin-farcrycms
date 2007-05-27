<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2003, http://www.daemon.com.au $
$License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php$

|| VERSION CONTROL ||
$Header: /cvs/farcry/farcry_mollio/webskin/dmEvent/displayTeaserTypeB.cfm,v 1.1 2006/04/04 06:03:54 gstewart Exp $
$Author: gstewart $
$Date: 2006/04/04 06:03:54 $
$Name:  $
$Revision: 1.1 $

|| DESCRIPTION || 
$Description: teaser template
|| DEVELOPER ||
$Developer: Gavin Stewart (gavin@daemon.com.au)$
--->
<!--- @@displayname: b.h3 level heading inside a "featurebox" --->
<!--- @@author: Gavin Stewart (gavin@daemon.com.au)--->

 <cfsetting enablecfoutputonly="yes">

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">
<cfimport taglib="/farcry/core/tags/widgets" prefix="widge">
<!--- get nav parent --->
<cfoutput>
<div class="featurebox">
	<h3>#stObj.Title#</h3>
	<p>
	#stObj.Teaser#
	</cfoutput><skin:buildLink objectid="#stObj.objectid#" class="morelink"><cfoutput>More<span>about:#stObj.Title#</span></cfoutput></skin:buildLink><cfoutput>
	</p>
</div>
</cfoutput>
<cfsetting enablecfoutputonly="no">
