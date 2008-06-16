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
<!--- @@displayname: XML Feed Rule execute --->

<!--- go get the feed --->
<cfhttp url="#stObj.xmlFeedURL#" method="get" throwonerror="yes" timeout="10" />

<cfset rss = createobject("component", "#application.packagepath#.farcry.rss") />
<cfset aItems = rss.getItemsAsArray(cfhttp.filecontent) />
<cfset count = arrayLen(aItems) />
<cfif count gt stobj.maxrecords>
	<cfset count = stobj.maxrecords />
</cfif>

<!--- Display the feed --->
<cfoutput>
	<div class="xmlfeed">
		#stObj.intro#
</cfoutput>

<cfloop from="1" to="#count#" index="i">
	<cfoutput>
		<div class="xmlitem">
			<a href="#aItems[i].link#">#aItems[i].title#</a> #application.thisCalendar.i18nDateFormat(aItems[i]["dc:date"],session.dmProfile.locale,application.longF)# 
			<br />
			#aItems[i].description#
		</div>
	</cfoutput>
</cfloop>

<cfoutput>
	</div>
</cfoutput>

<cfsetting enablecfoutputonly="false" />