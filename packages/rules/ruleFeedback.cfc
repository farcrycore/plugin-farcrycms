<cfcomponent displayname="Feedback: Feedback Form" hint="Allows website users to send feedback" extends="farcry.core.packages.rules.rules" output="false">
	<cfproperty ftSeq="1" ftFieldset="" name="title" type="string" default="" hint="Title of form" ftLabel="Title" ftType="string" ftValidation="required" />
	<cfproperty ftSeq="2" ftFieldset="" name="emailto" type="longchar" default="" hint="List of email addresses that feedback should be sent to" ftLabel="Send feedback to" ftType="string" ftValidation="required" />
	<cfproperty ftSeq="3" ftFieldset="" name="success" type="longchar" default="Thank you for your feedback." hint="Response message when feedback has been sent" ftLabel="Success message" ftValidation="required" />
	
</cfcomponent>