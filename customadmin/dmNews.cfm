<cfimport taglib="/farcry/core/tags/admin" prefix="admin" />
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<!--- Override the client side validation for the filter fields. --->
<cfset stFilterMetaData = structNew() />
<cfset stFilterMetaData.title.ftValidation = "" />

<!--- set up page header --->
<admin:header title="News" />

<ft:objectadmin 
	typename="dmNews"
	permissionset="news"
	title="#application.adminBundle[session.dmProfile.locale].newsAdministration#"
	columnList="title,catnews,publishdate,datetimelastUpdated"
	sortableColumns="title,publishdate,datetimelastUpdated"
	lFilterFields="title,source"
	stFilterMetaData="#stFilterMetaData#"
	sqlorderby="publishdate desc"
	plugin="farcrycms"
	module="/dmNews.cfm" />

<!--- setup footer --->
<admin:footer />