<cfsetting enablecfoutputonly="yes" />

<cfimport taglib="/farcry/core/tags/wizard" prefix="wiz" />
<cfimport taglib="/farcry/core/tags/formtools" prefix="ft" />


<!--- PROCESS WIZARD SUBMISSION --->
<!--- Always save wizard WDDX data --->
<wiz:processwizard excludeAction="Cancel">

	<!--- Save any Types submitted (including any new ones) --->
	<wiz:processWizardObjects typename="ruleMyHandpicked" />
	<wiz:processWizardObjects typename="ruleMyHandpicked_aObjects" />
</wiz:processwizard>

<wiz:processwizard action="Save" Savewizard="true" Exit="true" /><!--- Save wizard Data to Database and remove wizard --->
<wiz:processwizard action="Cancel" Removewizard="true" Exit="true" /><!--- remove wizard --->


<!--- RENDER THE WIZARD --->
<wiz:wizard ReferenceID="#stobj.objectid#" r_stWizard="stWizard">

	<wiz:step name="Select Objects">
		<wiz:object stobject="#stobj#" wizardID="#stWizard.ObjectID#" lfields="Intro" format="edit" legend="Introduction" />
		<wiz:object stobject="#stobj#" wizardID="#stWizard.ObjectID#" lfields="aObjects" format="edit" legend="Select Handpicked Objects" />
	</wiz:step>
	
	<wiz:step name="Select Webskin Templates">

		<cfoutput><h3>Selected Handpicked Objects</h3></cfoutput>

		<cfif structKeyExists(stWizard.data, stobj.objectid)>
			<cfif arrayLen(stWizard.data[stobj.objectid].aObjects)>		
				
				<cfoutput>
				<table width="100%">
				<tr>
					<th>Handpicked Object</th>
					<th>Content Template</th>
				</tr>
				</cfoutput>
					
				<cfloop from="1" to="#arrayLen(stWizard.data[stobj.objectid].aObjects)#" index="i">
					
					<cfset oType = createObject("component", application.stcoapi["#stWizard.data[stobj.objectid].aObjects[i].typename#"].packagePath) />
					<cfset teaserHTML = oType.getView(objectid=stWizard.data[stobj.objectid].aObjects[i].data, template="librarySelected", alternateHTML="") />
					<cfif not len(teaserHTML)>
						<cfset st = oType.getData(objectid=stWizard.data[stobj.objectid].aObjects[i].data) />
						<cfset teaserHTML = st.label />
					</cfif>
					<wiz:object objectid="#stWizard.data[stobj.objectid].aObjects[i].objectid#" wizardID="#stWizard.ObjectID#" lfields="webskin" r_stFields="stFields" />
					
					
					<cfoutput>
					<tr>
						<td style="padding:10px;">#teaserHTML#</td>
						<td style="padding:10px;">#stFields.webskin.html#</td>
					</tr>
					</cfoutput>
				</cfloop>
				
				<cfoutput>
				</table>
				</cfoutput>
			</cfif>
		<cfelse>
			<cfoutput><p>OBJECT NOT YET STORED IN THE WIZARD</p></cfoutput>
		</cfif>
			
	
	</wiz:step>
</wiz:wizard>

<cfsetting enablecfoutputonly="no" />



