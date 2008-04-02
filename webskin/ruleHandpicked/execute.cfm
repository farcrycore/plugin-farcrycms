<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Handpicked rule execute --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfif arrayLen(stobj.aObjects)>
	<cfloop from="1" to="#arrayLen(stobj.aObjects)#" index="i">
		
		<skin:view objectID="#stobj.aObjects[i].data#" typename="#stobj.aObjects[i].typename#" webskin="#stobj.aObjects[i].webskin#" alternateHTML="<p>WEBSKIN NOT AVAILABLE</p>" />

	</cfloop>
</cfif>

<cfsetting enablecfoutputonly="false" />