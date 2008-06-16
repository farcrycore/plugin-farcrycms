<cfsetting enablecfoutputonly="true">
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
$Description: teaser template
|| DEVELOPER ||
$Developer: Gavin Stewart (gavin@daemon.com.au)$
--->
<!--- @@displayname: b.h3 level heading inside a "featurebox" --->
<!--- @@author: Gavin Stewart (gavin@daemon.com.au)--->


<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cfoutput>
	<h3><a href="#stObj.link#" target="_new">#stObj.Title#</a></h3>
	<cfif trim(len(stObj.teaser))>
		<p>
		#stObj.teaser#
		<a href="#stObj.link#" target="_new" class="morelink">Go<span>about:#stObj.Title#</span></a>
		</p>
	</cfif>
</cfoutput>

<cfsetting enablecfoutputonly="false">
