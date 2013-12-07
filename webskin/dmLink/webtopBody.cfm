<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Link Webtop Body --->

<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<!--- Override the client side validation for the filter fields. --->
<cfset stFilterMetaData = structNew() />
<cfset stFilterMetaData.title.ftValidation = "" />
<cfset stFilterMetaData.link.ftValidation = "" />

<ft:objectadmin 
	typename="dmLink"
	title="#application.rb.getResource('linksAdministration', 'Links Administration')#"
	permissionset="link"
	columnList="title,link,catlink,datetimelastUpdated"
	sortableColumns="title,link,datetimelastUpdated"
	lFilterFields="title,link"
	stFilterMetaData="#stFilterMetaData#"
	sqlorderby="datetimelastUpdated desc" />

<cfsetting enablecfoutputonly="false">