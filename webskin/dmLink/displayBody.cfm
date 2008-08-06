<cfsetting enablecfoutputonly="true" /> 

<!--- @@displayname: FarCry CMS Plugin standard body display --->
<!--- @@author: Matthew Bryant (mbryant@daemon.com.au)--->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfif len(stObj.link)>
	<cflocation url="#stObj.link#" addtoken="No" />
<cfelse>
	<cfoutput>
	<h1>#stObj.title#</h1>
	<p>No link available.</p>
	</cfoutput>
</cfif>

<cfsetting enablecfoutputonly="false" /> 