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

	<cfproperty ftSeq="1" ftFieldset="General" name="displayMethod" type="string" hint="Display teaser method to render individual content items." required="true" default="displayTeaserStandard" ftType="webskin" fttypename="dmNews" ftprefix="displayTeaser" ftLabel="Display Method" />
	<cfproperty ftSeq="4" ftFieldset="General" name="intro" type="string" hint="Intro text for the news listing.  Can be any combination of content and HTML markup." required="false" default="" ftType="string" ftLabel="Intro Text" />
	<cfproperty ftSeq="5" ftFieldset="General" name="suffix" type="string" hint="Suffix text for the news listing.  Can be any combination of content and HTML markup." required="false" default="" ftType="string" ftLabel="Suffix Text" />
	<cfproperty ftSeq="7" ftFieldset="General" name="numItems" type="numeric" hint="The number of items to display per page." required="true" default="5" ftType="numeric" ftIncludeDecimal="false" ftvalidation="validate-digits" ftLabel="## items per page" />
	<cfproperty ftSeq="10" ftFieldset="General" name="bArchive" type="boolean" hint="Display News as an archive (ie. paginated display)." required="true" default="0" ftType="boolean" ftLabel="Display with pagination?" />
	<cfproperty ftSeq="12" ftFieldset="General" name="numPages" type="numeric" hint="The number of pages of news articles to display at most (when bArchive is flagged as true)." required="true" default="1" ftType="numeric" ftIncludeDecimal="false" ftvalidation="validate-digits" ftLabel="How many pages would you like in the archive at most?" />
	<cfproperty ftSeq="20" ftFieldset="Categorisation" name="bMatchAllKeywords" type="boolean" hint="Does the content need to match ALL selected keywords?" required="false" default="0" ftType="boolean" ftLabel="Does the content need to match ALL the selected Keywords?" />
	<cfproperty ftseq="25" ftfieldset="Categorisation" name="metadata" type="longchar" hint="A list of categories that the news content must match in order to be shown." required="false" default="" fttype="category" ftalias="root" ftlabel="Selected Categories" />

</cfcomponent>