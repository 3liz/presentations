---
marp: true
title: Comment utiliser des données OSM dans QGIS
paginate: true
theme: gaia
class: invert
header: '![height:30px](media/logo/osm_logo.png) ![height:30px](media/heart.png) ![height:30px](media/logo/qgis_letter.png)'
footer: '![height:30px](media/events/sotm-fr-2022.svg) SOTM-FR - Nantes 2022'
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

# Comment utiliser des données OSM dan QGIS
<!-- _class: lead gaia-->
<br/>

![height:80px](media/logo/osm_logo.png) ![height:80px](media/heart.png) ![height:80px](media/logo/qgis_letter.png)

Vecteur, raster, base de données, docker, Overpass, tuile raster, tuile vecteur…

Quoi utiliser ?

<br/>

*Etienne Trimaille*

![height:80px](media/logo_3liz.png)

# QGIS, l'application bureautique

<!-- _class: lead gaia-->

![height:500px](media/about-qgis-screenshot.png)

*Données OSM vecteur*

# Modèle de données OSM

![bg contain right:45%](media/osm/data-model.png)

| OSM      	| SIG     	|
|----------	|---------	|
| Node     	| Point   	|
| Way      	| Ligne    	|
| Relation 	| Polygone 	|

* Un way OSM peut soit être une ligne en SIG ou alors un polygone. selon ses tags (clé/valeur)
* Une relation OSM peut être soit un point, une ligne,un polygone, une multiligne, un multipolygone, géométrie générique...

# Modèle de données OSM

Une autre différence ➡ **les attributs**

* En SIG, la **couche** a un ou plusieurs **champs**, définissant **toutes** les entités de cette couche

* Dans OSM, la **couche** **n'existe pas**. Chaque entité est individuelle et possède ses propres champs.

#
<!-- _class: lead gaia-->

Et donc ....

les données OSM dans QGIS ne seront jamais à l'identique que les données OSM brutes

#
<!-- _class: lead gaia-->

## De plus, il faut se poser quelques questions

# Est-ce que vous avez besoin…

* d'avoir des données OSM très à jour ?
* de travailler sur une petite emprise ou alors une grande emprise ?
  * À propos, qu'est-ce qu'une petite ou une grande emprise ? (pour une API en ligne)
  * Densité de données dans les différentes parties du monde
* d'avoir les métadonnées OSM comme le contributeur, le numéro du changeset, la date et l'heure, numéro de version etc ?
* données pour l'affichage d'une carte, de l'analyse spatiale, du calcul d'itinéraire, du géocodage ou … ?
* toutes les clées et les valeurs d'OSM ou un sous-ensemble ?

#
<!-- _class: lead gaia-->

## Il n'y a pas qu'une seule réponse

#
<!-- _class: lead gaia-->

## Regardons ce qui est possible

# Avec QGIS seulement

* Avoir le thème **mapnik** comme un raster, depuis *l'explorateur*

![height:400px](media/osm/qgis-browser.png)

# Avec QGIS seulement

* Des outils en ligne existent pour transformer les données en format SIG (SHP, Geopackage, ...)
* https://download.geofabrik.de/
* https://www.data.data-wax.com/ France et autres pays, symbologie QGIS, GitHub (➡ capture ci-dessus)
* Portail data.gouv https://www.data.gouv.fr (présentation Région Sud par ex)

![bg contain right:45%](media/osm/osm2igeo.jpg)

# Avec QGIS seulement

![bg contain right:45%](media/osm/pbf.png)

* Charger un fichier OSM XML ou PBF
  * Grâce à GDAL/OGR en fond
* Plusieurs sites pour télécharger ces fichiers, à l'échelle mondiale :
  * http://download.openstreetmap.fr/extracts/
  * https://download.geofabrik.de/
  * ...

# Avec QGIS seulement

* Si on souhaite certains champ précis, cela se complique légérement
* Ce champ `other_tags` est de type **HStore**

![height:250px](media/osm/pbf-attribute-table.png)

# Utiliser QGIS Processing pour l'exploser

Menu  "traitements" ➡ "Boite à outils"

![height:500px](media/osm/explode-hstore.png)

# Ou alors une expression QGIS

![height:360px](media/osm/htsore-expression.png)

pour faire de la sélection, de l'étiquettage ...

# Avec des extensions QGIS

Certaines extensions concernent OSM parmi les 914 extensions disponibles dans le gestionnaire de QGIS 😎

![height:400px](media/osm/plugins.png)

# Extension QuickMapServices

![height:400px](media/osm/quick-map-services.png)

*OpenTopoMap* en fond, basé sur OSM, destiné à la randonnée 🏔

# Extension QuickMapServices

![height:400px](media/osm/quick-map-services.gif)

Dans *QuickMapServices*, aller dans *Settings* ➡ *More services* ➡ *Get contributed pack* pour activer **plusieurs** fonds de carte 🚀.

# Extension QuickOSM

* Télécharger les données à la volée
* Permet de faire des requêtes à Overpass, similaire à Overpass-Turbo
  * Serveur pour récupérer les données OSM brutes en utilisant un langage de requête OQL
* QuickOSM 2.1.0 arrive **très prochainement**
* L'extension cible 
  * les non contributeurs OSM, qui ne connaissent pas forcément les clés/valeurs
  * et aussi les experts de l'Overpass
* Suppression du champ HStore `other_tags` en l'explosant 
* Cela utilise une API, donc limite sur la quantité de donnée

# Requête rapide

* Recherche dans la langue native de l'utilisateur
  * 🇬🇧 `Bakery`
  * 🇩🇪 `Bäckerei`
  * 🇫🇷 `Boulangerie`
  * ➡ `shop=bakery` dans OSM
* Plusieurs clés/valeurs sont désormais possibles avec les opérateurs `AND`/`OR`

![](media/osm/presets.png)

* *Merci aux communautés JOSM et Vespucci pour le dépôt GitHub*

# Requête rapide

*French people love 🥖 and 🧀*

![height:400px](media/osm/quick-query.gif)

# Thème de carte

* Permet le téléchargement de **plusieurs** couches, plusieurs types d'objets, avec une symbologie QGIS en **2** clics

![height:400px](media/osm/map-preset.png)

# Thème de carte

![height:400px](media/osm/edit-preset.png)

# Thème de carte

<!-- _class: lead gaia-->

![height:400px](media/we-need-you.jpg)

*Carte cyclable*, *occupation du sol*, *cadastre*,...

https://docs.3liz.org/QuickOSM/user-guide/map-preset/

# QuickOSM dans Processing

* Disponible dans la **boîte à outils** et dans le modeleur Processing
* Traitement par lot possible dans Processing
* Exemple : téléchargement des bornes incendies, reprojection en 2154, zone tampon, application d'une symbologie, import dans une base de données PostGIS

![height:400px](media/osm/processing.png)

# QuickOSM dans Processing

![height:400px](media/osm/quickosm-processing.gif)

# Fichier OSM local

* Lire un fichier OSM XML/PBG local, filtrage sur clé/valeur

![height:400px](media/osm/osm-file.gif)

# Quelques astuces rapides dans QuickOSM

<!-- _class: lead gaia-->

# Recharger une requête pour mettre à jour les données OSM

<!-- _class: lead gaia-->

![height:500px](media/osm/reload-query.png)

# Faire des requêtes sur plusieurs villes avec `;`

<!-- _class: lead gaia-->

![height:90px](media/osm/many-places.png)

# Actions disponibles par défaut

<!-- _class: lead gaia-->

![height:400px](media/osm/actions.png)

# Geocodage

* Nouveau dans QGIS 3.20 🌟
* Plus besoin d'extension
* https://nominatim.qgis.org
* Algorithme Processing dans le modeleur ou pour du traitement par lot
![height:400px](media/osm/geocoding-nominatim.png)

# Geocodage

* Nouveau dans QGIS 3.20 🌟
* Plus besoin d'extension
* https://nominatim.qgis.org
* Intégration dans le localiseur

![height:400px](media/osm/locator.gif)

# Routage

* ORS Tools
* API avec les données OSM
* Isochrones, matrice de distances

![height:400px](media/osm/ors-tools.png)

# Importer OSM dans une base de données ?

https://wiki.openstreetmap.org/wiki/Databases_and_data_access_APIs#Database_Schemas

![height:300px](media/osm/db-schema.png)

* Principalement **osm2pgsql**, utilisé pour du rendu, projet assez vieux mais très utilisé
* Imposm, version **3** peut-être mise à jour. Chaque couche PostGIS possède sa propre configuration : clé/valeur, généralisation etc

# Base de données avec docker

* 🐘 and 🐳
* https://github.com/kartoza/docker-osm
* Projet docker-compose :
  * Conteneur PostgreSQL
  * Conteneur Imposm
  * Conteneur OSMUpdate : pour télécharger les diff régulièrement
* Méthodologie
  * Un fichier PBF dans le dossier
  * Zone d'intérêt pour le découpage
  * Copier la configuration d'exemple `.example.env` en `.env` pour les paramètres locaux par défaut
  * `make run`

# et voila !

![bg contain right:45%](media/osm/docker-osm-pgadmin.png)

Possible de personnaliser la configuration :
  * Le **mapping**
  * Généralisation pour différentes échelles
  * Mise à jour toutes les 2 minutes par défaut
  * Fichier SQL pour trigger, vues
  * Symbologie dans la table `layer_styles`, propre à QGIS

# Tuile vecteurs

* Support des tuiles vecteurs, nouveau dans QGIS 3.14 🌟
* MapTiler / OpenMapTiles https://openmaptiles.org/
* Présentations du vendredi après-midi

# Questions

<!-- _class: lead gaia-->

Ceci est juste un aperçu des possibilités.
Il existe encore d'autres extensions, etc

<br />

*Etienne*
🐦 @etrimaille
