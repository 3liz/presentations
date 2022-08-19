---
marp: true
title: Advanced QGIS forms into the web with Lizmap
paginate: true
theme: gaia
class: invert
header: '![height:30px](media/qgisfr2022_mdouchin/logo_3liz.png)'
footer: '![height:30px](media/events/foss4g-world-2022-square.jpg) FOSS4G 2022'
size: 4:3
style: |
  section {
    font-size: 1.6em;
  }
  section.lead {
    background: #3182be;
  }
  h1 {
    font-size: 1.35em;
  }
  ul li {
    font-size: 0.9em;
  }
  img[alt~="top"] {
    display: inline-block;
    vertical-align:top;
    margin-right:10px
  }
  img[alt~="center"] {
    display: block;
    margin: 0 auto;
  }
headingDivider: 1
---


# Advanced QGIS forms into the web with Lizmap

![w:300](media/qgisfr2022_mdouchin/logo_3liz.png)

Nicolas BOISTEAULT - 3LIZ

<!-- (15s) Hi, I'm going to show you some tips to make advanced forms in QGIS which will be easy for users to be filled.
I also will show you those forms in the web thanks to Lizmap with no more configuration most of the time.
This way you'll get more participation and less mistake in your data.
 -->

# Organize form's fields

- Use QGIS "Drag and Drop Designer"

![w:850](media/foss4g2022_lizmap_advanced_forms/02_QGIS_dnd_tabs_conf.png)

<!-- (20s)
First with the QGIS "Drag and Drop Designer" we can:
- Decide which fields needs to be filled
- Change the field's order
- Create tabs and group boxes
-->

# Toggle tabs or group boxes visibility on condition

![w:850](media/foss4g2022_lizmap_advanced_forms/06_QGIS_toggle_conf.png)

<!-- (35s) Let's say we create a form for a crowdsourcing campaign but also for logged in users in Lizmap (like people in our organization).
This form have many fields but many of them are not mandatory so we don't want to show them all because when forms seem too long to fill, some users might give up and close it.
To avoid that here we create a boolean field called `has_details`, with `Add details` as an Alias to have a more understandable title for this field which is defined as a `Checkbox`... -->

---

![w:870](media/foss4g2022_lizmap_advanced_forms/06_QGIS_toggle_conf2.png)

<!-- (15s) ...we also create a `Details` tab configured with a `Control Visibility by Expression` to only display it when the `has_details` checkbox is checked. -->

---

![w:450 center](media/foss4g2022_lizmap_advanced_forms/06_Lizmap_toggle.gif)

<!-- (10s) Here is the result. As you can see `Details` tab is only visible when `Add details?` is checked -->

# Upload photos

- Use "Attachment" widget and "Filter" to define allowed extensions

![w:680](media/foss4g2022_lizmap_advanced_forms/04_QGIS_attachment_conf.png)

<!-- (10s) Now we want people to upload photos. We create fields defined with the `Attachment` widget type and with a Filter to only display JPEG and PNG files -->

---

![w:750](media/foss4g2022_lizmap_advanced_forms/04_Lizmap_attachment.png)

<!-- (10s) You can see in Lizmap, only files with defined extensions are displayed when selecting them -->

---
- Edit pictures directly in Lizmap

![w:750](media/foss4g2022_lizmap_advanced_forms/04_Lizmap_attachment_crop..gif)

<!-- (10s) After file selection, you can also rotate or crop images. It is more convenient than to have to install a software for that. -->

# Constraints with expression

![w:800](media/foss4g2022_lizmap_advanced_forms/05_QGIS_constraint_conf.png)

<!-- (10s) Here we define a `Multiline` field and use an expression to constraint the field to have at least thirty characters and display an informative message when it is not honored -->

---

![w:720 center](media/foss4g2022_lizmap_advanced_forms/05_Lizmap_constraint.gif)

<!-- (10s) In Lizmap, the constraint is visible when hovering the field's name and when not honored on form submission -->

# Save login and groups

- Expression variables: @lizmap_user for users, @lizmap_user_groups for groups

![w:600 center](media/foss4g2022_lizmap_advanced_forms/07_QGIS_login_conf.png)

<!-- (15s) When contributors are logged in Lizmap, we can use their user login or user groups in form's expressions thanks to expression variables.
Here we create an invisible `login` field which get filled with the user login when form is saved.
 -->

# Value relation

![w:730](media/foss4g2022_lizmap_advanced_forms/08_QGIS_value_relation_conf.png)

<!-- (5s) The Value Relation widget is very convenient to display a list of value from another layer. -->

---

![w:350 center](media/foss4g2022_lizmap_advanced_forms/08_Lizmap_value_relation.gif)

<!-- (10s) But sometimes the list can be very long. In this example, we display scientific names for amphibians and reptiles in France. To ease selection we could, for example, suggest the last previous record on top of the list for logged in users -->

# Use case: suggestion based on previous record

```sql
SELECT * FROM (
  (
    SELECT DISTINCT ON (login)
      1 AS id,
      obs.id_animal,
      amph.scientific_name,
      login
    FROM foss4g.observations obs
    LEFT JOIN foss4g.amphibians_reptiles amph 
    ON obs.id_animal = amph.id_animal
    ORDER BY login, date_obs DESC
  )
  UNION ALL 
  (
  SELECT row_number() over (ORDER BY scientific_name) + 1 AS id,
    id_animal,
    scientific_name,
    NULL AS login 
  FROM foss4g.amphibians_reptiles
  )
) sub_query ORDER BY id
```

<!-- (10s) For that, we create a layer from a view with this SQL query. It is a UNION ALL with the last previous record for logged in users and the whole list of animals -->

---

![w:570 center](media/foss4g2022_lizmap_advanced_forms/09_QGIS_last_observation.png)

<!-- (20s) In red, the attribute table shows us the last record for alice, bob and demo users. The rest is the whole list of animals. -->

---

![w:740](media/foss4g2022_lizmap_advanced_forms/10_QGIS_suggestion_conf1.png)

<!-- (15s) To only get the previous record for the logged in user in Lizmap we use this `Filter expression` which uses again the `@lizmap_user` expression variable -->

# Result 🎉

![w:720 center](media/foss4g2022_lizmap_advanced_forms/10_Lizmap_suggestion.gif)

<!-- (15s) As you can see now when a logged in user saves a form he then has on top of the scientific name's list the last specie suggested. -->

# Thank you for your attention

- 3Liz: https://3liz.com
- Twitter 🐦
  - Nicolas BOISTEAULT: https://twitter.com/nboisteault
  - 3Liz: https://twitter.com/3LIZ_news

![bg right:20% height:100px](media/qgisfr2022_mdouchin/logo_3liz.png)

<!-- (5s) -->