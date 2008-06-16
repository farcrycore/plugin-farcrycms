<cfsetting enablecfoutputonly="true" />
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
<!--- @@displayname: Show feedback form --->

<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<ft:processform action="Send">
	<ft:processformobjects typename="farFeedback">
		<cfif isvalid("email",stProperties.emailfrom)>
			<cfset oFeedback = createobject("component",application.stCOAPI["farFeedback"].packagepath) />
			
			<cfset stProperties.emailto = stObj.emailto />
			<cfset stProperties.subject = "Feedback email from: #stObj.title#" />
			
			<cfset oFeedback.sendFeedback(stObject=stProperties) />
			
			<cfset variables.feedbacksent = true />
		<cfelse>
			<ft:advice objectid="#stProperties.objectid#" field="emailfrom" value="#stProperties.emailfrom#" message="This must be a valid email address" />
			<ft:break />
		</cfif>
	</ft:processformobjects>
</ft:processform>

<cfset stPropMetadata = structnew() />
<cfset stPropMetadata.emailfrom.ftLabel = "Email" />

<ft:form>
	<cfoutput><h2>#stObj.title#</h2></cfoutput>
	
	<cfif structkeyexists(variables,"feedbacksent") and variables.feedbacksent>
		<cfoutput><p class="success">#stObj.success#</p></cfoutput>
	</cfif>
	
	<ft:object typename="farFeedback" lFields="name,emailfrom,comments" stPropMetadata="#stPropMetadata#" IncludeFieldSet="false" />
	<cfoutput><br/></cfoutput>
	
	<ft:farcrybuttonpanel>
		<ft:farcrybutton value="Send" />
	</ft:farcrybuttonpanel>
</ft:form>

<cfsetting enablecfoutputonly="false" />