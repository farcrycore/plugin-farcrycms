<cfsetting enablecfoutputonly="true" />
<!--------------------------------------------------------------------
dmNews
featured article display method 
--------------------------------------------------------------------->
<!--- @@displayname: Main featured news article --->

<cfoutput>
<div class="featureBox">
	<h4><span class="date">#dateformat(stObj.PUBLISHDATE,'DD/MM/YY')#</span> #stObj.title#</h4>
	<p>#stObj.teaser# <a href="#Application.URL.conjurer#?objectID=#stObj.objectID#" class="morelink">More</a></p>
</div>
</cfoutput>

<cfsetting enablecfoutputonly="false" />