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
sudo chown -R www-data templates_c
```
3. Mettre la permission:
```
sudo chmod -R 770 templates_c/
```
4. Refaire la meme chose pour le dossier smarty
