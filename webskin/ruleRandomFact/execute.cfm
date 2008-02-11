<cfsetting enablecfoutputonly="true" />
<!--- @@displayname: Random Fact Rule execute --->

<cfimport taglib="/farcry/core/tags/webskin/" prefix="skin" />

<!--- check if filtering by categories --->
<cfif NOT trim(len(stObj.metadata)) EQ 0>
	<!--- show by categories --->
	<cfswitch expression="#application.dbtype#">
		<cfcase value="mysql">
			<cfif stObj.bMatchAllKeywords>
				<!--- must match all categories --->
				<cfquery datasource="#arguments.dsn#" name="qGetFacts">
					SELECT DISTINCT type.objectID, type.label
					    FROM dmFacts type, refCategories refCat1
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
					ORDER BY type.label ASC
				</cfquery>
			<cfelse>
				<!--- doesn't need to match all categories --->
				<cfquery datasource="#arguments.dsn#" name="qGetFacts">
					SELECT DISTINCT type.objectID, type.label
					FROM tblTemp1, refCategories refCat, dmFacts type
					WHERE refCat.objectID = type.objectID
						AND refCat.categoryID IN ('#ListChangeDelims(stObj.metadata,"','",",")#')
						AND type.status = tblTemp1.Status
					ORDER BY type.label ASC
				</cfquery>
			</cfif>
		</cfcase>

		<cfdefaultcase>
			<cfif stObj.bMatchAllKeywords>
				<!--- must match all categories --->
				<cfquery datasource="#arguments.dsn#" name="qGetFacts">
					SELECT DISTINCT type.objectID, type.label
					FROM refCategories refcat1
					<!--- if more than one category make join for each --->
					<cfif listLen(stObj.metadata) gt 1>
						<cfloop from="2" to="#listlen(stObj.metadata)#" index="i">
							inner join refCategories refcat#i# on refcat#i-1#.objectid = refcat#i#.objectid
						</cfloop>
					</cfif>
					JOIN dmFacts type ON refcat1.objectID = type.objectID
					WHERE 1=1
						<!--- loop over each category and make sure item has all categories --->
						<cfloop from="1" to="#listlen(stObj.metadata)#" index="i">
							AND refCat#i#.categoryID = '#listGetAt(stObj.metadata,i)#'
						</cfloop>
						AND type.status IN ('#ListChangeDelims(request.mode.lValidStatus,"','",",")#')
					ORDER BY type.label ASC
				</cfquery>
			<cfelse>
				<!--- doesn't need to match all categories --->
				<cfquery datasource="#arguments.dsn#" name="qGetFacts">
					SELECT DISTINCT type.objectID, type.label
					FROM refObjects refObj
					JOIN refCategories refCat ON refObj.objectID = refCat.objectID
					JOIN dmFacts type ON refObj.objectID = type.objectID
					WHERE refObj.typename = 'dmFacts'
						AND refCat.categoryID IN ('#ListChangeDelims(stObj.metadata,"','",",")#')
						AND type.status IN ('#ListChangeDelims(request.mode.lValidStatus,"','",",")#')
					ORDER BY type.label ASC
				</cfquery>
			</cfif>
		</cfdefaultcase>
	</cfswitch>
<cfelse>
	<!--- don't filter on categories --->
	<cfquery datasource="#arguments.dsn#" name="qGetFacts">
		SELECT *
		FROM #application.dbowner#dmFacts
		WHERE status IN ('#ListChangeDelims(request.mode.lValidStatus,"','",",")#')
		ORDER BY label
	</cfquery>
</cfif>

<!--- if the intro text exists - append to aInvocations to be output as HTML --->
<cfoutput>
	#stObj.intro#
</cfoutput>

<!--- get random numbers --->
<cfset lRandom = "">
<cfset counter = 0>

<cfloop condition="#counter# lte #stObj.numItems#">
	<cfset random = randrange(1,qGetFacts.recordcount)>
	<!--- check if first number in list --->
	<cfif listlen(lRandom)>
		<!--- check if number not already in list --->
		<cfif not listfind(lRandom, random)>
			<!--- append number to list --->
			<cfset lRandom = lRandom & "," & random>
			<!--- update counter --->
			<cfset counter = counter + 1>
			<!--- check if all recordcords have been accounted for --->
			<cfif counter eq qGetFacts.recordcount or counter eq stObj.numItems>
				<cfbreak>
			</cfif>
		</cfif>
	<cfelse>
		<!--- add number to list --->
		<cfset lRandom = random>
		<cfset counter = 1>
		<!--- check if all recordcords have been accounted for --->
		<cfif counter eq qGetFacts.recordcount or counter eq stObj.numItems>
			<cfbreak>
		</cfif>
	</cfif>
</cfloop>
		
<!--- Loop Through facts and Display --->
<cfloop query="qGetFacts">
	<!--- check if fact is in random selection, if so display it --->
	<cfif listfind(lRandom,currentrow)>
		<skin:view objectid="#qGetFacts.objectid[currentrow]#" webskin="#stObj.displayMethod#" />
	</cfif>
</cfloop>

<cfsetting enablecfoutputonly="false" />