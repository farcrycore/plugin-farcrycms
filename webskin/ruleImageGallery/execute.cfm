<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: Daemon Pty Limited 2002-2013, http://www.daemon.com.au --->
<!--- @@displayname: Image Gallery Rule --->

<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin/" prefix="skin" />

<!--- Get images from the categories selected --->
<cfset qImages = application.fapi.getContentObjects(typename="dmImage", categories_eq=stobj.catImageGallery, orderby="datetimelastupdated DESC") />


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
<cfif qImages.recordcount>
	<cfoutput>
		<div class="gallery">
			<ul class="thumbnails">
	</cfoutput>
             
	<cfloop query="qImages">
		<!--- get gallery image --->
		<cfset stImage = application.fapi.getContentObject(typename="dmImage", objectid=qImages.objectid)>

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