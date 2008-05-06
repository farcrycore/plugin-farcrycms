<cfsetting enablecfoutputonly="true" />
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