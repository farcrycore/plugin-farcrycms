<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: Daemon Pty Limited 2002-2013, http://www.daemon.com.au --->
<!--- @@displayname: Email Feedback --->
<!--- @@description: Emails feedback to admin --->

<!--- import tag library --->
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<cfset stObj.objectid = createuuid() />
<cfmail 
    subject="#stObj.subject#" 
    from="#stObj.emailfrom#" 
    to="#stObj.emailto#" 
    type="html">
	<ft:object stObject="#stObj#" format="display" lFields="name,emailfrom,comments" />
</cfmail>

<cfsetting enablecfoutputonly="false" />