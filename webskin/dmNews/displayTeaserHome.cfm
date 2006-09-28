<cfsetting enablecfoutputonly="yes">
<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2006, http://www.daemon.com.au $

|| VERSION CONTROL ||
$Header: /home/cvsuser/cvs/agora/webskin/dmNews/displayTeaserHome.cfm,v 1.1 2006/02/14 05:21:46 daniela Exp $
$Date: 2006/02/14 05:21:46 $
$Name: HEAD $
$Revision: 1.1 $

|| DESCRIPTION || 
$Description: Home page news teasers $

|| DEVELOPER ||
$Developer: Daniela Milton (daniela@daemon.com.au) $

|| ATTRIBUTES ||
--->
<cfoutput>
	<h6 style="color: ##000000; border-bottom: 0"><span class="date"><strong>#dateformat(stObj.PUBLISHDATE,'DD/MM/YY')#</strong></span> #stObj.title#</h6>
	<p>#stObj.teaser# <a href="#Application.URL.conjurer#?objectID=#stObj.objectID#" class="morelink">More</a></p>
</cfoutput>
<cfsetting enablecfoutputonly="no">