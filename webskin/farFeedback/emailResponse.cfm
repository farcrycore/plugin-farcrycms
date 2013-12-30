<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: Daemon Pty Limited 2002-2013, http://www.daemon.com.au --->
<!--- @@displayname: Email Response --->
<!--- @@description: Sends a response to the user leaving feedback --->

<cfmail 
    subject="Thankyou for your feedback" 
    from="#stObj.emailto#" 
    to="#stObj.emailfrom#" 
    type="html"><cfoutput>
	<p>Hello #stObj.name#</p>
	<p>We appreciate the time you've taken to send us feedback. If you have any further comments please don't hesitate to contact us again.</p>
	<p>Sincerely,<br/>The #cgi.http_host# web team.</p>
</cfoutput></cfmail>

<cfsetting enablecfoutputonly="false" />