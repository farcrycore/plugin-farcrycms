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

<!--- @@displayname: Link Content Type --->
<!--- @@Description: Records links to external web assets. --->
<!--- @@Developer: Geoff Bowers (modius@daemon.com.au) --->
<cfcomponent extends="farcry.core.packages.types.types" displayname="Link" hint="You can create a library of external links using link content.  Links can be categorised and published throughout the site as needed." bSchedule="true" bUseInTree="true" bFriendly="true" bObjectBroker="true">
<!------------------------------------------------------------------------
type properties
------------------------------------------------------------------------->
<cfproperty ftseq="1" ftFieldset="Link Information" name="title" type="string" hint="Meaningful reference title for link" required="no" default="" ftlabel="Title" blabel="true" ftvalidation="required" />
<cfproperty ftseq="2" ftfieldset="Link Information" name="teaser" type="longchar" hint="A brief description of the link" required="no" default="" ftlabel="Teaser" />
<cfproperty ftSeq="3" ftFieldset="Link Information" name="teaserImage" type="uuid" hint="UUID of image to display in teaser" required="no" default="" fttype="uuid" ftjoin="dmImage" ftlabel="Teaser Image">
<cfproperty ftseq="4" ftfieldset="Link Information" name="link" type="string" hint="Url of link" required="no" default="" ftlabel="Link" fttype="url" ftvalidation="required" />
<cfproperty ftseq="5" ftfieldset="Link Information" name="displayMethod" type="string" hint="Display method to render this link object with." required="yes" default="displayPageStandard" fttype="webskin" ftprefix="displayPage" ftlabel="Display Method" />

<cfproperty ftseq="30" ftfieldset="Categorisation" name="catLink" type="longchar" hint="Link categorisation." required="no" default="" fttype="category" ftalias="dmLink" ftlabel="Link Category" />

<!--- system properties --->
<cfproperty name="status" type="string" hint="Status of the node (draft, pending, approved)." required="yes" default="draft" />

<cffunction name="display" access="public" output="false" returntype="void" hint="Redirect user to the link location by default.">
	<cfargument name="objectid" required="yes" type="UUID">
	
	<cfset var stObj = getData(arguments.objectid) />
	<cfif len(stObj.link)>
		<cflocation url="#stObj.link#" addtoken="No" />
	<cfelse>
		<cfthrow type="types.dmLink" message="No link available." detail="dmLink requires a valid URL for the link property in order to redirect." />
	</cfif>

</cffunction>

</cfcomponent>