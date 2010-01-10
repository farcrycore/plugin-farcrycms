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
<cfcomponent extends="farcry.core.packages.types.versions" displayname="News" 
	hint="Report your up-to-the-minute happenings by creating News content. News can be published throughout your site using publishing rules." 
	bSchedule="true" bFriendly="true" fualias="news"
	bObjectBroker="true">
<!------------------------------------------------------------------------
type properties
------------------------------------------------------------------------->	
<cfproperty 
	name="title" type="string" hint="News title." required="no" default="" 
	ftseq="1" ftfieldset="General Details" ftwizardStep="General Details" ftlabel="Title" ftvalidation="required" />

<cfproperty 
	name="source" type="string" hint="source of the information contained in the content" required="no" default="" 
	ftseq="2" ftfieldset="General Details" ftwizardStep="General Details" ftlabel="Source" />
	
<cfproperty 
	name="displayMethod" type="string" hint="Display method to render." required="yes" default="displayPageStandard"
	ftseq="3" ftfieldset="General Details" ftwizardStep="General Details" ftlabel="Content Template" 
	fttype="webskin" ftprefix="displayPage" />
	
<cfproperty 
	name="catNews" type="longchar" hint="News categorisation." required="no" default="" 
	ftseq="4" ftfieldset="Categorisation" ftwizardStep="General Details" ftlabel="News Category"
	fttype="category" ftalias="dmNews" />

<cfproperty 
	name="publishDate" type="date" hint="The date that a news object is sent live and appears on the public website" required="no" default="" 
	ftseq="11" ftfieldset="Publishing Details" ftwizardStep="General Details" ftlabel="Publish Date"
	ftType="datetime" ftDefaultType="Evaluate" ftDefault="now()" ftDateFormatMask="dd mmm yyyy" ftTimeFormatMask="hh:mm tt" ftToggleOffDateTime="false" />
	
<cfproperty 
	name="expiryDate" type="date" hint="The date that a news object is removed from the web site" required="no" default="" 
	ftseq="12" ftfieldset="Publishing Details" ftwizardStep="General Details" ftlabel="Expiry Date" 
	ftType="datetime" ftDefaultType="Evaluate" ftDefault="DateAdd('yyyy', 200, now())" ftDateFormatMask="dd mmm yyyy" ftTimeFormatMask="hh:mm tt" ftToggleOffDateTime="true" />

<cfproperty 
	name="Body" type="longchar" hint="Main body of content." required="no" default="" 
	ftseq="21" ftfieldset="News Story" ftwizardStep="News Body" ftlabel="Body Content"
	ftType="RichText" 
	ftImageArrayField="aObjectIDs" ftImageTypename="dmImage" ftImageField="StandardImage"
	ftTemplateTypeList="dmImage,dmfile,dmflash,dmNavigation,dmHTML"
	ftTemplateWebskinPrefixList="insertHTML" />

<cfproperty 
	name="teaserImage" type="UUID" hint="Teaser image to display." required="no" default="" 
	ftseq="31" ftfieldset="Story Teaser" ftwizardStep="News Body" ftlabel="Teaser Image" 
	fttype="uuid" ftjoin="dmImage" 
	fthelptitle="Teaser Requirements"
	fthelpsection="Teaser images can only be selected from the pool of associated media images. You must add to the media library before selecting." />

<cfproperty 
	name="Teaser" type="longchar" hint="Teaser text." required="no" default="" 
	ftseq="32" ftfieldset="Story Teaser" ftwizardStep="News Body" ftlabel="Story Teaser" />

<cfproperty 
	name="aObjectIds" type="array" hint="Mixed media content for this content." required="no" default=""
	ftseq="41" ftfieldset="Related Content" ftwizardStep="News Body" ftlabel="Media Library" 
	ftJoin="dmImage,dmfile,dmflash" bSyncStatus="true"  ftJoinAllowDuplicates="false" />
	
<cfproperty 
	name="aRelatedIDs" type="array" hint="Related content items." required="no" default="" 
	ftseq="42" ftfieldset="Related Content" ftwizardStep="News Body" ftlabel="Related Content"
	fttype="array" ftJoin="dmFile,dmNavigation,dmHTML" />

<!--- system attribute --->
<cfproperty name="status" type="string" hint="Status of the node (draft, pending, approved)." required="yes" default="draft" />


<!------------------------------------------------------------------------
object methods 
------------------------------------------------------------------------->	

</cfcomponent>