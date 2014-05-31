<cfsetting enablecfoutputonly="true">
<!--- @@displayname: News Listing --->
<!--- @@cacheStatus: 1 --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<!--- environment variables --->
<cfparam name="categoryID" default="" />

<cfif structKeyExists(url,"category")>
	<cfset categoryID = application.fapi.getContentType(typename="dmCategory").getCategoryIDbyName(urlDecode(url.category)) />
</cfif>

<cfset qNews = application.fapi.getContentObjects(typename="dmNews",catNews_eq=categoryID) />

<!--- 
 // view 
--------------------------------------------------------------------------------->
<cfoutput>
	<div class="page-header">
		<skin:breadcrumb separator="/" objectid="#application.fapi.getNavID("dmNews")#" includeSelf="true" />
		<h2>Latest News</h2>
	</div><!-- /page-header -->
</cfoutput>

<skin:pagination 
	query="qNews" recordsPerPage="3"
	paginationID=""  top="false" bottom="true"
	r_stObject="stNews">
	<skin:view objectID="#stNews.objectID#" typename="dmNews" template="displayTeaserStandard" />
</skin:pagination>

<cfsetting enablecfoutputonly="false">