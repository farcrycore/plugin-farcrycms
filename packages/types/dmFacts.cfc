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
<cfcomponent extends="farcry.core.packages.types.types" displayname="Facts" hint="A fact snippet that belongs to a fact collection." bSchedule="1" bFriendly="1" bObjectBroker="true">
<!------------------------------------------------------------------------
type properties
------------------------------------------------------------------------->
<cfproperty ftseq="10" ftfieldset="Fact Details" ftwizardStep="Fact Details" name="title" type="nstring" hint="Meaningful reference title" required="no" default="" ftLabel="Title" />
<cfproperty ftseq="11" ftfieldset="Fact Details" ftwizardStep="Fact Details" name="link" type="string" hint="Link to a page internal or external" required="no" default="" ftLabel="Link" />
<cfproperty ftseq="12" ftfieldset="Fact Details" ftwizardStep="Fact Details" name="body" type="longchar" hint="Content of the fact" required="No" default="" ftLabel="Fact Content" ftType="richtext" />
<cfproperty ftseq="13" ftfieldset="Fact Details" ftwizardStep="Fact Details" name="imageID" type="uuid" hint="UUID of image to display in fact" required="no" default="" fttype="uuid" ftjoin="dmimage" ftlabel="Fact Image" />
<cfproperty ftseq="14" ftfieldset="Fact Details" ftwizardStep="Fact Details" name="displayMethod" type="string" hint="Display method to render." required="yes" default="display" fttype="webskin" ftprefix="displayTeaser" ftlabel="Content Template" />

<cfproperty ftseq="30" ftfieldset="Categorisation" ftwizardStep="Fact Category" name="catFacts" type="string" hint="Fact categorisation." required="no" default="" fttype="category" ftalias="dmfacts" ftlabel="Fact Category" />

<cfproperty name="commentlog" type="longchar" hint="Workflow comment log." required="no" default="" />
<cfproperty name="status" type="string" hint="Status of the node (draft, pending, approved)." required="yes" default="draft" />

<!--- Object Methods --->

</cfcomponent>