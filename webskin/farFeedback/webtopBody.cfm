<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Feedback Webtop Body --->

<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<!--- Override the client side validation for the filter fields. --->
<cfset stFilterMetaData = structNew() />
<cfset stFilterMetaData.subject.ftValidation = "" />
<cfset stFilterMetaData.emailfrom.ftValidation = "" />
<cfset stFilterMetaData.emailto.ftValidation = "" />
<cfset stFilterMetaData.name.ftValidation = "" />

<ft:objectadmin 
	typename="farFeedback"
	title="Manage Feedback"
	bEditCol="false"
	columnList="subject,emailfrom,name,datetimecreated"
	sortableColumns="subject,emailfrom,name,datetimecreated"
	lFilterFields="subject,emailfrom,name"
	stFilterMetaData="#stFilterMetaData#"
	sqlorderby="datetimecreated desc" />

<cfsetting enablecfoutputonly="false">