<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Image Gallery Webtop Body --->

<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<!--- Override the client side validation for the filter fields. --->
<cfset stFilterMetaData = structNew() />
<cfset stFilterMetaData.title.ftValidation = "" />

<ft:objectadmin 
	typename="farImageGallery"
	permissionset="Image Gallery"
	title="#application.rb.getResource('imageGalleryAdministration', 'Image Gallery Administration')#"
	columnList="imgCover,title,teaser,datetimelastUpdated"
	sortableColumns="title,datetimelastUpdated"
	lFilterFields="title"
	stFilterMetaData="#stFilterMetaData#"
	sqlorderby="datetimelastupdated desc" />

<cfsetting enablecfoutputonly="false">