<!--- @@Copyright: Daemon Pty Limited 1995-2007, http://www.daemon.com.au --->
<!--- @@License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php --->
<!--- @@displayname: Utility: Plain Text Block --->
<!--- @@Description: Publishing rule for rendering a block of user definable text/markup in the container. --->
<!--- @@Developer: Geoff Bowers (modius@daemon.com.au) --->
<cfcomponent displayname="Utility: Plain Text Block" extends="farcry.core.packages.rules.rules" 
	hint="Publishing rule for rendering a block of user definable text/markup in the container.">

<!--- rule object properties --->
<cfproperty ftseq="1" ftfieldset="Text Rule" name="title" type="string" hint="Title for text rule; not displayed in the container." required="no" default="" ftlabel="Admin Title"
			fthelptitle="Admin Title"
			fthelpsection="The title for this rule is for administrative purposes only.  Please include a title in the HTML of the following field if you want a title displayed as part of the output for this rule." />
<cfproperty ftseq="2" ftfieldset="Text Rule Content" name="text" type="longchar" hint="Text to display.  Can be any combination of content and HTML markup." required="yes" default="" fttype="richtext" ftlabel="Free Text" />
	
<cffunction name="execute" hint="Displays the text rule on the page." output="false" returntype="void" access="public">
	<cfargument name="objectID" required="Yes" type="uuid" default="">
	<cfargument name="dsn" required="false" type="string" default="#application.dsn#">
	
	<cfset var stObj = getData(arguments.objectid) /> 
	<cfset var blurb = stObj.text />

	<cfif len(trim(blurb))>
		<cfset arrayAppend(request.aInvocations,blurb) />
	</cfif>
	
</cffunction>
</cfcomponent>

