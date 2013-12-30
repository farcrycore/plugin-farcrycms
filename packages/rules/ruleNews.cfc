<!--- @@Copyright: Daemon Pty Limited 2002-2013, http://www.daemon.com.au --->
<!--- @@License:
    This file is part of FarCry CMS Plugin.

    FarCry CMS Plugin is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    FarCry CMS Plugin is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with FarCry CMS Plugin.  If not, see <http://www.gnu.org/licenses/>.
--->
<cfcomponent 
	extends="farcry.core.packages.rules.rules" 
	displayname="News Listing" 
	hint="News rule publishes news content items in date order, with 
		most recently published first.  News content is only visible 
		if it is a) approved content; b) time is past the publish date; 
		c) time is before the expriy date, and; d) it matches the nominated 
		categories." 
	bObjectBroker="true"
	icon="fa-file-text">

	<cfproperty name="intro" type="longchar" required="false" default="" 
		ftSeq="10" ftFieldset="General" ftLabel="Intro Text"
		fthint="Optional. Intro text for the news listing.  Can be any combination of content and HTML markup.">

	<cfproperty name="displayMethod" type="string" required="true" default="displayTeaserStandard" 
		ftSeq="20" ftFieldset="General" ftLabel="Display Template" 
		ftType="webskin" 
		ftTypename="dmNews" ftPrefix="displayTeaser"
		ftHint="This determines how each of your news items will display.">

	<cfproperty name="suffix" type="longchar" required="false" default="" 
		ftSeq="30" ftFieldset="General" ftLabel="Suffix Text"
		fthint="Optional. Suffix text for the news listing.  Can be any combination of content and HTML markup.">

	<cfproperty name="numItems" type="numeric" required="true" default="5" 
		ftSeq="40" ftFieldset="Results" ftLabel="## items per page" 
		ftType="numeric" 
		ftIncludeDecimal="false" ftValidation="validate-digits"
		fthint="The number of items to display per page.">

	<cfproperty name="bArchive" type="boolean" required="true" default="0" 
		ftSeq="50" ftFieldset="Results" ftLabel="Paginated Archive?" 
		ftType="boolean"
		ftHint="Create a paginated archive of News pages.">

	<cfproperty name="numPages" type="numeric" required="true" default="10" 
		ftSeq="60" ftFieldset="Results" ftLabel="## of pages" 
		ftType="numeric" 
		ftIncludeDecimal="false" ftValidation="validate-digits"
		fthint="The number of pages in the paginated archive.">

	<cfproperty name="metadata" type="longchar" required="false" default="" 
		ftSeq="70" ftFieldset="Categorisation" ftLabel="Selected News Categories" 
		ftType="category" ftAlias="dmnews"
		fthint="A list of categories that the news content must match in order to be shown.">

	<cfproperty name="bMatchAllKeywords" type="boolean" required="false" default="0" 
		ftSeq="80" ftFieldset="Categorisation" ftLabel="Match all the selected categories?" 
		ftType="boolean"
		ftHint="If this box is ticked, an article must be tagged with all of the selected categories in order to appear.">

</cfcomponent>