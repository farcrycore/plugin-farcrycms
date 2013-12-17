<cfsetting enablecfoutputonly="true" /> 
<!--- @@displayname: Gallery Listing --->

<!--- import tag library --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfset qGalleries = application.fapi.getContentObjects(typename="farImageGallery", lproperties="objectid, title, teaser, imgCover", orderby="datetimelastupdated DESC") />

<cfoutput>
	<div class="page-header">
		<skin:breadcrumb separator="/" />
		<h2>#stObj.title#</h2>
	</div><!-- /page-header -->

	<cfif structKeyExists(stobj, "teaser") AND len(stobj.teaser)>
		<p>#stobj.teaser#</p>
	</cfif>

	<ul class="thumbnails">
</cfoutput>

<cfloop query="qGalleries">
	<cfoutput>
		<li class="span3">
			<div class="thumbnail">
			<a href="#application.fapi.getLink(typename="farImageGallery", objectid=qGalleries.objectid)#"><img src="#qGalleries.imgCover#" alt="#qGalleries.title#"></a>
			<h3><a href="#application.fapi.getLink(typename="farImageGallery", objectid=qGalleries.objectid)#">#qGalleries.title#</a></h3>
			<p>#qGalleries.teaser#</p>
			</div>
		</li>
	</cfoutput>
</cfloop>

<cfoutput>
	</ul>
</cfoutput>
<cfsetting enablecfoutputonly="false" /> 