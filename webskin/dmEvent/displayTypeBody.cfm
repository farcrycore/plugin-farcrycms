<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Event Listing --->
<!--- @@cacheStatus: 1 --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<!--- environment variables --->
<cfparam name="categoryID" default="" />

<cfif structKeyExists(url,"category")>
	<cfset categoryID = application.fapi.getContentType(typename="dmCategory").getCategoryIDbyName(urlDecode(url.category)) />
</cfif>

<cfset qEvents = application.fapi.getContentObjects(typename="dmEvent",catEvent_eq=categoryID) />

<!--- 
 // view 
--------------------------------------------------------------------------------->
<cfoutput>
	<div class="page-header">
		<skin:breadcrumb separator="/" objectid="#application.fapi.getNavID("dmEvent")#" includeSelf="true" />
		<h2>Latest Events</h2>
	</div><!-- /page-header -->
</cfoutput>

<skin:pagination 
	query="qEvents" recordsPerPage="3"
	paginationID="" top="false" bottom="true"
	r_stObject="stEvent">
	<skin:view objectID="#stEvent.objectID#" typename="dmEvent" template="displayTeaserStandard" />
</skin:pagination>

<cfsetting enablecfoutputonly="false">