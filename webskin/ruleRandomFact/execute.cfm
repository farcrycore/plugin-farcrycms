<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: Daemon Pty Limited 2002-2008, http://www.daemon.com.au --->
<!--- @@License:
    This file is part of FarCry CMS Plugin.

    FarCry CMS Plugin is free software: you can redistribute it and/or modify
    it under the terms of the GNU Lesser General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    FarCry CMS Plugin is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public License
    along with FarCry CMS Plugin.  If not, see <http://www.gnu.org/licenses/>.
--->
<!--- @@displayname: Random Fact Rule execute --->

<cfimport taglib="/farcry/core/tags/webskin/" prefix="skin" />
<!--- check if filtering by categories --->
<cfif len(trim(stobj.metadata))>

	<cfset oCat = createObject("component", "farcry.core.packages.types.category") />
	<cfset qGetFacts = oCat.getDataQuery(lCategoryIDs="#stObj.metadata#"
		,typename="dmFacts"
		,bMatchAll="#stobj.bMatchAllKeywords#"
		,sqlOrderBy="label ASC"
		) />

<cfelse>
	<!--- don't filter on categories --->
	<cfquery datasource="#arguments.dsn#" name="qGetFacts">
		SELECT objectid
		FROM #application.dbowner#dmFacts
		WHERE status IN ('#ListChangeDelims(request.mode.lValidStatus,"','",",")#')
		ORDER BY label ASC
	</cfquery>
</cfif>


<!--- if the intro text exists - append to aInvocations to be output as HTML --->
<cfoutput>
	#stObj.intro#
</cfoutput>

<!--- get random numbers --->
<cfset lRandom = "">
<cfset counter = 0>

<cfloop condition="#qGetFacts.recordcount# and #counter# lte #stObj.numItems#">
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
		<skin:view objectid="#qGetFacts.objectid[currentrow]#" webskin="#stObj.displayMethod#" alternateHTML="" />
	</cfif>
</cfloop>

<cfsetting enablecfoutputonly="false" />