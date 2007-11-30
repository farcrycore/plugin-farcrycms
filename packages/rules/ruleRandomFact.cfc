<!--- 
|| LEGAL ||
$Copyright: Daemon Pty Limited 1995-2003, http://www.daemon.com.au $
$License: Released Under the "Common Public License 1.0", http://www.opensource.org/licenses/cpl.php$ 

|| VERSION CONTROL ||
$Header: /cvs/farcry/core/packages/rules/ruleRandomFact.cfc,v 1.20.2.2 2006/02/17 05:49:22 daniela Exp $
$Author: daniela $
$Date: 2006/02/17 05:49:22 $
$Name: milestone_3-0-1 $
$Revision: 1.20.2.2 $

|| DESCRIPTION || 
$Description: 
Publishing rule to randomly show a number of fact content items from 
a pool of fact items.  The pool is comprised of those content items 
that match the nominated categories.
$

|| DEVELOPER ||
$Developer: Geoff Bowers (modius@daemon.com.au) $
--->

<cfcomponent displayname="Facts: Random Fact Rule" extends="farcry.core.packages.rules.rules" hint="Publishing rule to randomly show a number of fact content items from a pool of fact items.  The pool is comprised of those content items that match the nominated categories.">
	<cfproperty name="displayMethod" type="string" default="displayTeaser" hint="Display method to render fact content items" ftSeq="1" ftFieldset="" ftLabel="Display method" ftType="webskin" ftTypename="dmFact" ftPrefix="displayTeaser" />
	<cfproperty name="intro" type="string" default="" hint="Intro test for random fact displays. Can be any combination of content and HTML markup." ftSeq="2" ftFieldset="" ftLabel="Intro" ftType="longchar" />
	<cfproperty name="numItems" type="numeric" default="1" hint="The number of fact items to display" ftSeq="3" ftFieldset="" ftLabel="Items per page" ftType="integer" />
	<cfproperty name="bMatchAllKeywords" type="boolean" default="0" hint="Does the content need to match ALL selected categories" ftSeq="4" ftFieldset="" ftLabel="Match all keywords" ftType="boolean" />
	<cfproperty name="metadata" type="longchar" default="" hint="A list of category ObjectIDs that the content is to be drawn from" ftSeq="5" ftFieldset="" ftLabel="Categories" ftType="category" />
	
	<cffunction access="public" name="execute" output="true">
		<cfargument name="objectID" required="Yes" type="uuid" default="">
		<cfargument name="dsn" required="false" type="string" default="#application.dsn#">
		<cfparam name="request.mode.lValidStatus" default="approved">
				
		<cfset stObj = this.getData(arguments.objectid)> 
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
		<cfif len(stObj.intro) AND qGetFacts.recordCount>
			<cfset tmp = arrayAppend(request.aInvocations,stObj.intro)>
		</cfif>
		
		<!--- get random numbers --->
		<cfset lRandom = "">
		<Cfset counter = 0>
		
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
				<cfscript>
				 	stInvoke = structNew();
					stInvoke.objectID = qGetFacts.objectID;
					stInvoke.typename = application.types.dmFacts.typePath;
					stInvoke.method = stObj.displayMethod;
					arrayAppend(request.aInvocations,stInvoke);
				</cfscript>
			</cfif>
		</cfloop>
					
	</cffunction> 
</cfcomponent>