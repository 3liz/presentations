---
marp: true
title: Journée Professionnelle OpenIG 2024 - Lizmap et l'aide à l'optimisation d'un projet QGIS pour le Web
paginate: true
theme: gaia
class: invert
header: '![height:30px](media/logo_3liz.png)'
footer: '![height:30px](media/jpopenig-2023/logo.png) Journée Professionelle OpenIG 2024'
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

# Lizmap et l'aide à l'optimisation d'un projet QGIS pour le Web

René-Luc DHONT, 3liz

![height:100](media/qgis-icon-small.png)

![height:100](media/postgis-logo.png)


![bg right](media/logo_lizmap.png)

# 3Liz

- Fondé en **2007**
  - Initialement SSLL SIG
  - Développement autour de PostGIS, MapServer, OpenLayers, etc

- Depuis **2011**
  - Éditeur Open Source avec la publication de **Lizmap**
  - Centré autour de QGIS / QGIS Server / PostgreSQL+PostGIS / Lizmap

💎

- Toujours **Open Source** https://github.com/3liz/
- Contributeurs QGIS **core** (essentiellement serveur)
- Hébergement, Installation, Maintenance, Développement, Formation, Conseil, Assistance

# Petits rappels sur QGIS Server et Lizmap

![height:100](media/logo_lizmap_small.png)

![height:100](media/qgis-icon-small.png)


<!-- _class: lead gaia-->

# QGIS **n'est pas seulement** une application bureautique

C'est aussi :

- Un serveur SIG 🚀 **QGIS Server**
- Des applications mobiles 📱 **QField** et Mergin
- Un lanceur d'algorithmes ⚙ de manipulation de données **qgis_processing**

Ils exploitent tous le même cœur 💎

![height:100](media/qgis-icon-small.png)

# QGIS Server

- Utilise des **projets QGIS**
- Propose le **même rendu** 🚀
- La **certification OGC** depuis 2018 : WMS, WFS, WMTS...
- Nouvelle OGC API Features
- **Rapport de tests récent**: http://test.qgis.org/ogc_cite/ogcapif/latest/report.html

![height:100](media/qgis-icon-small.png)

- **Extensible** - Plugin Python
- Des requêtes non standard - **GetPrint**, GetLegendGraphics JSON, etc

# Au dessus de QGIS Serveur

- Lizmap Web Client
- **Préparer sur QGIS bureautique, déployer sur Lizmap**
- Github, Open Source : Mozilla Public Licence
- **Proxy** à QGIS Serveur
- Administration Web pour la gestion des utilisateurs et droits.
- Toutes les autres configurations dans QGIS bureautique.

![height:100](media/logo_lizmap_small.png)

- Création **No Code** d'Application Web Cartographique
- **QGIS Bureautique** comme outil de création et publication

# Fonctionnalités principales

* Multi-projets
* Gestion des droits d'accès (répertoire, projet, couche, filtre utilisateur)
* Consultation et Interrogation
* Arbre des couches
* Outils de mesures
* Outils de dessin
* Impression
* Outils d'édition
* Graphiques
* Géolocalisation

![height:100](media/logo_lizmap_small.png)

# Améliorations de la version 3.7 de Lizmap Web Client

![height:100](media/logo_lizmap_small.png)

<!-- _class: lead gaia-->


# Améliorations de la version 3.7 de Lizmap Web Client : Arbre des couches

![legend height:500](media/lwc-3-7-2/legend.png)

# Améliorations de la version 3.7 de Lizmap Web Client : Mise en page

![print-plugin](media/lwc-3-7-2/print-plugin.png)

# Améliorations de la version 3.7 de Lizmap Web Client : Ajout de données en relation depuis le parent

![add-child height:500](media/lwc-3-7-2/add-child.gif)

# Améliorations de la version 3.7 de Lizmap Web Client : Edition de données en relation depuis le parent

![edit-from-parent height:500](media/lwc-3-7-2/edit-from-parent.gif)

# Améliorations de la version 3.7 de Lizmap Web Client : Dessin ajout de texte

![draw-text](media/lwc-3-7-2/draw-text.png)

# Améliorations de la version 3.7 de Lizmap Web Client : Dessin avec contraintes

![draw-constraints](media/lwc-3-7-2/draw-constraints.gif)

# Améliorations de la version 3.7 de Lizmap Web Client : Des actions de projet et de couche

![actions](media/lwc-3-7-2/actions.png)


Inspiré par les **actions QGIS**, les actions Lizmap permettent d'exécuter une **fonction PostgreSQL** avec pour contexte un objet vectoriel, une couche, ou simplement la vue du projet.

# Validation et optimisation des projets QGIS pour le Web

![height:100](media/logo_lizmap_small.png)

![height:100](media/qgis-icon-small.png)


<!-- _class: lead gaia-->

# Validation et optimisation des projets QGIS pour le Web : contrôles

![height:500](media/lizmap-plugin-4/table_controles.png)

# Validation et optimisation des projets QGIS pour le Web : explications

![height:500](media/lizmap-plugin-4/controles-explications.png)

# Validation et optimisation des projets QGIS pour le Web : auto-corrections

![height:500](media/lizmap-plugin-4/auto-corrections.png)

# Validation et optimisation des projets QGIS pour le Web : Paramètres débutant

![height:500](media/lizmap-plugin-4/parametres-debutant.png)

# Validation et optimisation des projets QGIS pour le Web : Paramètres avancés

![height:500](media/lizmap-plugin-4/parametres-avances.png)

# Validation et optimisation des projets QGIS pour le Web : Les contrôles bloquants

- 💥 Espace en début/fin dans le nom de la couche/du groupe
- 💥 L'URL de la Géoplateforme française contient un jeton d'authentification
- 💥 Raster ECW
- 💥 Base de données d'authentification
- 💥 Service PostgreSQL
- 💥 Utilisateur et/ou mot de passe PostgreSQL
- 💥 Autre lecteur (réseau ou local)
- 💥 Dossier parent

# Validation et optimisation des projets QGIS pour le Web : Les contrôles bloquants

- 🔒 Connexion SSL à une base de données PostgreSQL
- 🚀 Métadonnées estimées
- 🚀 Simplification géométrique côté fournisseur
- 🚀 Le raster n'a pas de pyramide
- 🚀 Projet de confiance sur les métadonnées
- 🚀 Ne pas utiliser les identifiants des couches comme nom
- 🛑 La couche n'est pas publiée dans le WFS
- 🛑 Le champ n'est pas publié dans le WFS
- 🛑 Groupe "baselayers" vide

# Validation et optimisation des projets QGIS pour le Web : Les contrôles importants

- 🚀 Clés pirmaires de type entier simple pour les couches de base de données PostgreSQL
- 🛑 Nom de couche ou de groupe dupliqué
- 🛑 Validité OGC (serveur QGIS)

# Merci pour votre attention !

![height:100](media/logo_lizmap_small.png)

![height:100](media/qgis-icon-small.png)

![height:100](media/postgis-logo.png)


<!-- _class: lead gaia-->
