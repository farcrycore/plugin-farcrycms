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
<cfcomponent displayname="Images: Image Gallery" extends="farcry.core.packages.rules.rules" hint="Displays an image gallery of selected images">


	<cfproperty ftSeq="1" ftFieldset="Images" name="aImages" type="array" default="" hint="The list of images to be displayed in the gallery" ftLabel="Images" ftJoin="dmImage" />
	<cfproperty ftSeq="2" ftFieldset="Images" name="catImageGallery" type="longchar" default="" hint="A list of category ObjectIDs that the content is to be drawn from" ftLabel="Categories" ftType="category" />
	<cfproperty ftSeq="10" ftFieldset="Display" name="numItems" type="numeric" hint="The number of items to display per page." required="true" default="20" ftType="numeric" ftIncludeDecimal="false" ftvalidation="validate-digits" ftLabel="## items per page" />
	
</cfcomponent>