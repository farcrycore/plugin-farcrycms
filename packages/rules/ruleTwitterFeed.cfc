<!--- @@Copyright: Daemon Pty Limited 1995-2009, http://www.daemon.com.au --->
<!--- @@displayname: AOC: Twitter Feed --->
<!--- @@description: outputs n tweets for defined screen name --->
<!--- @@author: modius@daemon.com.au --->

<cfcomponent displayname="Utility: Twitter Feed" extends="farcry.core.packages.rules.rules" output="false" hint="Adds a twitter feed to the page" bObjectBroker="true">
	
	<cfproperty ftSeq="1" ftFieldset="Twitter Feed" name="title" type="string" ftType="string" default="" ftLabel="Title"  />
	<cfproperty ftSeq="2" ftFieldset="Twitter Feed" name="screenname" type="string" ftType="string" default="" fthint="The twitter user to follow." ftLabel="Screen name"  />
	<cfproperty ftSeq="3" ftFieldset="Twitter Feed" name="pagesize" type="numeric" ftType="integer" default="5" fthint="The number of status messages to include." ftLabel="Twits" />

</cfcomponent>