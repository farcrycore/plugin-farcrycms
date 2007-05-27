<cfsetting enablecfoutputonly="true" />
<!--------------------------------------------------------------------
dmNews
featured article display method 
--------------------------------------------------------------------->
<!--- @@displayname: news article with thumbnail --->
<cfimport taglib="/farcry/core/packages/fourq/tags/" prefix="q4">
<cfoutput>
		<div class="floatnewsBody">	
		<cfif isDefined("stObj.teaserImage")>
		<cfif stObj.teaserImage NEQ "">
			<q4:contentobjectget objectid="#stObj.teaserImage#" r_stobject="stImage">
			<a href="#Application.URL.conjurer#?objectID=#stObj.objectID#"><img src="/images/#stImage.thumbNail#" alt="#stImage.alt#" border="0" align="left" hspace="5"></a>
		</cfif>
		</cfif>
			<div class="floatnewsTitle"><a href="#Application.URL.conjurer#?objectID=#stObj.objectID#">#stObj.title#</a></div>
		#stObj.teaser#
		</div>
		<div class="floatnewsPubDate">Date published: #dateformat(stObj.PUBLISHDATE,'DD/MM/YY')#</div>
</cfoutput>

<cfsetting enablecfoutputonly="false" />