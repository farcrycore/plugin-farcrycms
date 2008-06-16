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
<!--- @@displayname: Emails a response --->
<!--- @@description: Sends a response to the user leaving feedback --->

<cfmail subject="Thankyou for your feedback" from="#stObj.emailto#" to="#stObj.emailfrom#" type="html"><cfoutput>
	<p>Hello #stObj.name#</p>
	<p>We appreciate the time you've taken to send us feedback. If you have any further comments please don't hesitate to contact us again.</p>
	<p>Sincerely,<br/>The #cgi.http_host# web team.</p>
</cfoutput></cfmail>

<cfsetting enablecfoutputonly="false" />