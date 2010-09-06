<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: Daemon Pty Limited 1995-2009, http://www.daemon.com.au --->
<!--- @@displayname: Utility: Twitter Feed --->
<!--- @@description: outputs n tweets for defined screen name --->	

<cfset stLocal.tweetlimit = "10" />
<cfif structKeyExists(stObj, "pagesize") and stObj.pagesize gt 0>
	<cfset stLocal.tweetlimit = stObj.pagesize />
</cfif>

<cfsavecontent variable="twitterFeed">
	
	<cfloop from="1" to="#arrayLen(stParam.aTweets)#" index="i">

		<cfif i MOD 2>
			<cfoutput>
				<div>
					<div class="pod-content-wrap">

						<a href="http://www.twitter.com/#stObj.screenname#">
							<img src="#stParam.aTweets[i].twitProfilePic#" style="padding-right:10px;float:left;" alt="Twitter Profile Pic">
						</a>

						<div class="twitter-text">
							<p>#stParam.aTweets[i].twit#</p>
							<em style="float:right;">#stParam.aTweets[i].twitDate#</em>
						</div>
						
						<br class="clearer">							
					</div>
				</div>
			</cfoutput>
		<cfelse>
			<cfoutput>
				<div class="twitter-bg">
					<div class="pod-content-wrap">

						<a href="http://www.twitter.com/#stObj.screenname#">
							<img src="#stParam.aTweets[i].twitProfilePic#" style="padding-right:10px;float:left;" alt="Twitter Profile Pic">
						</a>

						<div class="twitter-text">
							<p>#stParam.aTweets[i].twit#</p>
							<em style="float:right;">#stParam.aTweets[i].twitDate#</em>
						</div>
						
						<br class="clearer">
					</div>
				</div>
			</cfoutput>	
		</cfif>
		
		<cfif i eq stLocal.tweetlimit>
			<cfbreak />
		</cfif>
	</cfloop>
	
</cfsavecontent>	


<cfoutput>
	<div class="pod-bottom greybutton">
	
		<div class="pod-top">
			<h3>#stObj.title#</h3>
		</div>
	
		<div class="pod twitter pod-body">
			#twitterFeed#
		</div>
		
		<div class="pod-morelink">
			<a href="http://www.twitter.com/#stObj.screenname#">
				Follow #stObj.screenname# on Twitter
			</a>
		</div>

	</div>
</cfoutput> 

<cfsetting enablecfoutputonly="false" />