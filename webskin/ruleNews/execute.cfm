<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: News rule execute --->

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />

<cfset var i = 1>
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
	<cfoutput>#stObj.intro#</cfoutput>
</cfif>

<cfif NOT stObj.bArchive>
	
	<cfloop query="qGetNews">
		<skin:view objectid="#qGetNews.objectid#" typename="dmNews" webskin="#stObj.displaymethod#" />
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

	</cfif>

	<!--- Loop Through News and Display --->
	<cfloop query="qGetNews" startrow="#startrow#" endrow="#endrow#">
		<skin:view objectid="#qGetNews.objectid#" typename="dmNews" webskin="#stObj.displaymethod#" />
	</cfloop>

	<!--- Output Page Numbers --->
	<cfif iNumberOfPages GT 1>
	
		<!--- save pagination output to variable --->
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

	</cfif>

</cfif>

<cfif len(trim(stObj.suffix)) AND qGetNews.recordCount>
	<cfoutput>#stObj.suffix#</cfoutput>
</cfif>

<cfsetting enablecfoutputonly="false" />