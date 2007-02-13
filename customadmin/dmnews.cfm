<cfimport taglib="/farcry/farcry_core/tags/admin/" prefix="admin">
<cfimport taglib="/farcry/farcry_core/tags/widgets/" prefix="widgets">

<cfset editobjectURL = "#application.url.farcry#/conjuror/invocation.cfm?objectid=##recordset.objectID[recordset.currentrow]##&typename=dmnews">

<!--- set up page header --->
<admin:header title="News Admin" writingDir="#session.writingDir#" userLanguage="#session.userLanguage#" onload="setupPanes('container1');">

<widgets:typeadmin 
	typename="dmNews"
	permissionset="news"
	title="#application.adminBundle[session.dmProfile.locale].newsAdministration#"
	bdebug="0">
</widgets:typeadmin>

<admin:footer>
