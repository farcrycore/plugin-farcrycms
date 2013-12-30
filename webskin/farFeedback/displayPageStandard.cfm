<cfsetting enablecfoutputonly="true">
<!--- @@Copyright: Daemon Pty Limited 2002-2013, http://www.daemon.com.au --->
<!--- @@displayname: Feedback Preview --->

<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<skin:view stObject="#stObj#" webskin="webtopHeaderModal" />

<cfoutput>
	<div class="row">
		<div class="span2"></div>
		<div class="span8">
</cfoutput>

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

<cfoutput>
		</div>
		<div class="span2"></div>
	</div>
</cfoutput>

<skin:view stObject="#stObj#" webskin="webtopFooterModal" />
<cfsetting enablecfoutputonly="false">