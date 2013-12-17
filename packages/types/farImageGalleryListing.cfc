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
<cfcomponent extends="farcry.core.packages.types.versions" displayname="Image Gallery Listing" 
	hint="Image Gallery Listing Page." bUseInTree="true"
    bFriendly="true" fualias="gallery-list"
	bObjectBroker="true"
    icon="fa fa-picture-o">

<!------------------------------------------------------------------------
type properties
------------------------------------------------------------------------->	
<cfproperty name="title" type="string" hint="Image gallery listing page title." required="no" default="" 
	ftseq="10" ftfieldset="General Details" ftlabel="Title" ftvalidation="required" />

<cfproperty 
    name="teaser" type="longchar" hint="Teaser text." required="no" default="" 
    ftseq="20" ftfieldset="General Details" ftlabel="Description"
    ftlimit="512" />

<!--- 
 // deprecated properties 
--------------------------------------------------------------------------------->
<cfproperty name="displayMethod" type="string" hint="Display method to render." required="yes" default="displayPageStandard" />

</cfcomponent>