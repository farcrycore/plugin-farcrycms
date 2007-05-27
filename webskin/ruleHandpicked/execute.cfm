<cfsetting enablecfoutputonly="yes" />


<cfif arrayLen(stobj.aObjects)>
	<cfloop from="1" to="#arrayLen(stobj.aObjects)#" index="i">
		<cfset html = createObject("component", application.stcoapi["#stobj.aObjects[i].typename#"].packagePath).getView(objectid="#stobj.aObjects[i].data#", template="#stobj.aObjects[i].webskin#", alternateHTML="<p>WEBSKIN NOT AVAILABLE</p>") />
		<cfoutput>#html#</cfoutput>
	</cfloop>
</cfif>

<cfsetting enablecfoutputonly="no" />