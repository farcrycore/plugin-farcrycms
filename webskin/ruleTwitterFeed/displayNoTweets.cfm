<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: Daemon Pty Limited 1995-2009, http://www.daemon.com.au --->
<!--- @@displayname: Utility: No Twitter Feed Available--->
<!--- @@description: outputs n tweets for defined screen name --->	

<cfoutput>
<div class="pod-bottom greybutton">
	
	<div class="pod-top">
		<h3>#stObj.title#</h3>
	</div>
	
	<div class="pod twitter pod-body">
		No tweets available
	</div>
		
	<div class="pod-morelink">
		<a href="http://www.twitter.com/#stObj.screenname#">
			Follow #stObj.screenname# on Twitter
		</a>
	</div>
</div>
</cfoutput>
<cfsetting enablecfoutputonly="false" />