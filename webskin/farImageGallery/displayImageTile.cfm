<cfsetting enablecfoutputonly="true">

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfparam name="stParam.galleryID" default="#stParam.galleryID#">

<!--- get Image --->
<cfset stImage = application.fapi.getContentObject(typename="dmImage", objectid=stObj.objectID)>

<skin:loadJS id="jquery" />
<skin:loadJS id="fancyboxJS" baseHref="/farcry/plugins/farcrycms/www/js/fancybox" lFiles="jquery.mousewheel-3.0.4.pack.js,jquery.fancybox-1.3.4.pack.js" />
<skin:loadCSS id="fancyboxCSS" baseHref="/farcry/plugins/farcrycms/www/js/fancybox" lFiles="jquery.fancybox-1.3.4.css" media="screen" />

<skin:onReady>
	<cfoutput>
		$j("a.fancybox").fancybox({
			cyclic: true,
			titlePosition: 'over'
		});
	</cfoutput>
</skin:onReady>

<cfoutput>
	<div class="gallery-inner">
		<a href="#stImage.sourceImage#" title="#stImage.title#" class="fancybox gallery-thumb" rel="#stParam.galleryID#">
			<img src="#stImage.standardImage#" alt="#stImage.title#">
		</a>
		<p>#stImage.title#</p>
	</div>
</cfoutput>


<cfsetting enablecfoutputonly="false">