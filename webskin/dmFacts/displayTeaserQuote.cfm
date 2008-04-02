<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: Daemon Pty Limited 1995-2007, http://www.daemon.com.au --->
<!--- @@License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php --->
<!--- @@displayname: Fact Teaser --->
<!--- @@Description:  --->
<!--- @@Developer: Geoff Bowers (modius@daemon.com.au) --->
<cfoutput>
	<h3>#stObj.title#</h3>
	<div class="fc-richtext">#stobj.body#</div>
	
	<cfoutput><blockquote class="burmaQuoteSidebar"><div>#stobj.quote#</div><cite>#stobj.cite#</cite></blockquote></cfoutput>	
</cfoutput>

<cfsetting enablecfoutputonly="false" />