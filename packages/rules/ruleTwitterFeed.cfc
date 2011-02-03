<!--- @@Copyright: Daemon Pty Limited 1997-2010, http://www.daemon.com.au --->
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
<!--- @@displayname: Twitter Feed Rule --->
<!--- @@description: Display tweets for a nominated Twitter screen name. --->

<cfcomponent 
	displayname="Utility: Twitter Feed" extends="farcry.core.packages.rules.rules" output="false" 
	hint="Adds a twitter feed to the page" 
	bObjectBroker="true">
	
	<cfproperty 
		name="title" type="string" default="" 
		ftSeq="1" ftFieldset="Twitter Feed" ftLabel="Title" 
		fthint="Title for the Twitter feed."
		ftType="string" />
		
	<cfproperty 
		name="screenname" type="string" default="" 
		ftSeq="2" ftFieldset="Twitter Feed" ftLabel="Screen name" 
		fthint="The screen name of the Twitter user to follow (without the @). For example, @modius would be modius."
		ftType="string" />
		
	<cfproperty 
		name="pagesize" type="numeric" default="5" 
		ftSeq="3" ftFieldset="Twitter Feed" ftLabel="Tweets" 
		fthint="The number of status messages to retrieve." 
		ftType="integer" />

	<cfproperty 
		name="bajax" type="boolean" default="true" 
		ftSeq="4" ftFieldset="Twitter Feed" ftLabel="AJAX Feed"
		fthint="Select if you want the feed to be retrieved asynchronously." 
		ftType="boolean" />

	<!--- 
	 // methods
	--------------------------------------------------------------------------------------------------->
	<cffunction name="getTweets" returntype="array" access="public" output="false" hint="Gets a bunch of tweets based on a nominated twitter screen name.">
	
		<cfargument name="screenname" type="string" required="true" />
		<cfargument name="pagesize" type="numeric" required="false" default="1" />
		
		<cfset var apiURL = "http://api.twitter.com/1/statuses/user_timeline/#arguments.screenname#.xml?count=#round(arguments.pagesize)#" />
		<cfset var xmlTwitter = "" />
		<cfset var aTwits = arrayNew(1) />
		<cfset var aParsedTwits=arrayNew(1) />
		<cfset var i = 0 />
	
		<!--- get twits --->
		<cfhttp url="#apiURL#" result="xmlTwitter" />
	
		<cfif NOT isxml(xmlTwitter.filecontent)>
			<cfreturn arrayNew(1) />
		</cfif>

		<cfset xmlTwitter = xmlparse(xmlTwitter.filecontent) />
		<cfset aTwits = xmlSearch(xmlTwitter, "//status") />

		<!--- parse the xml into a purty array --->
		<cfloop from="1" to="#arrayLen(aTwits)#" index="i">

			<cfset aParsedTwits[i] = structNew()>		
			<cfset aParsedTwits[i].twit = aTwits[i].text.xmltext />
			<cfset aParsedTwits[i].twitdate = "- " & aTwits[i].user.screen_name.xmlText & timeFormat(aTwits[i].created_at.xmltext, " h:mmtt ") & dateFormat(aTwits[i].created_at.xmltext, "d/mm") />
			<cfset aParsedTwits[i].twitProfilePic = aTwits[i].user.profile_image_url.xmlText />

			<!--- activate urls --->
			<cfset aParsedTwits[i].twit = rereplace(rereplace(aParsedTwits[i].twit,"(https?://\w+([/\.][^ \./]+)+)","<a href='\1'>\1</a>","ALL"),"@([\w_]+)","<a href='http://twitter.com/\1'>@\1</a>","ALL") />
		</cfloop>

		<cfreturn aParsedTwits />

	</cffunction>

</cfcomponent>