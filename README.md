# FarCry CMS Plugin

Extends the content management features of FarCry Core to include a variety of common features.

## Features

Includes

- News content
- Events content
- Feedback form
- Image galleries
- Fun facts
- Variety of publishing rules

> The solution requires an installation of FarCry 7.0: http://www.farcrycore.org

## Installation

### Checkout from source control

```
cd ./farcry/plugins
git clone https://github.com/farcrycore/plugin-farcrycms.git farcrycms
```

> ```master``` should be mostly stable. But there are specific milestone tags for those who don't want to risk it.

### Update project constructor

Add ```farcrycms``` to the plugin list within ```./www/farcryConstructor.cfm```

```
<!---// set plugin list--->
<cfset THIS.plugins = "farcrycms,googleMaps,googleAnalytics,googleSiteSearch,farcrydoc" />
```

### Deploy content types

Go into the webtop ADMIN > DEVELOPER TOOLS and deploy all the plugin content types.
