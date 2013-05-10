<!--- @@Copyright: Daemon Pty Limited 2002-2013, http://www.daemon.com.au --->
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

<cfcomponent extends="farcry.core.packages.types.versions" displayname="Events" 
    hint="Calendar events happen at a given place and time. Events can be published in list and month calendar formats." 
    bSchedule="true" bFriendly="true" bObjectBroker="true">
<!------------------------------------------------------------------------
type properties
------------------------------------------------------------------------->	

<!--- wiz: General Details --->
<cfproperty name="title" type="string" required="no" default="" 
    ftSeq="1" ftWizardStep="General Details" ftFieldset="Event Overview" ftLabel="Title" 
    ftValidation="required"
    hint="Title of content item.">

<cfproperty name="startDate" type="date" required="no" default="" 
    ftSeq="2" ftWizardStep="General Details" ftFieldset="Event Overview" ftLabel="Start Date" 
    ftType="datetime" ftDefaultType="Evaluate" ftDefault="now()" 
    ftDateFormatMask="dd mmm yyyy" ftTimeFormatMask="hh:mm tt" ftToggleOffDateTime="false"
    hint="The start date of the event">

<cfproperty name="endDate" type="date" required="no" default="" 
    ftSeq="3" ftWizardStep="General Details" ftFieldset="Event Overview" ftLabel="End Date" 
    ftType="datetime" ftDefaultType="Evaluate" ftDefault="DateAdd('d', 5, now())" 
    ftDateFormatMask="dd mmm yyyy" ftTimeFormatMask="hh:mm tt" ftToggleOffDateTime="false"
    hint="The end date of the event">

<cfproperty name="location" type="string" required="no" default="" 
    ftSeq="4" ftWizardStep="General Details" ftFieldset="Event Overview" ftLabel="Venue Location" 
    ftType="longchar"
    fthint="Street address for the venue.">

<cfproperty name="locationMap" type="longchar" required="no" default="" 
    ftSeq="5" ftWizardStep="General Details" ftFieldset="Event Overview" ftLabel="Map"
    ftType="longchar"
    fthint="Complete, long form, URL to a map of the location. ">

<cfproperty name="note" type="string" required="no" default="" 
    ftSeq="5" ftWizardStep="General Details" ftFieldset="Event Overview" ftLabel="Registration Note"
    fhint="For example; 7:30am for an 8:00am start.">

<cfproperty name="displayMethod" type="string" required="yes" default="displayPageStandard" 
    ftSeq="6" ftWizardStep="General Details" ftFieldset="Event Overview" ftLabel="Page Layout" 
    ftType="webskin" 
    ftPrefix="displayPage"
    fthint="Choose a page layout.">

<cfproperty name="catEvent" type="longchar" required="no" default="" 
    ftSeq="7" ftWizardStep="General Details" ftFieldset="Categorisation" ftLabel="Event Category" 
    ftType="category" ftAlias="dmEvent" ftRenderType="dropDown" 
    ftSelectMultiple="false"
    hint="Event categorisation.">

<cfproperty name="publishDate" type="date" required="no" default="" 
    ftSeq="8" ftWizardStep="General Details" ftFieldset="Publishing Details" ftLabel="Publish Date" 
    ftType="datetime" ftDefaultType="Evaluate" ftDefault="now()" 
    ftDateFormatMask="dd mmm yyyy" ftTimeFormatMask="hh:mm tt" ftToggleOffDateTime="false"
    fthint="The date that the event is published and appears on the website.">

<cfproperty name="expiryDate" type="date" required="no" default="" 
    ftSeq="9" ftWizardStep="General Details" ftFieldset="Publishing Details" ftLabel="Expiry Date" 
    ftType="datetime" ftDefaultType="Evaluate" ftDefault="DateAdd('d', 5, now())" 
    ftDateFormatMask="dd mmm yyyy" ftTimeFormatMask="hh:mm tt" ftToggleOffDateTime="true"
    fthint="Optional. The date that the event expires and is removed from the web site.">

<!--- Organiser Details --->
<cfproperty name="orgName" type="string" required="no" default="" 
    ftSeq="25" ftWizardStep="Event Details" ftFieldset="Organiser" ftLabel="Contact Name"
    hint="The name of this Event Organiser">

<cfproperty name="orgPhone" type="string" required="no" 
    ftSeq="26" ftWizardStep="Event Details" ftFieldset="Organiser" ftLabel="Contact Phone"
    hint="The phone number of this Event Organiser">

<cfproperty name="orgBookingURL" type="string" required="no" 
    ftSeq="27" ftWizardStep="Event Details" ftFieldset="Organiser" ftLabel="Booking URL" 
    ftType="url"
    ftHint="Optional. Link to an external booking system.">

<cfproperty name="orgEmail" type="string" required="no" default="" 
    ftSeq="28" ftWizardStep="Event Details" ftFieldset="Organiser" ftLabel="Contact Email" 
    ftType="email"
    hint="The Email address for this Event Organiser">

<!--- wiz: Event Details --->
<cfproperty name="body" type="longchar" required="no" default="" 
    ftSeq="31" ftWizardStep="Event Details" ftFieldset="Event Description" ftLabel="Body Content" 
    ftType="RichText" 
    ftTemplateTypeList="dmImage,dmFile"
    hint="Main body of content.">

<cfproperty name="cost" type="string" required="no" default="" 
    ftSeq="32" ftWizardStep="Event Details" ftFieldset="Event Description" ftLabel="Cost"
    hint="Cost of event">

<cfproperty name="teaserImage" type="uuid" required="no" default="" 
    ftSeq="41" ftWizardStep="Event Details" ftFieldset="Event Teaser" ftLabel="Teaser Image" 
    ftType="uuid" ftJoin="dmImage" 
    fthelptitle="Teaser Requirements" fthelpsection="Teaser images can only be selected from the pool of associated media images. You must add to the media library before selecting."
    hint="UUID of image to display in teaser">

<cfproperty name="imgMain" type="string" 
    ftSeq="42" ftWizardStep="Event Details" ftFieldset="Event Teaser" ftLabel="Main Image" 
    ftType="image" ftDestination="/images/dmEvent/imgMain" 
    ftAutoGenerateType="center" ftImageWidth="625" ftImageHeight="324" 
    ftSourceField="teaserImage:SourceImage" 
    ftAllowUpload="false" ftQuality="0.8" ftInterpolation="blackman"
    ftHint="This is main image on the page.">

<cfproperty name="teaser" type="longchar" required="no" default="" 
    ftSeq="43" ftWizardStep="Event Details" ftFieldset="Event Teaser" ftLabel="Teaser Text"
    hint="Teaser text.">

<cfproperty name="aObjectIDs" type="array" required="no" default="" 
    ftSeq="51" ftWizardStep="Event Details" ftFieldset="Related Content" ftLabel="Media Library" 
    ftJoin="dmImage,dmfile" 
    bSyncStatus="true"
    hint="Mixed type children objects that sit underneath this object">

<!--- system properties --->
<cfproperty name="status" type="string" hint="Status of the node (draft, pending, approved)." required="yes" default="draft" />


<!------------------------------------------------------------------------
object methods 
------------------------------------------------------------------------->	

</cfcomponent>
