<!--- @@Copyright: Daemon Pty Limited 2002-2008, http://www.daemon.com.au --->
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
<cfcomponent extends="farcry.core.packages.types.arrayTable" displayname="Handpicked Rule Extended Array Table" hint="Handpicked Rule Extended Array Table" bObjectBroker="true">

	<!------------------------------------------------------------------------
	type properties
	------------------------------------------------------------------------->	
	<cfproperty ftseq="1" ftfieldset="General Details" name="webskin" type="string" hint="Webskin used when rendering the object." required="no" default="" ftType="list" ftlistdata="getWebskinList" ftlabel="Content Template" />
	
	
	<cffunction name="getWebskinList" access="public" output="false" returntype="query">
	
		<cfset var qWebskins = queryNew("init") />
		<cfset var rqWebskins = queryNew("init") />
		<cfset var st = createObject("component", application.stcoapi["ruleHandpicked_aObjects"].packagePath).getData(objectid=arguments.objectid) />
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