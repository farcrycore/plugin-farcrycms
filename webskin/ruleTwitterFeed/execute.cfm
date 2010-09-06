<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: Daemon Pty Limited 1995-2009, http://www.daemon.com.au --->
<!--- @@displayname: AOC: Twitter Feed --->
<!--- @@description: outputs n tweets for defined screen name --->
<!--- @@cacheStatus: 1 --->
<!--- @@cacheTimeout: 60 --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />
	
<!--- get twits --->
<cfhttp url="http://twitter.com/statuses/user_timeline/#stObj.screenname#.xml?count=#stObj.pagesize#&page=1" result="xmlTwitter" />



<cfset twitterProfile="Twitter Profile" />
<cfset twitterFeed="Twitter Feed" />
    
<cfif isxml(xmlTwitter.filecontent)>

    <cfset xmlTwitter = xmlparse(xmlTwitter.filecontent) />
    <cfset aTwits = xmlSearch(xmlTwitter, "//status") />
	<cfset aParsedTwits=arrayNew(1)>
	
	
	<!--- parse the xml and pass a nice array to the a webskin for overriding if needed --->
	<cfloop from="1" to="#arrayLen(aTwits)#" index="i">
		
		<cfset aParsedTwits[i] = structNew()>		
		<cfset aParsedTwits[i].twit = aTwits[i].text.xmltext />
		<cfset aParsedTwits[i].twitdate = "- " & aTwits[i].user.screen_name.xmlText & timeFormat(aTwits[i].created_at.xmltext, " h:mmtt ") & dateFormat(aTwits[i].created_at.xmltext, "d/mm") />
		<cfset aParsedTwits[i].twitProfilePic = "#application.url.webroot#/css/images/icon-twitter.png" />			
			
		<cfif len(aTwits[i].user.profile_image_url.xmlText)>
			<cfset aParsedTwits[i].twitProfilePic = aTwits[i].user.profile_image_url.xmlText />
		</cfif>
			
		<!--- activate urls --->
		<cfset aParsedTwits[i].twit = rereplace(rereplace(aParsedTwits[i].twit,"(https?://\w+([/\.][^ \./]+)+)","<a href='\1'>\1</a>","ALL"),"@([\w_]+)","<a href='http://twitter.com/\1'>@\1</a>","ALL") />
		
	</cfloop>
	
	<skin:view objectID="#stObj.objectID#" typename="#stObj.typename#" webskin="displayAjax" aTweets="#aParsedTwits#"/>
<cfelse>
	<skin:view objectID="#stObj.objectID#" typename="#stObj.typename#" webskin="displayNoTweets" />
</cfif>

<cfsetting enablecfoutputonly="false" />