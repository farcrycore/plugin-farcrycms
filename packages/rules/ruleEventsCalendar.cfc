<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2006, http://www.daemon.com.au $
$Community: FarCry CMS http://www.farcrycms.org $
$License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php$

|| VERSION CONTROL ||
$Header: $
$Author: $
$Date: $
$Name:  $
$Revision: $

|| DESCRIPTION || 
$Description: 
ruleEventsCalendar (FarCry Core)
Publishing rule for showing Event content items in a month calendar view format.
$

|| DEVELOPER ||
$Developer: Geoff Bowers (modius@daemon.com.au)$

--->
<cfcomponent displayname="Events: Calendar Rule" extends="farcry.core.packages.rules.rules" 
	hint="Publishing rule for showing Event content items in a month calendar view format.">

<cfproperty ftSeq="1" ftFieldSet="Introduction" name="intro" type="string" hint="Intro text for the event listing" required="no" default="" ftType="longchar" ftLimit="255">
<cfproperty ftSeq="2" ftFieldSet="Introduction" name="months" type="numeric" hint="Number of months to show" required="yes" default="1">
<cfproperty ftSeq="3" ftFieldSet="Introduction" name="displayMethod" type="string" hint="Display method to render this event rule with." required="yes" default="displayteaserCalendar" ftType="webskin" ftTypename="ruleEventsCalendar">
<cfproperty ftSeq="11" ftFieldSet="Categories" name="bMatchAllKeywords" hint="Doest the content need to match ALL selected keywords" type="boolean" required="false" default="0">
<cfproperty ftSeq="12" ftFieldSet="Categories" name="metadata" type="string" hint="A list of category ObjectIDs that the news content is to be drawn from" required="false" default="" ftType="category">

	
	<cffunction name="getDefaultProperties" returntype="struct" access="public">
		<cfscript>
			stProps=structNew();
			stProps.objectid = createUUID();
			stProps.label = '';
			stProps.displayMethod = 'displayteaserCalendar';
			stProps.bMatchAllKeywords = 0;
			stProps.metadata = '';
		</cfscript>	
		<cfreturn stProps>
	</cffunction>  

	<cffunction access="public" name="execute" output="true">
		<cfargument name="objectID" required="Yes" type="uuid" default="">
		<cfargument name="dsn" required="false" type="string" default="#application.dsn#">
		<cfparam name="request.mode.lValidStatus" default="approved">
		<cfset stObj = this.getData(arguments.objectid)> 
		
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
			<cfset tmp = arrayAppend(request.aInvocations,stObj.intro)>
		</cfif>
		<cfif qGetEvents.recordcount>
		<cfset stParam = structNew()>
		<cfset stParam.aEvents = arrayNew(1) />
		<cfset stParam.qEvents = qGetEvents />
				
		<!--- <cfloop query="qGetEvents">
			<cfset tmpObjectId = qGetEvents.objectId>
			<cfset tmpTitle = qGetEvents.title>
			<cfset tmpLocation = qGetEvents.location>
			<cfset tmpStartDate = qGetEvents.startDate>
			<cfset tmpEndDate = qGetEvents.endDate>
			
			<!--- if expiry date loop through each day of event --->
			<cfif year(qGetEvents.endDate) neq 2050>
				<cfloop from="0" to="#dateDiff('d',qGetEvents.startDate,qGetEvents.endDate)#" index="day">
					<cfset stEvent = structNew() />
					<cfset stEvent.eventDate =  dateadd("d",day,tmpStartDate)>
					<cfset stEvent.objectid = tmpObjectId>
					<cfset stEvent.title = tmpTitle>
					<cfset stEvent.location = tmpLocation>
					<cfset stEvent.startDate = tmpStartDate>
					<cfset stEvent.endDate = tmpEndDate>
					<cfset arrayAppend(stParam.aEvents, stEvent) />
				</cfloop>
			<cfelse>
				<!--- no expiry so just use start date --->
				<cfset stEvent = structNew() />
				<cfset stEvent.eventDate =  tmpStartDate>
				<cfset stEvent.objectid = tmpObjectId>
				<cfset stEvent.title = tmpTitle>
				<cfset stEvent.location = tmpLocation>
				<cfset stEvent.startDate = tmpStartDate>
				<cfset stEvent.endDate = tmpEndDate>
				<cfset arrayAppend(stParam.aEvents, stEvent) />
			</cfif>
		</cfloop>
		 --->
		<cfset html = getView(objectid=stobj.objectid, template="#stObj.displayMethod#", stparam="#stParam#") />
		<cfset arrayAppend(request.aInvocations,html) />
		
		<!--- <cfscript>
			stInvoke.objectID = qGetEvents.objectID;
			stInvoke.typename = application.stcoapi.ruleEventsCalendar.packagepath;
			stInvoke.method = stObj.displayMethod;
			stInvoke.months = stObj.months;
			arrayAppend(request.aInvocations,stInvoke);
		</cfscript> --->
		</cfif>					
	</cffunction> 

</cfcomponent>