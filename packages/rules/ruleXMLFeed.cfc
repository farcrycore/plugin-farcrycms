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
<!--- 
|| DESCRIPTION || 
$Description: Publishing rule to pull, parse and display external RSS feeds.  Is dependent on the rss.cfc component. $
$TODO: add application scope cacheing to query$

|| DEVELOPER ||
$Developer: Geoff Bowers (modius@daemon.com.au) $
--->
<!--- <cfsetting enablecfoutputonly="Yes"> --->
<cfcomponent displayname="Utility: XML Feed Publishing Rule" extends="farcry.core.packages.rules.rules" hint="Displays an XML feed within a container">

	<!--- rule object properties --->
	<cfproperty ftSeq="1" ftFieldset="" name="feedName" type="string" default="" hint="A useful name for this feed" ftLabel="Feed name" ftType="string" />
	<cfproperty ftSeq="2" ftFieldset="" name="XMLFeedURL" type="string" default="" hint="The location of the feed (URL)" ftLabel="Feed URL" ftType="string" />
	<cfproperty ftSeq="3" ftFieldset="" name="intro" type="string" default="" hint="An introduction to this feed" ftLabel="Introduction" ftType="longchar" />
	<cfproperty ftSeq="4" ftFieldset="" name="maxRecords" type="numeric" default="20" hint="The maximum number of records to return to the user" ftLabel="Max. records" ftType="integer" />
	
</cfcomponent>

