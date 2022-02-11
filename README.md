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
