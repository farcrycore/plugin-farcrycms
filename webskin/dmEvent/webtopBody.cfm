<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Event Webtop Body --->

<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<!--- Override the client side validation for the filter fields. --->
<cfset stFilterMetaData = structNew() />
<cfset stFilterMetaData.title.ftValidation = "" />

<ft:objectadmin 
	typename="dmEvent"
	permissionset="event"
	title="#application.rb.getResource('eventsAdministration', 'Events Administration')#"
	columnList="title,startDate,endDate,catevent,publishdate,datetimelastUpdated"
	sortableColumns="title,startDate,publishdate,datetimelastUpdated"
	lFilterFields="title"
	stFilterMetaData="#stFilterMetaData#"
	sqlorderby="startDate desc" />

<cfsetting enablecfoutputonly="false">