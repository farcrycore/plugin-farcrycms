<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2003, http://www.daemon.com.au $
$License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php$ 

|| VERSION CONTROL ||
$Header: /cvs/farcry/core/packages/rules/ruleRandomFact.cfc,v 1.20.2.2 2006/02/17 05:49:22 daniela Exp $
$Author: daniela $
$Date: 2006/02/17 05:49:22 $
$Name: milestone_3-0-1 $
$Revision: 1.20.2.2 $

|| DESCRIPTION || 
$Description: 
Publishing rule to randomly show a number of fact content items from 
a pool of fact items.  The pool is comprised of those content items 
that match the nominated categories.
$

|| DEVELOPER ||
$Developer: Geoff Bowers (modius@daemon.com.au) $
--->

<cfcomponent displayname="Facts: Random Fact Rule" extends="farcry.core.packages.rules.rules" hint="Publishing rule to randomly show a number of fact content items from a pool of fact items.  The pool is comprised of those content items that match the nominated categories.">
	<cfproperty name="displayMethod" type="string" default="displayTeaserStandard" hint="Display method to render fact content items" ftSeq="1" ftFieldset="" ftLabel="Display method" ftType="webskin" ftTypename="dmFacts" ftPrefix="displayTeaser" />
	<cfproperty name="intro" type="string" default="" hint="Intro test for random fact displays. Can be any combination of content and HTML markup." ftSeq="2" ftFieldset="" ftLabel="Intro" ftType="longchar" />
	<cfproperty name="numItems" type="numeric" default="1" hint="The number of fact items to display" ftSeq="3" ftFieldset="" ftLabel="Items per page" ftType="integer" />
	<cfproperty name="bMatchAllKeywords" type="boolean" default="0" hint="Does the content need to match ALL selected categories" ftSeq="4" ftFieldset="" ftLabel="Match all keywords" ftType="boolean" />
	<cfproperty name="metadata" type="longchar" default="" hint="A list of category ObjectIDs that the content is to be drawn from" ftSeq="5" ftFieldset="" ftLabel="Categories" ftType="category" />
	
</cfcomponent>