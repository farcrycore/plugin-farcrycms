<cfsetting enablecfoutputonly="true" /> 

<!--- @@displayname: FarCry CMS Plugin standard display --->
<!--- @@author: Matthew Bryant (mbryant@daemon.com.au)--->


<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />


<cfif len(stObj.link)>
	<cflocation url="#stObj.link#" addtoken="No" />
<cfelse>
	
	<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" template="displayHeaderStandard" pageTitle="#stObj.title#" />
			
		<skin:breadcrumb separator=" / ">
		
		<cfoutput>
		<h1>#stObj.title#</h1>
		<p>No link available.</p>
		</cfoutput>
		
	
	<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" template="displayFooterStandard" />
</cfif>


<cfsetting enablecfoutputonly="false" /> 
