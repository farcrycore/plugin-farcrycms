<cfimport taglib="/farcry/core/tags/admin" prefix="admin" />
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<!--- set up page header --->
<admin:header title="News" />

<ft:objectadmin 
	typename="dmNews"
	permissionset="news"
	title="#application.adminBundle[session.dmProfile.locale].newsAdministration#"
	plugin="farcrycms"
	module="/dmnews.cfm" />

<!--- setup footer --->
<admin:footer />
