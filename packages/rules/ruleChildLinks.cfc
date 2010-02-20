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

<!--- @@displayname: Display Title for the Template --->
<!--- @@Description: List teasers for the current navigation folders children.  Children types are restricted to dmHTML, dmLink and dmInclude content types. --->
<!--- @@Developer: Geoff Bowers (modius@daemon.com.au) --->
<cfcomponent displayname="Utility: Child Links Rule" extends="farcry.core.packages.rules.rules" 
	hint="List teaser displays for the current navigation folders children.  
		Children content types are restricted to HTML, Link and Include. 
		This publishing rule is commonly used on section landing pages to 
		build a summary for the pages in the section.">

<cfproperty 
	name="intro" hint="Intro text to child link listing; can be any relevant HTML code and content." type="string" required="false" default="" 
	ftSeq="1" ftFieldset="General Details" ftLabel="Introduction"
	ftType="longchar" />
	
<cfproperty 
	name="displayMethod" type="string" hint="Teaser display method to render children links." required="yes" default="displayTeaserStandard" 
	ftSeq="2" ftFieldset="General Details" ftLabel="Display Method" 
	ftType="webskin" ftTypename="dmHTML,dmInclude,dmLink" ftPrefix="displayTeaser" />
	
</cfcomponent>
