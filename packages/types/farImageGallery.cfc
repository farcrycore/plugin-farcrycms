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
<cfcomponent extends="farcry.core.packages.types.versions" displayname="Image Gallery" 
	hint="Create Image Gallery content."
	bSchedule="true" 
	bFriendly="true" fualias="gallery"
	bObjectBroker="true"
	icon="fa fa-picture-o">

<!------------------------------------------------------------------------
type properties
------------------------------------------------------------------------->	
<cfproperty 
	name="title" type="string" hint="Image gallery title." required="no" default="" 
	ftseq="10" ftfieldset="Gallery Details" ftlabel="Gallery Title" ftvalidation="required" />

<cfproperty 
	name="teaser" type="longchar" hint="Teaser text." required="no" default="" 
	ftseq="20" ftfieldset="Gallery Details" ftlabel="Description"
	ftlimit="512" />

<cfproperty
	name="imgCoverSourceID" type="uuid" required="false" default="" 
	ftSeq="30" ftfieldset="Gallery Images" ftLabel="Cover Image Source" 
	fthint="Choose an image from the library for the cover of the gallery."
	ftType="UUID" ftJoin="dmImage" />

<cfproperty name="imgCover" type="string" required="false"
	ftSeq="40" ftFieldset="Gallery Images" ftLabel="Gallery Cover"
	fthint="Crop the cover image to suit your gallery."
	ftType="image" ftDestination="/images/imagegallery/cover"
	ftAutoGenerateType="center" ftImageWidth="300" ftImageHeight="200"
	ftSourceField="imgCoverSourceID:sourceImage" ftCreateFromSourceDefault="true"
	ftAllowUpload="true" ftQuality="0.8" ftInterpolation="blackman">

<cfproperty name="aImage" type="array" required="false" default=""
	ftseq="50" ftfieldset="Gallery Images" ftLabel="Image Gallery" 
	ftType="array" ftjoin="dmImage" ftAllowBulkUpload="true" />

<!--- 
 // legacy properties: deprecated 
--------------------------------------------------------------------------------->
<cfproperty name="Body" type="longchar" hint="DEPRECATED. Main body of content." required="no" default="" />
<cfproperty name="displayMethod" type="string" hint="DEPRECATED. Display method to render." required="yes" default="displayPageStandard" />
<cfproperty name="catImageGallery" type="longchar" hint="DEPRECATED. Image Gallery categorisation." required="no" default="" />
<cfproperty name="SourceID" type="uuid" required="false" default="" />

</cfcomponent>