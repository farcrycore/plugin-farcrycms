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

<!--- @@displayname: Fact Content Type --->
<!--- @@Description: Records facts, testimonials and the like. --->
<!--- @@Developer: Geoff Bowers (modius@daemon.com.au) --->
<cfcomponent extends="farcry.core.packages.types.types" displayname="Fact" hint="Facts are little snippets of information; factoids, quotes, testimonials, brand messages and more. Create a library of facts and have them publish randomly on your site tokeep things interesting." bSchedule="true" bObjectBroker="true">
<!------------------------------------------------------------------------
type properties
------------------------------------------------------------------------->
<cfproperty ftseq="1" ftfieldset="Fact Details" name="title" type="string" hint="Meaningful reference title" required="no" default="" ftLabel="Title" ftvalidation="required" />


<cfproperty ftseq="3" ftfieldset="Fact Details" name="link" type="string" hint="Link to a page internal or external" required="no" default="" fttype="url" ftLabel="Link" />
<cfproperty ftseq="4" ftfieldset="Fact Details" name="body" type="longchar" hint="Content of the factoid." required="No" default="" ftLabel="Content" ftType="longchar" />
<cfproperty ftseq="5" ftfieldset="Fact Details" name="imageID" type="uuid" hint="Image to display with factoid." required="no" default="" fttype="uuid" ftjoin="dmImage" ftlabel="Image" />

<cfproperty ftseq="10" ftfieldset="Fact Details" name="displayMethod" type="string" hint="Display method to render." required="yes" ftDefault="displayTeaserStandard" fttype="webskin" ftprefix="display" ftlabel="Display Method" />

<cfproperty ftseq="30" ftfieldset="Categorisation" name="catFacts" type="longchar" hint="Fact categorisation." required="no" default="" fttype="category" ftalias="dmFacts" ftlabel="Category" />

<!--- system properties --->
<cfproperty name="status" type="string" hint="Status of the node (draft, pending, approved)." required="yes" default="draft" />

</cfcomponent>