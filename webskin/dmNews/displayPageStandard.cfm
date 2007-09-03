<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: Daemon Pty Limited 1995-2007, http://www.daemon.com.au --->
<!--- @@License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php --->
<!--- @@displayname: Standard News Display --->
<!--- @@Description: Full page display for News content. --->
<!--- @@Developer: Geoff Bowers (modius@daemon.com.au) --->

<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">
<cfimport taglib="/farcry/core/tags/container" prefix="con">

<!--- include standard header --->
<cfmodule 
	template="/farcry/projects/#application.applicationname#/webskin/includes/dmHeader.cfm"
	pageTitle="#stObj.title#"
	layoutClass="type-b">

<cfoutput>
<div id="content">
	<div id="breadcrumb">
		</cfoutput><skin:breadcrumb separator=" / " includeSelf=0 here="#stobj.title#"><cfoutput>
	</div>
	<h1>#stObj.Title#</h1>
	#stObj.Body#
</div>
</cfoutput>

<!--- include standard footers --->
<cfinclude template="/farcry/projects/#application.applicationname#/webskin/includes/dmFooter.cfm">

<cfsetting enablecfoutputonly="false" />