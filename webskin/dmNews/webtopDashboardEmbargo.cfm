<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Dashboard Clock --->
<!--- @@viewstack: fragment --->
<!--- @@viewbinding: type --->
<!--- @@cardClass: fc-dashboard-card-medium --->
<!--- @@cardHeight: 400px --->
<!--- @@seq: 100 --->

<cfimport taglib="/farcry/core/tags/webskin/" prefix="skin">

<cfset qnews = application.fapi.getcontentobjects(typename="dmNews",lProperties="objectID,title,publishDate",orderBy="publishDate ASC", publishDate_gt=now())>

<cfoutput>
<i class="fa fa-question-circle fa-lg pull-right" title="Content that is approved but has a future publish date."></i>
<h3>Embargoed News</h3>

<table class="table table-striped">
	<tr>
		<th>Publish</th>
		<th>Title</th>
	</tr>
</cfoutput>

<cfoutput query="qNews">
	<tr>
		<td>#application.fapi.prettyDate(qNews.publishdate)#</td>
		<td>#qNews.title#</td>
	</tr>
</cfoutput>
<cfoutput>
</table>

</cfoutput>


<cfsetting enablecfoutputonly="false" />