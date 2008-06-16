<!--- @@Copyright: Daemon Pty Limited 2002-2008, http://www.daemon.com.au --->
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

<!--- 
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