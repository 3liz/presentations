---
marp: true
title: How to use OSM data in QGIS Desktop
paginate: true
theme: gaia
class: invert
header: '![height:30px](media/logo/osm_logo.png) ![height:30px](media/heart.png) ![height:30px](media/logo/qgis_letter.png)'
footer: '![height:30px](media/events/sotm-world-2022.svg) SOTM - Firenze 2022'
size: 4:3
style: |
  section {
    font-size: 1.6em;
  }
  section.lead {
    background: #3182be;
  }
  h1 {
    font-size: 1.4em;
  }
  ul li {
    font-size: 0.9em;
  }
headingDivider: 1
---

# How to use OSM data in QGIS ?
<!-- _class: lead gaia-->
<br/>

![height:80px](media/logo/osm_logo.png) ![height:80px](media/heart.png) ![height:80px](media/logo/qgis_letter.png)

Vector, raster, database, docker, Overpass, tiles and so on …

Which one can I use ?

<br/>

*Etienne Trimaille*
🐦 [@etrimaille](https://twitter.com/etrimaille)

![height:80px](media/logo_3liz.png)

# 3Liz

* **Open Source** forever, check our [GitHub](https://github.com/3liz/)
* Contributors in QGIS, server side mainly, plugins
* ♥ QGIS Desktop ♥ QGIS Server ♥ PostGIS ♥
* Opensource solution for publishing QGIS Project on the web, 
  **Lizmap Web Client** 🦎

![height:80px](media/logo_3liz_small.png)

# QGIS, the powerful desktop app

<!-- _class: lead gaia-->

![height:500px](media/about-qgis-screenshot.png)

*OSM vector data with different symbologies*

# QGIS, the powerful desktop app

<!-- _class: lead gaia-->

![height:500px](media/qgis/network_analysis.png)

*Isochrone analysis*

# QGIS, the powerful desktop app

<!-- _class: lead gaia-->

![height:500px](media/qgis/temporal_weather.gif)

*Remote data with temporal controller*

# QGIS, the powerful desktop app

<!-- _class: lead gaia-->

![height:500px](media/qgis/3d_viewer.png)

*3D*

# OSM data model

![bg contain right:45%](media/osm/data-model.png)

* Different primitive objects

| OSM      	| GIS     	|
|----------	|---------	|
| Node     	| Point   	|
| Way      	| Line    	|
| Relation 	| Polygon 	|

* A OSM way can either be a GIS line or GIS polygon according to its OSM tags (key/values)
* A OSM relation can be point, line, multilinestrings, multipolygons, mixed geometry…

# OSM data model

Another difference ➡ **attributes**

* In GIS, the **layer** has one or many **fields**, defining all features in this specific layer

* In OSM, the **layer** does **not** exist. Each feature is individual and has its own fields. 

#
<!-- _class: lead gaia-->

Therefore

OSM data in QGIS will be different from raw OSM data

#
<!-- _class: lead gaia-->

## Moreover, there are a few questions

# Do you need …

* to have up to date OSM data ?
* to work with small extent or a big extent ?
  * By the way, what is a small and big extent ? (for online API)
  * Density of data in different part of the worlds
* to have OSM metadata such as contributor, changeset, timestamp ?
* data designed for display or analysis or routing or geocoding or … ?
* all OSM keys and values or just the "most common ones" ?

#
<!-- _class: lead gaia-->

## There isn't a single answer

#
<!-- _class: lead gaia-->

## Let's see what is possible

# With QGIS only

* Add the default mapnik style as a raster, from the *QGIS Browser*

![height:400px](media/osm/qgis-browser.png)

# With QGIS only

* Some online tools are already transforming the data into GIS formats (SHP, Geopackage…)
* https://download.geofabrik.de/
* https://www.data.data-wax.com/ France and other countries, QGIS style, GitHub (➡ this screenshot)
* Opendata portals (such as the French one 🇫🇷 https://www.data.gouv.fr). Look in your country 😉
* …

![bg contain right:45%](media/osm/osm2igeo.jpg)

# With QGIS only

![bg contain right:45%](media/osm/pbf.png)

* Load OSM XML or PBF files
  * Thanks to OGR in the background
* Different websites to download these files with worldwide coverage:
  * https://download.geofabrik.de/
  * http://download.openstreetmap.fr/extracts/
  * …

# With QGIS only

* It starts to be an issue if you want some **specific** fields
* This is called an **HStore** field

![height:250px](media/osm/pbf-attribute-table.png)

# Use Processing Explode HStore

![height:500px](media/osm/explode-hstore.png)

# Or use QGIS Expression

![height:360px](media/osm/htsore-expression.png)

for selection, labelling ...

# Using QGIS Plugins

A few plugins in the QGIS plugin manager among the 914 plugins available 😎 (August 2022)

![height:400px](media/osm/plugins.png)

# QuickMapServices plugin

![height:400px](media/osm/quick-map-services.png)

*OpenTopoMap* in the background, based on OSM, designed for hiking 🏔

# QuickMapServices plugin

![height:400px](media/osm/quick-map-services.gif)

In *QuickMapServices*, go in *Settings* ➡ *More services* ➡ *Get contributed pack* to enable a **lot** of basemaps 🚀.

# QuickOSM plugin

* Download the data on the fly
* Making requests to the Overpass API, similar to Overpass-Turbo
  * Server API to retrieve raw OSM data based on queries (OQL)
* QuickOSM **2.2.1** is **on its way**
* Targeting both 
  * **non OSM contributors**
  * and OSM OverpassAPI **experts**
* It's removing the HStore field `other_tags` by exploding it 
* As it's using an API, limited amount of data
* Let's make an overview of this new version

# Quick Query

* Search in your native language
  * 🇬🇧 `Bakery`
  * 🇮🇹 `Panetteria`
  * 🇫🇷 `Boulangerie`
  * ➡ `shop=bakery` in OSM
* Multi key/value support with `AND`/`OR` operator

![](media/osm/presets.png)

* *Thanks to the JOSM and Vespucci community to share these presets on GitHub*

# Quick Query

*French people love 🥖 and 🧀*

![height:400px](media/osm/quick-query.gif)

# Map presets

* Download many layers, many OSM objects, with a QGIS symbology at the **same** time with 2 clicks

![height:400px](media/osm/map-preset.png)

# Map presets

![height:400px](media/osm/edit-preset.png)

*A few steps to make new presets, with a QGIS style*

# Map presets

<!-- _class: lead gaia-->

![height:400px](media/we-need-you.jpg)

*Bicycle map*, *landuse*… map presets

https://docs.3liz.org/QuickOSM/user-guide/map-preset/

# QuickOSM in Processing

* Available in Processing *Toolbox* and *Modeler*
* Batch processing
* Example : downloading fire hydrants, reprojecting in meters projection, buffering and QGIS Style

![height:400px](media/osm/processing.png)

# QuickOSM in Processing

![height:400px](media/osm/quickosm-processing.gif)

# Local OSM file

* Having a PBF/OSM file on your computer ?
* You can still filter it

![height:400px](media/osm/osm-file.gif)

# Some quick tips in QuickSOM

<!-- _class: lead gaia-->

# Reload the query to get latest update from OSM

<!-- _class: lead gaia-->

![height:500px](media/osm/reload-query.png)

# Query many named places with `;`

<!-- _class: lead gaia-->

![height:90px](media/osm/many-places.png)

# Default QGIS Actions available

<!-- _class: lead gaia-->

![height:400px](media/osm/actions.png)

*JOSM, Wikipedia, URL, Mapillary*

# Default QGIS Actions available

<!-- _class: lead gaia-->

![height:400px](media/osm/quickosm-actions.gif)

*JOSM, Wikipedia, URL, Mapillary*

# Translations

<!-- _class: lead gaia-->

* Web interface : https://www.transifex.com/quickosm/gui/dashboard/

* Statistics : https://docs.3liz.org/QuickOSM/translation-stats/

# OSM relations

**Issues with OSM relations**

* The underlying library (OGR) can **only** **display** `relations` = `route`, `multilinestrings`, `multipolygons` or `boundary`.
* Other relations need some post-processing to manage geometries for a GIS software

# Geocoding

* New in QGIS 3.20 🌟
* No more plugin required
* https://nominatim.qgis.org
* Processing algorithm for batch geocoding
![height:400px](media/osm/geocoding-nominatim.png)

# Geocoding

* New in QGIS 3.20 🌟
* No more plugin required
* https://nominatim.qgis.org
* Integrated in the locator bar (without plugin)

![height:400px](media/osm/locator.gif)

# Routing

* ORS Tools
* API based on OpenStreetMap data
* isochrones and matrix calculations

![height:400px](media/osm/ors-tools.png)

# Importing OSM in a database ?

https://wiki.openstreetmap.org/wiki/Databases_and_data_access_APIs#Database_Schemas

![height:300px](media/osm/db-schema.png)

* Mainly **osm2pgsql**, used for rendering, very old project and used
* Imposm, version **3** is updatable. Each layer has a **mapping** configuration

# Database with docker

* 🐘 and 🐳
* https://github.com/kartoza/docker-osm
* Docker-compose project :
  * PostgreSQL container
  * Imposm container
  * OSMUpdate container : to download OSM diff files
* Workflow
  * Drop a PBF file in the folder
  * Drop the area of interest for clipping (recommended) in the folder
  * Copy `.example.env` to `.env` for local settings
  * `make run`

# et voila !

![bg contain right:45%](media/osm/docker-osm-pgadmin.png)

Possible to customize the configuration :
  * Different **mapping**
  * Generalization for different scales
  * Updated every two minutes by default
  * SQL Triggers, views
  * Styles included in the QGIS `layer_styles` table


# Vector tiles

* Vector tile support, new in QGIS 3.14 🌟
* MapTiler / OpenMapTiles https://openmaptiles.org/
* Presentation from Jiri Komarek and Wladimir Szczerban **yesterday at the SOTM** or at the FOSS4G next week

# Questions

<!-- _class: lead gaia-->

This was just a *subset* of capabilities.
There are still other plugins, other ways etc.

<br />

*Etienne*
🐦 @etrimaille or @3LIZ_news
