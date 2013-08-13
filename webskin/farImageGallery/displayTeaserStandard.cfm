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

<!--- @@displayname: Title and teaser and thumbnail --->
<!--- @@author: Matthew Bryant (mbryant@daemon.com.au)--->


<!--- IMPORT TAG LIBRARIES --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cfset link = application.fapi.getLink(objectID=stObj.objectID,typename=stObj.typename) />


<cfif len(stobj.sourceid)>
	<cfset coverImageID = stobj.sourceid>
<cfelse>
	<cfset coverImageID = stobj.aImage[1]>
</cfif>	
<cfoutput>

	<div class="teaser clearfix">
		<h3><a href="#link#">#stObj.title#</a></h3>
		<cfif len(coverImageID)>
			<cfset stCoverImage = application.fapi.getContentObject(typename="dmImage", objectid=coverImageID)>
			<a href="#link#" class="thumbnail">			
				<i><skin:view objectid="#stCoverImage.objectid#" typename="dmImage" template="displayThumbnailImage" /></i>
			</a>	
		</cfif>
		
		<div class="teaser-content">
			<p>#stObj.teaser#</p>
			<p><a href="#link#">Read more...</a></p>
		</div><!-- /teaser-content -->
	</div>
</cfoutput>

<cfsetting enablecfoutputonly="false" />