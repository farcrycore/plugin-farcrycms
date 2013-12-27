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
	displayname="Event Calendar"
	hint="Small and large calendar month views for events."
	icon="fa-calendar">

	<cfproperty name="intro" type="string" required="no" default="" 
		ftSeq="10" ftFieldset="Calendar View" ftlabel="Introduction"
		ftType="longchar" ftLimit="500"
		fthint="Optional. Intro text for the event calendar.">

	<cfproperty name="displayMethod" type="string" required="yes" default="displayTeaserCalendar" 
		ftSeq="20" ftFieldset="Calendar View" ftLabel="Display Template" 
		ftType="webskin" 
		ftPrefix="displayTeaserCalendar"
		fthint="Choice of multiple small months or a single large month calendar view.">

	<cfproperty name="months" type="numeric" required="yes" default="3" 
		ftSeq="30" ftFieldset="Calendar View" ftlabel="Months"
		fttype="integer" 
		fthint="Number of months to show on small calendar.">

	<cfproperty name="metadata" type="longchar" required="false" default="" 
		ftSeq="40" ftFieldset="Calendar View" ftlabel="Filter Categories"
		ftType="category"
		fthint="Optional. Filter events to specific categories.">

	<cfproperty name="bMatchAllKeywords" type="boolean" required="false" default="0" 
		ftSeq="50" ftFieldset="Calendar View" ftlabel="All Keywords?"
		fthint="Check if events must match ALL selected keywords.">

</cfcomponent>