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
    displayname="Image Gallery" 
    hint="Impromptu image gallery of media library images matching a specific category."
    icon="fa-picture-o">

    <cfproperty name="catImageGallery" type="longchar" default="" 
        ftSeq="10" ftFieldset="Image Gallery" ftLabel="Categories" 
        ftType="category" ftalias="dmImage" 
        ftRenderType="dropDown" ftDropdownFirstItem="All Images" ftSelectMultiple="false"
        fthint="Optional. Category of images to display. No selection will show all images.">

    <cfproperty name="numItems" type="numeric" required="true" default="20" 
        ftSeq="20" ftFieldset="Image Gallery" ftLabel="Images to Display" 
        ftType="numeric" 
        ftIncludeDecimal="false" ftValidation="validate-digits"
        fthint="Total number of items to display in gallery.">
	
</cfcomponent>