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
$Description: dmEvent Type $

|| DEVELOPER ||
$Developer: Geoff Bowers (modius@daemon.com.au) $
--->
<cfcomponent extends="farcry.farcry_core.packages.types.versions" displayname="Events" hint="Dynamic events data" bSchedule="1" bFriendly="1">
<!------------------------------------------------------------------------
type properties
------------------------------------------------------------------------->	

<cfproperty ftseq="11" ftfieldset="Event Details" ftWizzardStep="General Details" name="Title" type="nstring" hint="Title of object." required="no" default="" ftLabel="Title" />
<cfproperty ftseq="12" ftfieldset="Event Details" ftWizzardStep="General Details" name="Location" type="nstring" hint="Location of event" required="no" default="" ftLabel="Location" />
<cfproperty ftseq="13" ftfieldset="Event Details" ftWizzardStep="General Details" name="Teaser" type="longchar" hint="Teaser text." required="no" default="" ftLabel="Teaser Text" />
<cfproperty ftseq="14" ftfieldset="Event Details" ftWizzardStep="General Details" name="teaserImage" type="uuid" hint="UUID of image to display in teaser" required="no" default="" fttype="uuid" ftjoin="dmimage" ftlabel="Teaser Image" />
<cfproperty ftseq="15" ftfieldset="Event Details" ftWizzardStep="General Details" name="Body" type="longchar" hint="Main body of content." required="no" default="" ftType="RichText" ftlabel="Body Content" ftTemplateTypeList="dmImage,dmFile,dmFlash" />
<cfproperty ftseq="16" ftfieldset="Event Display" ftWizzardStep="General Details" name="displayMethod" type="string" hint="Display method to render." required="yes" default="display" fttype="webskin" ftprefix="displayPage" ftlabel="Content Template" />

<cfproperty ftseq="21" ftfieldset="Event Dates" ftWizzardStep="Event Dates" name="publishDate" type="date" hint="The date that a event object is sent live and appears on the public website" required="no" default=""ftDefaultType="Evaluate" ftDefault="now()" ftType="datetime" ftDateFormatMask="dd mmm yyyy" ftTimeFormatMask="hh:mm tt" ftToggleOffDateTime="false" ftlabel="Publish Date" />
<cfproperty ftseq="22" ftfieldset="Event Dates" ftWizzardStep="Event Dates" name="expiryDate" type="date" hint="The date that a event object is removed from the web site" required="no" default=""ftDefaultType="Evaluate" ftDefault="DateAdd('d', 5, now())" ftType="datetime" ftDateFormatMask="dd mmm yyyy" ftTimeFormatMask="hh:mm tt" ftToggleOffDateTime="false" ftlabel="Expiry Date" />
<cfproperty ftseq="23" ftfieldset="Event Dates" ftWizzardStep="Event Dates" name="startDate" type="date" hint="The start date of the event" required="no" default=""ftDefaultType="Evaluate" ftDefault="now()" ftType="datetime" ftDateFormatMask="dd mmm yyyy" ftTimeFormatMask="hh:mm tt" ftToggleOffDateTime="false" ftlabel="Start Date" />
<cfproperty ftseq="24" ftfieldset="Event Dates" ftWizzardStep="Event Dates" name="endDate" type="date" hint="The end date of the event" required="no" default=""ftDefaultType="Evaluate" ftDefault="DateAdd('d', 5, now())" ftType="datetime" ftDateFormatMask="dd mmm yyyy" ftTimeFormatMask="hh:mm tt" ftToggleOffDateTime="false" ftlabel="End Date" />

<cfproperty ftseq="30" ftfieldset="Related Content" ftWizzardStep="Related Content" name="aObjectIDs" type="array" hint="Mixed type children objects that sit underneath this object" required="no" default="" ftJoin="dmImage,dmfile,dmflash" ftlabel="Media Library" />

<cfproperty ftseq="40" ftfieldset="Categorisation" name="catEvent" type="string" hint="Event categorisation." required="no" default="" fttype="category" ftalias="dmevent" ftlabel="Event Category" />

<cfproperty name="status" type="string" hint="Status of the node (draft, pending, approved)." required="yes" default="draft" />
<cfproperty name="commentlog" type="longchar" hint="Workflow comment log." required="no" default="" />


<!------------------------------------------------------------------------
object methods 
------------------------------------------------------------------------->	


</cfcomponent>