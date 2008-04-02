<cfcomponent displayname="Images: Image Gallery" extends="farcry.core.packages.rules.rules" hint="Displays an image gallery of selected images">


	<cfproperty ftSeq="1" ftFieldset="Images" name="aImages" type="array" default="" hint="The list of images to be displayed in the gallery" ftLabel="Images" ftJoin="dmImage" />
	<cfproperty ftSeq="2" ftFieldset="Images" name="catImageGallery" type="longchar" default="" hint="A list of category ObjectIDs that the content is to be drawn from" ftLabel="Categories" ftType="category" />
	<cfproperty ftSeq="10" ftFieldset="Display" name="numItems" type="numeric" hint="The number of items to display per page." required="true" default="20" ftType="numeric" ftIncludeDecimal="false" ftvalidation="validate-digits" ftLabel="## items per page" />
	
</cfcomponent>