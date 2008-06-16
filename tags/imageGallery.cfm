<cfsetting enablecfoutputonly="true">
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

<!--- @@displayname: Image Gallery Renderer --->
<!--- @@description: Renders an image gallery from a list of image objectIDs  --->
<!--- @@author: Matthew Bryant (mbryant@daemon.com.au) --->


<!------------------ 
FARCRY IMPORT FILES
 ------------------>
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />


<cfparam name="attributes.imageIDs" type="any" /><!--- image object IDs. Can be a list or array of object ids --->

<cfif isArray(attributes.imageIDs)>
	<cfset attributes.imageIDs = arrayToList(attributes.imageIDs) />
</cfif>

<!------------------ 
START WEBSKIN
 ------------------>
<cfif thisTag.ExecutionMode EQ "start">
	
	<skin:htmlHead id="imageGalleryCSS">
	<cfoutput>
	<style type="text/css">
	ul.gallery  {margin-bottom:20px;}
	ul.gallery li {border: 1px solid ##ccc;float:left; margin:5px 13px 5px 0px; padding:0px; display:block; background:white;height:150px;width:130px;text-align:center;}
	ul.gallery li img {margin:5px auto; padding:0px; display:block; border: none;align:center;}
	</style>
	</cfoutput>
	</skin:htmlHead>
	
	
	<cfif listLen(attributes.imageIDs)>
		<cfoutput><ul class="gallery"></cfoutput>		
		
		<cfloop list="#attributes.imageIDs#" index="imageID">		
			<skin:view objectid="#imageID#" webskin="displayGalleryThumbnail" r_html="galleryThumbnailHTML" alternateHTML="" />
			<cfif len(galleryThumbnailHTML)>
				<cfoutput><li>#galleryThumbnailHTML#</li></cfoutput>
			</cfif>
		</cfloop>
		
		<cfoutput></ul><br style="clear:left;" /></cfoutput>
	</cfif>
</cfif>

<cfsetting enablecfoutputonly="false">