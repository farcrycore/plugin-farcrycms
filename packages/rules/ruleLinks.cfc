<cfcomponent displayname="Links: Link Listing Rule" extends="farcry.core.packages.rules.rules" hint="Method for displaying dmLink objects">
	<cfproperty name="displayMethod" type="string" default="displayTeaser" hint="Display method to render this event rule with" ftSeq="1" ftFieldset="" ftLabel="Display method" ftType="webskin" ftTypename="dmLink" ftPrefix="displayTeaser" />
	<cfproperty name="intro" type="string" default="" hint="Intro text for the event listing" ftSeq="2" ftFieldset="" ftLabel="Intro" ftType="longchar" />
	<cfproperty name="numItems" type="numeric" default="5" hint="The number of items to display per page" ftSeq="3" ftFieldset="" ftLabel="Items per page" ftType="integer" />
	<cfproperty name="numPages" type="numeric" default="1" hint="The number of pages to display at most" ftSeq="4" ftFieldset="" ftLabel="Max. pages" ftType="integer" />
	<cfproperty name="bArchive" type="boolean" default="0" hint="Displays as an archive" ftSeq="5" ftFieldset="" ftLabel="Archive" ftType="boolean" />	
	<cfproperty name="bMatchAllKeywords" type="boolean" default="0" hint="Does the content need to match ALL selected categories" ftSeq="6" ftFieldset="" ftLabel="Match all keywords" ftType="boolean" />
	<cfproperty name="metadata" type="longchar" default="" hint="A list of category ObjectIDs that the content is to be drawn from" ftSeq="7" ftFieldset="" ftLabel="Categories" ftType="category" />
	<cfproperty name="suffix" type="string" default="" hint="Suffix text for the listing" ftSeq="8" ftFieldset="" ftLabel="Suffix" ftType="string" />

</cfcomponent>