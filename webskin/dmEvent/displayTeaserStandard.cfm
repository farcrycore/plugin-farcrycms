<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: Daemon Pty Limited 2002-2008, http://www.daemon.com.au --->
<!--- @@License:
    This file is part of FarCry CMS Plugin.

    FarCry CMS Plugin is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    FarCry CMS Plugin is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with FarCry CMS Plugin.  If not, see <http://www.gnu.org/licenses/>.
--->

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