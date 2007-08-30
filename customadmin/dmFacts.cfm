<cfimport taglib="/farcry/core/tags/admin/" prefix="admin">
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<!--- Override the client side validation for the filter fields. --->
<cfset stFilterMetaData = structNew() />
<cfset stFilterMetaData.title.ftValidation = "" />
<cfset stFilterMetaData.link.ftValidation = "" />

<!--- set up page header --->
<admin:header title="Fact Admin" writingDir="#session.writingDir#" userLanguage="#session.userLanguage#" />

<ft:objectadmin 
	typename="dmFacts"
	title="#application.adminBundle[session.dmProfile.locale].factsAdministration#"
	permissionset="fact"
	columnList="title,link,catfacts,datetimelastUpdated"
	sortableColumns="title,link,datetimelastUpdated"
	lFilterFields="title,link"
	stFilterMetaData="#stFilterMetaData#"
	sqlorderby="datetimelastUpdated desc"
	plugin="farcrycms"
	module="/dmFacts.cfm" />

<admin:footer />