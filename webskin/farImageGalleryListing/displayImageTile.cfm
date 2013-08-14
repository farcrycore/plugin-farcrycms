<cfsetting enablecfoutputonly="true">

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />


<cfparam name="stParam.rowNum" default="">
<!--- get Image --->
<cfset stGallery = application.fapi.getContentObject(typename="farImageGallery", objectid=stObj.objectID)>

<cfset link = application.fapi.getLink(objectID=stGallery.objectID,typename=stGallery.typename) />


<cfif len(stGallery.sourceid)>
	<cfset coverImageID = stGallery.sourceid>
<cfelse>
	<cfset coverImageID = stGallery.aImage[1]>
</cfif>	

<cfoutput>
		<cfif len(coverImageID)>
			<cfset stCoverImage = application.fapi.getContentObject(typename="dmImage", objectid=coverImageID)>
			<div class="gallery-inner">
			<a href="#link#" class="gallery-thumb">			
				<i><skin:view objectid="#stCoverImage.objectid#" typename="dmImage" template="displayThumbnailImage" /></i>
			</a>	
			</div><!-- /.gallery-inner -->
		</cfif>
</cfoutput>


<cfsetting enablecfoutputonly="false">