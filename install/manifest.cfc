<cfcomponent extends="farcry.core.webtop.install.manifest" name="manifest">

	<!--- IMPORT TAG LIBRARIES --->
	<cfimport taglib="/farcry/core/packages/fourq/tags/" prefix="q4">
	
	
	<cfset this.name = "FarCry CMS" />
	<cfset this.description = "FarCry is more than an enterprise-class application. FarCry CMS is an ""out of the box"" open source solution, a fully extensible application framework, and a commercially supported services model." />
	<cfset this.lRequiredPlugins = "" />
	<cfset addSupportedCore(majorVersion="5", minorVersion="0", patchVersion="0") />
	

</cfcomponent>

