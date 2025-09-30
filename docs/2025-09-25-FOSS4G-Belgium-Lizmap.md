---
marp: true
title: FOSS4G Belgium 2025 - Lizmap Web Geoportal for QGIS
paginate: true
theme: gaia
class: invert
header: '![height:30px](media/logo_3liz.png)'
footer: '![height:30px](media/events/foss4g-be.svg) FOSS4G Belgium 2025'
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

# LIZMAP WEB CLIENT

### Web Geoportal for QGIS

Nicolas Boisteault

![height:300](media/logo_lizmap.png)

![height:80px](media/logo_3liz.png)

<!-- _class: lead gaia-->

# 3Liz

* French company
* **Open Source** forever, check our GitHub https://github.com/3liz/ 
* Core contributors in QGIS, server side mainly
* PyQGIS development, Lizmap development, Lizmap hosting (SAAS), support, trainings about PyQGIS, PostGIS, Lizmap...

![bg drop-shadow contain right:30%](media/logo_3liz.png)

# QGIS Desktop

We sometimes spend a lot of time configuring our project in QGIS Desktop ⏰

* Setting up layers and relations

* Layers symbology

* Build form to make it easy to add data

* PDF print layout

* ...

# QGIS Desktop

<!-- _class: lead gaia-->

![height:450px](media/qgis/network_analysis.png)

# Need to share your work ?

* We already use QGIS as our main GIS tool
* We **are used to it** !
* Then we need to publish a full-featured application to the web ?
* We **do not** want to spend **again** time to set up and configure web maps in complex admin panels, re-styling layers, forms etc.

# One thing to know

<!-- _class: lead gaia-->

* QGIS is **not only** a desktop application
* But a GIS server as well 🚀
* OGC certification since 2018 : WMS, WFS, WMTS...

![bg drop-shadow contain right:30%](media/logo_qgis.png)

# On top of QGIS Server

![bg drop-shadow contain right:30%](media/logo_lizmap.png)

* Lizmap Web Client
* Prepare on QGIS desktop, deploy on Lizmap
* Web administration panel is **mainly** for authentication and authorization management (users and groups)
* All other configurations are done **within QGIS desktop**

# How to

* Create a project with some layers
* Use the Lizmap plugin to configure some options specific for the web (extent, scales, tools available etc.)
* And upload on the Lizmap server
* You've got a web map based on the QGIS project

![height:350px](media/lizmap/demo.png)

# Use cases of Lizmap

<!-- _class: lead gaia-->

Some examples to demonstrate
the main features

# Map Catalog in Meylan

<!-- _class: lead gaia-->

French city in the Alps
Publish thematic maps for citizens
Eye-candy, with simplicity
https://geo.myelan.fr

#

![bg](media/use_case_meylan_1.jpg)

# 

![bg](media/use_case_meylan_2.jpg)

# Custom CSS themes

<!-- _class: lead gaia-->

* https://mapeo.calvados.fr/carto/

#

![bg](media/use_case_mapeo_calvados.png)

# Embed in another website - AF3V

<!-- _class: lead gaia-->

* Possible to embed Lizmap in another website
* AF3V : French association about bicycle routes
* https://Af3v.org

#

![bg](media/lizmap/landing-page-af3v.png)

# Dataviz with land use in Guadeloupe

<!-- _class: lead gaia-->

* Guadeloupe island in the Caribbean
* Valorisation of Land Use data
* Evolution of Land use data
* https://cartophyl.lizmap.com/demo/index.php/view/map/?repository=cartophyl&project=indic_GP#

#

![bg](media/lizmap/dataviz-guadeloupe-1.png)

#

![bg](media/lizmap/dataviz-guadeloupe-2.png)

#

![bg](media/lizmap/dataviz-guadeloupe-3.png)

# Identify feature

<!-- _class: lead gaia-->

* ADUGA, Urban planning agency
* Highlight key figures of **local business parks**
* Use core **QGIS HTML Maptip** to use **QGIS expressions**

# 

![bg](media/use_case_aduga_1.jpg)

<!-- https://carto.aduga.org/index.php/view/map?repository=observatoire&project=atlas_zae_lizmap_383
-->

# Treeview

<!-- _class: lead gaia-->

![w:800](media/lwc-3-7-2/legend.png)

# Attribute table

Using DataTables, a JavaScript library to display dynamic tables

<video src="media/foss4gbe2025/attribute_table.mp4" controls width="70%"></video>

# Layer editing

<!-- _class: lead gaia-->

Setting up forms in QGIS desktop can be **very** powerful !

thanks to many features such as Drag&Drop designer, container, visibility by expression, constraints, widgets...

# Layer editing

<!-- _class: lead gaia-->

Different kind of **native** editing widgets from QGIS **desktop** : date picker, dropdown, text input, checkox...

![w:600](media/use_case_edition_2.png)

# Layer editing

<!-- _class: lead gaia-->

Constraints with a **QGIS** expression

![w:800](media/foss4g2022_lizmap_advanced_forms/05_QGIS_constraint_conf.png)

# Layer editing

Constraints with a **QGIS** expression

<!-- _class: lead gaia-->

![w:680 center](media/foss4g2022_lizmap_advanced_forms/05_Lizmap_constraint.gif)

# Layer editing - Extra capabilities

<!-- _class: lead gaia-->

* **Geolocation**, GPS accuracy control for **field** mapping
* **Snapping** with existing features
* Geometry toolbar
  * Reverse line geometry etc

# Form filtering in Narbonne

<!-- _class: lead gaia-->

* Find local products and markets
* Using form filtering : checkbox or dropdown menu
* https://lizmap.legrandnarbonne.com/index.php/view/map/?repository=public&project=circuit_court

#

![bg](media/use_case_grandnarbonne_filter.png)

#

<!-- _class: lead gaia-->

## Extent Lizmap core with some additional modules 🌟

# AltiProfil

* Developed by a Lizmap user in the Indian Ocean (Arnaud Vandecasteele)
* https://github.com/arno974/lizmap-altiProfil

![](media/lizmap/alti-profil.jpeg)

# Web Processing Service

* To expose QGIS Processing (the toolbox and modeler) on the web

![height:350px](media/lizmap/wps-chart.png)

#

<!-- _class: lead gaia-->

## Extend Lizmap with some additional **JavaScript**

https://github.com/3liz/lizmap-javascript-scripts

#

![bg](media/lizmap-javascript-scripts.png)

# Add a Mapillary viewer

<!-- _class: lead gaia-->

![height:500px](media/lizmap/mapillary.gif)

# Access control

* Possible to have users and groups
* Different level of filtering and check access control :
  * Make group of projects visible or not on the landing page
  * Make projects visible or not
  * Make layers visible or not
  * Make editing available or not for a layer
  * Within the same layer, make features visible or not (either by attribute or by spatial intersection)

# Access control

<!-- _class: lead gaia-->

* Spatial filtering, like a **mask layer**

![height:500px center](media/lizmap/filter-polygon.gif)

# A growing community

* Different kind of users
  * Private companies
  * Public organizations
  * Research centers
* Main contribution from the **Open Source** community in 
  * **translations**
  * the **Javascript** library
  * helping each other on discourse: **https://discourse.osgeo.org/c/qgis/lizmap/48**
  * and writing some **documentation**

# Translations

* https://www.transifex.com/3liz-1/lizmap-locales/dashboard/
* 27 languages on Transifex
  * English and French: 100%
  * Dutch: 81%

🇬🇧 🇨🇿 🇫🇷 🇵🇹 🇯🇵 🇷🇺 🇺🇦 🇮🇹 🇵🇱 🇷🇴 🇩🇪 🇸🇰 🇸🇪 🇧🇷 🇪🇸 🇳🇱 🇭🇺 🇫🇮 🇬🇷 🇳🇴 🇦🇷 🇮🇩 🇸🇮

# Freely usable and used worldwide

* Groundwater mapping **Western cape, South Africa** https://www.groundwaterinfo.africa
* **Switzerland** https://www.wandelderzeit.ch/
* Faunalia (**Italia**) https://lizmap.faunalia.eu/
* Consorzio Toscana Nord (**Italy**) http://geoportale.cbtoscananord.it
* Município de Arraiolos (**Portugal**) http://pdm-revisao.municipioarraiolos.pt/
* SAERI (**South Atlantic**): https://data.saeri.org/saeri_webgis/lizmap/www/

#

![bg](media/use_case_falkland_islands.png)

# Want to try Lizmap?
Ask us!
Test our Lizmap hosting one month for free.

## 👇

### info@3liz.com

# Questions

Thank you for your attention.

![bg auto](media/lizmap/karunati-background.png)

