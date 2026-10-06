---
marp: true
author: Michaël DOUCHIN, 3Liz
headingDivider: 1
paginate: true
theme: gaia
class: normal
title: RoadNetwork QGIS plugin - QGIS UC 2026 Laax
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


header: '![height:30px](media/logo/roadnetwork.svg) RoadNetwork'
footer: '![height:30px](media/events/qgis-uc-2026-laax.webp) QGIS UC 2026 Laax'
---

# ![image height:40px](media/logo/roadnetwork.svg) RoadNetwork ![image height:40px](media/logo/roadnetwork.svg)

<!-- _class: lead gaia-->

Managing a **topological county road network**
Linear referencing with **QGIS** & **PostGIS**

*Michaël Douchin*   - ![height:40px](media/logo_3liz.png)

![h:350px drop-shadow:10px,10px,4px,dimgray](media/qgisuc_2026_laax_roadnetwork/road_network_background.png)


# Road **network**

Each **road**
- has an **identification** e.g. `D907`
- is composed by a **series of ordered edges**  (simple linestrings)

**Markers** are positioned along the roads e.g. Their position is often measured with a **GPS** `(X,Y)`

  ![height:300px drop-shadow:10px,10px,4px,dimgray](media/qgisuc_2026_laax_roadnetwork/marker_photo.png)


# Topology

The road network is a **GRAPH** built with **edges** and **nodes**

- each edge has
  a **start and end node**
- an edge can have
  - a **previous** edge
  - a **next** edge
- **intersecting edges** are cut by a **node** (if they are on the same level)


![bg](media/qgisuc_2026_laax_roadnetwork/edge_node_graph.png)

# Position & **references**

This simple organization of **roads, edges and markers** allows to determine a position of any object based on:

- a **road code**: `D902`
- a **marker code**: `1`
- an **abscissa**: `500m`

You can also provide an optional
**offset**: `3m` and **side**: `left`

![bg right:50% contain drop-shadow:10px,10px,4px,dimgray](media/qgisuc_2026_laax_roadnetwork/references_schema.png)

Any point within a distance of **50m** of any road will have its **references**: `D902 PR 1 + 500m (3m left)`


# Linear **referencing**

Each data object, **point** or **(multi)linestring**, is defined by its **references** calculated from the road network:
- **Points**: trees, street lights, car accidents, etc.
- **Linestrings**: paintings, safety barriers, roadworks, etc.

We must be able to:
- **calculate the references** from the object geometry
- **create a geometry** based on given references
  - a **point**
  - a **multi-linestring** between 2 references

![bg contain right:45% drop-shadow:10px,10px,4px,dimgray](media/qgisuc_2026_laax_roadnetwork/illustration.png)



# Corner **cases**

**Discontinuity**: edges could have been deleted (or have changed status)

![height:160 drop-shadow:10px,10px,4px,dimgray](media/qgisuc_2026_laax_roadnetwork/discontinuity.png)

**Roundabouts** have their own road code `GIR D35-D80` and cut the other roads

![height:200px drop-shadow:10px,10px,4px,dimgray](media/qgisuc_2026_laax_roadnetwork/roundabout_principles.png)


# Context

Funded by the **Département du Calvados** (French department)

  ![height:200px](media/qgisuc_2026_laax_roadnetwork/logo_cd14.png)


**Objectives**
- They would like to **get rid of a proprietary software** & **use only FOSS4G** tools
- The data must be stored in a **PostgreSQL database** ![height:35px](media/logo-postgresql.png)
- **Visualization & Editing** must be done **inside QGIS** ![height:30px](media/logo_qgis.png), with the help of a **plugin**
- **Calculations** (references, geometry editing) must be made available for **Lizmap Web Client** ![height:35px](media/logo_lizmap.png)

![bg opacity:0.3](media/qgisuc_2026_laax_roadnetwork/departement_calvados.png)


# RoadNetwok

## A **QGIS** plugin
<!-- _class: lead gaia-->

### With the power of **PostgreSQL & PostGIS**

![height:100px drop-shadow:10px,10px,4px,dimgray](media/logo_qgis.png) ![height:100px](media/logo-postgresql.png)



# Database **model**

![height:40px](media/logo-postgresql.png) All the logic is stored inside a **PostgreSQL database**

A simple set of **tables**: `roads`, `edges`, `nodes`, `markers`, `glossary`, `managed_objects` + **views**

Many **functions** to calculate references, geometries, among:
`get_road_point_from_reference`
`get_road_substring_from_references`
`update_table_references_from_geometries`
`update_table_geometry_from_references`

**Trigger functions** in charge of maintaining the road network **topology** (automatic node creation, split intersected edges, etc.)


![bg contain right:50% drop-shadow:10px,10px,4px,dimgray](media/qgisuc_2026_laax_roadnetwork/database_model.png)



# **Administration** tools

QGIS **Processing algorithms** which allow to:

- **Create the database structure** with all the tables/functions, etc.
- **Upgrade the structure** automatically (if upgrading your plugin)
- **Create a QGIS administration project** with all the layers, styles, labels, actions, etc.
- **Import data** from template **edges** and **markers** tables

![bg contain right:30% drop-shadow:10px,10px,4px,dimgray](media/qgisuc_2026_laax_roadnetwork/qgis_administration_panel.png)


# QGIS administration **project**

![height:600px drop-shadow:10px,10px,4px,dimgray](media/qgisuc_2026_laax_roadnetwork/qgis_administration_project.png)


# **Tools** - Quick search (CTRL+K)

![width:900px drop-shadow:10px,10px,4px,dimgray](media/qgisuc_2026_laax_roadnetwork/qgis_search_ctrl_k.gif)


# **Tools** - Get references on map click (hover supported)

![width:900px drop-shadow:10px,10px,4px,dimgray](media/qgisuc_2026_laax_roadnetwork/qgis_get_references_map_click.gif)


# Editing **rules**

Data are not edited in the production schema `road_graph` but in a **dedicated editing sessions schema**
- The user creates a **polygon** and **clones an extract of the production data** in a sanbox
- **Editing** is made with **QGIS tools**: forms, topology
- QGIS **automatic transaction grouping** has been activated in the project: changes made with triggers are visible **live**
- A map tool helps to **create roundabouts**
- Modifications are then **merged back** into the `road_graph` schema

![bg width:1200px right:50% drop-shadow:10px,10px,4px,dimgray](media/qgisuc_2026_laax_roadnetwork/qgis_editing.gif)


# Managed **objects**

![bg opacity:0.4](media/qgisuc_2026_laax_roadnetwork/illustration.png)

The **local authorities** manages a lot of data based on the road network : `roadworks`, `asphalt rehabilitation`, `road signs`, `hedge pruning`.

The `managed_objects` layer lists **all the PostgreSQL tables** impacted by any **graph modification**
![width:1000px drop-shadow:10px,10px,4px,dimgray](media/qgisuc_2026_laax_roadnetwork/qgis_managed_objects.png)

When the user **merges the data from the editing session**, every impacted object is
**automatically updated based on the rule** chosen by the admin user.

- **Point objects** are often not moved but their **references must be updated** Ex: `a road sign`
- **(Multi)Linestring objects** must often follow the changes, but we keep the start & point and only edit the nodes between. Ex: `a painting roadwork`


# **Conclusion**

The **QGIS plugin** is here to
- create/ugprade the **database structure**
- **visualize** the road network
- **position** with references & get references from position
- **edit data safely** in a sandbox and use algorithm to copy/merge the data
- **import** data

The main business logic really lies **inside the PostgreSQL database**
- **schemas** and **tables**, functions, triggers

![bg opacity:0.3](media/qgisuc_2026_laax_roadnetwork/qgis_get_references_map_click.gif)

# ![image height:40px](media/logo/roadnetwork.svg) Thanks for your attention ![image height:40px](media/logo/roadnetwork.svg)

<!-- _class: lead gaia-->

Any questions ?

- **Contact**: info@3liz.com
- **Source code**:
  https://github.com/3liz/qgis-road-network-plugin/
  ![image height:150px](media/qgisuc_2026_laax_roadnetwork/github_repo_qrcode.gif)
- **This presentation**
  https://docs.3liz.org/presentations/2026-10-06_RoadNetwork-Plugin_QGIS_UC_Laax.html
  ![image height:150px](media/qgisuc_2026_laax_roadnetwork/presentation_qrcode.png)
