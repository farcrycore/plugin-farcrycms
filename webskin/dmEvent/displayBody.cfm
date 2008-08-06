<cfsetting enablecfoutputonly="true" /> 

<!--- @@displayname: FarCry CMS Plugin standard body display --->
<!--- @@author: Matthew Bryant (mbryant@daemon.com.au)--->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfoutput>
<h1>#stObj.title#</h1>
<p>
	<strong>Where:</strong> #stObj.location#<br />
	<strong>When:</strong> #dateformat(stobj.startDate)# #timeformat(stobj.startDate)#
	<cfif showFarcryDate(stobj.endDate)> 
		until #dateformat(stObj.endDate)# #timeformat(stObj.endDate)#
	</cfif>
</p>
#stObj.body#
</cfoutput>

<cfsetting enablecfoutputonly="false" /> 