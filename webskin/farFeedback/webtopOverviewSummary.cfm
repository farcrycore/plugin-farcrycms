<cfsetting enablecfoutputonly="true">
<!--- @@Copyright: Daemon Pty Limited 2002-2013, http://www.daemon.com.au --->
<!--- @@displayname: Feedback Webtop Overview Summary --->


<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />


<!--- 
 // view 
--------------------------------------------------------------------------------->
<skin:view stObject="#stObj#" webskin="webtopOverviewDevActions" />

<ft:form>
	<ft:object 
		stobject="#stobj#" 
		typename="farFeedback" 
		lfields="subject, name, emailfrom, comments" 
		format="display" 
		legend="#application.fapi.getContentTypeMetadata(stobj.typename,'displayname',stobj.typename)# Information" />
	
	<ft:object 
		stobject="#stobj#" 
		typename="farFeedback" 
		lfields="emailto, datetimecreated" 
		format="display" 
		legend="Administration Details" />
</ft:form>

<cfsetting enablecfoutputonly="false">