<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Event Teaser --->

<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cfset link = application.fapi.getLink(objectID=stObj.objectID,typename=stObj.typename) />

<cfoutput>
	<div class="teaser clearfix">
		<h3><a href="#link#">#stObj.title#</a>&nbsp;<small>#dateformat(stObj.startDate, "dd mmm yyy")# <cfif showFarcryDate(stobj.endDate)>until #dateformat(stObj.endDate, "dd mmm yyy")#</cfif></small></h3>
		<cfif isValid("UUID",stObj.teaserImage)>
			<a href="#link#" class="thumbnail">
				<i><skin:view objectid="#stobj.teaserImage#" typename="dmImage" template="displayThumbnailImage" /></i>
			</a>
		</cfif>
		<div class="teaser-content">
			<p>#stObj.teaser#</p>
			<p><a href="#link#">Read more...</a></p>
		</div><!-- /teaser-content -->
	</div><!-- /teaser clearfix -->
	<hr />
</cfoutput>

<cfsetting enablecfoutputonly="false">