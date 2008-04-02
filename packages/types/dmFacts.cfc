<!--- @@Copyright: Daemon Pty Limited 1995-2007, http://www.daemon.com.au --->
<!--- @@License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php --->
<!--- @@displayname: Fact Content Type --->
<!--- @@Description: Records facts, testimonials and the like. --->
<!--- @@Developer: Geoff Bowers (modius@daemon.com.au) --->
<cfcomponent extends="farcry.core.packages.types.types" displayname="Fact" hint="Records facts, testimonials and the like." bSchedule="true" bObjectBroker="true">
<!------------------------------------------------------------------------
type properties
------------------------------------------------------------------------->
<cfproperty ftseq="1" ftfieldset="Fact Details" name="title" type="string" hint="Meaningful reference title" required="no" default="" ftLabel="Title" ftvalidation="required" />


<cfproperty ftseq="3" ftfieldset="Fact Details" name="link" type="string" hint="Link to a page internal or external" required="no" default="" fttype="url" ftLabel="Link" />
<cfproperty ftseq="4" ftfieldset="Fact Details" name="body" type="longchar" hint="Content of the factoid." required="No" default="" ftLabel="Content" ftType="longchar" />
<cfproperty ftseq="5" ftfieldset="Fact Details" name="imageID" type="uuid" hint="Image to display with factoid." required="no" default="" fttype="uuid" ftjoin="dmImage" ftlabel="Image" />

<cfproperty ftseq="10" ftfieldset="Fact Details" name="displayMethod" type="string" hint="Display method to render." required="yes" ftDefault="displayTeaserStandard" fttype="webskin" ftprefix="display" ftlabel="Display Method" />

<cfproperty ftseq="30" ftfieldset="Categorisation" name="catFacts" type="longchar" hint="Fact categorisation." required="no" default="" fttype="category" ftalias="dmFacts" ftlabel="Category" />

<!--- system properties --->
<cfproperty name="commentlog" type="longchar" hint="Workflow comment log." required="no" default="" />
<cfproperty name="status" type="string" hint="Status of the node (draft, pending, approved)." required="yes" default="draft" />

</cfcomponent>