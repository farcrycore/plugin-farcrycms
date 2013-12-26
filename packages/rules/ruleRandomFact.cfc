<!--- @@Copyright: Daemon Pty Limited 2002-2013, http://www.daemon.com.au --->
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
<cfcomponent 
    extends="farcry.core.packages.rules.rules" 
    displayname="Random Fact Rule" 
    hint="Randomly show fun facts">

    <cfproperty name="displayMethod" type="string" default="displayTeaserStandard" 
        ftSeq="10" ftFieldset="" ftLabel="Display method" 
        ftType="webskin" 
        ftTypename="dmFacts" ftPrefix="displayTeaser"
        fthint="Teaser display to show fact.">

    <cfproperty name="intro" type="string" default="" 
        ftSeq="20" ftFieldset="" ftLabel="Intro" 
        ftType="longchar" ftlimit="256"
        fthint="Optional. Intro text for random fact displays.">

    <cfproperty name="numItems" type="numeric" default="1" 
        ftSeq="30" ftFieldset="" ftLabel="Items per page" 
        ftType="integer"
        hint="The number of fact items to display">

    <cfproperty name="metadata" type="longchar" default="" 
        ftSeq="40" ftFieldset="" ftLabel="Categories" 
        ftType="category" ftalias="dmFacts"
        hint="A list of category ObjectIDs that the content is to be drawn from">

    <cfproperty name="bMatchAllKeywords" type="boolean" default="0" 
        ftSeq="50" ftFieldset="" ftLabel="Match all keywords" 
        ftType="boolean"
        hint="Does the content need to match ALL selected categories?">

<!--- 
 // type methods 
--------------------------------------------------------------------------------->
    <cffunction name="getFacts" returntype="query" output="false" access="public" hint="Returns Facts based on category">
        <cfargument name="metadata" type="string" required="false" default="" />
        <cfargument name="bMatchAllKeywords" type="boolean" required="false" default="false" />
        <cfargument name="numItems" type="numeric" required="false" default="1" />

        <cfset var q = "">

        <cfif NOT len(trim(arguments.metadata))>
            <cfset q = application.fapi.getContentObjects(typename="dmFacts", status="approved") />
        <cfelseif arguments.bMatchAllKeywords>
            <cfset q = application.fapi.getContentObjects(typename="dmFacts", catFacts_eq=arguments.metadata, status="approved") />
        <cfelse>
            <cfset q = application.fapi.getContentObjects(typename="dmFacts", catFacts_in=arguments.metadata, status="approved") />
        </cfif>

        <cfset q = QueryRandomRows(q, arguments.numItems)>

        <cfreturn q />
    </cffunction>

    <cfscript>
    /**
     * Returns specified number of random records.
     * 
     * @param theQuery      The query to return random records from. (Required)
     * @param NumberOfRows      The number of random records to return. (Required)
     * @return Returns a query. 
     * @author Shawn Seley and John King (shawnse@aol.com) 
     * @version 1, July 10, 2002 
     */
    function QueryRandomRows(theQuery, NumberOfRows) {
        var FinalQuery      = QueryNew(theQuery.ColumnList);
        var x                = 0;
        var y               = 0;
        var i               = 0;
        var random_element  = 0;
        var random_row      = 0;
        var row_list        = "";

        if(NumberOfRows GT theQuery.recordcount) NumberOfRows = theQuery.recordcount;

        QueryAddRow(FinalQuery, NumberOfRows);

        // build a list of rows from which we will "scratch off" the randomly selected values in order to avoid repeats
        for (i=1; i LTE theQuery.RecordCount; i=i+1) row_list = row_list & i & ",";

        // Build the new query
        for(x=1; x LTE NumberOfRows; x=x+1){
            // pick a random_row from row_list and delete that element from row_list (to prevent duplicates)
            random_element  = RandRange(1, ListLen(row_list));          // pick a random list element
            random_row      = ListGetAt(row_list, random_element);      // get the corresponding query row number
            row_list        = ListDeleteAt(row_list, random_element);   // delete the used element from the list
            for(y=1; y LTE ListLen(theQuery.ColumnList); y=y+1) {
                QuerySetCell(FinalQuery, ListGetAt(theQuery.ColumnList, y), theQuery[ListGetAt(theQuery.ColumnList, y)][random_row],x);
            }
        }

        return FinalQuery;
    }
    </cfscript>
</cfcomponent>