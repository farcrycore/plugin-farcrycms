<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: Daemon Pty Limited 2002-2013, http://www.daemon.com.au --->
<!--- @@displayname: Random Fact Rule --->

<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin/" prefix="skin" />

<!--- get random facts --->
<cfset qFacts = getFacts(stobj.metadata, stobj.bMatchAllKeywords, stobj.numItems)>

<!--- if the intro text exists - append to aInvocations to be output as HTML --->
<cfoutput>
	#stObj.intro#
</cfoutput>

<!--- Loop Through facts and Display --->
<cfloop query="qFacts">
	<skin:view objectid="#qFacts.objectid[currentrow]#" webskin="#stObj.displayMethod#" alternateHTML="" />
</cfloop>


<cfsetting enablecfoutputonly="false" />