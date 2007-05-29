<cfcomponent extends="farcry.core.packages.types.arrayTable" displayname="Handpicked Rule Extended Array Table" hint="Handpicked Rule Extended Array Table" bObjectBroker="true">

	<!------------------------------------------------------------------------
	type properties
	------------------------------------------------------------------------->	
	<cfproperty ftseq="1" ftfieldset="General Details" name="webskin" type="string" hint="Webskin used when rendering the object." required="no" default="" ftType="list" ftlistdata="getWebskinList" ftlabel="Content Template" />
	
	
	<cffunction name="getWebskinList" access="public" output="false" returntype="query">
	
		<cfset var qWebskins = queryNew("init") />
		<cfset var rqWebskins = queryNew("init") />
		<cfset var st = createObject("component", application.stcoapi["ruleMyHandpicked_aObjects"].packagePath).getData(objectid=arguments.objectid) />
		<cfset var handpickedTypename = application.coapi.COAPIADMIN.findType(objectid=st.data) />
		<cfset var stHandpickedObject = createObject("component", application.stcoapi["#handpickedTypename#"].packagePath).getData(objectid=st.data) />
		
		<cfif len(handpickedTypename)>
			<cfset qWebskins = application.coapi.COAPIADMIN.getWebskins(typename=stHandpickedObject.typename, prefix="displayTeaser") />
		</cfif>
		
		<cfquery dbtype="query" name="qWebskins">
		SELECT methodName as [value], displayname as name
		from qWebskins
		</cfquery>
		
		<cfreturn qWebskins />
	</cffunction> 


</cfcomponent>