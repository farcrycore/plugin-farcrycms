<cfsetting enablecfoutputonly="true" />

<cfparam name="stobj.bajax" type="boolean" default="true" />

<cfimport taglib="/farcry/core/tags/webskin" prefix="skin" />
<skin:view objectID="#stObj.objectID#" typename="#stObj.typename#" webskin="displayTweets" bajax="#stobj.bajax#" />

<cfsetting enablecfoutputonly="false" />