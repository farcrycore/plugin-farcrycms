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
	title="Fun Facts"
	columnList="imgthumb,title,link,catfacts,datetimelastUpdated"
	sortableColumns="title,link,datetimelastUpdated"
	lFilterFields="title,link"
	stFilterMetaData="#stFilterMetaData#"
	sqlorderby="datetimelastUpdated desc" />

<cfsetting enablecfoutputonly="false">