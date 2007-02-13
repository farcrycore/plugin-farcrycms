<cfsetting enablecfoutputonly="yes">
<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2006, http://www.daemon.com.au $

|| VERSION CONTROL ||
$Header: /home/cvsuser/cvs/agora/webskin/dmNews/displayTeaserBullets.cfm,v 1.2 2006/02/15 02:14:50 daniela Exp $
$Date: 2006/02/15 02:14:50 $
$Name: HEAD $
$Revision: 1.2 $

|| DESCRIPTION || 
$Description: News Teaser bullets $

|| DEVELOPER ||
$Developer: Daniela Milton (daniela@daemon.com.au) $

|| ATTRIBUTES ||
--->
<cfoutput>
	<h4><span class="date">#dateformat(stObj.PUBLISHDATE,'DD/MM/YY')#</span> #stObj.title#</h4>
	<p><a href="#Application.URL.conjurer#?objectID=#stObj.objectID#" class="morelink">More</a></p>
</cfoutput>
<cfsetting enablecfoutputonly="no">