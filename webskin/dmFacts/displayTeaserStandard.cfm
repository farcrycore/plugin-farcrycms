<cfsetting enablecfoutputonly="true" />
<!--- @@Copyright: Daemon Pty Limited 2002-2013, http://www.daemon.com.au --->
<!--- @@displayname: Fact Well --->

<!--- import tag libraries --->
<cfimport taglib="/farcry/core/tags/webskin" prefix="skin">

<cfif len(stobj.link)>
    <cfoutput>
        <div class="well clearfix">
            <a href="#stobj.link#"><img src="#getFileLocation(stobject=stobj, fieldname="imgThumb").path#" alt="#stObj.title#" class="img-circle pull-right">
            <strong>#stObj.title#</strong></a><br>
            #stobj.body#
        </div>
    </cfoutput>

<cfelse>
    <cfoutput>
        <div class="well clearfix">
            <img src="#getFileLocation(stobject=stobj, fieldname="imgThumb").path#" alt="#stObj.title#" class="img-circle pull-right">
            <strong>#stObj.title#</strong><br>
        	#stobj.body#
        </div>
    </cfoutput>
</cfif>

<cfsetting enablecfoutputonly="false" />