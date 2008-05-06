<cfcomponent displayname="Feedback" hint="Allows users to post feedback" extends="farcry.core.packages.types.types" output="false">
	<cfproperty ftSeq="1" ftFieldset="" name="subject" type="string" default="" hint="The subject of the email" ftLabel="Subject" ftType="string" ftValidation="required" />
	<cfproperty ftSeq="2" ftFieldset="" name="emailfrom" type="string" default="" hint="The email of the person leaving feedback" ftLabel="From" ftType="email" ftValidation="required" />
	<cfproperty ftSeq="3" ftFieldset="" name="emailto" type="string" default="" hint="The email that the feedback was sent to" ftLabel="To" ftType="string" ftValidation="required" />
	<cfproperty ftSeq="4" ftFieldset="" name="name" type="string" default="" hint="The name of the person leaving feedback" ftLabel="Name" ftType="string" ftValidation="required" />
	<cfproperty ftSeq="5" ftFieldset="" name="comments" type="longchar" default="" hint="" ftLabel="Comment" ftType="longchar" ftValidation="required" />
	
	<cffunction name="sendFeedback" access="public" returntype="boolean" description="Sends the relevant emails" output="false">
		<cfargument name="objectid" type="uuid" required="false" hint="" />
		<cfargument name="stObject" type="struct" required="false" hint="" />
		
		<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />
		
		<cfif structkeyexists(arguments,"objectid")>
			<cfset arguments.stObject = getData(arguments.objectid) />
		</cfif>
		
		<cftry>
			<skin:view stObject="#arguments.stObject#" webskin="emailFeedback" />
			<skin:view stObject="#arguments.stObject#" webskin="emailResponse" />
			
			<cfreturn true />
			
			<cfcatch type="any">
				<cfreturn false />
			</cfcatch>
		</cftry>
	</cffunction>
	
</cfcomponent>