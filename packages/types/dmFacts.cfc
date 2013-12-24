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
<cfcomponent 
    extends="farcry.core.packages.types.types" 
    displayname="Fun Facts" 
    hint="Facts are little snippets of information; factoids, quotes, testimonials, brand messages and more. Create a library of facts and have them publish randomly on your site tokeep things interesting." 
    bSchedule="true" bObjectBroker="true"
    icon="fa-smile-o">

    <cfproperty name="title" type="string" required="no" default="" 
        ftSeq="10" ftFieldset="Fact Details" ftLabel="Title" 
        ftValidation="required">

    <cfproperty name="body" type="longchar" required="No" default="" 
        ftSeq="20" ftFieldset="Fact Details" ftLabel="Content" 
        ftType="longchar" ftlimit="500">

    <cfproperty name="link" type="string" required="no" default="" 
        ftSeq="30" ftFieldset="Fact Details" ftLabel="Link" 
        ftType="url"
        fthint="Optional. Link using absolute URL; eg. http://www.somewhere.com">

    <cfproperty name="imageID" type="uuid" required="no" default="" 
        ftSeq="40" ftFieldset="Fact Details" ftLabel="Source Image" 
        ftType="uuid" ftJoin="dmImage">

    <cfproperty name="imgThumb" type="string" required="false"
        ftSeq="50" ftFieldset="Fact Details" ftLabel="Thumbnail Image"
        ftType="image" ftDestination="/images/fact/thumb"
        ftAutoGenerateType="center" ftImageWidth="100" ftImageHeight="100"
        ftSourceField="imageID:sourceImage" ftCreateFromSourceDefault="true"
        ftAllowUpload="true" ftQuality="0.8" ftInterpolation="blackman">

    <cfproperty name="catFacts" type="longchar" required="no" default="" 
        ftSeq="60" ftFieldset="Categorisation" ftLabel="Category" 
        ftType="category" ftAlias="dmFacts"
        fthint="Optional. Category for filtering facts.">

    <cfproperty name="status" type="string" required="yes" default="draft"
        hint="Status of the node (draft, pending, approved).">

<!--- 
 // deprecated: legacy properties 
--------------------------------------------------------------------------------->
    <cfproperty name="displayMethod" type="string" required="no">
</cfcomponent>