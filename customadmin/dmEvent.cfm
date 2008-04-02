<cfimport taglib="/farcry/core/tags/admin/" prefix="admin" />
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<!--- Override the client side validation for the filter fields. --->
<cfset stFilterMetaData = structNew() />
<cfset stFilterMetaData.title.ftValidation = "" />

<!--- set up page header --->
<admin:header title="Event Admin" />

<ft:objectadmin 
	typename="dmEvent"
	permissionset="event"
	title="#application.adminBundle[session.dmProfile.locale].eventsAdministration#"
	columnList="title,startDate,endDate,catevent,publishdate,datetimelastUpdated"
	sortableColumns="title,startDate,publishdate,datetimelastUpdated"
	lFilterFields="title"
	stFilterMetaData="#stFilterMetaData#"
	sqlorderby="startDate desc"
	plugin="farcrycms"
	module="/dmEvent.cfm" />

<admin:footer />