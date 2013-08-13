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
<cfcomponent extends="farcry.core.packages.types.versions" displayname="Image Gallery Listing" 
	hint="Create Image Gallery Listing Page." bUseInTree="true"
	bSchedule="true" bFriendly="true" fualias="Image Gallery"
	bObjectBroker="true">
<!------------------------------------------------------------------------
type properties
------------------------------------------------------------------------->	
<cfproperty 
	name="title" type="string" hint="Image gallery listing page title." required="no" default="" 
	ftseq="1" ftfieldset="General Details" ftwizardStep="General Details" ftlabel="Title" ftvalidation="required" />

<cfproperty 
	name="displayMethod" type="string" hint="Display method to render." required="yes" default="displayPageStandard"
	ftseq="3" ftfieldset="General Details" ftwizardStep="General Details" ftlabel="Content Template" 
	fttype="webskin" ftprefix="displayPage" />

<cfproperty 
	name="aImageGallery" type="array" ftType="array" ftLabel="Image Gallery" required="false" default="" 
	ftseq="5" ftfieldset="General Details" ftjoin="farImageGallery" ftwizardStep="General Details">

<!------------------------------------------------------------------------
object methods 
------------------------------------------------------------------------->	

</cfcomponent>