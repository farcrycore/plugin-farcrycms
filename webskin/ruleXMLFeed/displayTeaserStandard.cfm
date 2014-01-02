<cfsetting enablecfoutputonly="true">
<!--- @@displayname: RSS Item Teaser --->

<cfparam name="stparam.item" type="struct">

<!--- apply ESAPI functions as we can't trust source content --->
<cfoutput>
<div class="feed-item">
	<h4><a href="#application.fc.lib.esapi.encodeForHTMLAttribute(stparam.item.link)#" target="feed-item">#application.fc.lib.esapi.EncodeForHTML(stparam.item.title)#</a> <small>#application.fapi.prettydate(stparam.item.pubDate)#</small></h4>
	<cfif structKeyExists(stparam.item.description, "value")><p>#application.fc.lib.esapi.EncodeForHTML(stparam.item.description.value)#</p></cfif>
</div>
</cfoutput>

<cfsetting enablecfoutputonly="false">