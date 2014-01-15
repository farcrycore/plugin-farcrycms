<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Embargoed News --->
<!--- @@viewstack: fragment --->
<!--- @@viewbinding: type --->
<!--- @@cardClass: fc-dashboard-card-large --->
<!--- @@cardHeight: 200px --->
<!--- @@seq: 110 --->

<cfimport taglib="/farcry/core/tags/webskin/" prefix="skin">

<cfset qnews = application.fapi.getcontentobjects(typename="dmNews",lProperties="objectID,title,publishDate",orderBy="publishDate ASC", publishDate_gt=now())>

<cfoutput>
<i class="fa fa-question-circle fa-lg pull-right" title="Content that is approved but has a future publish date."></i>
<h3>Embargoed News <small><a href="?id=content.farcrycmssubsection.farcrycmsmenu.listdmnews">All News</a></small></h3>

<table class="table table-striped">
	<thead>
	<tr>
		<th>Publish</th>
		<th>Title</th>
	</tr>
	</thead>
	<tbody>
</cfoutput>

<cfoutput query="qNews">
	<tr>
		<td>#application.fapi.prettyDate(qNews.publishdate)#</td>
		<td><skin:buildLink href="#application.url.webtop#/edittabOverview.cfm?objectid=#qNews.objectid#&typename=#qNews.typename#" bmodal="true" linktext="#qNews.title#" title="Editing: #qNews.title#" /></td>
	</tr>
</cfoutput>
<cfoutput>
	</tbody>
</table>

</cfoutput>


<cfsetting enablecfoutputonly="false" />