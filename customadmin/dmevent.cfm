<cfimport taglib="/farcry/core/tags/admin/" prefix="admin" />
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<!--- set up page header --->
<admin:header title="Event Admin" />

<ft:objectadmin 
	typename="dmEvent"
	permissionset="event"
	title="#application.adminBundle[session.dmProfile.locale].eventsAdministration#"
	plugin="farcrycms"
	module="/dmevent.cfm" />

<admin:footer />
