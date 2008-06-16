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
<cfimport taglib="/farcry/core/tags/admin" prefix="admin" />
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<!--- Override the client side validation for the filter fields. --->
<cfset stFilterMetaData = structNew() />
<cfset stFilterMetaData.subject.ftValidation = "" />
<cfset stFilterMetaData.emailfrom.ftValidation = "" />
<cfset stFilterMetaData.emailto.ftValidation = "" />
<cfset stFilterMetaData.name.ftValidation = "" />

<!--- set up page header --->
<admin:header title="News" />

<ft:objectadmin 
	typename="farFeedback"
	permissionset="news"
	title="Manage Feedback"
	columnList="subject,emailfrom,name,datetimecreated"
	sortableColumns="subject,emailfrom,name,datetimecreated"
	lFilterFields="subject,emailfrom,name"
	stFilterMetaData="#stFilterMetaData#"
	sqlorderby="datetimecreated desc"
	plugin="farcrycms"
	module="/farFeedback.cfm" />

<!--- setup footer --->
<admin:footer />