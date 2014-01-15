<cfsetting enablecfoutputonly="true">
<!--- @@displayname: Dashboard Feedback Form --->
<!--- @@viewstack: fragment --->
<!--- @@viewbinding: type --->
<!--- @@cardClass: fc-dashboard-card-large --->
<!--- @@cardHeight: 200px --->
<!--- @@seq: 100 --->

<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfset qFeedback = application.fapi.getContentObjects(typename="farFeedback", lproperties="objectid, subject, datetimecreated", orderby="datetimecreated DESC", datetimecreated_gt=session.dmprofile.lastlogin)>

<cfoutput>
<div style="padding: 0 6px;">

	<i class="fa fa-question-circle fa-lg pull-right" style="margin-top:6px" title="Feedback since your last login."></i>
	<h3>Feedback Since Last Login <small>#application.fapi.prettyDate(session.dmprofile.lastlogin)# | <a href="?id=content.farcrycmssubsection.farcryfeedbackmenu.listfarfeedback">All Feedback</a></small></h3>

	<cfif qFeedback.recordcount>
		<table class="table table-striped">
			<thead>
				<tr>			
					<th colspan="2" align="left">Subject</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
				<cfloop query="qFeedback">
					<tr>
						<td><i class="fa #application.fapi.getContentTypeMetadata(typename="#qFeedback.typename#", md="icon", default="fa-file-text")# fa-lg" title="#application.fapi.getContentTypeMetadata(typename="#qFeedback.typename#", md="displayname", default="Unknown")#"></i></td>
						<td><skin:buildLink href="#application.url.webtop#/edittabOverview.cfm?objectid=#qFeedback.objectid#&typename=#qFeedback.typename#" linktext="#qFeedback.subject#" title="Editing: #qFeedback.subject#" bmodal="true" /></td>
						<td nowrap="true">#application.fapi.prettyDate(qFeedback.datetimecreated)#</td>
					</tr>
				</cfloop>
			</tbody>
		</table>
	<cfelse>
		<p>There has been no feedback since your last login. Sometimes no news is good news.</p>
	</cfif>

</div>
</cfoutput>

<cfsetting enablecfoutputonly="false">