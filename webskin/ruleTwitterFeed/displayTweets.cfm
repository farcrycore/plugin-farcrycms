<cfsetting enablecfoutputonly="true" /> 
<!--- @@Copyright: Copyright (c) 2010 Daemon Pty Limited. All rights reserved. --->
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
<!--- @@displayname: Display Tweets --->
<!--- @@description: Display tweets for a nominated screen name; cached for 15 minutes. Override this view in your project to easily alter the way the tweets are displayed. --->
<!--- @@cacheStatus: 1 --->
<!--- @@cacheTimeout: 15 --->

<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<!--- environment vars --->
<cfset stLocal.aTweets = getTweets(stobj.screenname, stobj.pagesize) />

<!--- 
 // view
--------------------------------------------------------------------------------------------------->
<cfoutput>
	<div class="tweet-pod">
		<h3>#stObj.title#</h3>
		<cfloop from="1" to="#arrayLen(stLocal.aTweets)#" index="i">
			<div class="tweet">
				<a href="http://www.twitter.com/#stObj.screenname#"><img src="#stLocal.aTweets[i].twitProfilePic#" style="padding-right:10px;float:left;" alt="#stobj.screenname#" /></a>
				<p>#stLocal.aTweets[i].twit#<br><em>#stLocal.aTweets[i].twitDate#</em></p>							
			</div>
		</cfloop>
		<a href="http://www.twitter.com/#stObj.screenname#">Follow #stObj.screenname# on Twitter</a>
	</div>
</cfoutput>

<cfsetting enablecfoutputonly="false" />