<cfsetting enablecfoutputonly="true" /> 

<!--- @@displayname: FarCry CMS Plugin standard body display --->
<!--- @@author: Ken Boncheol Koo (ken@daemon.com.au)--->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfoutput>

	<div class="page-header">
		<h1>#stObj.title#</h1>
	</div><!-- /page-header -->

	<cfif structKeyExists(stobj, "teaser") AND len(stobj.teaser)>
		<p>#stobj.teaser#</p>
	</cfif>

	<cfif arrayLen(stobj.aImageGallery)>
		<div class="gallery">
			<cfloop from="1" to="#arrayLen(stobj.aImageGallery)#" index="i">
				<skin:view typename="farImageGalleryListing" objectid="#stobj.aImageGallery[i]#" webskin="displayImageTile">
			</cfloop>
		</div>
	</cfif>

</cfoutput>


<cfsetting enablecfoutputonly="false" /> 

