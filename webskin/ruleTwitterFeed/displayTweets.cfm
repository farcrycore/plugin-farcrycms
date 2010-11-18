<cfsetting enablecfoutputonly="true" /> 
<!--- @@Copyright: Copyright (c) 2010 Daemon Pty Limited. All rights reserved. --->
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