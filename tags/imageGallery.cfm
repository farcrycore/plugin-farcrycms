<cfsetting enablecfoutputonly="true">
<!--- @@Copyright: Daemon Pty Limited 1995-2007, http://www.daemon.com.au --->
<!--- @@License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php --->
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