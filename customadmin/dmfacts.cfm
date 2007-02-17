<cfimport taglib="/farcry/core/tags/admin/" prefix="admin">
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />

<!--- set up page header --->
<admin:header title="Fact Admin" writingDir="#session.writingDir#" userLanguage="#session.userLanguage#" />

<ft:objectadmin 
	typename="dmFacts"
	title="#application.adminBundle[session.dmProfile.locale].factsAdministration#"
	permissionset="fact"
	plugin="farcrycms"
	module="/dmfacts.cfm" />

<admin:footer />
