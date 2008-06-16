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
<cfcomponent displayname="Feedback: Feedback Form" hint="Allows website users to send feedback" extends="farcry.core.packages.rules.rules" output="false">
	<cfproperty ftSeq="1" ftFieldset="" name="title" type="string" default="" hint="Title of form" ftLabel="Title" ftType="string" ftValidation="required" />
	<cfproperty ftSeq="2" ftFieldset="" name="emailto" type="longchar" default="" hint="List of email addresses that feedback should be sent to" ftLabel="Send feedback to" ftType="string" ftValidation="required" />
	<cfproperty ftSeq="3" ftFieldset="" name="success" type="longchar" default="Thank you for your feedback." hint="Response message when feedback has been sent" ftLabel="Success message" ftValidation="required" />
	
</cfcomponent>