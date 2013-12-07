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

<cfcomponent extends="farcry.core.packages.types.versions" 
    displayname="Events" 
    hint="Calendar events happen at a given place and time. Events can be published in list and month calendar formats." 
    bSchedule="true" bFriendly="true" bObjectBroker="true"
    icon="fa-calendar">
<!------------------------------------------------------------------------
type properties
------------------------------------------------------------------------->	

<cfproperty name="title" type="string" required="no" default="" 
    ftSeq="10" ftFieldset="Event Overview" ftLabel="Title" 
    ftValidation="required" />

<cfproperty name="startDate" type="date" required="no" default="" 
    ftSeq="20" ftFieldset="Event Overview" ftLabel="Start Date" 
    ftType="datetime" ftDefaultType="Evaluate" ftDefault="now()" 
    ftDateFormatMask="dd mmm yyyy" ftTimeFormatMask="hh:mm tt" ftToggleOffDateTime="false" />

<cfproperty name="endDate" type="date" required="no" default="" 
    ftSeq="30" ftFieldset="Event Overview" ftLabel="End Date" 
    ftType="datetime" ftDefaultType="Evaluate" ftDefault="DateAdd('d', 5, now())" 
    ftDateFormatMask="dd mmm yyyy" ftTimeFormatMask="hh:mm tt" ftToggleOffDateTime="false"
    ftWatch="startDate" />

<cfproperty name="publishDate" type="date" required="no" default="" 
    ftSeq="40" ftFieldset="Event Overview" ftLabel="Publish Date" 
    ftType="datetime" ftDefaultType="Evaluate" ftDefault="now()" 
    ftDateFormatMask="dd mmm yyyy" ftTimeFormatMask="hh:mm tt" ftToggleOffDateTime="false"
    fthint="The date that the event is published and appears on the website.">

<cfproperty name="location" type="string" required="no" default="" 
    ftSeq="50" ftFieldset="Event Overview" ftLabel="Venue Location" 
    ftType="longchar"
    fthint="Street address for the event venue." />

<cfproperty name="teaserImage" type="uuid" required="no" default="" 
    ftSeq="60" ftFieldset="Event Description" ftLabel="Teaser Image" 
    ftType="uuid" ftJoin="dmImage" />

<cfproperty name="teaser" type="string" dbPrecision="2000" required="no" default="" 
    ftSeq="70" ftFieldset="Event Description" ftLabel="Teaser Text"
    fttype="longchar" ftlimit="500" />

<cfproperty name="body" type="longchar" required="no" default="" 
    ftSeq="80" ftFieldset="Event Description" ftLabel="Body Content" 
    ftType="RichText" 
    ftTemplateTypeList="dmImage,dmFile"
    hint="Main body of content." />

<cfproperty name="aObjectIDs" type="array" required="no" default="" 
    ftSeq="90" ftFieldset="Event Description" ftLabel="Media Library" 
    ftJoin="dmImage,dmfile" ftAllowBulkUpload="true" ftAllowEdit="true"
    bSyncStatus="true"
    fthint="Upload files and images for the event." />

<cfproperty name="catEvent" type="longchar" required="no" default="" 
    ftSeq="100" ftFieldset="Additional Publishing Options" ftLabel="Event Category" 
    ftType="category" ftAlias="dmEvent" ftRenderType="dropDown" 
    ftSelectMultiple="false" />

<cfproperty name="expiryDate" type="date" required="no" default="" 
    ftSeq="110" ftFieldset="Additional Publishing Options" ftLabel="Expiry Date" 
    ftType="datetime" 
    ftDefaultType="Evaluate" ftDefault="DateAdd('m', 5, now())" 
    ftDateFormatMask="dd mmm yyyy" ftTimeFormatMask="hh:mm tt" 
    ftToggleOffDateTime="true"
    fthint="Optional. The date that the event expires and is removed from the web site.">

<!--- system properties --->
<cfproperty name="displayMethod" type="string" required="yes" default="displayPageStandard">
<cfproperty name="status" type="string" hint="Status of the node (draft, pending, approved)." required="yes" default="draft" />

</cfcomponent>