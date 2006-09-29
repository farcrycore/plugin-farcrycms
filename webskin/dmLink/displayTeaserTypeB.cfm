<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2003, http://www.daemon.com.au $
$License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php$

|| VERSION CONTROL ||
$Header: /cvs/farcry/farcry_mollio/webskin/dmLink/displayTeaserTypeB.cfm,v 1.2 2006/04/04 06:16:39 gstewart Exp $
$Author: gstewart $
$Date: 2006/04/04 06:16:39 $
$Name:  $
$Revision: 1.2 $

|| DESCRIPTION || 
$Description: teaser template
|| DEVELOPER ||
$Developer: Gavin Stewart (gavin@daemon.com.au)$
--->
<!--- @@displayname: b.h3 level heading inside a "featurebox" --->
<!--- @@author: Gavin Stewart (gavin@daemon.com.au)--->

 <cfsetting enablecfoutputonly="yes">

<cfimport taglib="/farcry/farcry_core/tags/webskin" prefix="skin">
<cfimport taglib="/farcry/farcry_core/tags/widgets" prefix="widge">
<cfoutput>
<div class="featurebox">
	<h3><a href="#stObj.link#" target="_new">#stObj.Title#</a></h3>
	<cfif trim(len(stObj.teaser))>
	<p>
	#stObj.teaser#
	<a href="#stObj.link#" target="_new" class="morelink">Go<span>about:#stObj.Title#</span></a>
	</p>
</cfif>
</div>
</cfoutput>
<cfsetting enablecfoutputonly="no">
