<cfcomponent displayname="Event Listing" extends="farcry.core.packages.types.versions"
	hint="Display a calendar of Events."
	bFriendly="true" fualias="events" 
	bObjectBroker="true" bUseInTree="true"
	icon="fa-calendar">
<!------------------------------------------------------------------------
type properties
------------------------------------------------------------------------->	
<cfproperty 
	name="title" type="string" hint="Calendar title." required="no" default="" 
	ftseq="10" ftFieldset="General Details" ftlabel="Calendar Title" 
	ftvalidation="required" />

<cfproperty 
	name="Teaser" type="longchar" hint="Teaser text." required="no" default="" 
	ftseq="20" ftFieldset="General Details" ftlabel="Teaser"
	ftlimit="512" />

<cfproperty 
	name="numEvents" type="integer" required="true" default="0"
	ftSeq="30" ftFieldset="Configuration" ftLabel="Number of Events"
	ftHint="The number of Events to display. 0 to display all."
	ftType="integer" >

<cfproperty 
	name="bPagination" type="boolean" required="false" default="false" 
	ftSeq="40" ftFieldset="Configuration" ftLabel="Paginaton" 
	ftHint="Enable/Disable Pagination.">

<cfproperty 
	name="catCalendar" type="longchar" hint="Categories to filter events by." required="false" default=""
	ftseq="50" ftfieldset="Categorisation" ftlabel="Filter for Categories"
	fttype="category" ftalias="dmEvent"  />

<cfproperty 
	name="bMatchAllKeywords" type="boolean" hint="Match ALL selected keywords." required="false" default="0"
	ftSeq="31" ftFieldset="Categorisation" ftLabel="Match all the selected categories?" 
    ftHint="If this box is ticked, an event must be tagged with all of the selected categories in order to appear in the calendar."
    ftType="boolean" />

<!------------------------------------------------------------------------
type methods 
------------------------------------------------------------------------->	
<cffunction name="getEvents" returntype="query" output="false" access="public" hint="Returns dmEvent base on category">
	<cfargument name="category" type="string" required="false" default="" />
	<cfargument name="bMatchAllKeywords" type="boolean" required="false" default="false" />

	<cfif NOT len(trim(arguments.category))>
		<cfset var q = application.fapi.getContentObjects(typename="dmEvent", publishdate_lte=now(), expirydate_gte=now(), endDate_gte=now(), orderby="startDate asc", status="approved") />
	<cfelseif arguments.bMatchAllKeywords>
		<cfset var q = application.fapi.getContentObjects(typename="dmEvent", publishdate_lte=now(), expirydate_gte=now(), endDate_gte=now(), catEvent_eq=arguments.category, orderby="startDate asc", status="approved") />
	<cfelse>
		<cfset var q = application.fapi.getContentObjects(typename="dmEvent", publishdate_lte=now(), expirydate_gte=now(), endDate_gte=now(), catEvent_in=arguments.category, orderby="startDate asc", status="approved") />
	</cfif>

	<cfreturn q />
</cffunction>

</cfcomponent>

	