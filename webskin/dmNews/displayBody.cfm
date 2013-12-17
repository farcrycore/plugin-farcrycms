<cfsetting enablecfoutputonly="true" /> 
<!--- @@displayname: News Body --->

<!--- import tag library --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<!--- 
 // view 
--------------------------------------------------------------------------------->
<cfoutput>
	<div class="page-header">
		<skin:breadcrumb separator="/" objectid="#application.fapi.getNavID("dmNews")#" includeSelf="true" />
		<h2><span class="date">#dateformat(stObj.publishDate, "dd mmm yyy")#</span>
	#stObj.title#</h2>
	</div><!-- /page-header -->

#stObj.body#
</cfoutput>


<cfsetting enablecfoutputonly="false" /> 