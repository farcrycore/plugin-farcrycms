<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Facts Webtop Body --->

<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<!--- Override the client side validation for the filter fields. --->
<cfset stFilterMetaData = structNew() />
<cfset stFilterMetaData.title.ftValidation = "" />
<cfset stFilterMetaData.link.ftValidation = "" />

<ft:objectadmin 
	typename="dmFacts"
	title="#application.rb.getResource('factsAdministration', 'Facts Administration')#"
	permissionset="fact"
	columnList="title,link,catfacts,datetimelastUpdated"
	sortableColumns="title,link,datetimelastUpdated"
	lFilterFields="title,link"
	stFilterMetaData="#stFilterMetaData#"
	sqlorderby="datetimelastUpdated desc" />

<cfsetting enablecfoutputonly="false">