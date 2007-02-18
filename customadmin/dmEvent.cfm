<cfimport taglib="/farcry/core/tags/admin/" prefix="admin" />
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<!--- set up page header --->
<admin:header title="Event Admin" />

<ft:objectadmin 
	typename="dmEvent"
	permissionset="event"
	title="#application.adminBundle[session.dmProfile.locale].eventsAdministration#"
	columnList="title,startDate,catevent,publishdate,datetimelastUpdated"
	sortableColumns="title,startDate,publishdate,datetimelastUpdated"
	lFilterFields="title"
	sqlorderby="startDate desc"
	plugin="farcrycms"
	module="/dmevent.cfm" />

<admin:footer />
