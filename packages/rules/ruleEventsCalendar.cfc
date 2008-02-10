<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2006, http://www.daemon.com.au $
$Community: FarCry CMS http://www.farcrycms.org $
$License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php$

|| VERSION CONTROL ||
$Header: $
$Author: $
$Date: $
$Name:  $
$Revision: $

|| DESCRIPTION || 
$Description: 
ruleEventsCalendar (FarCry Core)
Publishing rule for showing Event content items in a month calendar view format.
$

|| DEVELOPER ||
$Developer: Geoff Bowers (modius@daemon.com.au)$

--->
<cfcomponent displayname="Events: Calendar Rule" extends="farcry.core.packages.rules.rules" 
	hint="Publishing rule for showing Event content items in a month calendar view format.">

	<cfproperty ftSeq="1" ftFieldSet="Introduction" name="intro" type="string" hint="Intro text for the event listing" required="no" default="" ftType="longchar" ftLimit="255">
	<cfproperty ftSeq="2" ftFieldSet="Introduction" name="months" type="numeric" hint="Number of months to show" required="yes" default="1">
	<cfproperty ftSeq="3" ftFieldSet="Introduction" name="displayMethod" type="string" hint="Display method to render this event rule with." required="yes" default="displayteaserCalendar" ftType="webskin" ftTypename="ruleEventsCalendar">
	<cfproperty ftSeq="11" ftFieldSet="Categories" name="bMatchAllKeywords" hint="Doest the content need to match ALL selected keywords" type="boolean" required="false" default="0">
	<cfproperty ftSeq="12" ftFieldSet="Categories" name="metadata" type="longchar" hint="A list of category ObjectIDs that the news content is to be drawn from" required="false" default="" ftType="category">

	<cffunction name="getDefaultProperties" returntype="struct" access="public">
		<cfscript>
			stProps=structNew();
			stProps.objectid = createUUID();
			stProps.label = '';
			stProps.displayMethod = 'displayteaserCalendar';
			stProps.bMatchAllKeywords = 0;
			stProps.metadata = '';
		</cfscript>	
		<cfreturn stProps>
	</cffunction>  

</cfcomponent>