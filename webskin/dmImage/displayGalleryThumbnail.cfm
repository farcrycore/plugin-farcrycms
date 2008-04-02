<cfsetting enablecfoutputonly="true" />

<!--- @@displayname: Gallery Thumbnail Image --->



<!--- Import Tag Libraries --->
<cfimport taglib="/farcry/core/tags/webskin/" prefix="skin" />

<skin:view objectid="#stobj.objectid#" typename="dmImage" webskin="displayThumbnailImage" r_html="thumbnailHTML" />

<cfoutput>
<a href="#application.url.imageRoot##stobj.standardImage#" target="_blank">#thumbnailHTML#</a>
<div>#stobj.title#</div>
</cfoutput>


<cfsetting enablecfoutputonly="false" />

