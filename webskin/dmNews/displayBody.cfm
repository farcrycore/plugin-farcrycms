<cfsetting enablecfoutputonly="true" /> 

<!--- @@displayname: FarCry CMS Plugin standard body display --->
<!--- @@author: Matthew Bryant (mbryant@daemon.com.au)--->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfoutput>
<h1>
	<span class="date">#dateformat(stObj.publishDate, "dd mmm yyy")#</span>
	#stObj.title#
</h1>
#stObj.body#
</cfoutput>


<cfsetting enablecfoutputonly="false" /> 