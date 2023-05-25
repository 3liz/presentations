---
marp: true
title: OpenIG 2023 - Publier une carte d'occupation du sol avec Lizmap
paginate: true
theme: gaia
class: invert
header: ''
footer: '![height:50px](media/openig_2023_lizmap/logo_openig.png) OpenIG 2023 - Occupation du sol dans Lizmap'
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


# Publier une carte d'occupation du sol avec Lizmap

![bg right height:300](media/openig_2023_lizmap/logo_lizmap.png)

Journée professionnelle
OpenIG 2023
![height:100](media/openig_2023_lizmap/logo_openig.png)

Michaël DOUCHIN, 3liz
Lizmap https://lizmap.Com

![height:80](media/logo/logo_3liz.png)



# Les données

<!-- _class: lead gaia-->

#  Occupation du sol open-data du Grand Narbonne

![image height:500px](media/openig_2023_lizmap/00_portail_openig.jpg)

# Dans QGIS

![bg right:60%](media/openig_2023_lizmap/02_donnees_brutes.png)

* 2 couches : **occupation du sol** et **évolution** 2018/2021
* Nomenclature Excel avec **les couleurs** des classes
* Pas de **code INSEE**

# Préparation

Utilisation de l'algorithme **Intersection** de ![height:40](media/logo/qgis_logo_full.png)

* Limiter à **quelques communes** pour la démo
* **Re-découper** les zonages
* Ajouter le **code de la commune** `code_insee`
* Recalcul des **surfaces en hectare** `$area / 10000`

![image height:500px](media/openig_2023_lizmap/03_donnees_traitee.png)

# Organisation et renommage des couches

![image height:700px](media/openig_2023_lizmap/04_arbre_des_couches.png)

# Lecture de la nomenclature

![image height:700px](media/openig_2023_lizmap/05_nomenclature.png)


# Mise en forme des données

![image height:700px](media/openig_2023_lizmap/06_styles_des_couches.png)

# Publier dans Lizmap Web Client
![bg right height:300](media/openig_2023_lizmap/logo_lizmap.png)
<!-- _class: lead gaia-->

# Utilisation du plugin Lizmap

* On l'installe
* On l'ouvre et on ajoute l'URL du serveur
* On valide, et on publie sur le serveur

![image height:600px](media/openig_2023_lizmap/07_plugin_lizmap.png)

# Première carte

[Voir le résultat](https://demo.snap.lizmap.com/lizmap_3_6/index.php/view/map?repository=miscellaneous&project=demo_ocsol_3_lizmap)

![image height:500px](media/openig_2023_lizmap/08_premiere_carte_lizmap.png)

# Ajout des graphiques dans le plugin Lizmap

* Choisir le **type de graphique**: camembert, diagramme en bâtons, etc.
* Choisir les **informations**: titre, description, etc.
* Choisir la **couche source** et les champs **abscisse et ordonnée(s)**

![image height:400px](media/openig_2023_lizmap/09_plugin_lizmap_dataviz.png)

# Carte avec les graphiques

[Voir le résultat](https://demo.snap.lizmap.com/lizmap_3_6/index.php/view/map?repository=miscellaneous&project=demo_ocsol_4_dataviz)

![image height:500px](media/openig_2023_lizmap/10_carte_avec_premier_dataviz.png)


# Mettre en couleurs les graphiques

* une **jointure** avec le fichier de **nomenclature**
* une **expression QGIS** pour créer une couleur compatible
* chaque couche a un **nouveau champ** `color`

![image height:500px](media/openig_2023_lizmap/11_ajout_champ_couleur.png)


# Cartes avec les graphique en couleur

[Voir le résultat](https://demo.snap.lizmap.com/lizmap_3_6/index.php/view/map?repository=miscellaneous&project=demo_ocsol_5_dataviz_couleur)

![image height:500px](media/openig_2023_lizmap/12_carte_avec_graphique_en_couleur.png)

# Mise en relation des données et filtre en cascade

* Créer des **relations dans QGIS**
* Modifier la **configuration Lizmap** pour les exploiter
* Ajouter la **localisation par commune** et activer **le filtrage**
* Ajouter d'**autres graphiques** `HTML` pour la démo

![image height:500px](media/openig_2023_lizmap/13_relations_dans_qgis.png)

# Carte d'occupation du sol finalisée

[Voir le résultat](https://demo.snap.lizmap.com/lizmap_3_6/index.php/view/map?repository=miscellaneous&project=occupation_sol)

![image height:500px](media/openig_2023_lizmap/fond_ccl.png)

# Conclusion

* **QGIS** permet :
  * de **visualiser, préparer et importer** des données SIG d'occupation du sol
  * de préparer des **projets cartographique** de mise en valeur des données
* **Lizmap Web Client**, basé sur **QGIS Server**, permet :
  * de proposer à des utilisateurs des **cartes en ligne** pour découvrir les données d'occupation du sol
  * d'**illustrer ces données** à l'aide de graphique basés sur les données vectorielles
  * de mettre les **données en relation** pour filtrer les graphiques à partir des données

# Merci de votre attention !

**Web** : https://lizmap.com - **Twitter** ![width:50px](media/openig_2023_lizmap/logo_lizmap_small.png) @LizmapForQGIS


![height:550px](media/openig_2023_lizmap/fond_ccl.png)
