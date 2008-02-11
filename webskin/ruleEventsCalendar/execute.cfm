<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Events calendar rule execute --->

<cfif application.dbtype eq "mysql">
	<!--- create temp table for status --->
	<cfquery datasource="#arguments.dsn#" name="temp">
		DROP TABLE IF EXISTS tblTemp1
	</cfquery>
	<cfquery datasource="#arguments.dsn#" name="temp2">
		create temporary table `tblTemp1`
			(
			`Status`  VARCHAR(50) NOT NULL
			)
	</cfquery>
	<cfloop list="#request.mode.lValidStatus#" index="i">
		<cfquery datasource="#arguments.dsn#" name="temp3">
			INSERT INTO tblTemp1 (Status) 
			VALUES ('#replace(i,"'","","all")#')
		</cfquery>
	</cfloop>
</cfif>

<!--- check if filtering by categories --->
<cfif NOT trim(len(stObj.metadata)) EQ 0>
	<!--- show by categories --->
	<cfswitch expression="#application.dbtype#">
		<cfcase value="mysql">
			<cfif stObj.bMatchAllKeywords>
				<!--- must match all categories --->
				<cfquery datasource="#arguments.dsn#" name="qGetEvents">
					SELECT DISTINCT type.objectID, type.publishDate, type.label, type.title, type.location, type.startDate, type.endDate
					    FROM tblTemp1, dmEvent type, refCategories refCat1
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
						AND type.status = tblTemp1.Status
						AND publishdate <= #now()#
						AND expirydate >= #now()#
					ORDER BY type.startDate ASC, type.label ASC
				</cfquery>
			<cfelse>
				<!--- doesn't need to match all categories --->
				<cfquery datasource="#arguments.dsn#" name="qGetEvents">
					SELECT DISTINCT type.objectID, type.publishDate, type.label, type.title, type.location, type.startDate, type.endDate
					FROM tblTemp1, refCategories refCat, dmEvent type
					WHERE refCat.objectID = type.objectID
						AND refCat.categoryID IN ('#ListChangeDelims(stObj.metadata,"','",",")#')
						AND type.status = tblTemp1.Status
						AND publishdate <= #now()#
						AND expirydate >= #now()#
					ORDER BY type.startDate ASC, type.label ASC
				</cfquery>
			</cfif>
		</cfcase>

		<cfdefaultcase>
			<cfif stObj.bMatchAllKeywords>
				<!--- must match all categories --->
				<cfquery datasource="#arguments.dsn#" name="qGetEvents">
					SELECT DISTINCT type.objectID, type.publishDate, type.label, type.title, type.location, type.startDate, type.endDate
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
				<cfquery datasource="#arguments.dsn#" name="qGetEvents">
					SELECT DISTINCT type.objectID, type.publishDate, type.label, type.title, type.location, type.startDate, type.endDate
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
	<cfswitch expression="#application.dbtype#">
		<cfcase value="mysql">
			<cfquery datasource="#arguments.dsn#" name="qGetEvents">
				SELECT *
				FROM #application.dbowner#dmEvent events, tblTemp1
				WHERE events.status = tblTemp1.Status
					AND publishdate <= #now()#
					AND expirydate >= #now()#
				ORDER BY startDate ASC
			</cfquery>
		</cfcase>

		<cfdefaultcase>
			<cfquery datasource="#arguments.dsn#" name="qGetEvents">
				SELECT *
				FROM #application.dbowner#dmEvent
				WHERE status IN ('#ListChangeDelims(request.mode.lValidStatus,"','",",")#')
					AND publishdate <= #now()#
					AND expirydate >= #now()#
				ORDER BY startDate ASC
			</cfquery>
		</cfdefaultcase>
	</cfswitch>
</cfif>

<cfif len(trim(stObj.intro)) AND qGetEvents.recordCount>
	#stObj.intro#
</cfif>

<cfif qGetEvents.recordcount>
	<cfset stParam = structNew()>
	<cfset stParam.aEvents = arrayNew(1) />
	<cfset stParam.qEvents = qGetEvents />
			
	<skin:view objectid="#stObj.objectid#" webskin="#stObj.displaymethod#" stParam="#stParam#" />
</cfif>

<cfsetting enablecfoutputonly="false" />