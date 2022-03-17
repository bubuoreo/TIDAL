# Projet fil-rouge TIDAL equipe 10

## Introduction  
L'objectif du projet fil rouge est de pouvoir réaliser un site web avec un hébergement sur un serveur au sein de la machine afin de se familiariser avec des outils et des langages de programmation comme PHP et Smarty par exemple.  
Afin de mettre en pratique les connaissances, nous proposons la réalisation d'un site internet avec quelques pages ainsi qu'une base de données sur une association d'acupuncture.


## Equipe
L'équipe responsable de ce projet est l'équipe numéro 10 constitué de :  
- Alexandre BURLOT
- Maxime CURRAL
- Romain GALMIER
- Romain GAUD
- Fares ZAGHOUANE

## Permission pour le htaccess
Nous avons mis en place un systeme de routage sur notre site, celui-ci passe pas un systeme de réécriture d'url 
pour cela nous avons du ajouter un fichier .htaccess qui va nous donner les règles de réecritrure d'url 

Afin de faire en sorte que le fichier soit bien lu et pris en compte par le serveur, il faut venir modifier la configuration du fichier
de configuration apache `/etc/apache2/apache2.conf` 
```bash
<Directory /var/www/>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
</Directory>
```
## Creation du fichier template_c pour faire marcher smarty

Afin de pouvoir utilier smarty correctement, nous devons lui accroder les droit de creation et execution.
nous pouvons accorder a smarty les droits sur tous le dossier: 
```bash
sudo chown -R tidal:www-data /var/www/html
sudo chmod -R ug+rw /var/www/html
```
ou bien simplement sur les dossiers utiles
1. Creer un dossier templates_c dans le dossier html
2. Lui attribuer la permission à www-data
```
sudo chown -R www-data templates_c
```
3. Mettre la permission:
```
sudo chmod -R 770 templates_c/
```
4. Refaire la meme chose pour le dossier smarty


## Travail accompli depuis l'évaluation en scéance

- Réalisation des sessions utilisateurs
- Routes en PHP
- Appels depuis la base de données
- Recherche par mot clé
- Conditions de tri
- Affichage patho depuis le choix des critères
- Améliorations CSS
- Resolution fonctionnement smarty
- ajout niveau admin plus acces route speciale reserve admin 
- affichage recherce par mot cle plus affichage tous les symptomes (filtres)

## Privilèges utilisateurs dans $_SESSION["status"]
|numéro|        état                        |
|------|------------------------------------|   
|   0  | utilisateur non connecté           |
|   1  | utilisateur identifié              |
|   2  | admin                              |

## Comptes de tests
|  user |  mdp  |
|-------|-------|
| root  | root  |
| test  | test  |
## Webographie

- https://developer.mozilla.org
- https://www.smarty.net/
- 
