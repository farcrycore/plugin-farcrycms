<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: Daemon Pty Limited 1995-2007, http://www.daemon.com.au --->
<!--- @@License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php --->
<!--- @@displayname: Standard News Display --->
<!--- @@Description: Full page display for News content. --->
<!--- @@Developer: Geoff Bowers (modius@daemon.com.au) --->

<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<!--- include standard header --->
<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" template="displayHeaderStandard" />


<skin:breadcrumb separator=" / ">

<cfoutput>
<h1>
	<span class="date">#dateformat(stObj.publishDate, "dd mmm yyy")#</span>
	#stObj.title#
</h1>
<div class="fc-richtext">#stObj.body#</div>
</cfoutput>

<!--- include standard footers --->
<skin:view objectid="#stobj.objectid#" typename="#stobj.typename#" template="displayFooterStandard" />

<cfsetting enablecfoutputonly="false" />