<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2007, http://www.daemon.com.au $
$License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php$

|| DESCRIPTION || 
$Description: 
Hand-pick and display individual content items with a specified displayTeaser* handler. 
Restricted to those content types with metadata bScheduled=true.
$

|| DEVELOPER ||
$Developer: Mat Bryant (m.bryant@daemon.com.au) $
--->
<cfcomponent displayname="Utility: Handpicked Rule" extends="farcry.core.packages.rules.rules" 
	hint="Hand-pick and display individual content items with a specified displayTeaser* handler.">

<cfproperty ftSeq="1" ftFieldSet="Intro" name="intro" type="longchar" hint="Intro text placed in front of the handpicked rule results.  Can be any relevant content and HTML markup." ftLabel="Introduction" />
<cfproperty ftSeq="2" ftFieldSet="Selected Objects" name="aObjects" type="array" ftJoin="dmEvent,dmFacts,dmLink,dmNews,dmHTML" ftLabel="Select Objects" />


</cfcomponent>