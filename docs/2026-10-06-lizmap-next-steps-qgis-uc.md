---
marp: true
author: 'René-Luc DHONT, 3Liz'
paginate: true
theme: gaia
class: normal
title: 'Lizmap Web Client: next steps - QGIS UC 2026 Laax'
header: '![height:30px](media/logo_lizmap_small.png) Lizmap Web Client: next steps'
footer: '![height:30px](media/events/qgis-uc-2026-laax.webp) QGIS UC 2026 Laax'
style: |
  section {
    font-size: 1.8em;
  }
  h1 {
    font-size: 1.5em;
  }
  ul {
    margin-top: 0px;
  }
  ul li {
    font-size: 1em;
  }
  img[alt~="center"] {
      display: block;
      margin: 0 auto;
  }
  @media print{
    section {
      font-size: 1.4em;
    }
  }
  @supports (-moz-appearance:none) {
    section {
      font-size: 1.4em;
    }
  }

---
# Lizmap Web Client: next steps

<!-- _class: lead gaia-->

### From 15 years of development to the futur

![height:300](media/logo_lizmap.png)

![height:80px](media/logo_3liz.png)

---
# What is Lizmap Web Client ?

![bg drop-shadow contain right:30%](media/logo_qgis.png)

### Web Geoportal for QGIS

- To share your works on QGIS
- To publish full-featured map applications to the web

### On top of QGIS Server

- Prepare on QGIS desktop, deploy on Lizmap
- Web administration panel is **mainly** for authentication and authorization management (users and groups)
- All other configurations are done **within QGIS desktop**

---
# How to

* Create a project with some layers
* Use the Lizmap plugin to configure some options specific for the web (extent, scales, tools available etc.)
* And upload on the Lizmap server
* You've got a web map based on the QGIS project

![height:350px](media/lizmap/demo.png)

---
# Full featured ?

![bg right:69%](media/foss4g2022_lizmap_advanced_forms/05_Lizmap_constraint.gif)

- **Layers**: visibility, opacity, metadata, export, filter, selection, etc.
- **Tools**: measure, print, locate, geolocation, attribute table, etc.
- **Editing layer**: create, modify, delete features, with QGIS form, snapping, expressions, etc.

---
# Lizmap Web Client maintained versions

- **3.8** as security release since 2026.02
- **3.9** as active release since 2025.06
- **3.10** as release candidate since 2026.05

![height:300 center](media/qgisuc_2026_laax_lizmap/2026-10-lizmap-versions.png)


---
# Next Lizmap Web Client

<!-- _class: lead gaia-->

### 3.10 in dev since 2025.09
### 3.10 in RC since 2026.05
### 3.10.0 in 2026.10

---
# Lizmap Web Client 3.10 - Attribute Table

Funded by digi-studio, Etra & Faunalia - Developed by Nicolas Boisteault, René-Luc D'Hont & Riccardo Beltrami

![height:450 center](media/qgisuc_2026_laax_lizmap/attribute_table_filter.gif)

---
# Lizmap Web Client 3.10 - Geolocation heading

Funded by Terre de Provence Agglomération - Developed by René-Luc D'Hont & Nicolas Boisteault

![height:450 center](media/qgisuc_2026_laax_lizmap/geolocation.gif)

---
# Lizmap Web Client 3.10 - Panoramax

Funded by Terre de Provence Agglomération - Developed by Nicolas Boisteault

![height:450 center](media/qgisuc_2026_laax_lizmap/panoramax.gif)

---
# Lizmap Web Client 3.10 - Portfolio

Funded by the Municipality of Mirandela - Developed by René-Luc D'Hont

![height:450 center](media/qgisuc_2026_laax_lizmap/portfolio.gif)

---
# Lizmap Web Client 3.10 - DXF Export

Developed by Lorenz Meyer

![height:450 center](media/qgisuc_2026_laax_lizmap/dxf-export.gif)

---
# Lizmap Web Client 3.10 - Shortlink

Funded by Etra - Developed by Riccardo Beltrami

![height:450 center](media/qgisuc_2026_laax_lizmap/shortlink.gif)

---
# Lizmap Web Client 3.10 - Copy/Paste in editing

Developed by Lorenz Meyer

![height:450 center](media/qgisuc_2026_laax_lizmap/copy_paste_edition.gif)

---
# Lizmap Web Client 3.10 - Many others enhancements

- Editing
  - Apply default value on update
  - Automatically enable snapping
  - Background color defined in QGIS for form tabs
  - For attachments and images, file names now follow the default value: expression
  - Support for many-to-many relations in the form
- Printing
  - Users can print at a custom scale
  - Single atlas feature now respects the configuration: expression
  - Export a PDF with several atlas features
- Popup
  - child layers are now correctly placed in the chosen group or tab
  - group all popups by layer, in a tabular view
- Tooltip - QGIS symbology can now be displayed, on hover, the icon is enlarged

---
# Lizmap Web Client 3.10 - Thanks

- To funders
  - Etra
  - Faunalia
  - Terre de Provence Agglomération
  - Municipality of Mirandela
  - Conseil départemental du Gard
  - digi-studio
  - CC Parthenay-Gâtine
  - CC Bièvre Est
- To developers
  - Lorenz Meyer
  - Riccardo Beltrami

![bg contain right:40%](media/heart.png)

---
# What's next for Lizmap Web Client ?

<!-- _class: lead gaia-->

---
# Ordered features

- Open the attribute table in a new browser tab / window
- Light offline mode
- REST APIs to manage Lizmap config
  - Create repositories
  - Push QGIS Projects

![bg contain right:60%](media/qgisuc_2026_laax_lizmap/lizmap-plugin-upload.webp)

---
# New open attribute table

![bg](media/qgisuc_2026_laax_lizmap/open-attribute-table-new-window.gif)

---
# Lizmap Web Client 4

- Dropped OpenLayers 2
- Filter Manager
- Better QJazz integration:
  - Async printing
  - Async vector export
  - Managing loaded projects
- Better QGIS Desktop integration
  - Use REST APIs to manage Lizmap config
- Use other QGIS Project storages: PostgreSQL, S3, etc.
- Some other cool things

---
# ![image height:40px](media/logo_3liz.png) Thanks for your attention ![image height:40px](media/logo_3liz.png)

<!-- _class: lead gaia-->

Any questions ?
