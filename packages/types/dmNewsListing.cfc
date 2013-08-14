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
<cfcomponent extends="farcry.core.packages.types.versions" displayname="News Listing" 
	hint="Make configurable dmnews listings." 
	bSchedule="true" bFriendly="true" fualias="newslisting" bUseInTree="true"
	bObjectBroker="true">
<!------------------------------------------------------------------------
type properties
------------------------------------------------------------------------->	
<cfproperty 
	name="title" type="string" hint="News title." required="no" default="" 
	ftseq="1" ftFieldset="General Details" ftwizardStep="General Details" ftlabel="Title" ftvalidation="required" />

<cfproperty 
	name="Teaser" type="longchar" hint="Teaser text." required="no" default="" 
	ftseq="2" ftFieldset="General Details" ftwizardStep="General Details" ftlabel="Teaser" />

<cfproperty 
	name="numNews" type="integer" ftType="integer" ftLabel="Number of News to display" required="true" default="0"
	ftSeq="20" ftFieldset="Configuration"  ftWizardStep="General Details" 
	ftHint="The number of news items to display. 0 to display all">

<cfproperty 
	name="bPagination" type="boolean" ftLabel="Paginaton" required="false" default="false" 
	ftSeq="22" ftFieldset="Configuration" ftWizardStep="General Details"
	ftHint="Enable/Disable Pagination.">

<cfproperty 
	name="metadata" type="longchar" hint="A list of categories that the news content must match in order to be shown." required="false" default=""
	ftseq="30" ftfieldset="Categorisation" ftwizardStep="General Details" ftlabel="Selected News Categories"
	fttype="category" ftalias="dmNews"  />

<cfproperty 
	name="bMatchAllKeywords" type="boolean" hint="Does the content need to match ALL selected keywords?" required="false" default="0"
	ftSeq="31" ftFieldset="Categorisation" ftLabel="Match all the selected categories?" 
    ftType="boolean" ftHint="If this box is ticked, an article must be tagged with all of the selected categories in order to appear in this area." />

<!------------------------------------------------------------------------
object methods 
------------------------------------------------------------------------->	

<cffunction name="getNews" returntype="query" output="false" access="public" hint="Returns dmNews base on category">
	<cfargument name="category" type="string" required="false" default="" />
	<cfargument name="bMatchAllKeywords" type="boolean" required="false" default="false" />

	<cfif NOT len(trim(arguments.category))>
		<cfset var q = application.fapi.getContentObjects(typename="dmNews", publishdate_lte=now(), expirydate_gte=now(), orderby="publishdate DESC", status="approved") />
	<cfelseif arguments.bMatchAllKeywords>
		<cfset var q = application.fapi.getContentObjects(typename="dmNews", publishdate_lte=now(), expirydate_gte=now(), catNews_eq=arguments.category, orderby="publishdate DESC", status="approved") />
	<cfelse>
		<cfset var q = application.fapi.getContentObjects(typename="dmNews", publishdate_lte=now(), expirydate_gte=now(), catNews_in=arguments.category, orderby="publishdate DESC", status="approved") />
	</cfif>

	<cfreturn q />
</cffunction>

</cfcomponent>
