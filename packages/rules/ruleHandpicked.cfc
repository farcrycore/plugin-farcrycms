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


<!--- 
|| DESCRIPTION || 
$Description: 
Hand-pick and display individual content items with a specified displayTeaser* handler. 
Restricted to those content types listed in the ftJoin attribute of aObjects.
$

|| DEVELOPER ||
$Developer: Mat Bryant (m.bryant@daemon.com.au) $
--->
<cfcomponent displayname="Utility: Handpicked Rule" extends="farcry.core.packages.rules.rules" 
	hint="Hand-pick and display individual content items with a specified displayTeaser* handler.">

	<cfproperty ftSeq="1" ftFieldSet="Intro" name="intro" type="longchar" hint="Intro text placed in front of the handpicked rule results.  Can be any relevant content and HTML markup." ftLabel="Introduction" />
	<cfproperty ftSeq="2" ftFieldSet="Selected Objects" name="aObjects" type="array" ftJoin="dmEvent,dmFacts,dmFlash,dmFile,dmImage,dmInclude,dmLink,dmNews,dmHTML" arrayProps="webskin:string" ftLabel="Select Objects" />



	<cffunction name="ftEditAObjects" access="public" output="false" returntype="string" hint="This is going to called from ft:object and will always be passed 'typename,stobj,stMetadata,fieldname'.">
		<cfargument name="typename" required="true" type="string" hint="The name of the type that this field is part of.">
		<cfargument name="stObject" required="true" type="struct" hint="The object of the record that this field is part of.">
		<cfargument name="stMetadata" required="true" type="struct" hint="This is the metadata that is either setup as part of the type.cfc or overridden when calling ft:object by using the stMetadata argument.">
		<cfargument name="fieldname" required="true" type="string" hint="This is the name that will be used for the form field. It includes the prefix that will be used by ft:processform.">
		<cfargument name="stPackage" required="true" type="struct" hint="Contains the metadata for the all fields for the current typename.">
				
		<cfset var htmlLabel = "" />
		<cfset var joinItems = "" />
		<cfset var i = "" />
		<cfset var returnHTML = "" />
		<cfset var thisobject = "" />
		<cfset var thiswebskin = "" />
		<cfset var thistypename = "" />
		<cfset var stWebskins = structnew() />
		<cfset var itemlist = "" />
		
		<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />
		<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />
		<cfimport taglib="/farcry/core/tags/grid" prefix="grid" />
		
		<skin:loadJS id="jquery-ui" />
		<skin:loadCSS id="jquery-ui" />
		
		<cfset joinItems = arguments.stObject[arguments.stMetadata.name] />
		<cftry>
		<cfsavecontent variable="returnHTML">	
			<grid:div class="multiField">

			<cfif arraylen(joinItems)>
				<cfoutput><ul id="join-#stObject.objectid#-#arguments.stMetadata.name#" class="arrayDetailView" style="list-style-type:none;border:1px solid ##ebebeb;border-width:1px 1px 0px 1px;margin:0px;"></cfoutput>
				
				<cfloop from="1" to="#arraylen(joinItems)#" index="i">
					<cfif isstruct(joinItems[i])>
						<cfset thisobject = joinItems[i].data />
						<cfset thiswebskin = joinItems[i].webskin />
						<cfset thistypename = joinItems[i].typename />
					<cfelseif isvalid("uuid",joinItems[i])>
						<cfset thisobject = joinItems[i] />
						<cfset thiswebskin = "" />
						<cfset thistypename = application.fapi.findType(thisobject) />
					</cfif>
					
					<cfif not structkeyexists(stWebskins,thistypename)>
						<cfset stWebskins[thistypename] = application.coapi.COAPIADMIN.getWebskins(typename=thistypename, prefix='displayTeaser') />
					</cfif>
					
					<!--- Webskin may have been overriden in form scope --->
					<cfif structkeyexists(form,i&"webskin")>
						<cfset thiswebskin = form[i&"webskin"] />
					</cfif>
					
					<cftry>
						<skin:view objectid="#thisobject#" webskin="librarySelected" r_html="htmlLabel" />
						<cfcatch type="any">
							<cfset htmlLabel = "OBJECT NO LONGER EXISTS" />
						</cfcatch>
					</cftry>
					
					<cfset itemlist = listappend(itemlist,thisobject) />
					
					<cfoutput>
					<li id="join-item-#thisobject#" class="sort #iif(not i mod 2,de('oddrow'),de('evenrow'))#" serialize="#thisobject#" style="clear:both;border:1px solid ##ebebeb;padding:5px;zoom:1;">
						<table style="width:100%;">
							<tr>
								<td class="" style="cursor:move;padding:3px;"><span class="ui-icon ui-icon-arrow-2-n-s"></span></td>
								<td class="" style="cursor:move;width:100%;padding:3px;">#htmlLabel#</td>
								<td class="" style="padding:3px;">
									<select name="#arguments.fieldname##thisobject#webskin" style="width:170px;">
										<cfloop query="stWebskins.#thistypename#">
											<option value="#stWebskins[thistypename].methodname#"<cfif thiswebskin eq stWebskins[thistypename].methodname> selected</cfif>>#stWebskins[thistypename].displayname#</option>
										</cfloop>
									</select>
								</td>
								<td class="" style="padding:3px;white-space:nowrap;">
									<ft:button
										Type="button" 
										renderType="button"
										class="ui-state-default ui-corner-all"
										value="Remove" 
										text="remove" 
										confirmText="Are you sure you want to remove this item? Doing so will only unlink this content item. The content will remain in the database." 
										onClick="fcForm.detachLibraryItem('#stObject.typename#','#stObject.objectid#','#arguments.stMetadata.name#','#arguments.fieldname#','#thisobject#');" />
							 	</td>
							</tr>
						</table>
					</li>
					</cfoutput>	
				</cfloop>
				
				<cfoutput></ul></cfoutput>
			</cfif>
			
			<cfoutput><input type="hidden" id="#arguments.fieldname#" name="#arguments.fieldname#" value="#itemlist#" /></cfoutput>
			
			<ft:buttonPanel style="">
			<cfoutput>
				
				<ft:button	Type="button" 
							renderType="button"
							class="ui-state-default ui-corner-all"
							value="select" 
							onClick="fcForm.openLibrarySelect('#stObject.typename#','#stObject.objectid#','#arguments.stMetadata.name#','#arguments.fieldname#');" />
				
				<cfif arraylen(joinItems)>
					
					<ft:button	Type="button" 
								renderType="button"
								class="ui-state-default ui-corner-all"
								value="Remove All" 
								text="remove all" 
								confirmText="Are you sure you want to remove all the attached items?"
								onClick="fcForm.detachAllLibraryItems('#stObject.typename#','#stObject.objectid#','#arguments.stMetadata.name#','#arguments.fieldname#','#itemList#');" />
					
				</cfif>
					
				<select id="#arguments.fieldname#-add-type">
					<option value="">- Create New -</option>
					<cfloop list="#arguments.stMetadata.ftJoin#" index="i">
						<option value="#trim(i)#">#application.fapi.getContentTypeMetadata(i, 'displayname', i)#</option>
					</cfloop>
				</select>
				<skin:onReady>
					$j('###arguments.fieldname#-add-type').change(function() {
						fcForm.openLibraryAdd('#stObject.typename#','#stObject.objectid#','#arguments.stMetadata.name#','#arguments.fieldname#');
					});
				</skin:onReady>
					
			</cfoutput>
			</ft:buttonPanel>
			
			<cfif arraylen(joinItems) GT 1>
				<cfoutput>
					<script type="text/javascript">
					$j(function() {
						fcForm.initSortable('#arguments.stobject.typename#','#arguments.stobject.objectid#','#arguments.stMetadata.name#','#arguments.fieldname#');
					});
					</script>
				</cfoutput>
			</cfif>
			</grid:div>
		</cfsavecontent>
		<cfcatch><cflog file="handpicked" text="#cfcatch.message# - #cfcatch.TagContext[1].toString()#"></cfcatch>
		</cftry>
		<cfif structKeyExists(request, "hideLibraryWrapper") AND request.hideLibraryWrapper>
			<cfreturn "#returnHTML#" />
		<cfelse>
			<cfreturn "<div id='#arguments.fieldname#-library-wrapper'>#returnHTML#</div>" />	
		</cfif>
		
	</cffunction>
	
	<cffunction name="ftValidateAObjects" access="public" output="true" returntype="struct" hint="This will return a struct with bSuccess and stError">
		<cfargument name="ObjectID" required="true" type="UUID" hint="The objectid of the object that this field is part of.">
		<cfargument name="Typename" required="true" type="string" hint="the typename of the objectid.">
		<cfargument name="stFieldPost" required="true" type="struct" hint="The fields that are relevent to this field type.">
		<cfargument name="stMetadata" required="true" type="struct" hint="This is the metadata that is either setup as part of the type.cfc or overridden when calling ft:object by using the stMetadata argument.">
		
		<cfset var aField = ArrayNew(1) />
		<cfset var stResult = structNew()>	
		<cfset var thisobject = "" />
		<cfset var stArrayData = structNew() />
			
		<cfset stResult.bSuccess = true>
		<cfset stResult.value = "">
		<cfset stResult.stError = StructNew()>
		
		<!--- --------------------------- --->
		<!--- Perform any validation here --->
		<!--- --------------------------- --->
		<!---
		IT IS IMPORTANT TO NOTE THAT THE STANDARD ARRAY TABLE UI, PASSES IN A LIST OF DATA IDS WITH THEIR SEQ
		ie. dataid1:seq1,dataid2:seq2...
		 --->
		
		<cfif listLen(arguments.stFieldPost.value)>
			<!--- Remove any leading or trailing empty list items --->
			<cfif arguments.stFieldPost.value EQ ",">
				<cfset arguments.stFieldPost.value = "" />
			</cfif>
			<cfif left(arguments.stFieldPost.value,1) EQ ",">
				<cfset arguments.stFieldPost.value = right(arguments.stFieldPost.value,len(arguments.stFieldPost.value)-1) />
			</cfif>
			<cfif right(arguments.stFieldPost.value,1) EQ ",">
				<cfset arguments.stFieldPost.value = left(arguments.stFieldPost.value,len(arguments.stFieldPost.value)-1) />
			</cfif>	
			
			<cfloop list="#arguments.stFieldPost.value#" index="thisobject">			
				<cfset stArrayData = structNew() />
				<cfset stArrayData.parentid = arguments.objectid />
				<cfset stArrayData.data = listfirst(thisobject,":") />
				<cfset stArrayData.typename = application.fapi.findType(stArrayData.data) />
				<cfset stArrayData.webskin = "" />
				<cfif structkeyexists(arguments.stFieldPost.stSupporting,stArrayData.data&"webskin")>
					<cfset stArrayData.webskin = arguments.stFieldPost.stSupporting[stArrayData.data & "webskin"] />
				</cfif>
				<cfset stArrayData.seq = arrayLen(aField) + 1 />
				 
				<cfset ArrayAppend(aField,stArrayData)>
			</cfloop>
		</cfif>
		
		<cfset stResult.value = aField>
		<!--- ----------------- --->
		<!--- Return the Result --->
		<!--- ----------------- --->
		<cfreturn stResult>
		
	</cffunction>
	

</cfcomponent>