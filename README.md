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

## Installation

> The plugin requires an installation of [FarCry 7.0 framework](https://github.com/farcrycore/core)
> FarCry 6.x installations must use `milestone-6-2-6`

### Checkout from source control

```
cd ./farcry/plugins
git clone https://github.com/farcrycore/plugin-farcrycms.git farcrycms
```

> ```master``` should be mostly stable for 7.x. But there are specific milestone tags for earlier releases of FarCry and those who don't want to risk change.

### Update project constructor

Add ```farcrycms``` to the plugin list within ```./www/farcryConstructor.cfm```

```
<cfset THIS.plugins = "farcrycms,googleMaps,googleAnalytics,googleSiteSearch,farcrydoc" />
```

### Deploy content types

Go into the webtop `ADMIN > DEVELOPER TOOLS >COAPI` and deploy all the plugin content types.  Alternatively, you can call any URL with `?updateall=yourprojectkey` to automatically deploy any non-destructive schema changes.
