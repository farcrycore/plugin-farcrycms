<cfsetting enablecfoutputonly="true" />

<!--- @@displayname: Image Gallery Execution --->



<!--- Import Tag Libraries --->
<cfimport taglib="/farcry/core/tags/webskin/" prefix="skin" />
<cfimport taglib="/farcry/core/tags/formtools/" prefix="ft" />
<cfimport taglib="/farcry/plugins/farcrygreybox/tags/" prefix="gb" />
<cfimport taglib="/farcry/plugins/farcrycms/tags/" prefix="cms" />


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

		<!--- Initialise list of image IDs --->
		<cfset lImageIDs = "" />
		
		<!--- Loop through the page to get all the image ID s --->
		<ft:paginateLoop r_stObject="st" bTypeAdmin="false">		
			<cfset lImageIDs = listAppend(lImageIDs, st.stobject.objectid) />
		</ft:paginateLoop>

		<!--- Render the image gallery --->
		<cms:imageGallery imageIDs="#lImageIDs#" />

		
	</ft:pagination> 
		
	
</cfif>


<cfsetting enablecfoutputonly="false" />