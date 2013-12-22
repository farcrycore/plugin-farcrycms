<cfsetting enablecfoutputonly="true" /> 
<!--- @@displayname: Event Body --->

<!--- import tag library --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<!--- 
 // view 
--------------------------------------------------------------------------------->
<cfoutput>
	<div class="page-header">
		<skin:breadcrumb separator="/" objectid="#application.fapi.getNavID("dmEvent")#" includeSelf="true" />
		<h2>#stObj.title#</h2>
		<p><span class="date">#application.fapi.prettyDate(stObj.startDate)#</span></p>
	</div><!-- /page-header -->

	<p>
		<strong>Where:</strong> #stObj.location#<br />
		<strong>When:</strong> #dateformat(stobj.startDate)# #timeformat(stobj.startDate)#
		<cfif showFarcryDate(stobj.endDate)> 
			until #dateformat(stObj.endDate)# #timeformat(stObj.endDate)#
		</cfif>
	</p>

	#stObj.body#
</cfoutput>

<cfsetting enablecfoutputonly="false" /> 