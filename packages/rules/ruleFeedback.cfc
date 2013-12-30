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
    displayname="Feedback Form" 
    hint="Allows website users to send feedback" output="false"
    icon="fa-envelope-o">

    <cfproperty name="title" type="string" default="" required="true"
        ftSeq="1" ftFieldset="General Details" ftLabel="Form Title" 
        ftType="string" 
        ftValidation="required"
        fthint="Title of the form. Appears above the form as a heading.">

    <cfproperty name="emailto" type="longchar" default="" required="true"
        ftSeq="2" ftFieldset="General Details" ftLabel="Feedback Address" 
        ftType="string" 
        ftValidation="required"
        fthint="List of email addresses that feedback should be sent to.">

    <cfproperty name="successTitle" type="string" default="Thank you for your feedback." 
        ftSeq="3" ftFieldset="Response" ftLabel="Response Title"
        fttype="string" 
        ftValidation="required"
        fthint="Response message when feedback has been sent.">

    <cfproperty name="successResponse" type="longchar" default="We have sent you a confirmation of your feedback via email. We will respond to your feedback shortly. Enjoy the site!" 
        ftSeq="3" ftFieldset="Response" ftLabel="Response Message"
        fttype="richtext" 
        ftValidation="required"
        fthint="Response message when feedback has been sent.">

</cfcomponent>