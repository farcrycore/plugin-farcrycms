<cfsetting enablecfoutputonly="true" /> 

<!--- @@displayname: FarCry CMS Plugin standard page display --->
<!--- @@author: Matthew Bryant (mbryant@daemon.com.au)--->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" template="displayHeaderStandard" pageTitle="#stObj.title#" />
		
	<skin:breadcrumb separator=" / ">
	
	<skin:view typename="#stobj.typename#" objectid="#stobj.objectid#" webskin="displayBody" />

<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" template="displayFooterStandard" />

<cfsetting enablecfoutputonly="false" /> 
