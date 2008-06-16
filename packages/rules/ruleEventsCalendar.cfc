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
<!--- @@Description: 
ruleEventsCalendar (FarCry Core)
Publishing rule for showing Event content items in a month calendar view format. --->
<!--- @@Developer: Geoff Bowers (modius@daemon.com.au) --->
<cfcomponent displayname="Events: Calendar Rule" extends="farcry.core.packages.rules.rules" 
	hint="Publishing rule for showing Event content items in a month calendar view format.">

	<cfproperty ftSeq="1" ftFieldSet="Introduction" name="intro" type="string" hint="Intro text for the event listing" required="no" default="" ftType="longchar" ftLimit="255">
	<cfproperty ftSeq="2" ftFieldSet="Introduction" name="months" type="numeric" hint="Number of months to show" required="yes" default="1">
	<cfproperty ftSeq="3" ftFieldSet="Introduction" name="displayMethod" type="string" hint="Display method to render this event rule with." required="yes" default="displayTeaserCalendar" ftLabel="Display Method" ftType="webskin" ftPrefix="displayTeaserCalendar" ftTypename="ruleEventsCalendar">
	<cfproperty ftSeq="11" ftFieldSet="Categories" name="bMatchAllKeywords" hint="Doest the content need to match ALL selected keywords" type="boolean" required="false" default="0">
	<cfproperty ftSeq="12" ftFieldSet="Categories" name="metadata" type="longchar" hint="A list of category ObjectIDs that the news content is to be drawn from" required="false" default="" ftType="category">

	<cffunction name="getDefaultProperties" returntype="struct" access="public">
		<cfscript>
			stProps=structNew();
			stProps.objectid = createUUID();
			stProps.label = '';
			stProps.displayMethod = 'displayteaserCalendar';
			stProps.bMatchAllKeywords = 0;
			stProps.metadata = '';
		</cfscript>	
		<cfreturn stProps>
	</cffunction>  

</cfcomponent>