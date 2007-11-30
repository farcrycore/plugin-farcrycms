<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Execute --->

<cfimport taglib="/farcry/core/tags/webskin/" prefix="skin" />

<!--- If Archive: Get Maximum Rows in New Table --->
<cfif stObj.bArchive>	
	<cfquery datasource="#arguments.dsn#" name="qGetCount">
		SELECT		objectID
		FROM		#application.dbowner#dmEvent
		ORDER by	startDate ASC
	</cfquery>
	<cfset maximumRows = qGetCount.recordcount>
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
				<cfquery datasource="#arguments.dsn#" name="qGetEvents" maxrows="#maximumRows#">
					SELECT DISTINCT type.objectID, type.publishDate,type.startDate, type.label
					    FROM dmEvent type, refCategories refCat1
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
					ORDER BY type.startDate ASC, type.label ASC
				</cfquery>
			<cfelse>
				<!--- doesn't need to match all categories --->
				<cfquery datasource="#arguments.dsn#" name="qGetEvents" maxrows="#maximumRows#">
					SELECT DISTINCT type.objectID, type.publishDate,type.startDate, type.label
					FROM refCategories refCat, dmEvent type
					WHERE refCat.objectID = type.objectID
						AND refCat.categoryID IN ('#ListChangeDelims(stObj.metadata,"','",",")#')
						AND type.status IN ('#ListChangeDelims(request.mode.lValidStatus,"','",",")#')
						AND publishdate <= #now()#
						AND expirydate >= #now()#
					ORDER BY type.startDate ASC, type.label ASC
				</cfquery>
			</cfif>
		</cfcase>

		<cfdefaultcase>
			<cfif stObj.bMatchAllKeywords>
				<!--- must match all categories --->
				<cfquery datasource="#arguments.dsn#" name="qGetEvents" maxrows="#maximumRows#">
					SELECT DISTINCT type.objectID, type.publishDate,type.startDate, type.label
					FROM refCategories refcat1
					<!--- if more than one category make join for each --->
					<cfif listLen(stObj.metadata) gt 1>
						<cfloop from="2" to="#listlen(stObj.metadata)#" index="i">
							inner join refCategories refcat#i# on refcat#i-1#.objectid = refcat#i#.objectid
						</cfloop>
					</cfif>
					JOIN dmEvent type ON refcat1.objectID = type.objectID
					WHERE 1=1
						<!--- loop over each category and make sure item has all categories --->
						<cfloop from="1" to="#listlen(stObj.metadata)#" index="i">
							AND refCat#i#.categoryID = '#listGetAt(stObj.metadata,i)#'
						</cfloop>
						AND type.status IN ('#ListChangeDelims(request.mode.lValidStatus,"','",",")#')
						AND publishdate <= #now()#
						AND expirydate >= #now()#
					ORDER BY type.startDate ASC, type.label ASC
				</cfquery>
			<cfelse>
				<!--- doesn't need to match all categories --->
				<cfquery datasource="#arguments.dsn#" name="qGetEvents" maxrows="#maximumRows#">
					SELECT DISTINCT type.objectID, type.publishDate,type.startDate, type.label
					FROM refObjects refObj
					JOIN refCategories refCat ON refObj.objectID = refCat.objectID
					JOIN dmEvent type ON refObj.objectID = type.objectID
					WHERE refObj.typename = 'dmEvent'
						AND refCat.categoryID IN ('#ListChangeDelims(stObj.metadata,"','",",")#')
						AND type.status IN ('#ListChangeDelims(request.mode.lValidStatus,"','",",")#')
						AND publishdate <= #now()#
						AND expirydate >= #now()#
					ORDER BY type.startDate ASC, type.label ASC
				</cfquery>
			</cfif>
		</cfdefaultcase>
	</cfswitch>
<cfelse>
	<!--- don't filter on categories --->
	<cfquery datasource="#arguments.dsn#" name="qGetEvents" maxrows="#maximumRows#">
		SELECT *
		FROM #application.dbowner#dmEvent events
		WHERE status IN ('#ListChangeDelims(request.mode.lValidStatus,"','",",")#')		
			AND publishdate <= #now()#
			AND expirydate >= #now()#
		ORDER BY startDate ASC
	</cfquery>
</cfif>

<cfoutput>
	#stObj.intro#
</cfoutput>

<cfif NOT stObj.bArchive>

	<!--- loop over display methods --->
	<cfloop query="qGetEvents">
		<skin:view objectid="#qGetEvents.objectid[currentrow]#" webskin="#stObj.displayMethod#" />
	</cfloop>
	
<cfelse>

	<cfparam name="url.pgno" default="1">

	<!--- Get Number of Pages --->
	<cfset iNumberOfPages = Ceiling(qGetEvents.recordcount / stobj.numitems)>
	
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
	<cfset endrow = min(startrow + stobj.numitems - 1, qGetEvents.recordcount)>

	<!--- Output Page Numbers --->
	<cfif iNumberOfPages GT 1>
		<cfoutput>
			<div class="pagination">
			<p>
		</cfoutput>
		
		<cfif url.pgno EQ 1>
			<cfoutput>
				<span><strong>Previous</strong></span> 
			</cfoutput>
		<cfelse>
			<cfoutput>
				<a href="#Application.URL.conjurer#?objectID=#url.objectID#&pgno=#(url.pgno-1)#"><strong>Previous</strong></a> 
			</cfoutput>
		</cfif>
		
		<cfloop index="i" from="1" to="#iNumberOfPages#">
			<cfif i NEQ url.pgno>
				<cfoutput>
					<a href="#Application.URL.conjurer#?objectID=#url.objectID#&pgno=#i#">#i#</a> 
				</cfoutput>
			<cfelse>
				<cfoutput>
					<span>#i#</span>
				</cfoutput>
			</cfif>
		</cfloop>
		
		<cfif url.pgno EQ iNumberOfPages>
			<cfoutput>
				<span><strong>Next</strong></span>
			</cfoutput>
		<cfelse>
			<cfoutput>
				<a href="#Application.URL.conjurer#?objectID=#url.objectID#&pgno=#(url.pgno+1)#"><strong>Next</strong></a>
			</cfoutput>
		</cfif>
		
		<cfoutput>
			</p>
			<h4>Page #url.pgno# of #iNumberOfPages#</h4>
			</div>
			<br>
		</cfoutput>
	</cfif>
	
	<!--- Loop Through News and Display --->
	<cfloop query="qGetEvents" startrow="#startrow#" endrow="#endrow#">
		<skin:view objectid="#qGetEvents.objectid[currentrow]#" webskin="#stObj.displayMethod#" />
	</cfloop>
	
	<!--- Output Page Numbers --->
	<cfif iNumberOfPages GT 1>
		<cfoutput>
			<br>
			<div class="pagination">
			<p>
		</cfoutput>
		
		<cfif url.pgno EQ 1>
			<cfoutput>
				<span><strong>Previous</strong></span> 
			</cfoutput>
		<cfelse>
			<cfoutput>
				<a href="#Application.URL.conjurer#?objectID=#url.objectID#&pgno=#(url.pgno-1)#"><strong>Previous</strong></a>
			</cfoutput>
		</cfif>
			
		<cfloop index="i" from="1" to="#iNumberOfPages#">
			<cfif i NEQ url.pgno>
				<cfoutput>
					<a href="#Application.URL.conjurer#?objectID=#url.objectID#&pgno=#i#">#i#</a> 
				</cfoutput>
			<cfelse>
				<cfoutput>
					<span>#i#</span>
				</cfoutput>
			</cfif>
		</cfloop>
		<cfif url.pgno EQ iNumberOfPages>
			<cfoutput>
				<span><strong>Next</strong></span>
			</cfoutput>
		<cfelse>
			<cfoutput>
				<a href="#Application.URL.conjurer#?objectID=#url.objectID#&pgno=#(url.pgno+1)#"><strong>Next</strong></a>
			</cfoutput>
		</cfif>
		
		<cfoutput>
			</p>
			<h4>Page #url.pgno# of #iNumberOfPages#</h4>
			</div>		
		</cfoutput>

	</cfif>
	
</cfif>

<cfoutput>
	#stObj.suffix#
</cfoutput>

<cfsetting enablecfoutputonly="false" />