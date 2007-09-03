<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: Daemon Pty Limited 1995-2007, http://www.daemon.com.au --->
<!--- @@License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php --->
<!--- @@displayname: Event Teaser --->
<!--- @@Description: Teaser display for an event. --->
<!--- @@Developer: Geoff Bowers (modius@daemon.com.au) --->

<cfoutput>
<div>
	<h3><a href="#application.url.conjurer#?objectid=#stObj.objectid#">#stObj.Title#</a></h3>
	<div class="dm-metadata">
	#stobj.lastupdatedby#<br>
	Pub. #dateformat(stobj.datetimelastupdated)#<br>
	</div>
	<p></p>
	When: #dateformat(stobj.startDate)# #timeformat(stobj.startDate)#<cfif year(stObj.endDate) neq 2050> <!--- hack to see if event has expire date aka y2050 bug :) --->until #dateformat(stObj.endDate)# #timeformat(stObj.endDate)#</cfif><p></p>
	#stObj.Teaser#
	<span class="dm-tail">[<a href="#application.url.conjurer#?objectid=#stObj.objectid#">go</a>]</span>
</div>
</cfoutput>
<cfsetting enablecfoutputonly="false" />