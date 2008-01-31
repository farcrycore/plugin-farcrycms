<cfcomponent extends="farcry.core.webtop.install.manifest" name="manifest">

	<!--- IMPORT TAG LIBRARIES --->
	<cfimport taglib="/farcry/core/packages/fourq/tags/" prefix="q4">
	
	
	<cfset this.name = "farcrycms" />
	<cfset this.description = "farcry cms plugin" />
	<cfset this.lRequiredPlugins = "" />
	<cfset addSupportedCore(majorVersion="5", minorVersion="0", patchVersion="0") />
	

</cfcomponent>

