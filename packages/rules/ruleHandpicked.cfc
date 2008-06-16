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
Hand-pick and display individual content items with a specified displayTeaser* handler. 
Restricted to those content types with metadata bScheduled=true.
$

|| DEVELOPER ||
$Developer: Mat Bryant (m.bryant@daemon.com.au) $
--->
<cfcomponent displayname="Utility: Handpicked Rule" extends="farcry.core.packages.rules.rules" 
	hint="Hand-pick and display individual content items with a specified displayTeaser* handler.">

<cfproperty ftSeq="1" ftFieldSet="Intro" name="intro" type="longchar" hint="Intro text placed in front of the handpicked rule results.  Can be any relevant content and HTML markup." ftLabel="Introduction" />
<cfproperty ftSeq="2" ftFieldSet="Selected Objects" name="aObjects" type="array" ftJoin="dmEvent,dmFacts,dmFlash,dmFile,dmImage,dmInclude,dmLink,dmNews,dmHTML" ftLabel="Select Objects" />


</cfcomponent>