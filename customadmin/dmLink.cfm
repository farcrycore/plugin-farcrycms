<cfimport taglib="/farcry/core/tags/admin/" prefix="admin" />
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<!--- set up page header --->
<admin:header title="Link Admin" writingDir="#session.writingDir#" userLanguage="#session.userLanguage#" />

<!--- Override the client side validation for the filter fields. --->
<cfset stFilterMetaData = structNew() />
<cfset stFilterMetaData.title.ftValidation = "" />
<cfset stFilterMetaData.link.ftValidation = "" />

<ft:objectadmin 
	typename="dmLink"
	title="#application.adminBundle[session.dmProfile.locale].linksAdministration#"
	permissionset="link"
	columnList="title,link,catlink,datetimelastUpdated"
	sortableColumns="title,link,datetimelastUpdated"
	lFilterFields="title,link"
	stFilterMetaData="#stFilterMetaData#"
	sqlorderby="datetimelastUpdated desc"
	plugin="farcrycms"
	module="/dmLink.cfm" />

<admin:footer />