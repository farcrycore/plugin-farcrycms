<cfimport taglib="/farcry/core/tags/admin" prefix="admin" />
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<!--- Override the client side validation for the filter fields. --->
<cfset stFilterMetaData = structNew() />
<cfset stFilterMetaData.subject.ftValidation = "" />
<cfset stFilterMetaData.emailfrom.ftValidation = "" />
<cfset stFilterMetaData.emailto.ftValidation = "" />
<cfset stFilterMetaData.name.ftValidation = "" />

<!--- set up page header --->
<admin:header title="News" />

<ft:objectadmin 
	typename="farFeedback"
	permissionset="news"
	title="Manage Feedback"
	columnList="subject,emailfrom,name,datetimecreated"
	sortableColumns="subject,emailfrom,name,datetimecreated"
	lFilterFields="subject,emailfrom,name"
	stFilterMetaData="#stFilterMetaData#"
	sqlorderby="datetimecreated desc"
	plugin="farcrycms"
	module="/farFeedback.cfm" />

<!--- setup footer --->
<admin:footer />