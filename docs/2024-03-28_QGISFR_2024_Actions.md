---
marp: true
title: QGISFR 2024 - Utilisation des “actions QGIS” pour la gestion des données Véloroutes et Voies Vertes
paginate: true
theme: gaia
class: invert
header: '![height:45px](media/qgisfr2024_actions/logo_cd66_vertical.png)'
footer: '![height:30px](media/qgisfr2024_actions/logo_qgisfr_2024.png) QGISFR 2024 - Les actions QGIS et les VVV'
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
  header {
    float: right;
  }
headingDivider: 1
---

# Les ”actions QGIS” ⚙ et les VVV 🚲

René-Luc DHONT, 3liz
![height:100](media/logo/logo_3liz.png)

Conseil Départemental des Pyrénées Orientales
![height:100](media/qgisfr2024_actions/logo_cd66.png)

![bg right:45%](media/qgisfr2024_actions/fond.png)

# Les ”actions QGIS” ⚙

https://docs.qgis.org/3.34/fr/docs/user_manual/working_with_vector/vector_properties.html#actions-menu

<!-- _class: lead gaia-->

# Pour quoi faire ?

![width:850](media/qgisfr2024_actions/default_actions.png)

Simplifier une tâche récurrente

- Lancer un logiciel
- Ouvrir une page web
- Faire une opération avec QGIS

# Lancer un logiciel

![bg right:65%](media/qgisfr2024_actions/action_generique.png)

- Générique
- Unix
- Windows
- macOS

# Ouvrir une page web

![bg right:65%](media/qgisfr2024_actions/action_web.png)

- Ouvrir l'URL
- Envoyer l'URL
  - encodé ou JSON
  - en plusieurs parties

# Faire une opération avec QGIS

![bg right:65%](media/qgisfr2024_actions/action_python.png)

# Avec quel contexte ?

- Champ : variables `@field_index`, `@field_name` et `@field_value`
- Entité
- Canevas : variables `@click_x` et `@click_y`
- Formulaire : seulement sous forme de bouton de formulaire
- Couche

# Action entité

![bg right:65%](media/qgisfr2024_actions/action_feature.png)

# Action couche

![bg right:65%](media/qgisfr2024_actions/action_layer.png)

# Les actions dans la barre d'outil

![height:500](media/qgisfr2024_actions/action-in-menu.png)

# Les actions depuis la carte avec le bouton information

![height:500](media/qgisfr2024_actions/action-in-map.png)

# Les actions dans le formulaire

![height:500](media/qgisfr2024_actions/action-in-form.png)

# Les Véloroutes et Voies Vertes 🚲

https://www.velo-territoires.org/politiques-cyclables/data-velo-modeles-donnees/geostandard-veloroutes-voies-vertes/

<!-- _class: lead gaia-->

#

![bg](media/qgisfr2024_actions/veloroute_cote_vermeille.png)


# Une véloroute ?

Une **véloroute** est un **itinéraire cyclable** de moyenne ou longue distance, **continu** (sans interruption, y compris dans les villes), adapté à la circulation à vélo (sécurité, balisage).

La **véloroute** permet de mettre en place des itinéraires cyclables sur de **grandes distances**, en exploitant notamment le réseau de routes secondaires très dense et peu fréquenté.

#

![bg](media/qgisfr2024_actions/veloroute_cerdagne-capcir.png)

# Une voie verte ?

Une **voie verte** est un aménagement en **site propre** exclusivement réservée aux déplacements des véhicules **non motorisés** et des piétons et interdite aux cavaliers.

| Véhicule      | Autorisation |
|---------------| ------------ |
| 🚶 Piéton     | ✅           |
| 🛴 Trotinette | ✅           |
| 🚲 Vélo       | ✅           |
| 🏇 Cheval     | ❌           |
| 🛵 Scoot      | ❌           |
| 🏍 Moto       | ❌           |
| 🚗 Voiture    | ❌           |
| 🚚 Camionette | ❌           |
| 🚛 Camion     | ❌           |
| 🚜 Tracteur   | ❌           |


#

![bg](media/qgisfr2024_actions/veloroute_vallee_tet.png)

# Le réseau des Pyrénées Orientales

![bg right:55%](media/qgisfr2024_actions/Brochure_comptage-véloroute_2022.png)

* **EuroVelo 8** : Véloroute de la Méditerranée - tronçon de Barcelone à Béziers
* **V81** : Véloroute du piémont pyrénéen - de Perpignan à Bayonne
* **Pirinexus** : Boucle Le Boulou, Prats-de-molo, Olot, Gérone, Sant Feliu de Gixols, L'Escala, le Perthus
* **V300** : Véloroute Perpignan Thuir

# Géostandard véloroutes et voies vertes 🚲

https://www.velo-territoires.org/politiques-cyclables/data-velo-modeles-donnees/geostandard-veloroutes-voies-vertes/


<!-- _class: lead gaia-->

# Le modèle conceptuel COVADIS 3V

- segments (géographiques)
- portions (composés de segments)
- itinéraires (composés d'itinéraires)

![modele](media/qgisfr2024_actions/vvv-modele-conceptuel.png)

# Le modèle physique COVADIS 3V

- segments (géographiques)
- Elements
- portions (composés de segments)
- Etapes
- itinéraires (composés d'itinéraires)

![modele](media/qgisfr2024_actions/vvv-modele-physique.png)

# Comment exploiter ce modèle 3V dans QGIS ? 🚲

https://docs.3liz.org/qgis-veloroutes_voies_vertes-plugin/

<!-- _class: lead gaia-->

# Comment visualiser les données 3V dans QGIS ?

![height:500](media/qgisfr2024_actions/vvv-qgis-view.png)

# Comment faciliter la saisie des données 3V dans QGIS ?

![height:500](media/qgisfr2024_actions/vvv-qgis-forms.png)

# Comment faciliter la saisie des données 3V dans QGIS ?

![height:100](media/qgis-icon-small.png)

* Comment créer une portion facilement en gérant les éléments ?
* Comment créer facilement un itinéraire en gérant les étapes ?
* Comment couper un segment en conservant les portions ?
* Comment supprimer ou ajouter un segment d'une portion ?
* Comment supprimer ou ajouter une portion d'un itinéraire ?

![height:100](media/qgis-icon-small.png)

# Avec des Actions !!!

![height:400](media/qgisfr2024_actions/vvv-qgis-actions-segment.png)

# Avec des Actions !!!

![height:400](media/qgisfr2024_actions/vvv-qgis-actions-portion.png)

# Avec des Actions !!!

![height:400](media/qgisfr2024_actions/vvv-qgis-actions-itineraire.png)

# Merci pour votre attention

Des questions ?

![bg right:45%](media/qgisfr2024_actions/fond.png)
