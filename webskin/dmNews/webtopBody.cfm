<cfsetting enablecfoutputonly="true">
<!--- @@displayname: News Webtop Body --->

<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<!--- Override the client side validation for the filter fields. --->
<cfset stFilterMetaData = structNew() />
<cfset stFilterMetaData.title.ftValidation = "" />

<ft:objectadmin 
	typename="dmNews"
	title="#application.rb.getResource('newsAdministration', 'News Administration')#"
	columnList="title,catnews,publishdate,datetimelastUpdated"
	sortableColumns="title,publishdate,datetimelastUpdated"
	lFilterFields="title,source"
	stFilterMetaData="#stFilterMetaData#"
	sqlorderby="publishdate desc" />

<cfsetting enablecfoutputonly="false">