<!--- @@Copyright: Daemon Pty Limited 2002-2008, http://www.daemon.com.au --->
<!--- @@License:
    This file is part of FarCry CMS Plugin.

    FarCry CMS Plugin is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    FarCry CMS Plugin is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with FarCry CMS Plugin.  If not, see <http://www.gnu.org/licenses/>.
--->
<!--- 
|| DESCRIPTION || 
$Description: dmEvent Type $

|| DEVELOPER ||
$Developer: Geoff Bowers (modius@daemon.com.au) $
--->
<cfcomponent extends="farcry.core.packages.types.versions" displayname="Events" hint="Calendar events happen at a given place and time. Events can be published in list and month calendar formats." bSchedule="true" bFriendly="true" bObjectBroker="true">
<!------------------------------------------------------------------------
type properties
------------------------------------------------------------------------->	

<!--- wiz: General Details --->
<cfproperty ftseq="1" ftfieldset="Event Overview" ftwizardStep="General Details" name="title" type="string" hint="Title of object." required="no" default="" ftLabel="Title" ftvalidation="required" />
<cfproperty ftseq="2" ftfieldset="Event Overview" ftwizardStep="General Details" name="startDate" type="date" hint="The start date of the event" required="no" default=""ftDefaultType="Evaluate" ftDefault="now()" ftType="datetime" ftDateFormatMask="dd mmm yyyy" ftTimeFormatMask="hh:mm tt" ftToggleOffDateTime="false" ftlabel="Start Date" />
<cfproperty ftseq="3" ftfieldset="Event Overview" ftwizardStep="General Details" name="endDate" type="date" hint="The end date of the event" required="no" default=""ftDefaultType="Evaluate" ftDefault="DateAdd('d', 5, now())" ftType="datetime" ftDateFormatMask="dd mmm yyyy" ftTimeFormatMask="hh:mm tt" ftToggleOffDateTime="false" ftlabel="End Date" />
<cfproperty ftseq="4" ftfieldset="Event Overview" ftwizardStep="General Details" name="Location" type="string" hint="Location of event" required="no" default="" fttype="longchar" ftLabel="Location" />
<cfproperty ftseq="5" ftfieldset="Event Overview" ftwizardStep="General Details" name="displayMethod" type="string" hint="Display method to render." required="yes" default="displayPageStandard" fttype="webskin" ftprefix="displayPage" ftlabel="Content Template" />

<cfproperty ftseq="11" ftfieldset="Categorisation" ftwizardStep="General Details" name="catEvent" type="longchar" hint="Event categorisation." required="no" default="" fttype="category" ftalias="dmEvent" ftlabel="Event Category" />

<cfproperty ftseq="21" ftfieldset="Publishing Details" ftwizardStep="General Details" name="publishDate" type="date" hint="The date that a event object is sent live and appears on the public website" required="no" default=""ftDefaultType="Evaluate" ftDefault="now()" ftType="datetime" ftDateFormatMask="dd mmm yyyy" ftTimeFormatMask="hh:mm tt" ftToggleOffDateTime="false" ftlabel="Publish Date" />
<cfproperty ftseq="22" ftfieldset="Publishing Details" ftwizardStep="General Details" name="expiryDate" type="date" hint="The date that a event object is removed from the web site" required="no" default=""ftDefaultType="Evaluate" ftDefault="DateAdd('d', 5, now())" ftType="datetime" ftDateFormatMask="dd mmm yyyy" ftTimeFormatMask="hh:mm tt" ftToggleOffDateTime="true" ftlabel="Expiry Date" />

<!--- wiz: Event Details --->
<cfproperty ftseq="31" ftfieldset="Event Description" ftwizardStep="Event Details" name="body" type="longchar" hint="Main body of content." required="no" default="" ftType="RichText" ftlabel="Body Content" ftTemplateTypeList="dmImage,dmFile,dmFlash" />

<cfproperty ftseq="41" ftfieldset="Event Teaser" ftwizardStep="Event Details" name="teaserImage" type="uuid" hint="UUID of image to display in teaser" required="no" default="" fttype="uuid" ftjoin="dmImage" ftlabel="Teaser Image"
			fthelptitle="Teaser Requirements"
			fthelpsection="Teaser images can only be selected from the pool of associated media images. You must add to the media library before selecting." />
<cfproperty ftseq="42" ftfieldset="Event Teaser" ftwizardStep="Event Details" name="teaser" type="longchar" hint="Teaser text." required="no" default="" ftLabel="Teaser Text" />

<cfproperty ftseq="51" ftfieldset="Related Content" ftwizardStep="Event Details" name="aObjectIDs" type="array" hint="Mixed type children objects that sit underneath this object" required="no" default="" ftJoin="dmImage,dmfile,dmflash" ftlabel="Media Library" bSyncStatus="true" />

<!--- system properties --->
<cfproperty name="status" type="string" hint="Status of the node (draft, pending, approved)." required="yes" default="draft" />


<!------------------------------------------------------------------------
object methods 
------------------------------------------------------------------------->	

</cfcomponent>
