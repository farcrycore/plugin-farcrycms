<cfsetting enablecfoutputonly="true">
<!--- @@cacheStatus: 1 --->
<!--- @@cacheTimeout: 15 --->
<!--- @@fuAlias: rss --->
<!--- @@viewStack: data --->
<!--- @@viewBinding: type --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cfset request.mode.ajax = true>

<!--- init rss channel metadata --->
<cfset stChannel = structNew()>
<cfset stChannel.title = "#application.displayname# News Feed">
<cfset stChannel.link = "http://#cgi.server_name#/">
<cfset stChannel.description = "Latest News Feed">
<cfset stChannel.version = "rss_2.0">


<cfset qNews = application.fapi.getContentObjects(maxRows=25,typename="dmNews",lProperties="objectID,title,teaser,publishDate",orderBy="publishDate DESC") />

<cfset qFeed = queryNew("title, content, publisheddate, rsslink") />
<cfloop from="1" to="#qNews.recordCount#" index="i">
	<cfset queryaddrow(qFeed, 1) />
	<cfset querysetcell(qFeed, "title", qNews.title[i]) />
	<cfset querysetcell(qFeed, "content", trim(left(REReplaceNoCase(qNews.teaser[i],"<[^>]*>","","ALL"),255))) />
	<cfset querysetcell(qFeed, "publisheddate", qNews.publishDate[i]) />
	<cfset querysetcell(qFeed, "rsslink", application.fapi.getLink(objectid=qNews.objectid[i],typename=qNews.typename[i],includeDomain=1)) />
</cfloop>

<cffeed 
	action="create"
	query="#qFeed#"
	properties="#stChannel#"
	xmlvar="rssXML">

<cfcontent reset="true" type="application/rss+xml"><cfoutput>#rssXML#</cfoutput>

<cfsetting enablecfoutputonly="false">