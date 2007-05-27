<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2003, http://www.daemon.com.au $
$License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php$

|| VERSION CONTROL ||
$Header:  $
$Author: $
$Date: $
$Name: $
$Revision: $

|| DESCRIPTION || 
$Description: 
News rule publishes news content items in date order, with 
most recently published first.  News content is only visible 
if it is a) approved content; b) time is past the publish date; 
c) time is before the expriy date, and; d) it matches the nominated 
categories.
$

|| DEVELOPER ||
$Developer: Geoff Bowers (modius@daemon.com.au) $
--->
<cfcomponent displayname="News: Listing Rule" extends="farcry.core.packages.rules.rules" 
	hint="News rule publishes news content items in date order, with 
		most recently published first.  News content is only visible 
		if it is a) approved content; b) time is past the publish date; 
		c) time is before the expriy date, and; d) it matches the nominated 
		categories." bObjectBroker="true">

	<cfproperty ftSeq="1" ftFieldset="General" name="displayMethod" type="string" hint="Display teaser method to render individual content items." required="true" default="displayTeaserBullets" ftType="webskin" fttypename="dmNews" ftprefix="displayTeaser" ftLabel="Display Method" />
	<cfproperty ftSeq="4" ftFieldset="General" name="intro" type="string" hint="Intro text for the news listing.  Can be any combination of content and HTML markup." required="false" default="" ftType="string" ftLabel="Intro Text" />
	<cfproperty ftSeq="5" ftFieldset="General" name="suffix" type="string" hint="Suffix text for the news listing.  Can be any combination of content and HTML markup." required="false" default="" ftType="string" ftLabel="Suffix Text" />
	<cfproperty ftSeq="7" ftFieldset="General" name="numItems" type="numeric" hint="The number of items to display per page." required="true" default="5" ftType="numeric" ftIncludeDecimal="false" ftvalidation="validate-digits" ftLabel="## items per page" />
	<cfproperty ftSeq="10" ftFieldset="General" name="bArchive" type="boolean" hint="Display News as an archive (ie. paginated display)." required="true" default="false" ftType="boolean" ftLabel="Display as an Archive?" />
	<cfproperty ftSeq="12" ftFieldset="General" name="numPages" type="numeric" hint="The number of pages of news articles to display at most (when bArchive is flagged as true)." required="true" default="1" ftType="numeric" ftIncludeDecimal="false" ftvalidation="validate-digits" ftLabel="How many pages would you like in the archive at most?" />
	<cfproperty ftSeq="20" ftFieldset="Categorisation" name="bMatchAllKeywords" type="boolean" hint="Does the content need to match ALL selected keywords?" required="false" default="false" ftType="boolean" ftLabel="Does the content need to match ALL the selected Keywords?" />
  <cfproperty ftseq="25" ftfieldset="Categorisation" name="metadata" type="string" hint="A list of categories that the news content must match in order to be shown." required="false" default="" fttype="category" ftalias="root" ftlabel="Selected Categories" />


	<cffunction access="public" name="execute" output="true">
		<cfargument name="objectID" required="Yes" type="uuid" default="">
		<cfargument name="dsn" required="false" type="string" default="#application.dsn#">
				
		<cfset var i = 1>
		<cfset var stObj = this.getData(arguments.objectid)>
		<cfset var temp = ''>
		<cfset var temp2 = ''>
		<cfset var temp3 = ''>
		<cfset var qGetNewsCount = ''>
		<cfset var maximumRows = 0>
		<cfset var qGetNews = ''>
		<cfset var stInvoke = structNew()>
		<cfset var iNumberOfPages = 1>
		<cfset var startrow = 1>
		<cfset var endrow = 1>
		
		<cfparam name="request.mode.lValidStatus" default="approved">
		
		<!--- If Archive: Get Maximum Rows in New Table --->
		<cfif stObj.bArchive>
			<cfquery datasource="#arguments.dsn#" name="qGetNewsCount">
				SELECT objectID
				FROM #application.dbowner#dmNews
			</cfquery>
			<cfset maximumRows = qGetNewsCount.recordcount>
		<cfelse>
			<cfset maximumRows = stObj.numItems>
		</cfif>
		<!--- check if filtering by categories --->
		<cfif NOT trim(len(stObj.metadata)) EQ 0>
			<!--- show by categories --->
			<cfswitch expression="#application.dbtype#">
				<cfcase value="mysql">
					<cfif stObj.bMatchAllKeywords>
						<!--- must match all categories --->
						<cfquery datasource="#arguments.dsn#" name="qGetNews" maxrows="#maximumRows#">
							SELECT DISTINCT type.objectID, type.publishDate, type.label
							    FROM dmNews type, refCategories refCat1
							<!--- if more than one category make join for each --->
							<cfif listLen(stObj.metadata) gt 1>
								<cfloop from="2" to="#listlen(stObj.metadata)#" index="i">
								    , refCategories refCat#i#
								</cfloop>
							</cfif>
							WHERE 1=1
								<!--- loop over each category and make sure item has all categories --->
								<cfloop from="1" to="#listlen(stObj.metadata)#" index="i">
									AND refCat#i#.categoryID = '#listGetAt(stObj.metadata,i)#'
									AND refCat#i#.objectId = type.objectId
								</cfloop>
								AND type.status IN ('#ListChangeDelims(request.mode.lValidStatus,"','",",")#')
								AND publishdate <= #now()#
								AND expirydate >= #now()#
							ORDER BY type.publishDate DESC, type.label ASC
						</cfquery>
					<cfelse>
						<!--- doesn't need to match all categories --->
						<cfquery datasource="#arguments.dsn#" name="qGetNews" maxrows="#maximumRows#">
							SELECT DISTINCT type.objectID, type.publishDate, type.label
							FROM refCategories refCat, dmNews type
							WHERE refCat.objectID = type.objectID
								AND refCat.categoryID IN ('#ListChangeDelims(stObj.metadata,"','",",")#')
								AND type.status IN ('#ListChangeDelims(request.mode.lValidStatus,"','",",")#')
								AND publishdate <= #now()#
								AND expirydate >= #now()#
							ORDER BY type.publishDate DESC, type.label ASC
						</cfquery>
					</cfif>
				</cfcase>

				<cfdefaultcase>
					<cfif stObj.bMatchAllKeywords>
						<!--- must match all categories --->
						<cfquery datasource="#arguments.dsn#" name="qGetNews" maxrows="#maximumRows#">
							SELECT DISTINCT type.objectID, type.publishDate, type.label
							FROM refCategories refcat1
							<!--- if more than one category make join for each --->
							<cfif listLen(stObj.metadata) gt 1>
								<cfloop from="2" to="#listlen(stObj.metadata)#" index="i">
									inner join refCategories refcat#i# on refcat#i-1#.objectid = refcat#i#.objectid
								</cfloop>
							</cfif>
							JOIN dmNews type ON refcat1.objectID = type.objectID
							WHERE 1=1
								<!--- loop over each category and make sure item has all categories --->
								<cfloop from="1" to="#listlen(stObj.metadata)#" index="i">
									AND refCat#i#.categoryID = '#listGetAt(stObj.metadata,i)#'
								</cfloop>
								AND type.status IN ('#ListChangeDelims(request.mode.lValidStatus,"','",",")#')
								AND publishdate <= #now()#
								AND expirydate >= #now()#
							ORDER BY type.publishDate DESC, type.label ASC
						</cfquery>
					<cfelse>
						<!--- doesn't need to match all categories --->
						<cfquery datasource="#arguments.dsn#" name="qGetNews" maxrows="#maximumRows#">
							SELECT DISTINCT type.objectID, type.publishDate, type.label
							FROM refObjects refObj
							JOIN refCategories refCat ON refObj.objectID = refCat.objectID
							JOIN dmNews type ON refObj.objectID = type.objectID
							WHERE refObj.typename = 'dmNews'
								AND refCat.categoryID IN ('#ListChangeDelims(stObj.metadata,"','",",")#')
								AND type.status IN ('#ListChangeDelims(request.mode.lValidStatus,"','",",")#')
								AND publishdate <= #now()#
								AND expirydate >= #now()#
							ORDER BY type.publishDate DESC, type.label ASC
						</cfquery>
					</cfif>
				</cfdefaultcase>
			</cfswitch>
		<cfelse>
			<!--- don't filter on categories --->
			<cfquery datasource="#arguments.dsn#" name="qGetNews" maxrows="#maximumRows#">
				SELECT *
				FROM #application.dbowner#dmNews
				WHERE status IN ('#ListChangeDelims(request.mode.lValidStatus,"','",",")#')
					AND publishdate <= #now()#
					AND expirydate >= #now()#
				ORDER BY publishDate DESC
			</cfquery>
		</cfif>
		<cfif len(trim(stObj.intro)) AND qGetNews.recordCount>
			<cfset tmp = arrayAppend(request.aInvocations,stObj.intro)>
		</cfif>
		<cfif NOT stObj.bArchive>
			<cfloop query="qGetNews">
				<cfscript>
				 	stInvoke = structNew();
					stInvoke.objectID = qGetNews.objectID;
					stInvoke.typename = application.types.dmNews.typePath;
					stInvoke.method = stObj.displayMethod;
					arrayAppend(request.aInvocations,stInvoke);
				</cfscript>
			</cfloop>
		<cfelse>
			<cfparam name="url.pgno" default="1">
			<!--- Get Number of Pages --->
			<cfset iNumberOfPages = Ceiling(qGetNews.recordcount / stobj.numitems)>
			<!--- Check URL.pageno --->
			<cfif url.pgno GT iNumberOfPages OR url.pgno GT stobj.numpages>
				<cfset url.pgno = 1>
			</cfif>

			<!--- Check Number of Pages --->
			<cfif iNumberOfPages GT stobj.numpages>
				<cfset iNumberOfPages = stobj.numpages>
			</cfif>
			<!--- Get Query Start and End Numbers --->
			<cfset startrow = (url.pgno - 1) * stobj.numitems + 1>
			<cfset endrow = min(startrow + stobj.numitems - 1, qGetNews.recordcount)>

			<!--- Output Page Numbers --->
			<cfif iNumberOfPages GT 1>
				<!--- save pagination output to variable --->
				<cfsavecontent variable="pageNums">
					<cfoutput>
					<div class="pagination">
					<p>
						<cfif url.pgno EQ 1>
							<span><strong>Previous</strong></span> 
						<cfelse>
							<a href="#Application.URL.conjurer#?objectID=#url.objectID#&pgno=#(url.pgno-1)#"><strong>Previous</strong></a>
						</cfif>
						<cfloop index="i" from="1" to="#iNumberOfPages#">
							<cfif i NEQ url.pgno>
								<a href="#Application.URL.conjurer#?objectID=#url.objectID#&pgno=#i#">#i#</a> 
							<cfelse>
								<span>#i#</span>
							</cfif>
						</cfloop>
						<cfif url.pgno EQ iNumberOfPages>
							<span><strong>Next</strong></span>
						<cfelse>
							<a href="#Application.URL.conjurer#?objectID=#url.objectID#&pgno=#(url.pgno+1)#"><strong>Next</strong></a>
						</cfif>
					</p>
					<h4>Page #url.pgno# of #iNumberOfPages#</h4>
					</div>
					<br>
					</cfoutput>
				</cfsavecontent>
				<!--- append pagination output to Invocations array --->
				<cfset arrayAppend(request.aInvocations,pageNums)>
			</cfif>

			<!--- Loop Through News and Display --->
			<cfloop query="qGetNews" startrow="#startrow#" endrow="#endrow#">
				<cfscript>
				 	stInvoke = structNew();
					stInvoke.objectID = qGetNews.objectID;
					stInvoke.typename = application.types.dmNews.typePath;
					stInvoke.method = stObj.displayMethod;
					arrayAppend(request.aInvocations,stInvoke);
				</cfscript>
			</cfloop>

			<!--- Output Page Numbers --->
			<cfif iNumberOfPages GT 1>
				<!--- save pagination output to variable --->
				<cfsavecontent variable="pageNums2">
					<cfoutput>
					<br>
					<div class="pagination">
					<p>
						<cfif url.pgno EQ 1>
							<span><strong>Previous</strong></span> 
						<cfelse>
							<a href="#Application.URL.conjurer#?objectID=#url.objectID#&pgno=#(url.pgno-1)#"><strong>Previous</strong></a>
						</cfif>
						<cfloop index="i" from="1" to="#iNumberOfPages#">
							<cfif i NEQ url.pgno>
								<a href="#Application.URL.conjurer#?objectID=#url.objectID#&pgno=#i#">#i#</a> 
							<cfelse>
								<span>#i#</span>
							</cfif>
						</cfloop>
						<cfif url.pgno EQ iNumberOfPages>
							<span><strong>Next</strong></span>
						<cfelse>
							<a href="#Application.URL.conjurer#?objectID=#url.objectID#&pgno=#(url.pgno+1)#"><strong>Next</strong></a>
						</cfif>
					</p>
					<h4>Page #url.pgno# of #iNumberOfPages#</h4>
					</div>
					</cfoutput>
				</cfsavecontent>
				<!--- append pagination output to Invocations array --->
				<cfset arrayAppend(request.aInvocations,pageNums2)>
			</cfif>

		</cfif>
		<cfif len(trim(stObj.suffix)) AND qGetNews.recordCount>
			<cfset tmp = arrayAppend(request.aInvocations,stObj.suffix)>
		</cfif>

	</cffunction>

</cfcomponent>