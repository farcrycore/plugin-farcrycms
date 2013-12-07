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
	displayname="News" 
	hint="Report your up-to-the-minute happenings by creating News content." 
	bSchedule="true" bFriendly="true" fualias="news"
	bObjectBroker="true"
	icon="fa-file-text">
<!------------------------------------------------------------------------
type properties
------------------------------------------------------------------------->	
<cfproperty 
	name="title" type="string" hint="News title." required="no" default="" 
	ftseq="10" ftfieldset="News Story" ftlabel="Title" ftvalidation="required" />

<cfproperty 
	name="source" type="string" hint="source of the information contained in the content" required="no" default="" 
	ftseq="20" ftfieldset="News Story" ftlabel="Source"
	fthint="Source of the content; author tagline, agency, department, etc" />
	
<cfproperty 
	name="teaserImage" type="uuid" hint="Teaser image to display." required="no" default="" 
	ftseq="40" ftfieldset="News Story" ftlabel="Teaser Image" 
	fttype="uuid" ftjoin="dmImage" />

<cfproperty 
	name="Teaser" type="string" dbPrecision="2000" hint="Teaser text." required="no" default="" 
	ftseq="50" ftfieldset="News Story" ftlabel="Story Teaser"
	fttype="longchar" ftlimit="500" />

<cfproperty 
	name="Body" type="longchar" hint="Main body of content." required="no" default="" 
	ftseq="60" ftfieldset="News Story" ftlabel="News Content"
	ftType="RichText" 
	ftImageArrayField="aObjectIDs" ftImageTypename="dmImage" ftImageField="StandardImage"
	ftTemplateTypeList="dmImage,dmfile"
	ftTemplateWebskinPrefixList="insertHTML" />

<cfproperty 
	name="aObjectIds" type="array" hint="Mixed media content for this content." required="no" default=""
	ftseq="70" ftfieldset="Related Content" ftlabel="Media Library" 
	ftJoin="dmImage,dmfile" 
	bSyncStatus="true" ftJoinAllowDuplicates="false" ftallowedit="true" ftAllowBulkUpload="true" />
	
<cfproperty 
	name="aRelatedIDs" type="array" hint="Related content items." required="no" default="" 
	ftseq="80" ftfieldset="Related Content" ftlabel="Related Content"
	fttype="array" ftJoin="dmNavigation,dmNews"
	fthint="Related web pages and news items." />

<cfproperty 
	name="catNews" type="longchar" hint="News categorisation." required="no" default="" 
	ftseq="90" ftfieldset="Publishing Options" ftlabel="News Category"
	fttype="category" ftalias="dmNews" />

<cfproperty 
	name="publishDate" type="date" hint="The date that a news object is sent live and appears on the public website" required="no" default="" 
	ftseq="100" ftfieldset="Publishing Options" ftlabel="Publish Date"
	ftType="datetime" ftDefaultType="Evaluate" ftDefault="now()" ftDateFormatMask="dd mmm yyyy" ftTimeFormatMask="hh:mm tt" ftToggleOffDateTime="false"
	fthint="You can embargo news items by setting a future publish date." />
	
<cfproperty 
	name="expiryDate" type="date" hint="The date that a news object is removed from the web site" required="no" default="" 
	ftseq="110" ftfieldset="Publishing Options" ftlabel="Expiry Date" 
	ftType="datetime" 
	ftDefaultType="Evaluate" ftDefault="DateAdd('yyyy', 200, now())" ftDateFormatMask="dd mmm yyyy" ftTimeFormatMask="hh:mm tt" 
	ftToggleOffDateTime="true"
	fthint="Expired news is not visible in listings but is not removed from the site." />

<!--- system attribute --->
<cfproperty name="displayMethod" type="string" hint="Display method to render." required="yes" default="displayPageStandard" />
<cfproperty name="status" type="string" hint="Status of the node (draft, pending, approved)." required="yes" default="draft" />


</cfcomponent>
