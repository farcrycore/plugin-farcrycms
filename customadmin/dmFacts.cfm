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

<cfimport taglib="/farcry/core/tags/admin/" prefix="admin">
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<!--- Override the client side validation for the filter fields. --->
<cfset stFilterMetaData = structNew() />
<cfset stFilterMetaData.title.ftValidation = "" />
<cfset stFilterMetaData.link.ftValidation = "" />

<!--- set up page header --->
<admin:header title="Fact Admin" writingDir="#session.writingDir#" userLanguage="#session.userLanguage#" />

<ft:objectadmin 
	typename="dmFacts"
	title="#application.rb.getResource('factsAdministration', 'Facts Administration')#"
	permissionset="fact"
	columnList="title,link,catfacts,datetimelastUpdated"
	sortableColumns="title,link,datetimelastUpdated"
	lFilterFields="title,link"
	stFilterMetaData="#stFilterMetaData#"
	sqlorderby="datetimelastUpdated desc"
	plugin="farcrycms"
	module="/dmFacts.cfm" />

<admin:footer />