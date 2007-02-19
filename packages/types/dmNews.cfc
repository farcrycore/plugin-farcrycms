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

<cfcomponent extends="farcry.core.packages.types.versions" displayname="News" hint="Dynamic news data" bSchedule="1" bFriendly="1" bObjectBroker="true">
<!------------------------------------------------------------------------
type properties
------------------------------------------------------------------------->	
<cfproperty ftseq="1" ftfieldset="General Details" ftwizardStep="General Details" name="title" type="string" hint="News title." required="no" default="" ftlabel="Title" ftvalidation="required" />
<cfproperty ftseq="2" ftfieldset="General Details" ftwizardStep="General Details" name="source" type="string" hint="source of the information contained in the content" required="no" default="" ftlabel="Source" />
<cfproperty ftseq="3" ftfieldset="General Details" ftwizardStep="General Details" name="displayMethod" type="string" hint="Display method to render." required="yes" default="display" fttype="webskin" ftprefix="displayPage" ftlabel="Content Template" />
<cfproperty ftseq="4" ftfieldset="Categorisation" ftwizardStep="General Details" name="catNews" type="string" hint="News categorisation." required="no" default="" fttype="category" ftalias="dmnews" ftlabel="News Category" />

<cfproperty ftseq="11" ftfieldset="Publishing Details" ftwizardStep="General Details" name="publishDate" type="date" hint="The date that a news object is sent live and appears on the public website" required="no" default="" ftDefaultType="Evaluate" ftDefault="now()" ftType="datetime" ftDateFormatMask="dd mmm yyyy" ftTimeFormatMask="hh:mm tt" ftToggleOffDateTime="false" ftlabel="Publish Date" />
<cfproperty ftseq="12" ftfieldset="Publishing Details" ftwizardStep="General Details" name="expiryDate" type="date" hint="The date that a news object is removed from the web site" required="no" default="" ftDefaultType="Evaluate" ftDefault="DateAdd('d', 5, now())" ftType="datetime" ftDateFormatMask="dd mmm yyyy" ftTimeFormatMask="hh:mm tt" ftToggleOffDateTime="true" ftlabel="Expiry Date" />

<cfproperty ftseq="21" ftfieldset="News Story" ftwizardStep="News Body" name="Body" type="longchar" hint="Main body of content." required="no" default="" ftType="RichText" ftlabel="Body Content"
  ftImageArrayField="aObjectIDs" ftImageTypename="dmImage" ftImageField="StandardImage"
  ftTemplateTypeList="dmImage,dmfile,dmflash,dmNavigation,dmHTML"
  ftTemplateWebskinPrefixList="insertHTML" />

<cfproperty ftseq="31" ftfieldset="Story Teaser" ftwizardStep="News Body" name="teaserImage" type="UUID" hint="Teaser image to display." required="no" default="" fttype="uuid" ftjoin="dmimage" ftlabel="Teaser Image" 
			fthelptitle="Teaser Requirements"
			fthelpsection="Teaser images can only be selected from the pool of associated media images. You must add to the media library before selecting." />
<cfproperty ftseq="32" ftfieldset="Story Teaser" ftwizardStep="News Body" name="Teaser" type="longchar" hint="Teaser text." required="no" default="" ftlabel="Story Teaser" />

<cfproperty ftseq="41" ftfieldset="Related Content" ftwizardStep="News Body" name="aObjectIds" type="array" hint="Mixed media content for this content." required="no" default="" ftJoin="dmImage,dmfile,dmflash" ftlabel="Media Library" />
<cfproperty ftseq="42" ftfieldset="Related Content" ftwizardStep="News Body" name="aRelatedIDs" type="array" hint="Holds object pointers to related content.  Can be of mixed types." required="no" default="" ftJoin="dmFile,dmNavigation,dmHTML" ftlabel="Related Content" />



<!--- system attribute --->
<cfproperty name="status" type="string" hint="Status of the node (draft, pending, approved)." required="yes" default="draft" />

<!--- deprecated properties --->
<cfproperty name="commentlog" type="longchar" hint="Workflow comment log." required="no" default="" />


<!------------------------------------------------------------------------
object methods 
------------------------------------------------------------------------->	

</cfcomponent>



