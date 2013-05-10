<cfcomponent displayname="Event Listing" extends="farcry.core.packages.types.versions"
	hint="Display a list of Events."
	bFriendly="true" fualias="events" bObjectBroker="true" bUseInTree="true">
<!------------------------------------------------------------------------
type properties
------------------------------------------------------------------------->	
<cfproperty 
	name="title" type="string" hint="Event title." required="no" default="" 
	ftseq="1" ftFieldset="General Details" ftwizardStep="General Details" ftlabel="Title" ftvalidation="required" />

<cfproperty 
	name="Teaser" type="longchar" hint="Teaser text." required="no" default="" 
	ftseq="2" ftFieldset="General Details" ftwizardStep="General Details" ftlabel="Teaser" />

<cfproperty 
	name="numEvents" type="integer" ftType="integer" ftLabel="Number of Events to display" required="true" default="0"
	ftSeq="35" ftFieldset="Configuration"  ftWizardStep="General Details" 
	ftHint="The number of Education to display. 0 to display all">

<cfproperty 
	name="bPagination" type="boolean" ftLabel="Paginaton" required="false" default="false" 
	ftSeq="37" ftFieldset="Configuration" ftWizardStep="General Details"
	ftHint="Enable/Disable Pagination.">

<cfproperty 
	name="metadata" type="longchar" hint="A list of categories that the event content must match in order to be shown." required="false" default=""
	ftseq="30" ftfieldset="Categorisation" ftwizardStep="General Details" ftlabel="Selected Event Categories"
	fttype="category" ftalias="dmEvent"  />

<cfproperty 
	name="bMatchAllKeywords" type="boolean" hint="Does the content need to match ALL selected keywords?" required="false" default="0"
	ftSeq="31" ftFieldset="Categorisation" ftLabel="Match all the selected categories?" 
    ftType="boolean" ftHint="If this box is ticked, an article must be tagged with all of the selected categories in order to appear in this area." />

<!------------------------------------------------------------------------
object methods 
------------------------------------------------------------------------->	

<cffunction name="getEvents" returntype="query" output="false" access="public" hint="Returns dmEvent base on category">
	<cfargument name="category" type="string" required="false" default="" />
	<cfargument name="bMatchAllKeywords" type="boolean" required="false" default="false" />

	<cfif NOT len(trim(arguments.category))>
		<cfset var q = application.fapi.getContentObjects(typename="dmEvent", publishdate_lte=now(), expirydate_gte=now(), endDate_gte=now(), orderby="startDate DESC", status="approved") />
	<cfelseif arguments.bMatchAllKeywords>
		<cfset var q = application.fapi.getContentObjects(typename="dmEvent", publishdate_lte=now(), expirydate_gte=now(), endDate_gte=now(), catEvent_eq=arguments.category, orderby="startDate DESC", status="approved") />
	<cfelse>
		<cfset var q = application.fapi.getContentObjects(typename="dmEvent", publishdate_lte=now(), expirydate_gte=now(), endDate_gte=now(), catEvent_in=arguments.category, orderby="startDate DESC", status="approved") />
	</cfif>

	<cfreturn q />
</cffunction>

</cfcomponent>

	
