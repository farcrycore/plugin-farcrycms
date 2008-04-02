<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: Daemon Pty Limited 1995-2007, http://www.daemon.com.au --->
<!--- @@License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php --->
<!--- @@displayname: Event Teaser --->
<!--- @@Description: Teaser display for an event. --->
<!--- @@Developer: Geoff Bowers (modius@daemon.com.au) --->

<cfoutput>
<h4>
	<span class="date">#dateformat(stObj.startDate, "dd mmm yyy")# 
		<cfif showFarcryDate(stobj.endDate)>
			until #dateformat(stObj.endDate, "dd mmm yyy")#
		</cfif>
	</span>
	#stObj.Title#
</h4>
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