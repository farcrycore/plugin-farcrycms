<cfsetting enablecfoutputonly="true" /> 

<!--- @@displayname: FarCry CMS Plugin standard display --->
<!--- @@author: Matthew Bryant (mbryant@daemon.com.au)--->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" template="displayHeaderStandard" pageTitle="#stObj.title#" />
		
	<skin:breadcrumb separator=" / ">
	
	<cfoutput>
	<h1>#stObj.title#</h1>
	<p>
		<strong>Where:</strong> #stObj.location#<br />
		<strong>When:</strong> #dateformat(stobj.startDate)# #timeformat(stobj.startDate)#
		<cfif showFarcryDate(stobj.endDate)> 
			until #dateformat(stObj.endDate)# #timeformat(stObj.endDate)#
		</cfif>
	</p>
	<div class="fc-richtext">#stObj.body#</div>
	</cfoutput>
	

<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" template="displayFooterStandard" />

<cfsetting enablecfoutputonly="false" /> 
