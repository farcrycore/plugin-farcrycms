<cfsetting enablecfoutputonly="true" /> 
<!--- @@displayname: FancyBox Image Gallery --->

<!--- import tag library --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<!--- 
 // load JS/CSS assets 
--------------------------------------------------------------------------------->
<skin:loadJS id="jquery" />
<skin:loadJS id="fancyboxJS" baseHref="/farcry/plugins/farcrycms/www/fancybox" lFiles="jquery.fancybox.pack.js" bcombine="false" />
<skin:loadCSS id="fancyboxCSS" baseHref="/farcry/plugins/farcrycms/www/fancybox" lFiles="jquery.fancybox.css" media="screen" />

<skin:onReady>
	<cfoutput>
		$j("a.fancybox").fancybox({
			cyclic: true,
			helpers:  {
            	title : { type : 'inside' }
            }
		});
	</cfoutput>
</skin:onReady>

<!--- 
 // view: image gallery 
--------------------------------------------------------------------------------->
<cfoutput>
	<div class="page-header">
		<skin:breadcrumb separator="/" objectid="#application.fapi.getNavID("farImageGallery")#" includeSelf="true" />
		<h2>#stObj.title#</h2>
	</div><!-- /page-header -->
	<cfif structKeyExists(stobj, "teaser") AND len(stobj.teaser)>
		<p>#stobj.teaser#</p>
	</cfif>
</cfoutput>

<cfif arrayLen(stobj.aImage)>
	<cfoutput>
		<div class="gallery">
			<ul class="thumbnails">
	</cfoutput>
             
	<cfloop from="1" to="#arrayLen(stobj.aImage)#" index="i">
		<!--- get gallery image --->
		<cfset stImage = application.fapi.getContentObject(typename="dmImage", objectid=stObj.aImage[i])>

		<cfoutput>
			<li class="span2">
				<a href="#stImage.sourceImage#" title="#stImage.title#" class="thumbnail fancybox" rel="gallery"><img src="#stImage.thumbnailImage#" alt="#stImage.title#" class="img-rounded"></a>
			</li>
		</cfoutput>
	</cfloop>
	
	<cfoutput>
			</ul>
		</div><!-- /.gallery-inner -->
	</cfoutput>
</cfif>

<cfsetting enablecfoutputonly="false" />