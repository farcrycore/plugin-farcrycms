<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: Daemon Pty Limited 2002-2013, http://www.daemon.com.au --->
<!--- @@displayname: Feedback Form --->

<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<!--- 
 // process feedback form 
--------------------------------------------------------------------------------->
<ft:processform action="Send Feedback">
	<ft:processformobjects typename="farFeedback">
		<cfif isvalid("email",stProperties.emailfrom)>
			<cfset oFeedback = application.fapi.getContentType(typename="farFeedback") />
			
			<cfset stProperties.emailto = stObj.emailto />
			<cfset stProperties.subject = "Feedback: #stObj.title# (#stProperties.name#)" />
			
			<cfset oFeedback.sendFeedback(stObject=stProperties) />
			
			<cfset variables.feedbacksent = true />
		<cfelse>
			<ft:advice objectid="#stProperties.objectid#" field="emailfrom" value="#stProperties.emailfrom#" message="This must be a valid email address" />
			<ft:break />
		</cfif>
	</ft:processformobjects>
</ft:processform>

<!--- 
 // view: show feedback form 
--------------------------------------------------------------------------------->
<cfset stPropMetadata = structnew() />
<cfset stPropMetadata.emailfrom.ftLabel = "Email" />

<ft:form>
	<cfoutput><h3>#stObj.title#</h3></cfoutput>
	
	<cfif structkeyexists(variables,"feedbacksent") and variables.feedbacksent>
		<cfoutput>
		<div class="alert alert-success">
  		<button type="button" class="close" data-dismiss="alert">&times;</button>
  		<h4>#stObj.successTitle#</h4>
  		#stObj.successResponse#
		</div>
		</cfoutput>
	</cfif>
	
	<ft:object typename="farFeedback" lFields="name,emailfrom,comments" stPropMetadata="#stPropMetadata#" IncludeFieldSet="false" />
	<cfoutput><br/></cfoutput>
	
	<ft:buttonpanel>
		<ft:button value="Send Feedback" primaryAction="true" icon="fa-envelope" class="input-xlarge" />
	</ft:buttonpanel>
</ft:form>

<cfsetting enablecfoutputonly="false" />