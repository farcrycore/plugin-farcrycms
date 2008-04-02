<cfsetting enablecfoutputonly="true" />

<!--- @@displayname: Image Gallery Execution --->



<!--- Import Tag Libraries --->
<cfimport taglib="/farcry/core/tags/webskin/" prefix="skin" />
<cfimport taglib="/farcry/core/tags/formtools/" prefix="ft" />
<cfimport taglib="/farcry/plugins/farcrygreybox/tags/" prefix="gb" />


<!--- Array of images that is drawn from the image array and any categories selected. --->
<cfset variables.aImagesToDisplay = arrayNew(1) />
<cfset variables.qImagesToDisplay = queryNew('objectid') />


<!--- Get images from the array --->
<cfif arrayLen(stobj.aImages)>
	<cfloop from="1" to="#arrayLen(stobj.aImages)#" index="i">
		<cfset arrayAppend(variables.aImagesToDisplay, stobj.aImages[i]) />
		<cfset QueryAddRow(variables.qImagesToDisplay) />
		<cfset QuerySetCell(variables.qImagesToDisplay, "objectid", stobj.aImages[i]) />
	</cfloop>
</cfif>

<!--- Get images from the categories selected --->
<cfif listLen(stobj.catImageGallery)>

	<cfset oCat = createObject("component", "farcry.core.packages.types.category") />
	<cfset variables.qCatObjects = oCat.getDataQuery(lCategoryIDs="#stobj.catImageGallery#"
		,typename="dmImage"
		,sqlOrderBy="label ASC"
		) />

	<cfloop query="variables.qCatObjects">
		<cfif not listFindNoCase(arrayToList(variables.aImagesToDisplay), variables.qCatObjects.objectid)>
			<cfset arrayAppend(variables.aImagesToDisplay, variables.qCatObjects.objectid) />
			<cfset QueryAddRow(variables.qImagesToDisplay) />
			<cfset QuerySetCell(variables.qImagesToDisplay, "objectid", variables.qCatObjects.objectid) />
		</cfif>
	</cfloop>
</cfif>


<cfoutput>
<style type="text/css">
ul.gallery  {margin-bottom:20px;}
ul.gallery li {border: 1px solid ##ccc;float:left; margin:5px 13px 5px 0px; padding:0px; display:block; background:white;height:150px;width:130px;text-align:center;}
ul.gallery li img {margin:5px auto; padding:0px; display:block; border: none;align:center;}
</style>
</cfoutput>

<cfif variables.qImagesToDisplay.recordCount>
	<ft:pagination 
		paginationID="#stobj.objectid#"
		qRecordSet="#variables.qImagesToDisplay#"
		typename="dmImage"
		pageLinks="5"
		recordsPerPage="#stobj.numItems#" 
		Top="true" 
		Bottom="true"
		submissionType="url"
		renderType="inline"
		bShowPageDropdown="false"
		>

		<cfoutput><ul class="gallery"></cfoutput>		
		
		<ft:paginateLoop r_stObject="st" bTypeAdmin="false">		
			<skin:view objectid="#st.stobject.objectid#" typename="dmImage" webskin="displayGalleryThumbnail" r_html="galleryThumbnailHTML" />
			<cfoutput><li>#galleryThumbnailHTML#</li></cfoutput>
		</ft:paginateLoop>
		
		<cfoutput></ul><br style="clear:left;" /></cfoutput>
		
	</ft:pagination> 
		
	
</cfif>


<cfsetting enablecfoutputonly="false" />