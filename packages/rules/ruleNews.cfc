<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2003, http://www.daemon.com.au $
$License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php$

|| VERSION CONTROL ||
$Header:  $
$Author: $
$Date: $
$Name: $
$Revision: $

|| DESCRIPTION || 
$Description: 
News rule publishes news content items in date order, with 
most recently published first.  News content is only visible 
if it is a) approved content; b) time is past the publish date; 
c) time is before the expriy date, and; d) it matches the nominated 
categories.
$

|| DEVELOPER ||
$Developer: Geoff Bowers (modius@daemon.com.au) $
--->
<cfcomponent displayname="News: Listing Rule" extends="farcry.core.packages.rules.rules" 
	hint="News rule publishes news content items in date order, with 
		most recently published first.  News content is only visible 
		if it is a) approved content; b) time is past the publish date; 
		c) time is before the expriy date, and; d) it matches the nominated 
		categories." bObjectBroker="true">

	<cfproperty ftSeq="1" ftFieldset="General" name="intro" type="longchar" hint="Intro text for the news listing.  Can be any combination of content and HTML markup." required="false" default="" ftLabel="Intro Text" ftHint="This content will appear ABOVE your results." />
	<cfproperty ftSeq="2" ftFieldset="General" name="displayMethod" type="string" hint="Display teaser method to render individual content items." required="true" default="displayTeaserStandard" ftType="webskin" fttypename="dmNews" ftprefix="displayTeaser" ftLabel="Display Method" ftHint="This determines how each of your news results will render." />
	<cfproperty ftSeq="3" ftFieldset="General" name="suffix" type="longchar" hint="Suffix text for the news listing.  Can be any combination of content and HTML markup." required="false" default="" ftLabel="Suffix Text" ftHint="This content will appear BELOW your results." />

	<cfproperty ftSeq="10" ftFieldset="Results" name="numItems" type="numeric" hint="The number of items to display per page." required="true" default="5" ftType="numeric" ftIncludeDecimal="false" ftvalidation="validate-digits" ftLabel="## items per page" />
	<cfproperty ftSeq="11" ftFieldset="Results" name="bArchive" type="boolean" hint="Displays with a paginated display." required="true" default="0" ftType="boolean" ftLabel="Paginate?" ftHint="Selecting NOT to paginate will only show the first page of results." />
	
	
	<cfproperty ftseq="20" ftfieldset="Categorisation" name="metadata" type="longchar" hint="A list of categories that the news content must match in order to be shown." required="false" default="" fttype="category" ftalias="dmnews" ftlabel="Selected News Categories" />
	<cfproperty ftSeq="21" ftFieldset="Categorisation" name="bMatchAllKeywords" type="boolean" hint="Does the content need to match ALL selected keywords?" required="false" default="0" ftType="boolean" ftLabel="Match ALL the selected categories?" />


</cfcomponent>