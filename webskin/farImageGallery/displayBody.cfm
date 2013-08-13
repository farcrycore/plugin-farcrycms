<cfsetting enablecfoutputonly="true" /> 

<!--- @@displayname: FarCry CMS Plugin standard body display --->
<!--- @@author: Ken Boncheol Koo (ken@daemon.com.au)--->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfoutput>

	<h1>#stObj.title#</h1>

	<cfif structKeyExists(stobj, "teaser") AND len(stobj.teaser)>
		<p>#stobj.teaser#</p>
	</cfif>
<!--- 
	<cfif structKeyExists(stobj, "body") AND len(stobj.body)>
		<p>#stObj.body#</p>
	</cfif> --->

	<cfif arrayLen(stobj.aImage)>

	<div class="gallery">

             
		<cfloop from="1" to="#arrayLen(stobj.aImage)#" index="i">



		  <skin:view typename="farImageGallery" objectID="#stobj.aImage[i]#" webskin="displayImageTile" galleryID="#stobj.objectid#" rowNum="3"/>

		</cfloop>
		 </div><!-- /.gallery-inner -->
	</cfif>

</cfoutput>


<cfsetting enablecfoutputonly="false" /> 

