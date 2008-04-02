<cfsetting enablecfoutputonly="true" />

<!--- @@displayname: Title and teaser and thumbnail --->
<!--- @@author: Matthew Bryant (mbryant@daemon.com.au)--->


<!--- IMPORT TAG LIBRARIES --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">



<cfoutput>
<h4><span class="date">#dateformat(stObj.publishDate, "dd mmm yyy")#</span>#stObj.Title#</h4>
<p>
</cfoutput>

	<cfif len(stobj.teaserImage)>
		
		<skin:view objectid="#stobj.teaserImage#" typename="dmImage" template="displayThumbnailImage" r_html="teaserImageHTML" />
		
		<cfoutput>
			<span class="thumbnail">						
			<skin:buildLink objectID="#stobj.objectid#" linktext="#teaserImageHTML#" />
			</span>
		</cfoutput>
		
	</cfif>
	
<cfoutput>
	#stObj.Teaser#
	<skin:buildLink objectid="#stobj.objectID#" class="morelink">More<span>about:#stObj.Title#</span></skin:buildLink>
</p>
</cfoutput>

<cfsetting enablecfoutputonly="false" />