<cfimport taglib="/farcry/core/tags/admin/" prefix="admin" />
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<!--- set up page header --->
<admin:header title="Link Admin" writingDir="#session.writingDir#" userLanguage="#session.userLanguage#" />

<ft:objectadmin 
	typename="dmLink"
	title="#application.adminBundle[session.dmProfile.locale].linksAdministration#"
	permissionset="link"
	plugin="farcrycms"
	module="/dmlink.cfm" />

<admin:footer />
