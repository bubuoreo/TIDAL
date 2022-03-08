# TIDAL
Création site vitrine association acupuncteur

# Mon petit morceau de code avorté
DROP TABLE IF EXISTS public.userTable;
CREATE TABLE userTable (
  number INTEGER NOT NULL,
  "user" character varying(40) 
	        DEFAULT NULL,
  "password" character varying(40) 
	        DEFAULT NULL,
);
INSERT INTO public.userTable(number,"user","password") VALUES
(1,"user","password")
;

# Creation du fichier template_c pour faire marcher smarty

1. Creer un dossier templates_c dans le dossier html
2. Lui attribuer la permission à www-data
```
sudo chown -R    templates_c
```
3. Mettre la permission:
```
sudo chmod -R 770 templates_c/
```
4. Refaire la meme chose pour le dossier smarty

# Note avec la db (Résolu!)
Due a la manièere dont à été formaté la table **userTable**, les données sorties sont dans des curly brackets. **DB modifiée**.

 Fatal error: Uncaught --> Smarty: Unable to load template 'file:../view/template/index.tpl' <-- thrown in /var/www/html/smarty/libs/sysplugins/smarty_internal_template.php on line 195