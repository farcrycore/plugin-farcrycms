<cfsetting enablecfoutputonly="true" />
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

<!--- @@displayname: Image Gallery Execution --->



<!--- Import Tag Libraries --->
<cfimport taglib="/farcry/core/tags/webskin/" prefix="skin" />
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
	<!--- Initialise list of image IDs --->
	<cfset lImageIDs = "" />
	
	<skin:pagination 
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
		r_stObject="st" bTypeAdmin="false">
		
		<!--- Loop through the page to get all the image ID s --->
		<cfset lImageIDs = listAppend(lImageIDs, st.objectid) />
		
	</skin:pagination> 
	
	<!--- Render the image gallery --->
	<cms:imageGallery imageIDs="#lImageIDs#" />

</cfif>


<cfsetting enablecfoutputonly="false" />