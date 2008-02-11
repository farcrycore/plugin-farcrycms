<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2003, http://www.daemon.com.au $
$License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php$

|| VERSION CONTROL ||
$Header: /cvs/farcry/core/packages/rules/ruleXMLFeed.cfc,v 1.13 2005/07/19 03:59:21 pottery Exp $
$Author: pottery $
$Date: 2005/07/19 03:59:21 $
$Name: milestone_3-0-1 $
$Revision: 1.13 $

|| DESCRIPTION || 
$Description: Publishing rule to pull, parse and display external RSS feeds.  Is dependent on the rss.cfc component. $
$TODO: add application scope cacheing to query$

|| DEVELOPER ||
$Developer: Geoff Bowers (modius@daemon.com.au) $
--->
<!--- <cfsetting enablecfoutputonly="Yes"> --->
<cfcomponent displayname="Utility: XML Feed Publishing Rule" extends="farcry.core.packages.rules.rules" hint="Displays an XML feed within a container">

	<!--- rule object properties --->
	<cfproperty ftSeq="1" ftFieldset="" name="feedName" type="string" default="" hint="A useful name for this feed" ftLabel="Feed name" ftType="string" />
	<cfproperty ftSeq="2" ftFieldset="" name="XMLFeedURL" type="string" default="" hint="The location of the feed (URL)" ftLabel="Feed URL" ftType="string" />
	<cfproperty ftSeq="3" ftFieldset="" name="intro" type="string" default="" hint="An introduction to this feed" ftLabel="Introduction" ftType="longchar" />
	<cfproperty ftSeq="4" ftFieldset="" name="maxRecords" type="numeric" default="20" hint="The maximum number of records to return to the user" ftLabel="Max. records" ftType="integer" />
	
</cfcomponent>

