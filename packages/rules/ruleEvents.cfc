<cfcomponent displayname="Events: Listing Rule" extends="farcry.core.packages.rules.rules" hint="Displays current events">

	<cfproperty ftSeq="1" ftFieldset="General" name="intro" type="longchar" hint="Intro text for the Events listing.  Can be any combination of content and HTML markup." required="false" default="" ftLabel="Intro Text" ftHint="This content will appear ABOVE your results." />
	<cfproperty ftSeq="2" ftFieldset="General" name="displayMethod" type="string" hint="Display teaser method to render individual content items." required="true" default="displayTeaserStandard" ftType="webskin" fttypename="dmEvent" ftprefix="displayTeaser" ftLabel="Display Method" ftHint="This determines how each of your event results will render." />
	<cfproperty ftSeq="3" ftFieldset="General" name="suffix" type="longchar" hint="Suffix text for the event listing.  Can be any combination of content and HTML markup." required="false" default="" ftLabel="Suffix Text" ftHint="This content will appear BELOW your results." />

	<cfproperty ftSeq="10" ftFieldset="Results" name="numItems" type="numeric" hint="The number of items to display per page." required="true" default="5" ftType="numeric" ftIncludeDecimal="false" ftvalidation="validate-digits" ftLabel="## items per page" />
	<cfproperty ftSeq="11" ftFieldset="Results" name="bArchive" type="boolean" hint="Displays with a paginated display." required="true" default="0" ftType="boolean" ftLabel="Paginate?" ftHint="Selecting NOT to paginate will only show the first page of results." />

	<cfproperty ftseq="20" ftfieldset="Categorisation" name="metadata" type="longchar" hint="A list of categories that the event content must match in order to be shown." required="false" default="" fttype="category" ftalias="dmevent" ftlabel="Selected Event Categories" />
	<cfproperty ftSeq="21" ftFieldset="Categorisation" name="bMatchAllKeywords" type="boolean" hint="Does the content need to match ALL selected keywords?" required="false" default="0" ftType="boolean" ftLabel="Match ALL the selected categories?" />

</cfcomponent>