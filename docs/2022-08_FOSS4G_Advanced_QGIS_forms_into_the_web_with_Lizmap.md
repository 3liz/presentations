---
marp: true
title: Advanced QGIS forms into the web with Lizmap
paginate: true
theme: gaia
class: invert
header: '![height:30px](media/qgisfr2022_mdouchin/logo_3liz.png)'
footer: '![height:30px](media/logo/logo_foss4g2022_firenze.png) FOSS4G 2022'
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
  img[alt~="top"] {
      display: inline-block;
      vertical-align:top;
      margin-right:10px
    }
headingDivider: 1
---


# Advanced QGIS forms into the web with Lizmap

![w:300](media/qgisfr2022_mdouchin/logo_3liz.png)

Nicolas BOISTEAULT - 3LIZ

# Mandatory fields

- Define fields as `NOT NULL` in postgreSQL

![w:400 top](media/foss4g2022_lizmap_advanced_forms/00_QGIS_NOT_NULL.png) ![w:400](media/foss4g2022_lizmap_advanced_forms/00_Lizmap_NOT_NULL.png)

# Alias

- Define aliases for your fields

![w:400 top](media/foss4g2022_lizmap_advanced_forms/01_QGIS_alias.png) ![w:400](media/foss4g2022_lizmap_advanced_forms/01_Lizmap_alias.png)

<!-- 
- Fields name in database are simple/raw
- Make the field more comprehensive
-->

# Organize form's fields

- Use QGIS "Drag and Drop Designer"

![w:800](media/foss4g2022_lizmap_advanced_forms/02_QGIS_dnd_tabs_conf.png)

<!-- 
- Change field's order
- Create tabs and group box
-->

# Tabs

![w:400 top](media/foss4g2022_lizmap_advanced_forms/02_QGIS_dnd_tabs_result.png) ![w:400](media/foss4g2022_lizmap_advanced_forms/02_Lizmap_dnd_tabs.png)

# Group box

![w:400 top](media/foss4g2022_lizmap_advanced_forms/03_QGIS_dnd_groupbox_result.png) ![w:400](media/foss4g2022_lizmap_advanced_forms/03_Lizmap_dnd_groupbox.png)

# Toggle tabs of group box visibility on condition

![w:500 top](media/foss4g2022_lizmap_advanced_forms/06_QGIS_toggle_conf.png)
![w:500 top](media/foss4g2022_lizmap_advanced_forms/06_QGIS_toggle_conf2.png)

---

![w:400 top](media/foss4g2022_lizmap_advanced_forms/06_QGIS_toggle_result.gif)![w:400 top](media/foss4g2022_lizmap_advanced_forms/06_Lizmap_toggle.gif)

# Upload files

- Use "Attachment" widget and "Filter" to define allowed extensions

![w:650](media/foss4g2022_lizmap_advanced_forms/04_QGIS_attachment_conf.png)

---

![w:500](media/foss4g2022_lizmap_advanced_forms/04_QGIS_attachment_result.png)

![w:500](media/foss4g2022_lizmap_advanced_forms/04_Lizmap_attachment.png)

---
- Edit pictures directly in Lizmap

![w:700](media/foss4g2022_lizmap_advanced_forms/04_Lizmap_attachment_crop..gif)

# Constraints with expression

![w:800](media/foss4g2022_lizmap_advanced_forms/05_QGIS_constraint_result.gif)

---

![w:500](media/foss4g2022_lizmap_advanced_forms/05_Lizmap_constraint.gif)

# Save login and groups

- @lizmap_user for users, @lizmap_user_groups for groups

![w:600](media/foss4g2022_lizmap_advanced_forms/07_QGIS_login_conf.png)

# Value relation

![w:800](media/foss4g2022_lizmap_advanced_forms/08_QGIS_value_relation_conf.png)

---

![w:350](media/foss4g2022_lizmap_advanced_forms/08_Lizmap_value_relation.gif)

# Use case: suggestion based on previous record

- Get last previous record for every users

```sql
SELECT DISTINCT ON (login)
obs.cd_nom, amph.nom_complet, login
FROM foss4g.observations obs
LEFT JOIN foss4g.amphibians_reptiles amph ON obs.cd_nom = amph.cd_nom
ORDER BY login, date_obs DESC
```

![w:500](media/foss4g2022_lizmap_advanced_forms/09_QGIS_last_observation.png)

---

![w:760](media/foss4g2022_lizmap_advanced_forms/10_QGIS_suggestion_conf1.png)

---

![w:500](media/foss4g2022_lizmap_advanced_forms/10_QGIS_suggestion_conf3.png)


![w:800](media/foss4g2022_lizmap_advanced_forms/10_QGIS_suggestion_conf2.png)

# Still here? :) Result

![w:500](media/foss4g2022_lizmap_advanced_forms/10_Lizmap_suggestion.gif)

# Thank you for your attention

* 3Liz: https://3liz.com
* Twitter 🐦
  * Nicolas BOISTEAULT: https://twitter.com/nboisteault
  * 3Liz: https://twitter.com/3LIZ_news

![bg right:20% height:100px](media/qgisfr2022_mdouchin/logo_3liz.png)