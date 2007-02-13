<cfsetting enablecfoutputonly="yes">
<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2006, http://www.daemon.com.au $

|| VERSION CONTROL ||
$Header: /home/cvsuser/cvs/agora/webskin/dmFacts/displayTeaserFact.cfm,v 1.3 2006/02/15 02:10:05 daniela Exp $
$Date: 2006/02/15 02:10:05 $
$Name: HEAD $
$Revision: 1.3 $

|| DESCRIPTION || 
$Description: Random fact display handler $

|| DEVELOPER ||
$Developer: Daniela Milton (daniela@daemon.com.au) $

|| ATTRIBUTES ||
--->
<!--- @@displayname: random fact --->
<cfoutput>
	<div class="featurebox">
		<h3>Famous quotes</h3>
		#stObj.title#
	</div>
</cfoutput>

<cfsetting enablecfoutputonly="no">