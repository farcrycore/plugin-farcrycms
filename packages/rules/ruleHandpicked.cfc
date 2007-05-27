<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2003, http://www.daemon.com.au $
$License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php$

|| VERSION CONTROL ||
$Header: /cvs/farcry/core/packages/rules/ruleHandpicked.cfc,v 1.26 2005/09/09 05:24:08 guy Exp $
$Author: guy $
$Date: 2005/09/09 05:24:08 $
$Name: milestone_3-0-1 $
$Revision: 1.26 $

|| DESCRIPTION || 
$Description: 
Hand-pick and display individual content items with a specified displayTeaser* handler. 
Restricted to those content types with metadata bScheduled=true.
$

|| DEVELOPER ||
$Developer: Geoff Bowers (modius@daemon.com.au) $
--->
<cfcomponent displayname="Utility: Handpicked Rule" extends="farcry.core.packages.rules.rules" 
	hint="Hand-pick and display individual content items with a specified displayTeaser* handler.">

<cfproperty ftSeq="1" ftFieldSet="Intro" name="intro" type="longchar" hint="Intro text placed in front of the handpicked rule results.  Can be any relevant content and HTML markup." ftLabel="Introduction" />
<cfproperty ftSeq="2" ftFieldSet="Selected Objects" name="aObjects" type="array" ftJoin="dmEvent,dmFacts,dmLink,dmNews" ftLabel="Select Objects">




</cfcomponent>