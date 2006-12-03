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
$Description: dmFacts Type $

|| DEVELOPER ||
$Developer: Geoff Bowers (modius@daemon.com.au) $
--->
<cfcomponent extends="farcry.farcry_core.packages.types.types" displayname="Facts" hint="A fact snippet that belongs to a fact collection." bSchedule="1" bFriendly="1">
<!------------------------------------------------------------------------
type properties
------------------------------------------------------------------------->
<cfproperty name="title" type="nstring" hint="Meaningful reference title" required="no" default=""> 
<cfproperty name="link" type="string" hint="Link to a page internal or external" required="no" default=""> 
<cfproperty name="body" type="longchar" hint="Content of the fact" required="No" default=""> 
<cfproperty name="imageID" type="string" hint="UUID of image to display in fact" required="no" default="">
<cfproperty name="status" type="string" hint="Status of the node (draft, pending, approved)." required="yes" default="draft">
<cfproperty name="commentlog" type="longchar" hint="Workflow comment log." required="no" default="">
<cfproperty name="displayMethod" type="string" hint="Display method to render." required="yes" default="display">

<cfproperty ftseq="30" ftfieldset="Categorisation" name="catFacts" type="string" hint="Fact categorisation." required="no" default="" fttype="category" ftalias="dmfacts" ftlabel="Fact Category" />

<!--- Object Methods --->
<cffunction name="edit" access="public">
    <cfargument name="objectid" required="yes" type="UUID">
    
    <!--- getData for object edit --->
    <cfset stObj = this.getData(arguments.objectid)>
    <cfinclude template="_dmFacts/edit.cfm">
</cffunction>
    
</cfcomponent>
