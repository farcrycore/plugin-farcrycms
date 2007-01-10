<cfimport taglib="/farcry/farcry_core/tags/admin/" prefix="admin">
<cfimport taglib="/farcry/farcry_core/tags/widgets/" prefix="widgets">

<cfset editobjectURL = "#application.url.farcry#/conjuror/invocation.cfm?objectid=##recordset.objectID[recordset.currentrow]##&typename=dmlink">

<!--- set up page header --->
<admin:header title="Link Admin" writingDir="#session.writingDir#" userLanguage="#session.userLanguage#" onload="setupPanes('container1');">

<widgets:typeadmin 
	typename="dmLink"
	title="#application.adminBundle[session.dmProfile.locale].linksAdministration#"
	permissionset="link"
	bdebug="0">
</widgets:typeadmin>

<admin:footer>
