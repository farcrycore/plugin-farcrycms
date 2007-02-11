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
$Description: dmNews Type $

|| DEVELOPER ||
$Developer: Geoff Bowers (modius@daemon.com.au) $
--->

<cfcomponent extends="farcry.farcry_core.packages.types.versions" displayname="News" hint="Dynamic news data" bSchedule="1" bFriendly="1" bObjectBroker="true">
<!------------------------------------------------------------------------
type properties
------------------------------------------------------------------------->	
<cfproperty ftseq="1" ftfieldset="General Details" ftWizzardStep="General Details" name="Title" type="nstring" hint="News title." required="no" default="" ftlabel="Title" />
<cfproperty ftseq="2" ftfieldset="General Details" ftWizzardStep="General Details" name="source" type="string" hint="source of the information contained in the content" required="no" default="" ftlabel="Source" />
<cfproperty ftseq="3" ftfieldset="General Details" ftWizzardStep="General Details" name="publishDate" type="date" hint="The date that a news object is sent live and appears on the public website" required="no" default="" ftDefaultType="Evaluate" ftDefault="now()" ftType="datetime" ftDateFormatMask="dd mmm yyyy" ftTimeFormatMask="hh:mm tt" ftToggleOffDateTime="false" ftlabel="Publish Date" />
<cfproperty ftseq="4" ftfieldset="General Details" ftWizzardStep="General Details" name="expiryDate" type="date" hint="The date that a news object is removed from the web site" required="no" default="" ftDefaultType="Evaluate" ftDefault="DateAdd('d', 5, now())" ftType="datetime" ftDateFormatMask="dd mmm yyyy" ftTimeFormatMask="hh:mm tt" ftToggleOffDateTime="true" ftlabel="Expiry Date" />
<cfproperty ftseq="5" ftfieldset="General Details" ftWizzardStep="General Details" name="displayMethod" type="string" hint="Display method to render." required="yes" default="display" fttype="webskin" ftprefix="displayPage" ftlabel="Content Template" />
<cfproperty ftseq="6" ftfieldset="Categorisation" ftWizzardStep="General Details" name="catNews" type="string" hint="News categorisation." required="no" default="" fttype="category" ftalias="dmnews" ftlabel="News Category" />

<cfproperty ftseq="21" ftfieldset="News Item Details"  ftWizzardStep="News" name="Body" type="longchar" hint="Main body of content." required="no" default="" ftType="RichText" ftlabel="Body Content" ftTemplateTypeList="dmImage,dmfile,dmflash,dmNavigation,dmHTML" />
<cfproperty ftseq="22" ftfieldset="News Item Details"  ftWizzardStep="News" name="teaserImage" type="UUID" hint="Teaser image to display." required="no" default="" fttype="uuid" ftjoin="dmimage" ftlabel="Teaser Image" />
<cfproperty ftseq="23" ftfieldset="News Item Details"  ftWizzardStep="News" name="Teaser" type="longchar" hint="Teaser text." required="no" default="" ftlabel="Story teaser" />

<cfproperty ftseq="30" ftfieldset="Related Content"  ftWizzardStep="News" name="aObjectIds" type="array" hint="Mixed media content for this content." required="no" default="" ftJoin="dmImage,dmfile,dmflash" ftlabel="Media Library" />
<cfproperty ftseq="31" ftfieldset="Related Content"  ftWizzardStep="News" name="aRelatedIDs" type="array" hint="Holds object pointers to related content.  Can be of mixed types." required="no" default="" ftJoin="dmFile,dmNavigation,dmHTML" ftlabel="Related Content" />



<!--- system attribute --->
<cfproperty name="status" type="string" hint="Status of the node (draft, pending, approved)." required="yes" default="draft" />

<!--- deprecated properties --->
<cfproperty name="commentlog" type="longchar" hint="Workflow comment log." required="no" default="" />


<!------------------------------------------------------------------------
object methods 
------------------------------------------------------------------------->	

</cfcomponent>



