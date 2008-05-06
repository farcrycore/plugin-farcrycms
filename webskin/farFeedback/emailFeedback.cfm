<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Emails feedback --->
<!--- @@description: Emails feedback to admin --->

<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<cfset stObj.objectid = createuuid() />
<cfmail subject="#stObj.subject#" from="#stObj.emailfrom#" to="#stObj.emailto#" type="html">
	<ft:object stObject="#stObj#" format="display" lFields="emailfrom,name,comments"  />
</cfmail>

<cfsetting enablecfoutputonly="false" />