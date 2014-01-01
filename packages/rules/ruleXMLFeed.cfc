<!--- @@Copyright: Daemon Pty Limited 2002-2013, http://www.daemon.com.au --->
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
<cfcomponent 
    extends="farcry.core.packages.rules.rules"
    displayname="RSS Feed" 
    hint="Import a third-party RSS feed and display."
    bobjectbroker="true">

    <cfproperty name="feedName" type="string" default="" 
        ftSeq="1" ftFieldset="" ftLabel="Feed name" 
        ftType="string"
        fthint="Admin only. A useful name for this feed; will not be displayed to users.">

    <cfproperty name="XMLFeedURL" type="string" default="" 
        ftSeq="2" ftFieldset="" ftLabel="Feed URL" 
        ftType="string"
        fthint="Feed URL; for example, http://www.fullasagoog.com/rss.cfm">

    <cfproperty name="intro" type="string" default="" 
        ftSeq="3" ftFieldset="" ftLabel="Introduction" 
        ftType="longchar" ftlimit="512"
        fthint="Optional. Introduction text for the feed.">

    <cfproperty name="maxRecords" type="numeric" default="15" 
        ftSeq="4" ftFieldset="" ftLabel="Max. records" 
        ftType="integer"
        fthint="The maximum number of records to return to the user">
	
</cfcomponent>

