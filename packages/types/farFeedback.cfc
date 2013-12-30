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
	displayname="Feedback" 
	hint="Site visitors can leave feedback through the feedback publishing rule. All feedback will be collected in this location." output="false"
	icon="fa-envelope">

	<cfproperty name="subject" type="string" default="" required="true"
		ftSeq="1" ftFieldset="Feedback Form" ftLabel="Subject" 
		ftType="string" blabel="true"
		ftValidation="required" ftclass="input-xlarge"
		hint="The subject of the email">

	<cfproperty name="emailfrom" type="string" default="" required="true"
		ftSeq="2" ftFieldset="Feedback Form" ftLabel="From" 
		ftType="email" 
		ftValidation="required" ftclass="input-xlarge"
		hint="The email of the person leaving feedback">

	<cfproperty name="emailto" type="string" default="" 
		ftSeq="3" ftFieldset="Feedback Form" ftLabel="To" 
		ftType="string" 
		ftValidation="required" ftclass="input-xlarge"
		hint="The email that the feedback was sent to">

	<cfproperty name="name" type="string" default="" 
		ftSeq="4" ftFieldset="Feedback Form" ftLabel="Name" 
		ftType="string" 
		ftValidation="required" ftclass="input-xlarge"
		hint="The name of the person leaving feedback">

	<cfproperty name="comments" type="longchar" default="" 
		ftSeq="5" ftFieldset="Feedback Form" ftLabel="Comment" 
		ftType="longchar" ftclass="input-xlarge"
		ftValidation="required">

<!--- 
 // type functions 
--------------------------------------------------------------------------------->	
	<cffunction name="sendFeedback" access="public" returntype="boolean" description="Sends the relevant emails" output="false">
		<cfargument name="objectid" type="uuid" required="false" hint="" />
		<cfargument name="stObject" type="struct" required="false" hint="" />
		
		<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />
		
		<cfif structkeyexists(arguments,"objectid")>
			<cfset arguments.stObject = getData(arguments.objectid) />
		</cfif>
		
		<cftry>
			<skin:view stObject="#arguments.stObject#" webskin="emailFeedback" />
			<skin:view stObject="#arguments.stObject#" webskin="emailResponse" />
			
			<cfreturn true />
			
			<cfcatch type="any">
				<cfreturn false />
			</cfcatch>
		</cftry>
	</cffunction>
	
</cfcomponent>