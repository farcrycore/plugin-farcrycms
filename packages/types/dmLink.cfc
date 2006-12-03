<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2006, http://www.daemon.com.au $
$License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php$

|| VERSION CONTROL ||
$Header: $
$Author: $
$Date: $
$Name: $
$Revision: $

|| DESCRIPTION || 
$Description: dmLink Type $

|| DEVELOPER ||
$Developer: Geoff Bowers (modius@daemon.com.au) $
--->


<cfcomponent extends="farcry.farcry_core.packages.types.types" displayname="Link" hint="A way of linking to external pages" bSchedule="1" bUseInTree="1" bFriendly="1">
<!------------------------------------------------------------------------
type properties
------------------------------------------------------------------------->
<cfproperty ftseq="1" ftFieldset="Link Information" name="title" type="string" hint="Meaningful reference title for link" required="no" default="" ftlabel="Title" blabel="true" /> 
<cfproperty ftseq="2" ftfieldset="Link Information" name="teaser" type="longchar" hint="A brief description of the link" required="no" default="" ftlabel="Teaser" />
<cfproperty ftseq="3" ftfieldset="Link Information" name="link" type="string" hint="Url of link" required="no" default="" ftlabel="Link" fttype="url" /> 
<cfproperty ftseq="5" ftfieldset="Link Information" name="displayMethod" type="string" hint="Display method to render this link object with." required="yes" default="" fttype="webskin" ftprefix="displayPage" />

<cfproperty ftseq="30" ftfieldset="Categorisation" name="catLink" type="string" hint="Link categorisation." required="no" default="" fttype="category" ftalias="dmlink" ftlabel="Link Category" />

<!--- system property --->
<cfproperty name="status" type="string" hint="Status of the node (draft, pending, approved)." required="yes" default="draft" />

<!--- todo: remove comment log and replace with central log --->
<cfproperty ftseq="20" ftfieldset="Miscellaneous" name="commentlog" type="longchar" hint="Workflow comment log." required="no" default="" ftdisplayonly="true" ftlabel="Comments" /> 

<cffunction name="display" access="public" output="false" returntype="void" hint="Redirect user to the link location by default.">
	<cfargument name="objectid" required="yes" type="UUID">
	
	<cfset var stObj = getData(arguments.objectid) />
	<cfif len(stObj.link)>
		<cflocation url="#stObj.link#" addtoken="No" />
	<cfelse>
		<cfthrow type="types.dmlink" message="No link available." detail="dmLink requires a valid URL for the link property in order to redirect." />
	</cfif>

</cffunction>

</cfcomponent>