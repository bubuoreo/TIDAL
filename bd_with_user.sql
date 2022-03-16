--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5 (Debian 13.5-0+deb11u1)
-- Dumped by pg_dump version 13.5 (Debian 13.5-0+deb11u1)

-- Started on 2022-03-16 08:44:31 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE acudb;
--
-- TOC entry 3039 (class 1262 OID 16385)
-- Name: acudb; Type: DATABASE; Schema: -; Owner: pgtidal
--

CREATE DATABASE acudb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


ALTER DATABASE acudb OWNER TO pgtidal;

\connect acudb

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 200 (class 1259 OID 16442)
-- Name: keysympt; Type: TABLE; Schema: public; Owner: pgtidal
--

CREATE TABLE public.keysympt (
    idk integer NOT NULL,
    ids integer NOT NULL
);


ALTER TABLE public.keysympt OWNER TO pgtidal;

--
-- TOC entry 3040 (class 0 OID 0)
-- Dependencies: 200
-- Name: TABLE keysympt; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON TABLE public.keysympt IS 'Relations entre Symptômes et Mots-clé (many-to-many)';


--
-- TOC entry 3041 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN keysympt.idk; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON COLUMN public.keysympt.idk IS 'Clé étrangère, référence keywords.idK';


--
-- TOC entry 3042 (class 0 OID 0)
-- Dependencies: 200
-- Name: COLUMN keysympt.ids; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON COLUMN public.keysympt.ids IS 'Clé étrangère, référence symptome.idS';


--
-- TOC entry 201 (class 1259 OID 16447)
-- Name: keywords; Type: TABLE; Schema: public; Owner: pgtidal
--

CREATE TABLE public.keywords (
    idk integer NOT NULL,
    name character varying(40) DEFAULT NULL::character varying
);


ALTER TABLE public.keywords OWNER TO pgtidal;

--
-- TOC entry 3043 (class 0 OID 0)
-- Dependencies: 201
-- Name: TABLE keywords; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON TABLE public.keywords IS 'Mots-clés';


--
-- TOC entry 3044 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN keywords.idk; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON COLUMN public.keywords.idk IS 'Clé primaire (id) du mot-clé';


--
-- TOC entry 3045 (class 0 OID 0)
-- Dependencies: 201
-- Name: COLUMN keywords.name; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON COLUMN public.keywords.name IS 'Libellé du mot-clé';


--
-- TOC entry 202 (class 1259 OID 16453)
-- Name: meridien; Type: TABLE; Schema: public; Owner: pgtidal
--

CREATE TABLE public.meridien (
    code character varying(5) NOT NULL,
    nom character varying(20) NOT NULL,
    element character varying(1) NOT NULL,
    yin boolean NOT NULL
);


ALTER TABLE public.meridien OWNER TO pgtidal;

--
-- TOC entry 3046 (class 0 OID 0)
-- Dependencies: 202
-- Name: TABLE meridien; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON TABLE public.meridien IS 'Méridiens';


--
-- TOC entry 3047 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN meridien.code; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON COLUMN public.meridien.code IS 'Code du méridien';


--
-- TOC entry 3048 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN meridien.nom; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON COLUMN public.meridien.nom IS 'Nom du méridien';


--
-- TOC entry 3049 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN meridien.element; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON COLUMN public.meridien.element IS 'Elément';


--
-- TOC entry 3050 (class 0 OID 0)
-- Dependencies: 202
-- Name: COLUMN meridien.yin; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON COLUMN public.meridien.yin IS 'Vrai si yin';


--
-- TOC entry 203 (class 1259 OID 16459)
-- Name: patho; Type: TABLE; Schema: public; Owner: pgtidal
--

CREATE TABLE public.patho (
    idp integer NOT NULL,
    mer character varying(5) NOT NULL,
    type character varying(10) NOT NULL,
    "desc" character varying(50) NOT NULL
);


ALTER TABLE public.patho OWNER TO pgtidal;

--
-- TOC entry 3051 (class 0 OID 0)
-- Dependencies: 203
-- Name: TABLE patho; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON TABLE public.patho IS 'Pathologies';


--
-- TOC entry 3052 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN patho.idp; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON COLUMN public.patho.idp IS 'Clé primaire (id) de la pathologie';


--
-- TOC entry 3053 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN patho.mer; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON COLUMN public.patho.mer IS 'Code du méridien';


--
-- TOC entry 3054 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN patho.type; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON COLUMN public.patho.type IS 'Type de la pathologie';


--
-- TOC entry 3055 (class 0 OID 0)
-- Dependencies: 203
-- Name: COLUMN patho."desc"; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON COLUMN public.patho."desc" IS 'Description de la pathologie';


--
-- TOC entry 204 (class 1259 OID 16465)
-- Name: symptome; Type: TABLE; Schema: public; Owner: pgtidal
--

CREATE TABLE public.symptome (
    ids integer NOT NULL,
    "desc" character varying(256) NOT NULL
);


ALTER TABLE public.symptome OWNER TO pgtidal;

--
-- TOC entry 3056 (class 0 OID 0)
-- Dependencies: 204
-- Name: TABLE symptome; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON TABLE public.symptome IS 'Symptômes';


--
-- TOC entry 3057 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN symptome.ids; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON COLUMN public.symptome.ids IS 'Clé primaire (id) du symptôme';


--
-- TOC entry 3058 (class 0 OID 0)
-- Dependencies: 204
-- Name: COLUMN symptome."desc"; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON COLUMN public.symptome."desc" IS 'Description du symptôme';


--
-- TOC entry 205 (class 1259 OID 16470)
-- Name: symptpatho; Type: TABLE; Schema: public; Owner: pgtidal
--

CREATE TABLE public.symptpatho (
    ids integer NOT NULL,
    idp integer NOT NULL,
    aggr boolean DEFAULT false NOT NULL
);


ALTER TABLE public.symptpatho OWNER TO pgtidal;

--
-- TOC entry 3059 (class 0 OID 0)
-- Dependencies: 205
-- Name: TABLE symptpatho; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON TABLE public.symptpatho IS 'Relations entre Symptômes et Pathologies (many-to-many)';


--
-- TOC entry 3060 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN symptpatho.ids; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON COLUMN public.symptpatho.ids IS 'Clé étrangère, référence symptome.idS';


--
-- TOC entry 3061 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN symptpatho.idp; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON COLUMN public.symptpatho.idp IS 'Clé étrangère, référence patho.idP';


--
-- TOC entry 3062 (class 0 OID 0)
-- Dependencies: 205
-- Name: COLUMN symptpatho.aggr; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON COLUMN public.symptpatho.aggr IS 'Vrai si symptôme d''aggravation';


--
-- TOC entry 207 (class 1259 OID 16479)
-- Name: userTable; Type: TABLE; Schema: public; Owner: pgtidal
--

CREATE TABLE public."userTable" (
    id integer NOT NULL,
    username character varying(64) NOT NULL,
    password character varying(64) NOT NULL,
    email character varying(64) NOT NULL
);


ALTER TABLE public."userTable" OWNER TO pgtidal;

--
-- TOC entry 3063 (class 0 OID 0)
-- Dependencies: 207
-- Name: TABLE "userTable"; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON TABLE public."userTable" IS 'Table des utilisateurs';


--
-- TOC entry 206 (class 1259 OID 16477)
-- Name: userTable_id_seq; Type: SEQUENCE; Schema: public; Owner: pgtidal
--

ALTER TABLE public."userTable" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."userTable_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3026 (class 0 OID 16442)
-- Dependencies: 200
-- Data for Name: keysympt; Type: TABLE DATA; Schema: public; Owner: pgtidal
--

INSERT INTO public.keysympt (idk, ids) VALUES (3, 61);
INSERT INTO public.keysympt (idk, ids) VALUES (4, 61);
INSERT INTO public.keysympt (idk, ids) VALUES (4, 124);
INSERT INTO public.keysympt (idk, ids) VALUES (5, 61);
INSERT INTO public.keysympt (idk, ids) VALUES (5, 64);
INSERT INTO public.keysympt (idk, ids) VALUES (6, 256);
INSERT INTO public.keysympt (idk, ids) VALUES (6, 391);
INSERT INTO public.keysympt (idk, ids) VALUES (7, 1);
INSERT INTO public.keysympt (idk, ids) VALUES (7, 2);
INSERT INTO public.keysympt (idk, ids) VALUES (7, 22);
INSERT INTO public.keysympt (idk, ids) VALUES (7, 86);
INSERT INTO public.keysympt (idk, ids) VALUES (7, 93);
INSERT INTO public.keysympt (idk, ids) VALUES (7, 94);
INSERT INTO public.keysympt (idk, ids) VALUES (7, 97);
INSERT INTO public.keysympt (idk, ids) VALUES (7, 100);
INSERT INTO public.keysympt (idk, ids) VALUES (7, 102);
INSERT INTO public.keysympt (idk, ids) VALUES (7, 177);
INSERT INTO public.keysympt (idk, ids) VALUES (7, 179);
INSERT INTO public.keysympt (idk, ids) VALUES (7, 249);
INSERT INTO public.keysympt (idk, ids) VALUES (9, 4);
INSERT INTO public.keysympt (idk, ids) VALUES (9, 260);
INSERT INTO public.keysympt (idk, ids) VALUES (10, 29);
INSERT INTO public.keysympt (idk, ids) VALUES (10, 345);
INSERT INTO public.keysympt (idk, ids) VALUES (11, 6);
INSERT INTO public.keysympt (idk, ids) VALUES (12, 24);
INSERT INTO public.keysympt (idk, ids) VALUES (13, 87);
INSERT INTO public.keysympt (idk, ids) VALUES (13, 248);
INSERT INTO public.keysympt (idk, ids) VALUES (13, 283);
INSERT INTO public.keysympt (idk, ids) VALUES (14, 108);
INSERT INTO public.keysympt (idk, ids) VALUES (14, 130);
INSERT INTO public.keysympt (idk, ids) VALUES (14, 180);
INSERT INTO public.keysympt (idk, ids) VALUES (14, 199);
INSERT INTO public.keysympt (idk, ids) VALUES (14, 397);
INSERT INTO public.keysympt (idk, ids) VALUES (15, 76);
INSERT INTO public.keysympt (idk, ids) VALUES (16, 71);
INSERT INTO public.keysympt (idk, ids) VALUES (17, 17);
INSERT INTO public.keysympt (idk, ids) VALUES (18, 39);
INSERT INTO public.keysympt (idk, ids) VALUES (19, 28);
INSERT INTO public.keysympt (idk, ids) VALUES (19, 185);
INSERT INTO public.keysympt (idk, ids) VALUES (20, 10);
INSERT INTO public.keysympt (idk, ids) VALUES (21, 11);
INSERT INTO public.keysympt (idk, ids) VALUES (22, 123);
INSERT INTO public.keysympt (idk, ids) VALUES (23, 12);
INSERT INTO public.keysympt (idk, ids) VALUES (24, 86);
INSERT INTO public.keysympt (idk, ids) VALUES (24, 288);
INSERT INTO public.keysympt (idk, ids) VALUES (25, 13);
INSERT INTO public.keysympt (idk, ids) VALUES (26, 83);
INSERT INTO public.keysympt (idk, ids) VALUES (27, 8);
INSERT INTO public.keysympt (idk, ids) VALUES (27, 120);
INSERT INTO public.keysympt (idk, ids) VALUES (27, 197);
INSERT INTO public.keysympt (idk, ids) VALUES (27, 326);
INSERT INTO public.keysympt (idk, ids) VALUES (27, 327);
INSERT INTO public.keysympt (idk, ids) VALUES (28, 358);
INSERT INTO public.keysympt (idk, ids) VALUES (29, 221);
INSERT INTO public.keysympt (idk, ids) VALUES (30, 63);
INSERT INTO public.keysympt (idk, ids) VALUES (30, 109);
INSERT INTO public.keysympt (idk, ids) VALUES (30, 136);
INSERT INTO public.keysympt (idk, ids) VALUES (30, 350);
INSERT INTO public.keysympt (idk, ids) VALUES (31, 72);
INSERT INTO public.keysympt (idk, ids) VALUES (31, 245);
INSERT INTO public.keysympt (idk, ids) VALUES (32, 17);
INSERT INTO public.keysympt (idk, ids) VALUES (32, 18);
INSERT INTO public.keysympt (idk, ids) VALUES (32, 117);
INSERT INTO public.keysympt (idk, ids) VALUES (33, 352);
INSERT INTO public.keysympt (idk, ids) VALUES (34, 110);
INSERT INTO public.keysympt (idk, ids) VALUES (34, 123);
INSERT INTO public.keysympt (idk, ids) VALUES (34, 347);
INSERT INTO public.keysympt (idk, ids) VALUES (35, 221);
INSERT INTO public.keysympt (idk, ids) VALUES (36, 54);
INSERT INTO public.keysympt (idk, ids) VALUES (36, 99);
INSERT INTO public.keysympt (idk, ids) VALUES (36, 347);
INSERT INTO public.keysympt (idk, ids) VALUES (37, 20);
INSERT INTO public.keysympt (idk, ids) VALUES (37, 21);
INSERT INTO public.keysympt (idk, ids) VALUES (38, 22);
INSERT INTO public.keysympt (idk, ids) VALUES (38, 23);
INSERT INTO public.keysympt (idk, ids) VALUES (39, 176);
INSERT INTO public.keysympt (idk, ids) VALUES (40, 285);
INSERT INTO public.keysympt (idk, ids) VALUES (41, 381);
INSERT INTO public.keysympt (idk, ids) VALUES (42, 80);
INSERT INTO public.keysympt (idk, ids) VALUES (42, 314);
INSERT INTO public.keysympt (idk, ids) VALUES (43, 218);
INSERT INTO public.keysympt (idk, ids) VALUES (44, 333);
INSERT INTO public.keysympt (idk, ids) VALUES (45, 26);
INSERT INTO public.keysympt (idk, ids) VALUES (46, 321);
INSERT INTO public.keysympt (idk, ids) VALUES (47, 27);
INSERT INTO public.keysympt (idk, ids) VALUES (47, 28);
INSERT INTO public.keysympt (idk, ids) VALUES (47, 39);
INSERT INTO public.keysympt (idk, ids) VALUES (47, 42);
INSERT INTO public.keysympt (idk, ids) VALUES (47, 74);
INSERT INTO public.keysympt (idk, ids) VALUES (47, 185);
INSERT INTO public.keysympt (idk, ids) VALUES (47, 200);
INSERT INTO public.keysympt (idk, ids) VALUES (47, 277);
INSERT INTO public.keysympt (idk, ids) VALUES (47, 309);
INSERT INTO public.keysympt (idk, ids) VALUES (47, 310);
INSERT INTO public.keysympt (idk, ids) VALUES (48, 99);
INSERT INTO public.keysympt (idk, ids) VALUES (48, 110);
INSERT INTO public.keysympt (idk, ids) VALUES (48, 139);
INSERT INTO public.keysympt (idk, ids) VALUES (48, 347);
INSERT INTO public.keysympt (idk, ids) VALUES (49, 219);
INSERT INTO public.keysympt (idk, ids) VALUES (50, 71);
INSERT INTO public.keysympt (idk, ids) VALUES (51, 31);
INSERT INTO public.keysympt (idk, ids) VALUES (52, 32);
INSERT INTO public.keysympt (idk, ids) VALUES (53, 222);
INSERT INTO public.keysympt (idk, ids) VALUES (54, 304);
INSERT INTO public.keysympt (idk, ids) VALUES (55, 33);
INSERT INTO public.keysympt (idk, ids) VALUES (55, 34);
INSERT INTO public.keysympt (idk, ids) VALUES (55, 372);
INSERT INTO public.keysympt (idk, ids) VALUES (56, 346);
INSERT INTO public.keysympt (idk, ids) VALUES (57, 35);
INSERT INTO public.keysympt (idk, ids) VALUES (58, 35);
INSERT INTO public.keysympt (idk, ids) VALUES (59, 27);
INSERT INTO public.keysympt (idk, ids) VALUES (59, 38);
INSERT INTO public.keysympt (idk, ids) VALUES (59, 39);
INSERT INTO public.keysympt (idk, ids) VALUES (59, 40);
INSERT INTO public.keysympt (idk, ids) VALUES (59, 57);
INSERT INTO public.keysympt (idk, ids) VALUES (59, 315);
INSERT INTO public.keysympt (idk, ids) VALUES (59, 318);
INSERT INTO public.keysympt (idk, ids) VALUES (60, 1);
INSERT INTO public.keysympt (idk, ids) VALUES (60, 36);
INSERT INTO public.keysympt (idk, ids) VALUES (60, 37);
INSERT INTO public.keysympt (idk, ids) VALUES (60, 42);
INSERT INTO public.keysympt (idk, ids) VALUES (60, 100);
INSERT INTO public.keysympt (idk, ids) VALUES (60, 186);
INSERT INTO public.keysympt (idk, ids) VALUES (60, 231);
INSERT INTO public.keysympt (idk, ids) VALUES (61, 9);
INSERT INTO public.keysympt (idk, ids) VALUES (62, 43);
INSERT INTO public.keysympt (idk, ids) VALUES (63, 55);
INSERT INTO public.keysympt (idk, ids) VALUES (63, 302);
INSERT INTO public.keysympt (idk, ids) VALUES (64, 121);
INSERT INTO public.keysympt (idk, ids) VALUES (64, 130);
INSERT INTO public.keysympt (idk, ids) VALUES (65, 59);
INSERT INTO public.keysympt (idk, ids) VALUES (66, 30);
INSERT INTO public.keysympt (idk, ids) VALUES (66, 31);
INSERT INTO public.keysympt (idk, ids) VALUES (66, 95);
INSERT INTO public.keysympt (idk, ids) VALUES (66, 101);
INSERT INTO public.keysympt (idk, ids) VALUES (66, 137);
INSERT INTO public.keysympt (idk, ids) VALUES (66, 167);
INSERT INTO public.keysympt (idk, ids) VALUES (66, 255);
INSERT INTO public.keysympt (idk, ids) VALUES (66, 286);
INSERT INTO public.keysympt (idk, ids) VALUES (66, 363);
INSERT INTO public.keysympt (idk, ids) VALUES (66, 364);
INSERT INTO public.keysympt (idk, ids) VALUES (67, 44);
INSERT INTO public.keysympt (idk, ids) VALUES (67, 45);
INSERT INTO public.keysympt (idk, ids) VALUES (68, 46);
INSERT INTO public.keysympt (idk, ids) VALUES (69, 89);
INSERT INTO public.keysympt (idk, ids) VALUES (69, 90);
INSERT INTO public.keysympt (idk, ids) VALUES (69, 112);
INSERT INTO public.keysympt (idk, ids) VALUES (69, 394);
INSERT INTO public.keysympt (idk, ids) VALUES (70, 226);
INSERT INTO public.keysympt (idk, ids) VALUES (71, 47);
INSERT INTO public.keysympt (idk, ids) VALUES (72, 48);
INSERT INTO public.keysympt (idk, ids) VALUES (72, 342);
INSERT INTO public.keysympt (idk, ids) VALUES (73, 49);
INSERT INTO public.keysympt (idk, ids) VALUES (73, 50);
INSERT INTO public.keysympt (idk, ids) VALUES (73, 51);
INSERT INTO public.keysympt (idk, ids) VALUES (74, 53);
INSERT INTO public.keysympt (idk, ids) VALUES (74, 58);
INSERT INTO public.keysympt (idk, ids) VALUES (74, 232);
INSERT INTO public.keysympt (idk, ids) VALUES (74, 341);
INSERT INTO public.keysympt (idk, ids) VALUES (74, 348);
INSERT INTO public.keysympt (idk, ids) VALUES (74, 393);
INSERT INTO public.keysympt (idk, ids) VALUES (75, 54);
INSERT INTO public.keysympt (idk, ids) VALUES (75, 120);
INSERT INTO public.keysympt (idk, ids) VALUES (75, 194);
INSERT INTO public.keysympt (idk, ids) VALUES (76, 65);
INSERT INTO public.keysympt (idk, ids) VALUES (77, 220);
INSERT INTO public.keysympt (idk, ids) VALUES (77, 316);
INSERT INTO public.keysympt (idk, ids) VALUES (77, 349);
INSERT INTO public.keysympt (idk, ids) VALUES (78, 23);
INSERT INTO public.keysympt (idk, ids) VALUES (79, 55);
INSERT INTO public.keysympt (idk, ids) VALUES (80, 84);
INSERT INTO public.keysympt (idk, ids) VALUES (80, 278);
INSERT INTO public.keysympt (idk, ids) VALUES (80, 290);
INSERT INTO public.keysympt (idk, ids) VALUES (82, 207);
INSERT INTO public.keysympt (idk, ids) VALUES (83, 57);
INSERT INTO public.keysympt (idk, ids) VALUES (83, 58);
INSERT INTO public.keysympt (idk, ids) VALUES (83, 105);
INSERT INTO public.keysympt (idk, ids) VALUES (83, 108);
INSERT INTO public.keysympt (idk, ids) VALUES (83, 148);
INSERT INTO public.keysympt (idk, ids) VALUES (83, 151);
INSERT INTO public.keysympt (idk, ids) VALUES (83, 225);
INSERT INTO public.keysympt (idk, ids) VALUES (84, 15);
INSERT INTO public.keysympt (idk, ids) VALUES (84, 53);
INSERT INTO public.keysympt (idk, ids) VALUES (84, 54);
INSERT INTO public.keysympt (idk, ids) VALUES (84, 110);
INSERT INTO public.keysympt (idk, ids) VALUES (85, 232);
INSERT INTO public.keysympt (idk, ids) VALUES (86, 354);
INSERT INTO public.keysympt (idk, ids) VALUES (87, 60);
INSERT INTO public.keysympt (idk, ids) VALUES (87, 61);
INSERT INTO public.keysympt (idk, ids) VALUES (87, 62);
INSERT INTO public.keysympt (idk, ids) VALUES (87, 63);
INSERT INTO public.keysympt (idk, ids) VALUES (87, 64);
INSERT INTO public.keysympt (idk, ids) VALUES (88, 333);
INSERT INTO public.keysympt (idk, ids) VALUES (89, 7);
INSERT INTO public.keysympt (idk, ids) VALUES (89, 393);
INSERT INTO public.keysympt (idk, ids) VALUES (90, 121);
INSERT INTO public.keysympt (idk, ids) VALUES (90, 397);
INSERT INTO public.keysympt (idk, ids) VALUES (91, 8);
INSERT INTO public.keysympt (idk, ids) VALUES (92, 103);
INSERT INTO public.keysympt (idk, ids) VALUES (92, 119);
INSERT INTO public.keysympt (idk, ids) VALUES (92, 120);
INSERT INTO public.keysympt (idk, ids) VALUES (92, 250);
INSERT INTO public.keysympt (idk, ids) VALUES (93, 66);
INSERT INTO public.keysympt (idk, ids) VALUES (94, 72);
INSERT INTO public.keysympt (idk, ids) VALUES (94, 205);
INSERT INTO public.keysympt (idk, ids) VALUES (94, 245);
INSERT INTO public.keysympt (idk, ids) VALUES (94, 352);
INSERT INTO public.keysympt (idk, ids) VALUES (95, 96);
INSERT INTO public.keysympt (idk, ids) VALUES (95, 116);
INSERT INTO public.keysympt (idk, ids) VALUES (96, 67);
INSERT INTO public.keysympt (idk, ids) VALUES (97, 68);
INSERT INTO public.keysympt (idk, ids) VALUES (97, 155);
INSERT INTO public.keysympt (idk, ids) VALUES (98, 83);
INSERT INTO public.keysympt (idk, ids) VALUES (99, 69);
INSERT INTO public.keysympt (idk, ids) VALUES (100, 32);
INSERT INTO public.keysympt (idk, ids) VALUES (100, 171);
INSERT INTO public.keysympt (idk, ids) VALUES (100, 338);
INSERT INTO public.keysympt (idk, ids) VALUES (100, 339);
INSERT INTO public.keysympt (idk, ids) VALUES (101, 201);
INSERT INTO public.keysympt (idk, ids) VALUES (102, 67);
INSERT INTO public.keysympt (idk, ids) VALUES (102, 70);
INSERT INTO public.keysympt (idk, ids) VALUES (102, 287);
INSERT INTO public.keysympt (idk, ids) VALUES (103, 261);
INSERT INTO public.keysympt (idk, ids) VALUES (104, 74);
INSERT INTO public.keysympt (idk, ids) VALUES (105, 52);
INSERT INTO public.keysympt (idk, ids) VALUES (105, 171);
INSERT INTO public.keysympt (idk, ids) VALUES (106, 75);
INSERT INTO public.keysympt (idk, ids) VALUES (106, 76);
INSERT INTO public.keysympt (idk, ids) VALUES (106, 77);
INSERT INTO public.keysympt (idk, ids) VALUES (106, 78);
INSERT INTO public.keysympt (idk, ids) VALUES (106, 79);
INSERT INTO public.keysympt (idk, ids) VALUES (106, 80);
INSERT INTO public.keysympt (idk, ids) VALUES (106, 81);
INSERT INTO public.keysympt (idk, ids) VALUES (107, 76);
INSERT INTO public.keysympt (idk, ids) VALUES (108, 314);
INSERT INTO public.keysympt (idk, ids) VALUES (109, 85);
INSERT INTO public.keysympt (idk, ids) VALUES (109, 249);
INSERT INTO public.keysympt (idk, ids) VALUES (111, 77);
INSERT INTO public.keysympt (idk, ids) VALUES (112, 88);
INSERT INTO public.keysympt (idk, ids) VALUES (112, 125);
INSERT INTO public.keysympt (idk, ids) VALUES (112, 152);
INSERT INTO public.keysympt (idk, ids) VALUES (112, 213);
INSERT INTO public.keysympt (idk, ids) VALUES (112, 291);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 30);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 31);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 40);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 49);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 85);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 87);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 89);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 91);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 93);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 95);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 97);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 98);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 100);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 101);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 102);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 104);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 105);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 106);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 108);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 110);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 112);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 113);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 114);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 117);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 118);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 119);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 129);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 130);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 136);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 137);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 138);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 178);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 202);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 207);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 213);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 229);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 251);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 253);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 283);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 286);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 316);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 341);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 349);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 391);
INSERT INTO public.keysympt (idk, ids) VALUES (113, 392);
INSERT INTO public.keysympt (idk, ids) VALUES (114, 134);
INSERT INTO public.keysympt (idk, ids) VALUES (114, 278);
INSERT INTO public.keysympt (idk, ids) VALUES (114, 334);
INSERT INTO public.keysympt (idk, ids) VALUES (115, 305);
INSERT INTO public.keysympt (idk, ids) VALUES (116, 38);
INSERT INTO public.keysympt (idk, ids) VALUES (117, 146);
INSERT INTO public.keysympt (idk, ids) VALUES (117, 294);
INSERT INTO public.keysympt (idk, ids) VALUES (118, 39);
INSERT INTO public.keysympt (idk, ids) VALUES (118, 42);
INSERT INTO public.keysympt (idk, ids) VALUES (118, 147);
INSERT INTO public.keysympt (idk, ids) VALUES (118, 148);
INSERT INTO public.keysympt (idk, ids) VALUES (118, 182);
INSERT INTO public.keysympt (idk, ids) VALUES (118, 319);
INSERT INTO public.keysympt (idk, ids) VALUES (118, 388);
INSERT INTO public.keysympt (idk, ids) VALUES (119, 149);
INSERT INTO public.keysympt (idk, ids) VALUES (120, 294);
INSERT INTO public.keysympt (idk, ids) VALUES (121, 212);
INSERT INTO public.keysympt (idk, ids) VALUES (122, 88);
INSERT INTO public.keysympt (idk, ids) VALUES (122, 109);
INSERT INTO public.keysympt (idk, ids) VALUES (122, 151);
INSERT INTO public.keysympt (idk, ids) VALUES (122, 152);
INSERT INTO public.keysympt (idk, ids) VALUES (122, 396);
INSERT INTO public.keysympt (idk, ids) VALUES (123, 118);
INSERT INTO public.keysympt (idk, ids) VALUES (124, 65);
INSERT INTO public.keysympt (idk, ids) VALUES (124, 153);
INSERT INTO public.keysympt (idk, ids) VALUES (125, 154);
INSERT INTO public.keysympt (idk, ids) VALUES (126, 3);
INSERT INTO public.keysympt (idk, ids) VALUES (127, 155);
INSERT INTO public.keysympt (idk, ids) VALUES (128, 127);
INSERT INTO public.keysympt (idk, ids) VALUES (128, 145);
INSERT INTO public.keysympt (idk, ids) VALUES (128, 175);
INSERT INTO public.keysympt (idk, ids) VALUES (129, 157);
INSERT INTO public.keysympt (idk, ids) VALUES (130, 126);
INSERT INTO public.keysympt (idk, ids) VALUES (131, 172);
INSERT INTO public.keysympt (idk, ids) VALUES (132, 158);
INSERT INTO public.keysympt (idk, ids) VALUES (132, 250);
INSERT INTO public.keysympt (idk, ids) VALUES (133, 16);
INSERT INTO public.keysympt (idk, ids) VALUES (133, 159);
INSERT INTO public.keysympt (idk, ids) VALUES (133, 257);
INSERT INTO public.keysympt (idk, ids) VALUES (133, 308);
INSERT INTO public.keysympt (idk, ids) VALUES (134, 60);
INSERT INTO public.keysympt (idk, ids) VALUES (135, 299);
INSERT INTO public.keysympt (idk, ids) VALUES (136, 100);
INSERT INTO public.keysympt (idk, ids) VALUES (136, 160);
INSERT INTO public.keysympt (idk, ids) VALUES (136, 161);
INSERT INTO public.keysympt (idk, ids) VALUES (136, 209);
INSERT INTO public.keysympt (idk, ids) VALUES (136, 350);
INSERT INTO public.keysympt (idk, ids) VALUES (137, 4);
INSERT INTO public.keysympt (idk, ids) VALUES (137, 157);
INSERT INTO public.keysympt (idk, ids) VALUES (137, 260);
INSERT INTO public.keysympt (idk, ids) VALUES (137, 317);
INSERT INTO public.keysympt (idk, ids) VALUES (138, 162);
INSERT INTO public.keysympt (idk, ids) VALUES (139, 186);
INSERT INTO public.keysympt (idk, ids) VALUES (140, 163);
INSERT INTO public.keysympt (idk, ids) VALUES (140, 164);
INSERT INTO public.keysympt (idk, ids) VALUES (140, 165);
INSERT INTO public.keysympt (idk, ids) VALUES (140, 373);
INSERT INTO public.keysympt (idk, ids) VALUES (141, 7);
INSERT INTO public.keysympt (idk, ids) VALUES (141, 188);
INSERT INTO public.keysympt (idk, ids) VALUES (141, 211);
INSERT INTO public.keysympt (idk, ids) VALUES (142, 192);
INSERT INTO public.keysympt (idk, ids) VALUES (142, 210);
INSERT INTO public.keysympt (idk, ids) VALUES (143, 166);
INSERT INTO public.keysympt (idk, ids) VALUES (144, 167);
INSERT INTO public.keysympt (idk, ids) VALUES (145, 39);
INSERT INTO public.keysympt (idk, ids) VALUES (147, 23);
INSERT INTO public.keysympt (idk, ids) VALUES (147, 169);
INSERT INTO public.keysympt (idk, ids) VALUES (147, 170);
INSERT INTO public.keysympt (idk, ids) VALUES (148, 23);
INSERT INTO public.keysympt (idk, ids) VALUES (148, 57);
INSERT INTO public.keysympt (idk, ids) VALUES (148, 99);
INSERT INTO public.keysympt (idk, ids) VALUES (148, 100);
INSERT INTO public.keysympt (idk, ids) VALUES (148, 158);
INSERT INTO public.keysympt (idk, ids) VALUES (148, 164);
INSERT INTO public.keysympt (idk, ids) VALUES (148, 170);
INSERT INTO public.keysympt (idk, ids) VALUES (148, 171);
INSERT INTO public.keysympt (idk, ids) VALUES (148, 172);
INSERT INTO public.keysympt (idk, ids) VALUES (148, 173);
INSERT INTO public.keysympt (idk, ids) VALUES (148, 231);
INSERT INTO public.keysympt (idk, ids) VALUES (148, 233);
INSERT INTO public.keysympt (idk, ids) VALUES (148, 250);
INSERT INTO public.keysympt (idk, ids) VALUES (148, 318);
INSERT INTO public.keysympt (idk, ids) VALUES (148, 320);
INSERT INTO public.keysympt (idk, ids) VALUES (149, 16);
INSERT INTO public.keysympt (idk, ids) VALUES (149, 34);
INSERT INTO public.keysympt (idk, ids) VALUES (149, 357);
INSERT INTO public.keysympt (idk, ids) VALUES (150, 174);
INSERT INTO public.keysympt (idk, ids) VALUES (151, 176);
INSERT INTO public.keysympt (idk, ids) VALUES (151, 177);
INSERT INTO public.keysympt (idk, ids) VALUES (151, 178);
INSERT INTO public.keysympt (idk, ids) VALUES (152, 20);
INSERT INTO public.keysympt (idk, ids) VALUES (153, 201);
INSERT INTO public.keysympt (idk, ids) VALUES (154, 7);
INSERT INTO public.keysympt (idk, ids) VALUES (154, 103);
INSERT INTO public.keysympt (idk, ids) VALUES (154, 211);
INSERT INTO public.keysympt (idk, ids) VALUES (154, 250);
INSERT INTO public.keysympt (idk, ids) VALUES (155, 175);
INSERT INTO public.keysympt (idk, ids) VALUES (156, 57);
INSERT INTO public.keysympt (idk, ids) VALUES (156, 179);
INSERT INTO public.keysympt (idk, ids) VALUES (156, 180);
INSERT INTO public.keysympt (idk, ids) VALUES (156, 181);
INSERT INTO public.keysympt (idk, ids) VALUES (157, 10);
INSERT INTO public.keysympt (idk, ids) VALUES (157, 42);
INSERT INTO public.keysympt (idk, ids) VALUES (157, 107);
INSERT INTO public.keysympt (idk, ids) VALUES (157, 182);
INSERT INTO public.keysympt (idk, ids) VALUES (157, 183);
INSERT INTO public.keysympt (idk, ids) VALUES (157, 184);
INSERT INTO public.keysympt (idk, ids) VALUES (157, 225);
INSERT INTO public.keysympt (idk, ids) VALUES (157, 310);
INSERT INTO public.keysympt (idk, ids) VALUES (157, 311);
INSERT INTO public.keysympt (idk, ids) VALUES (158, 322);
INSERT INTO public.keysympt (idk, ids) VALUES (159, 337);
INSERT INTO public.keysympt (idk, ids) VALUES (160, 114);
INSERT INTO public.keysympt (idk, ids) VALUES (160, 115);
INSERT INTO public.keysympt (idk, ids) VALUES (160, 250);
INSERT INTO public.keysympt (idk, ids) VALUES (161, 186);
INSERT INTO public.keysympt (idk, ids) VALUES (161, 230);
INSERT INTO public.keysympt (idk, ids) VALUES (162, 187);
INSERT INTO public.keysympt (idk, ids) VALUES (163, 188);
INSERT INTO public.keysympt (idk, ids) VALUES (164, 190);
INSERT INTO public.keysympt (idk, ids) VALUES (165, 191);
INSERT INTO public.keysympt (idk, ids) VALUES (166, 18);
INSERT INTO public.keysympt (idk, ids) VALUES (167, 193);
INSERT INTO public.keysympt (idk, ids) VALUES (168, 192);
INSERT INTO public.keysympt (idk, ids) VALUES (168, 308);
INSERT INTO public.keysympt (idk, ids) VALUES (169, 175);
INSERT INTO public.keysympt (idk, ids) VALUES (169, 178);
INSERT INTO public.keysympt (idk, ids) VALUES (170, 196);
INSERT INTO public.keysympt (idk, ids) VALUES (171, 197);
INSERT INTO public.keysympt (idk, ids) VALUES (172, 168);
INSERT INTO public.keysympt (idk, ids) VALUES (173, 132);
INSERT INTO public.keysympt (idk, ids) VALUES (174, 198);
INSERT INTO public.keysympt (idk, ids) VALUES (175, 199);
INSERT INTO public.keysympt (idk, ids) VALUES (175, 202);
INSERT INTO public.keysympt (idk, ids) VALUES (176, 181);
INSERT INTO public.keysympt (idk, ids) VALUES (177, 203);
INSERT INTO public.keysympt (idk, ids) VALUES (177, 294);
INSERT INTO public.keysympt (idk, ids) VALUES (178, 204);
INSERT INTO public.keysympt (idk, ids) VALUES (178, 205);
INSERT INTO public.keysympt (idk, ids) VALUES (178, 206);
INSERT INTO public.keysympt (idk, ids) VALUES (179, 115);
INSERT INTO public.keysympt (idk, ids) VALUES (180, 129);
INSERT INTO public.keysympt (idk, ids) VALUES (180, 241);
INSERT INTO public.keysympt (idk, ids) VALUES (181, 208);
INSERT INTO public.keysympt (idk, ids) VALUES (182, 100);
INSERT INTO public.keysympt (idk, ids) VALUES (182, 116);
INSERT INTO public.keysympt (idk, ids) VALUES (182, 161);
INSERT INTO public.keysympt (idk, ids) VALUES (182, 209);
INSERT INTO public.keysympt (idk, ids) VALUES (183, 242);
INSERT INTO public.keysympt (idk, ids) VALUES (184, 77);
INSERT INTO public.keysympt (idk, ids) VALUES (184, 263);
INSERT INTO public.keysympt (idk, ids) VALUES (184, 307);
INSERT INTO public.keysympt (idk, ids) VALUES (184, 308);
INSERT INTO public.keysympt (idk, ids) VALUES (184, 317);
INSERT INTO public.keysympt (idk, ids) VALUES (184, 367);
INSERT INTO public.keysympt (idk, ids) VALUES (184, 386);
INSERT INTO public.keysympt (idk, ids) VALUES (185, 210);
INSERT INTO public.keysympt (idk, ids) VALUES (186, 48);
INSERT INTO public.keysympt (idk, ids) VALUES (186, 147);
INSERT INTO public.keysympt (idk, ids) VALUES (186, 375);
INSERT INTO public.keysympt (idk, ids) VALUES (187, 42);
INSERT INTO public.keysympt (idk, ids) VALUES (187, 92);
INSERT INTO public.keysympt (idk, ids) VALUES (187, 212);
INSERT INTO public.keysympt (idk, ids) VALUES (187, 214);
INSERT INTO public.keysympt (idk, ids) VALUES (187, 215);
INSERT INTO public.keysympt (idk, ids) VALUES (187, 293);
INSERT INTO public.keysympt (idk, ids) VALUES (187, 338);
INSERT INTO public.keysympt (idk, ids) VALUES (188, 216);
INSERT INTO public.keysympt (idk, ids) VALUES (189, 27);
INSERT INTO public.keysympt (idk, ids) VALUES (189, 218);
INSERT INTO public.keysympt (idk, ids) VALUES (189, 219);
INSERT INTO public.keysympt (idk, ids) VALUES (189, 277);
INSERT INTO public.keysympt (idk, ids) VALUES (189, 339);
INSERT INTO public.keysympt (idk, ids) VALUES (190, 347);
INSERT INTO public.keysympt (idk, ids) VALUES (190, 348);
INSERT INTO public.keysympt (idk, ids) VALUES (191, 98);
INSERT INTO public.keysympt (idk, ids) VALUES (191, 117);
INSERT INTO public.keysympt (idk, ids) VALUES (191, 125);
INSERT INTO public.keysympt (idk, ids) VALUES (191, 221);
INSERT INTO public.keysympt (idk, ids) VALUES (191, 222);
INSERT INTO public.keysympt (idk, ids) VALUES (191, 283);
INSERT INTO public.keysympt (idk, ids) VALUES (192, 316);
INSERT INTO public.keysympt (idk, ids) VALUES (193, 118);
INSERT INTO public.keysympt (idk, ids) VALUES (193, 223);
INSERT INTO public.keysympt (idk, ids) VALUES (193, 343);
INSERT INTO public.keysympt (idk, ids) VALUES (194, 141);
INSERT INTO public.keysympt (idk, ids) VALUES (194, 142);
INSERT INTO public.keysympt (idk, ids) VALUES (194, 276);
INSERT INTO public.keysympt (idk, ids) VALUES (195, 113);
INSERT INTO public.keysympt (idk, ids) VALUES (195, 148);
INSERT INTO public.keysympt (idk, ids) VALUES (196, 224);
INSERT INTO public.keysympt (idk, ids) VALUES (197, 36);
INSERT INTO public.keysympt (idk, ids) VALUES (197, 37);
INSERT INTO public.keysympt (idk, ids) VALUES (197, 38);
INSERT INTO public.keysympt (idk, ids) VALUES (197, 40);
INSERT INTO public.keysympt (idk, ids) VALUES (197, 172);
INSERT INTO public.keysympt (idk, ids) VALUES (197, 244);
INSERT INTO public.keysympt (idk, ids) VALUES (197, 318);
INSERT INTO public.keysympt (idk, ids) VALUES (198, 13);
INSERT INTO public.keysympt (idk, ids) VALUES (199, 114);
INSERT INTO public.keysympt (idk, ids) VALUES (199, 115);
INSERT INTO public.keysympt (idk, ids) VALUES (200, 287);
INSERT INTO public.keysympt (idk, ids) VALUES (201, 228);
INSERT INTO public.keysympt (idk, ids) VALUES (202, 229);
INSERT INTO public.keysympt (idk, ids) VALUES (203, 131);
INSERT INTO public.keysympt (idk, ids) VALUES (204, 231);
INSERT INTO public.keysympt (idk, ids) VALUES (204, 232);
INSERT INTO public.keysympt (idk, ids) VALUES (205, 233);
INSERT INTO public.keysympt (idk, ids) VALUES (206, 29);
INSERT INTO public.keysympt (idk, ids) VALUES (207, 131);
INSERT INTO public.keysympt (idk, ids) VALUES (208, 106);
INSERT INTO public.keysympt (idk, ids) VALUES (209, 106);
INSERT INTO public.keysympt (idk, ids) VALUES (210, 123);
INSERT INTO public.keysympt (idk, ids) VALUES (211, 124);
INSERT INTO public.keysympt (idk, ids) VALUES (212, 41);
INSERT INTO public.keysympt (idk, ids) VALUES (212, 132);
INSERT INTO public.keysympt (idk, ids) VALUES (213, 14);
INSERT INTO public.keysympt (idk, ids) VALUES (213, 135);
INSERT INTO public.keysympt (idk, ids) VALUES (214, 14);
INSERT INTO public.keysympt (idk, ids) VALUES (214, 135);
INSERT INTO public.keysympt (idk, ids) VALUES (215, 122);
INSERT INTO public.keysympt (idk, ids) VALUES (216, 123);
INSERT INTO public.keysympt (idk, ids) VALUES (217, 68);
INSERT INTO public.keysympt (idk, ids) VALUES (217, 156);
INSERT INTO public.keysympt (idk, ids) VALUES (217, 227);
INSERT INTO public.keysympt (idk, ids) VALUES (217, 235);
INSERT INTO public.keysympt (idk, ids) VALUES (217, 236);
INSERT INTO public.keysympt (idk, ids) VALUES (217, 237);
INSERT INTO public.keysympt (idk, ids) VALUES (217, 238);
INSERT INTO public.keysympt (idk, ids) VALUES (217, 273);
INSERT INTO public.keysympt (idk, ids) VALUES (217, 301);
INSERT INTO public.keysympt (idk, ids) VALUES (217, 365);
INSERT INTO public.keysympt (idk, ids) VALUES (217, 366);
INSERT INTO public.keysympt (idk, ids) VALUES (218, 239);
INSERT INTO public.keysympt (idk, ids) VALUES (218, 240);
INSERT INTO public.keysympt (idk, ids) VALUES (219, 63);
INSERT INTO public.keysympt (idk, ids) VALUES (219, 64);
INSERT INTO public.keysympt (idk, ids) VALUES (219, 96);
INSERT INTO public.keysympt (idk, ids) VALUES (219, 116);
INSERT INTO public.keysympt (idk, ids) VALUES (220, 278);
INSERT INTO public.keysympt (idk, ids) VALUES (221, 242);
INSERT INTO public.keysympt (idk, ids) VALUES (221, 395);
INSERT INTO public.keysympt (idk, ids) VALUES (222, 24);
INSERT INTO public.keysympt (idk, ids) VALUES (222, 73);
INSERT INTO public.keysympt (idk, ids) VALUES (223, 243);
INSERT INTO public.keysympt (idk, ids) VALUES (224, 24);
INSERT INTO public.keysympt (idk, ids) VALUES (224, 56);
INSERT INTO public.keysympt (idk, ids) VALUES (224, 73);
INSERT INTO public.keysympt (idk, ids) VALUES (224, 143);
INSERT INTO public.keysympt (idk, ids) VALUES (224, 144);
INSERT INTO public.keysympt (idk, ids) VALUES (224, 154);
INSERT INTO public.keysympt (idk, ids) VALUES (224, 302);
INSERT INTO public.keysympt (idk, ids) VALUES (224, 355);
INSERT INTO public.keysympt (idk, ids) VALUES (225, 335);
INSERT INTO public.keysympt (idk, ids) VALUES (226, 16);
INSERT INTO public.keysympt (idk, ids) VALUES (227, 81);
INSERT INTO public.keysympt (idk, ids) VALUES (227, 360);
INSERT INTO public.keysympt (idk, ids) VALUES (228, 246);
INSERT INTO public.keysympt (idk, ids) VALUES (229, 312);
INSERT INTO public.keysympt (idk, ids) VALUES (230, 247);
INSERT INTO public.keysympt (idk, ids) VALUES (230, 248);
INSERT INTO public.keysympt (idk, ids) VALUES (230, 249);
INSERT INTO public.keysympt (idk, ids) VALUES (230, 250);
INSERT INTO public.keysympt (idk, ids) VALUES (230, 391);
INSERT INTO public.keysympt (idk, ids) VALUES (230, 392);
INSERT INTO public.keysympt (idk, ids) VALUES (231, 39);
INSERT INTO public.keysympt (idk, ids) VALUES (231, 74);
INSERT INTO public.keysympt (idk, ids) VALUES (231, 91);
INSERT INTO public.keysympt (idk, ids) VALUES (231, 126);
INSERT INTO public.keysympt (idk, ids) VALUES (231, 141);
INSERT INTO public.keysympt (idk, ids) VALUES (231, 142);
INSERT INTO public.keysympt (idk, ids) VALUES (231, 193);
INSERT INTO public.keysympt (idk, ids) VALUES (231, 216);
INSERT INTO public.keysympt (idk, ids) VALUES (231, 251);
INSERT INTO public.keysympt (idk, ids) VALUES (231, 276);
INSERT INTO public.keysympt (idk, ids) VALUES (231, 290);
INSERT INTO public.keysympt (idk, ids) VALUES (231, 307);
INSERT INTO public.keysympt (idk, ids) VALUES (231, 308);
INSERT INTO public.keysympt (idk, ids) VALUES (231, 378);
INSERT INTO public.keysympt (idk, ids) VALUES (231, 386);
INSERT INTO public.keysympt (idk, ids) VALUES (231, 387);
INSERT INTO public.keysympt (idk, ids) VALUES (231, 388);
INSERT INTO public.keysympt (idk, ids) VALUES (231, 389);
INSERT INTO public.keysympt (idk, ids) VALUES (232, 111);
INSERT INTO public.keysympt (idk, ids) VALUES (232, 127);
INSERT INTO public.keysympt (idk, ids) VALUES (233, 110);
INSERT INTO public.keysympt (idk, ids) VALUES (234, 252);
INSERT INTO public.keysympt (idk, ids) VALUES (235, 89);
INSERT INTO public.keysympt (idk, ids) VALUES (236, 108);
INSERT INTO public.keysympt (idk, ids) VALUES (237, 29);
INSERT INTO public.keysympt (idk, ids) VALUES (237, 32);
INSERT INTO public.keysympt (idk, ids) VALUES (237, 253);
INSERT INTO public.keysympt (idk, ids) VALUES (237, 276);
INSERT INTO public.keysympt (idk, ids) VALUES (237, 329);
INSERT INTO public.keysympt (idk, ids) VALUES (237, 330);
INSERT INTO public.keysympt (idk, ids) VALUES (237, 345);
INSERT INTO public.keysympt (idk, ids) VALUES (238, 102);
INSERT INTO public.keysympt (idk, ids) VALUES (239, 106);
INSERT INTO public.keysympt (idk, ids) VALUES (240, 138);
INSERT INTO public.keysympt (idk, ids) VALUES (241, 254);
INSERT INTO public.keysympt (idk, ids) VALUES (242, 319);
INSERT INTO public.keysympt (idk, ids) VALUES (243, 77);
INSERT INTO public.keysympt (idk, ids) VALUES (243, 374);
INSERT INTO public.keysympt (idk, ids) VALUES (244, 255);
INSERT INTO public.keysympt (idk, ids) VALUES (245, 106);
INSERT INTO public.keysympt (idk, ids) VALUES (245, 123);
INSERT INTO public.keysympt (idk, ids) VALUES (245, 124);
INSERT INTO public.keysympt (idk, ids) VALUES (245, 256);
INSERT INTO public.keysympt (idk, ids) VALUES (245, 257);
INSERT INTO public.keysympt (idk, ids) VALUES (246, 258);
INSERT INTO public.keysympt (idk, ids) VALUES (247, 195);
INSERT INTO public.keysympt (idk, ids) VALUES (247, 259);
INSERT INTO public.keysympt (idk, ids) VALUES (248, 36);
INSERT INTO public.keysympt (idk, ids) VALUES (248, 37);
INSERT INTO public.keysympt (idk, ids) VALUES (248, 318);
INSERT INTO public.keysympt (idk, ids) VALUES (249, 193);
INSERT INTO public.keysympt (idk, ids) VALUES (249, 194);
INSERT INTO public.keysympt (idk, ids) VALUES (249, 251);
INSERT INTO public.keysympt (idk, ids) VALUES (250, 183);
INSERT INTO public.keysympt (idk, ids) VALUES (250, 262);
INSERT INTO public.keysympt (idk, ids) VALUES (250, 263);
INSERT INTO public.keysympt (idk, ids) VALUES (251, 25);
INSERT INTO public.keysympt (idk, ids) VALUES (251, 151);
INSERT INTO public.keysympt (idk, ids) VALUES (251, 264);
INSERT INTO public.keysympt (idk, ids) VALUES (251, 265);
INSERT INTO public.keysympt (idk, ids) VALUES (251, 266);
INSERT INTO public.keysympt (idk, ids) VALUES (251, 267);
INSERT INTO public.keysympt (idk, ids) VALUES (251, 268);
INSERT INTO public.keysympt (idk, ids) VALUES (251, 269);
INSERT INTO public.keysympt (idk, ids) VALUES (251, 270);
INSERT INTO public.keysympt (idk, ids) VALUES (251, 271);
INSERT INTO public.keysympt (idk, ids) VALUES (251, 272);
INSERT INTO public.keysympt (idk, ids) VALUES (251, 398);
INSERT INTO public.keysympt (idk, ids) VALUES (252, 320);
INSERT INTO public.keysympt (idk, ids) VALUES (253, 168);
INSERT INTO public.keysympt (idk, ids) VALUES (253, 304);
INSERT INTO public.keysympt (idk, ids) VALUES (254, 351);
INSERT INTO public.keysympt (idk, ids) VALUES (255, 73);
INSERT INTO public.keysympt (idk, ids) VALUES (256, 274);
INSERT INTO public.keysympt (idk, ids) VALUES (257, 202);
INSERT INTO public.keysympt (idk, ids) VALUES (257, 246);
INSERT INTO public.keysympt (idk, ids) VALUES (258, 275);
INSERT INTO public.keysympt (idk, ids) VALUES (259, 276);
INSERT INTO public.keysympt (idk, ids) VALUES (260, 167);
INSERT INTO public.keysympt (idk, ids) VALUES (261, 172);
INSERT INTO public.keysympt (idk, ids) VALUES (261, 231);
INSERT INTO public.keysympt (idk, ids) VALUES (261, 315);
INSERT INTO public.keysympt (idk, ids) VALUES (261, 321);
INSERT INTO public.keysympt (idk, ids) VALUES (262, 277);
INSERT INTO public.keysympt (idk, ids) VALUES (263, 363);
INSERT INTO public.keysympt (idk, ids) VALUES (264, 279);
INSERT INTO public.keysympt (idk, ids) VALUES (265, 280);
INSERT INTO public.keysympt (idk, ids) VALUES (266, 95);
INSERT INTO public.keysympt (idk, ids) VALUES (267, 11);
INSERT INTO public.keysympt (idk, ids) VALUES (267, 104);
INSERT INTO public.keysympt (idk, ids) VALUES (267, 223);
INSERT INTO public.keysympt (idk, ids) VALUES (267, 278);
INSERT INTO public.keysympt (idk, ids) VALUES (267, 280);
INSERT INTO public.keysympt (idk, ids) VALUES (267, 281);
INSERT INTO public.keysympt (idk, ids) VALUES (268, 358);
INSERT INTO public.keysympt (idk, ids) VALUES (269, 282);
INSERT INTO public.keysympt (idk, ids) VALUES (270, 383);
INSERT INTO public.keysympt (idk, ids) VALUES (271, 80);
INSERT INTO public.keysympt (idk, ids) VALUES (272, 72);
INSERT INTO public.keysympt (idk, ids) VALUES (272, 228);
INSERT INTO public.keysympt (idk, ids) VALUES (272, 245);
INSERT INTO public.keysympt (idk, ids) VALUES (272, 291);
INSERT INTO public.keysympt (idk, ids) VALUES (272, 292);
INSERT INTO public.keysympt (idk, ids) VALUES (272, 352);
INSERT INTO public.keysympt (idk, ids) VALUES (273, 284);
INSERT INTO public.keysympt (idk, ids) VALUES (274, 334);
INSERT INTO public.keysympt (idk, ids) VALUES (275, 304);
INSERT INTO public.keysympt (idk, ids) VALUES (276, 287);
INSERT INTO public.keysympt (idk, ids) VALUES (277, 19);
INSERT INTO public.keysympt (idk, ids) VALUES (278, 288);
INSERT INTO public.keysympt (idk, ids) VALUES (279, 278);
INSERT INTO public.keysympt (idk, ids) VALUES (280, 120);
INSERT INTO public.keysympt (idk, ids) VALUES (280, 207);
INSERT INTO public.keysympt (idk, ids) VALUES (280, 248);
INSERT INTO public.keysympt (idk, ids) VALUES (281, 217);
INSERT INTO public.keysympt (idk, ids) VALUES (281, 322);
INSERT INTO public.keysympt (idk, ids) VALUES (282, 289);
INSERT INTO public.keysympt (idk, ids) VALUES (283, 92);
INSERT INTO public.keysympt (idk, ids) VALUES (284, 58);
INSERT INTO public.keysympt (idk, ids) VALUES (285, 293);
INSERT INTO public.keysympt (idk, ids) VALUES (285, 395);
INSERT INTO public.keysympt (idk, ids) VALUES (286, 298);
INSERT INTO public.keysympt (idk, ids) VALUES (286, 299);
INSERT INTO public.keysympt (idk, ids) VALUES (287, 142);
INSERT INTO public.keysympt (idk, ids) VALUES (288, 234);
INSERT INTO public.keysympt (idk, ids) VALUES (289, 100);
INSERT INTO public.keysympt (idk, ids) VALUES (290, 207);
INSERT INTO public.keysympt (idk, ids) VALUES (291, 25);
INSERT INTO public.keysympt (idk, ids) VALUES (291, 84);
INSERT INTO public.keysympt (idk, ids) VALUES (291, 88);
INSERT INTO public.keysympt (idk, ids) VALUES (291, 143);
INSERT INTO public.keysympt (idk, ids) VALUES (291, 295);
INSERT INTO public.keysympt (idk, ids) VALUES (291, 296);
INSERT INTO public.keysympt (idk, ids) VALUES (291, 297);
INSERT INTO public.keysympt (idk, ids) VALUES (291, 298);
INSERT INTO public.keysympt (idk, ids) VALUES (291, 299);
INSERT INTO public.keysympt (idk, ids) VALUES (291, 300);
INSERT INTO public.keysympt (idk, ids) VALUES (291, 325);
INSERT INTO public.keysympt (idk, ids) VALUES (292, 320);
INSERT INTO public.keysympt (idk, ids) VALUES (293, 56);
INSERT INTO public.keysympt (idk, ids) VALUES (294, 303);
INSERT INTO public.keysympt (idk, ids) VALUES (294, 331);
INSERT INTO public.keysympt (idk, ids) VALUES (295, 82);
INSERT INTO public.keysympt (idk, ids) VALUES (295, 148);
INSERT INTO public.keysympt (idk, ids) VALUES (295, 220);
INSERT INTO public.keysympt (idk, ids) VALUES (296, 39);
INSERT INTO public.keysympt (idk, ids) VALUES (296, 159);
INSERT INTO public.keysympt (idk, ids) VALUES (296, 219);
INSERT INTO public.keysympt (idk, ids) VALUES (296, 314);
INSERT INTO public.keysympt (idk, ids) VALUES (296, 365);
INSERT INTO public.keysympt (idk, ids) VALUES (296, 367);
INSERT INTO public.keysympt (idk, ids) VALUES (296, 376);
INSERT INTO public.keysympt (idk, ids) VALUES (296, 388);
INSERT INTO public.keysympt (idk, ids) VALUES (297, 363);
INSERT INTO public.keysympt (idk, ids) VALUES (297, 364);
INSERT INTO public.keysympt (idk, ids) VALUES (298, 207);
INSERT INTO public.keysympt (idk, ids) VALUES (299, 244);
INSERT INTO public.keysympt (idk, ids) VALUES (300, 56);
INSERT INTO public.keysympt (idk, ids) VALUES (300, 140);
INSERT INTO public.keysympt (idk, ids) VALUES (300, 144);
INSERT INTO public.keysympt (idk, ids) VALUES (300, 154);
INSERT INTO public.keysympt (idk, ids) VALUES (300, 189);
INSERT INTO public.keysympt (idk, ids) VALUES (300, 190);
INSERT INTO public.keysympt (idk, ids) VALUES (300, 217);
INSERT INTO public.keysympt (idk, ids) VALUES (300, 234);
INSERT INTO public.keysympt (idk, ids) VALUES (300, 235);
INSERT INTO public.keysympt (idk, ids) VALUES (300, 277);
INSERT INTO public.keysympt (idk, ids) VALUES (300, 306);
INSERT INTO public.keysympt (idk, ids) VALUES (300, 322);
INSERT INTO public.keysympt (idk, ids) VALUES (300, 352);
INSERT INTO public.keysympt (idk, ids) VALUES (300, 354);
INSERT INTO public.keysympt (idk, ids) VALUES (301, 307);
INSERT INTO public.keysympt (idk, ids) VALUES (302, 97);
INSERT INTO public.keysympt (idk, ids) VALUES (302, 181);
INSERT INTO public.keysympt (idk, ids) VALUES (303, 42);
INSERT INTO public.keysympt (idk, ids) VALUES (303, 377);
INSERT INTO public.keysympt (idk, ids) VALUES (304, 28);
INSERT INTO public.keysympt (idk, ids) VALUES (304, 39);
INSERT INTO public.keysympt (idk, ids) VALUES (304, 73);
INSERT INTO public.keysympt (idk, ids) VALUES (304, 215);
INSERT INTO public.keysympt (idk, ids) VALUES (304, 262);
INSERT INTO public.keysympt (idk, ids) VALUES (304, 309);
INSERT INTO public.keysympt (idk, ids) VALUES (304, 310);
INSERT INTO public.keysympt (idk, ids) VALUES (304, 311);
INSERT INTO public.keysympt (idk, ids) VALUES (305, 51);
INSERT INTO public.keysympt (idk, ids) VALUES (305, 68);
INSERT INTO public.keysympt (idk, ids) VALUES (305, 217);
INSERT INTO public.keysympt (idk, ids) VALUES (305, 306);
INSERT INTO public.keysympt (idk, ids) VALUES (305, 312);
INSERT INTO public.keysympt (idk, ids) VALUES (305, 313);
INSERT INTO public.keysympt (idk, ids) VALUES (305, 314);
INSERT INTO public.keysympt (idk, ids) VALUES (306, 5);
INSERT INTO public.keysympt (idk, ids) VALUES (306, 323);
INSERT INTO public.keysympt (idk, ids) VALUES (306, 324);
INSERT INTO public.keysympt (idk, ids) VALUES (307, 336);
INSERT INTO public.keysympt (idk, ids) VALUES (308, 259);
INSERT INTO public.keysympt (idk, ids) VALUES (309, 34);
INSERT INTO public.keysympt (idk, ids) VALUES (310, 33);
INSERT INTO public.keysympt (idk, ids) VALUES (311, 206);
INSERT INTO public.keysympt (idk, ids) VALUES (312, 325);
INSERT INTO public.keysympt (idk, ids) VALUES (313, 49);
INSERT INTO public.keysympt (idk, ids) VALUES (313, 50);
INSERT INTO public.keysympt (idk, ids) VALUES (313, 65);
INSERT INTO public.keysympt (idk, ids) VALUES (313, 326);
INSERT INTO public.keysympt (idk, ids) VALUES (314, 32);
INSERT INTO public.keysympt (idk, ids) VALUES (314, 276);
INSERT INTO public.keysympt (idk, ids) VALUES (314, 329);
INSERT INTO public.keysympt (idk, ids) VALUES (314, 330);
INSERT INTO public.keysympt (idk, ids) VALUES (315, 331);
INSERT INTO public.keysympt (idk, ids) VALUES (315, 332);
INSERT INTO public.keysympt (idk, ids) VALUES (316, 333);
INSERT INTO public.keysympt (idk, ids) VALUES (317, 335);
INSERT INTO public.keysympt (idk, ids) VALUES (317, 336);
INSERT INTO public.keysympt (idk, ids) VALUES (317, 337);
INSERT INTO public.keysympt (idk, ids) VALUES (318, 369);
INSERT INTO public.keysympt (idk, ids) VALUES (319, 340);
INSERT INTO public.keysympt (idk, ids) VALUES (320, 232);
INSERT INTO public.keysympt (idk, ids) VALUES (320, 341);
INSERT INTO public.keysympt (idk, ids) VALUES (321, 263);
INSERT INTO public.keysympt (idk, ids) VALUES (321, 337);
INSERT INTO public.keysympt (idk, ids) VALUES (322, 150);
INSERT INTO public.keysympt (idk, ids) VALUES (322, 283);
INSERT INTO public.keysympt (idk, ids) VALUES (322, 319);
INSERT INTO public.keysympt (idk, ids) VALUES (323, 105);
INSERT INTO public.keysympt (idk, ids) VALUES (323, 213);
INSERT INTO public.keysympt (idk, ids) VALUES (323, 342);
INSERT INTO public.keysympt (idk, ids) VALUES (323, 343);
INSERT INTO public.keysympt (idk, ids) VALUES (324, 133);
INSERT INTO public.keysympt (idk, ids) VALUES (324, 134);
INSERT INTO public.keysympt (idk, ids) VALUES (324, 279);
INSERT INTO public.keysympt (idk, ids) VALUES (324, 334);
INSERT INTO public.keysympt (idk, ids) VALUES (324, 363);
INSERT INTO public.keysympt (idk, ids) VALUES (325, 344);
INSERT INTO public.keysympt (idk, ids) VALUES (326, 178);
INSERT INTO public.keysympt (idk, ids) VALUES (327, 105);
INSERT INTO public.keysympt (idk, ids) VALUES (327, 346);
INSERT INTO public.keysympt (idk, ids) VALUES (328, 134);
INSERT INTO public.keysympt (idk, ids) VALUES (328, 189);
INSERT INTO public.keysympt (idk, ids) VALUES (328, 190);
INSERT INTO public.keysympt (idk, ids) VALUES (328, 278);
INSERT INTO public.keysympt (idk, ids) VALUES (328, 296);
INSERT INTO public.keysympt (idk, ids) VALUES (328, 334);
INSERT INTO public.keysympt (idk, ids) VALUES (328, 352);
INSERT INTO public.keysympt (idk, ids) VALUES (328, 353);
INSERT INTO public.keysympt (idk, ids) VALUES (328, 354);
INSERT INTO public.keysympt (idk, ids) VALUES (328, 355);
INSERT INTO public.keysympt (idk, ids) VALUES (329, 165);
INSERT INTO public.keysympt (idk, ids) VALUES (329, 328);
INSERT INTO public.keysympt (idk, ids) VALUES (329, 356);
INSERT INTO public.keysympt (idk, ids) VALUES (329, 357);
INSERT INTO public.keysympt (idk, ids) VALUES (329, 358);
INSERT INTO public.keysympt (idk, ids) VALUES (329, 359);
INSERT INTO public.keysympt (idk, ids) VALUES (329, 360);
INSERT INTO public.keysympt (idk, ids) VALUES (329, 361);
INSERT INTO public.keysympt (idk, ids) VALUES (330, 36);
INSERT INTO public.keysympt (idk, ids) VALUES (330, 170);
INSERT INTO public.keysympt (idk, ids) VALUES (330, 362);
INSERT INTO public.keysympt (idk, ids) VALUES (331, 21);
INSERT INTO public.keysympt (idk, ids) VALUES (331, 68);
INSERT INTO public.keysympt (idk, ids) VALUES (331, 88);
INSERT INTO public.keysympt (idk, ids) VALUES (331, 140);
INSERT INTO public.keysympt (idk, ids) VALUES (331, 273);
INSERT INTO public.keysympt (idk, ids) VALUES (331, 353);
INSERT INTO public.keysympt (idk, ids) VALUES (331, 365);
INSERT INTO public.keysympt (idk, ids) VALUES (331, 366);
INSERT INTO public.keysympt (idk, ids) VALUES (331, 367);
INSERT INTO public.keysympt (idk, ids) VALUES (331, 368);
INSERT INTO public.keysympt (idk, ids) VALUES (332, 317);
INSERT INTO public.keysympt (idk, ids) VALUES (333, 85);
INSERT INTO public.keysympt (idk, ids) VALUES (333, 175);
INSERT INTO public.keysympt (idk, ids) VALUES (333, 292);
INSERT INTO public.keysympt (idk, ids) VALUES (334, 14);
INSERT INTO public.keysympt (idk, ids) VALUES (335, 370);
INSERT INTO public.keysympt (idk, ids) VALUES (335, 371);
INSERT INTO public.keysympt (idk, ids) VALUES (335, 372);
INSERT INTO public.keysympt (idk, ids) VALUES (336, 156);
INSERT INTO public.keysympt (idk, ids) VALUES (336, 227);
INSERT INTO public.keysympt (idk, ids) VALUES (336, 236);
INSERT INTO public.keysympt (idk, ids) VALUES (337, 389);
INSERT INTO public.keysympt (idk, ids) VALUES (338, 317);
INSERT INTO public.keysympt (idk, ids) VALUES (338, 373);
INSERT INTO public.keysympt (idk, ids) VALUES (338, 374);
INSERT INTO public.keysympt (idk, ids) VALUES (338, 375);
INSERT INTO public.keysympt (idk, ids) VALUES (338, 376);
INSERT INTO public.keysympt (idk, ids) VALUES (338, 377);
INSERT INTO public.keysympt (idk, ids) VALUES (339, 380);
INSERT INTO public.keysympt (idk, ids) VALUES (340, 189);
INSERT INTO public.keysympt (idk, ids) VALUES (340, 370);
INSERT INTO public.keysympt (idk, ids) VALUES (340, 381);
INSERT INTO public.keysympt (idk, ids) VALUES (340, 382);
INSERT INTO public.keysympt (idk, ids) VALUES (340, 383);
INSERT INTO public.keysympt (idk, ids) VALUES (341, 62);
INSERT INTO public.keysympt (idk, ids) VALUES (341, 231);
INSERT INTO public.keysympt (idk, ids) VALUES (342, 379);
INSERT INTO public.keysympt (idk, ids) VALUES (342, 384);
INSERT INTO public.keysympt (idk, ids) VALUES (342, 385);
INSERT INTO public.keysympt (idk, ids) VALUES (343, 384);
INSERT INTO public.keysympt (idk, ids) VALUES (344, 390);
INSERT INTO public.keysympt (idk, ids) VALUES (345, 392);
INSERT INTO public.keysympt (idk, ids) VALUES (346, 395);


--
-- TOC entry 3027 (class 0 OID 16447)
-- Dependencies: 201
-- Data for Name: keywords; Type: TABLE DATA; Schema: public; Owner: pgtidal
--

INSERT INTO public.keywords (idk, name) VALUES (1, '\\xiiE');
INSERT INTO public.keywords (idk, name) VALUES (2, '\\xxxiiE');
INSERT INTO public.keywords (idk, name) VALUES (3, '2ème orteil');
INSERT INTO public.keywords (idk, name) VALUES (4, '3ème orteil');
INSERT INTO public.keywords (idk, name) VALUES (5, '4ème orteil');
INSERT INTO public.keywords (idk, name) VALUES (6, '5ème orteil');
INSERT INTO public.keywords (idk, name) VALUES (7, 'abdomen');
INSERT INTO public.keywords (idk, name) VALUES (8, 'abdominaux');
INSERT INTO public.keywords (idk, name) VALUES (9, 'absence');
INSERT INTO public.keywords (idk, name) VALUES (10, 'acouphène');
INSERT INTO public.keywords (idk, name) VALUES (11, 'agitation');
INSERT INTO public.keywords (idk, name) VALUES (12, 'ailes du nez');
INSERT INTO public.keywords (idk, name) VALUES (13, 'aine');
INSERT INTO public.keywords (idk, name) VALUES (14, 'aisselle');
INSERT INTO public.keywords (idk, name) VALUES (15, 'aliment');
INSERT INTO public.keywords (idk, name) VALUES (16, 'allonger jambes');
INSERT INTO public.keywords (idk, name) VALUES (17, 'amaigrissement');
INSERT INTO public.keywords (idk, name) VALUES (18, 'amer');
INSERT INTO public.keywords (idk, name) VALUES (19, 'amertume');
INSERT INTO public.keywords (idk, name) VALUES (20, 'amygdale');
INSERT INTO public.keywords (idk, name) VALUES (21, 'angoisse');
INSERT INTO public.keywords (idk, name) VALUES (22, 'annulaire');
INSERT INTO public.keywords (idk, name) VALUES (23, 'anorexie');
INSERT INTO public.keywords (idk, name) VALUES (24, 'anus');
INSERT INTO public.keywords (idk, name) VALUES (25, 'anxiété');
INSERT INTO public.keywords (idk, name) VALUES (26, 'aphonie');
INSERT INTO public.keywords (idk, name) VALUES (27, 'appareil génital');
INSERT INTO public.keywords (idk, name) VALUES (28, 'appétit');
INSERT INTO public.keywords (idk, name) VALUES (29, 'arrière');
INSERT INTO public.keywords (idk, name) VALUES (30, 'articulation');
INSERT INTO public.keywords (idk, name) VALUES (31, 'assis');
INSERT INTO public.keywords (idk, name) VALUES (32, 'asthénie');
INSERT INTO public.keywords (idk, name) VALUES (33, 'asthme');
INSERT INTO public.keywords (idk, name) VALUES (34, 'auriculaire');
INSERT INTO public.keywords (idk, name) VALUES (35, 'avant');
INSERT INTO public.keywords (idk, name) VALUES (36, 'avant-bras');
INSERT INTO public.keywords (idk, name) VALUES (37, 'bâillements');
INSERT INTO public.keywords (idk, name) VALUES (38, 'ballonnement');
INSERT INTO public.keywords (idk, name) VALUES (39, 'ballonnements');
INSERT INTO public.keywords (idk, name) VALUES (40, 'bassin');
INSERT INTO public.keywords (idk, name) VALUES (41, 'bile');
INSERT INTO public.keywords (idk, name) VALUES (42, 'blanc');
INSERT INTO public.keywords (idk, name) VALUES (43, 'bleu');
INSERT INTO public.keywords (idk, name) VALUES (44, 'bois');
INSERT INTO public.keywords (idk, name) VALUES (45, 'borborygmes');
INSERT INTO public.keywords (idk, name) VALUES (46, 'bosse frontale');
INSERT INTO public.keywords (idk, name) VALUES (47, 'bouche');
INSERT INTO public.keywords (idk, name) VALUES (48, 'bras');
INSERT INTO public.keywords (idk, name) VALUES (49, 'brillant');
INSERT INTO public.keywords (idk, name) VALUES (50, 'cambrer');
INSERT INTO public.keywords (idk, name) VALUES (51, 'cardialgie');
INSERT INTO public.keywords (idk, name) VALUES (52, 'carie');
INSERT INTO public.keywords (idk, name) VALUES (53, 'cassure');
INSERT INTO public.keywords (idk, name) VALUES (54, 'catastrophe');
INSERT INTO public.keywords (idk, name) VALUES (55, 'céphalée');
INSERT INTO public.keywords (idk, name) VALUES (56, 'cervicale');
INSERT INTO public.keywords (idk, name) VALUES (57, 'cervicales');
INSERT INTO public.keywords (idk, name) VALUES (58, 'cervicalgie');
INSERT INTO public.keywords (idk, name) VALUES (59, 'chaleur');
INSERT INTO public.keywords (idk, name) VALUES (60, 'chaud');
INSERT INTO public.keywords (idk, name) VALUES (61, 'cheveux');
INSERT INTO public.keywords (idk, name) VALUES (62, 'cicatrisation');
INSERT INTO public.keywords (idk, name) VALUES (63, 'clair');
INSERT INTO public.keywords (idk, name) VALUES (64, 'clavicule');
INSERT INTO public.keywords (idk, name) VALUES (65, 'coccyx');
INSERT INTO public.keywords (idk, name) VALUES (66, 'cœur');
INSERT INTO public.keywords (idk, name) VALUES (67, 'colère');
INSERT INTO public.keywords (idk, name) VALUES (68, 'coliques');
INSERT INTO public.keywords (idk, name) VALUES (69, 'colonne vertébrale');
INSERT INTO public.keywords (idk, name) VALUES (70, 'concentration');
INSERT INTO public.keywords (idk, name) VALUES (71, 'confus');
INSERT INTO public.keywords (idk, name) VALUES (72, 'congestion');
INSERT INTO public.keywords (idk, name) VALUES (73, 'constipation');
INSERT INTO public.keywords (idk, name) VALUES (74, 'contraction');
INSERT INTO public.keywords (idk, name) VALUES (75, 'contracture');
INSERT INTO public.keywords (idk, name) VALUES (76, 'convulsion');
INSERT INTO public.keywords (idk, name) VALUES (77, 'corps');
INSERT INTO public.keywords (idk, name) VALUES (78, 'corps antérieur');
INSERT INTO public.keywords (idk, name) VALUES (79, 'coryza');
INSERT INTO public.keywords (idk, name) VALUES (80, 'côte');
INSERT INTO public.keywords (idk, name) VALUES (81, 'côté');
INSERT INTO public.keywords (idk, name) VALUES (82, 'côtes flottantes');
INSERT INTO public.keywords (idk, name) VALUES (83, 'cou');
INSERT INTO public.keywords (idk, name) VALUES (84, 'coude');
INSERT INTO public.keywords (idk, name) VALUES (85, 'courbures');
INSERT INTO public.keywords (idk, name) VALUES (86, 'crachat');
INSERT INTO public.keywords (idk, name) VALUES (87, 'crampe');
INSERT INTO public.keywords (idk, name) VALUES (88, 'craquements');
INSERT INTO public.keywords (idk, name) VALUES (89, 'creux poplité');
INSERT INTO public.keywords (idk, name) VALUES (90, 'creux sus-claviculaire');
INSERT INTO public.keywords (idk, name) VALUES (91, 'crispation');
INSERT INTO public.keywords (idk, name) VALUES (92, 'cuisse');
INSERT INTO public.keywords (idk, name) VALUES (93, 'cystite');
INSERT INTO public.keywords (idk, name) VALUES (94, 'debout');
INSERT INTO public.keywords (idk, name) VALUES (95, 'déchirure');
INSERT INTO public.keywords (idk, name) VALUES (96, 'découragement');
INSERT INTO public.keywords (idk, name) VALUES (97, 'défécation');
INSERT INTO public.keywords (idk, name) VALUES (98, 'déglutition');
INSERT INTO public.keywords (idk, name) VALUES (99, 'démangeaison');
INSERT INTO public.keywords (idk, name) VALUES (100, 'dent');
INSERT INTO public.keywords (idk, name) VALUES (101, 'dents');
INSERT INTO public.keywords (idk, name) VALUES (102, 'dépression');
INSERT INTO public.keywords (idk, name) VALUES (103, 'déprime');
INSERT INTO public.keywords (idk, name) VALUES (104, 'déviation');
INSERT INTO public.keywords (idk, name) VALUES (105, 'diaphragme');
INSERT INTO public.keywords (idk, name) VALUES (106, 'diarrhée');
INSERT INTO public.keywords (idk, name) VALUES (107, 'digérés');
INSERT INTO public.keywords (idk, name) VALUES (108, 'digestion');
INSERT INTO public.keywords (idk, name) VALUES (109, 'distension');
INSERT INTO public.keywords (idk, name) VALUES (110, 'doigt');
INSERT INTO public.keywords (idk, name) VALUES (111, 'dorée');
INSERT INTO public.keywords (idk, name) VALUES (112, 'dos');
INSERT INTO public.keywords (idk, name) VALUES (113, 'douleur');
INSERT INTO public.keywords (idk, name) VALUES (114, 'dyspnée');
INSERT INTO public.keywords (idk, name) VALUES (115, 'effroi');
INSERT INTO public.keywords (idk, name) VALUES (116, 'éminence thénar');
INSERT INTO public.keywords (idk, name) VALUES (117, 'énergie');
INSERT INTO public.keywords (idk, name) VALUES (118, 'enflure');
INSERT INTO public.keywords (idk, name) VALUES (119, 'engourdissement');
INSERT INTO public.keywords (idk, name) VALUES (120, 'ennui');
INSERT INTO public.keywords (idk, name) VALUES (121, 'enroulement');
INSERT INTO public.keywords (idk, name) VALUES (122, 'épaule');
INSERT INTO public.keywords (idk, name) VALUES (123, 'épigastre');
INSERT INTO public.keywords (idk, name) VALUES (124, 'épilepsie');
INSERT INTO public.keywords (idk, name) VALUES (125, 'épistaxis');
INSERT INTO public.keywords (idk, name) VALUES (126, 'érection');
INSERT INTO public.keywords (idk, name) VALUES (127, 'éructation');
INSERT INTO public.keywords (idk, name) VALUES (128, 'estomac');
INSERT INTO public.keywords (idk, name) VALUES (129, 'excès');
INSERT INTO public.keywords (idk, name) VALUES (130, 'exophtalmie');
INSERT INTO public.keywords (idk, name) VALUES (131, 'extrémité');
INSERT INTO public.keywords (idk, name) VALUES (132, 'extrémités');
INSERT INTO public.keywords (idk, name) VALUES (133, 'face');
INSERT INTO public.keywords (idk, name) VALUES (134, 'face antérieure de la jambe');
INSERT INTO public.keywords (idk, name) VALUES (135, 'faible');
INSERT INTO public.keywords (idk, name) VALUES (136, 'faiblesse');
INSERT INTO public.keywords (idk, name) VALUES (137, 'faim');
INSERT INTO public.keywords (idk, name) VALUES (138, 'fatigue');
INSERT INTO public.keywords (idk, name) VALUES (139, 'fétide');
INSERT INTO public.keywords (idk, name) VALUES (140, 'fièvre');
INSERT INTO public.keywords (idk, name) VALUES (141, 'flexion');
INSERT INTO public.keywords (idk, name) VALUES (142, 'foie');
INSERT INTO public.keywords (idk, name) VALUES (143, 'folie');
INSERT INTO public.keywords (idk, name) VALUES (144, 'fourmillement');
INSERT INTO public.keywords (idk, name) VALUES (145, 'foyer supérieur');
INSERT INTO public.keywords (idk, name) VALUES (146, 'frilosité');
INSERT INTO public.keywords (idk, name) VALUES (147, 'frisson');
INSERT INTO public.keywords (idk, name) VALUES (148, 'froid');
INSERT INTO public.keywords (idk, name) VALUES (149, 'front');
INSERT INTO public.keywords (idk, name) VALUES (150, 'ganglion');
INSERT INTO public.keywords (idk, name) VALUES (151, 'gaz');
INSERT INTO public.keywords (idk, name) VALUES (152, 'gémissements');
INSERT INTO public.keywords (idk, name) VALUES (153, 'gencive');
INSERT INTO public.keywords (idk, name) VALUES (154, 'genou');
INSERT INTO public.keywords (idk, name) VALUES (155, 'GI');
INSERT INTO public.keywords (idk, name) VALUES (156, 'gonflement');
INSERT INTO public.keywords (idk, name) VALUES (157, 'gorge');
INSERT INTO public.keywords (idk, name) VALUES (158, 'grave');
INSERT INTO public.keywords (idk, name) VALUES (159, 'gris');
INSERT INTO public.keywords (idk, name) VALUES (160, 'gros orteil');
INSERT INTO public.keywords (idk, name) VALUES (161, 'haleine');
INSERT INTO public.keywords (idk, name) VALUES (162, 'halètement');
INSERT INTO public.keywords (idk, name) VALUES (163, 'hanche');
INSERT INTO public.keywords (idk, name) VALUES (164, 'hémoptysie');
INSERT INTO public.keywords (idk, name) VALUES (165, 'hémorroïde');
INSERT INTO public.keywords (idk, name) VALUES (166, 'hypersomnie');
INSERT INTO public.keywords (idk, name) VALUES (167, 'hypotonie');
INSERT INTO public.keywords (idk, name) VALUES (168, 'ictère');
INSERT INTO public.keywords (idk, name) VALUES (169, 'IG');
INSERT INTO public.keywords (idk, name) VALUES (170, 'impressionnable');
INSERT INTO public.keywords (idk, name) VALUES (171, 'impuissance');
INSERT INTO public.keywords (idk, name) VALUES (172, 'incarcération');
INSERT INTO public.keywords (idk, name) VALUES (173, 'index');
INSERT INTO public.keywords (idk, name) VALUES (174, 'indigestion');
INSERT INTO public.keywords (idk, name) VALUES (175, 'inflammation');
INSERT INTO public.keywords (idk, name) VALUES (176, 'inguinale');
INSERT INTO public.keywords (idk, name) VALUES (177, 'inquiétude');
INSERT INTO public.keywords (idk, name) VALUES (178, 'insomnie');
INSERT INTO public.keywords (idk, name) VALUES (179, 'interne');
INSERT INTO public.keywords (idk, name) VALUES (180, 'intestins');
INSERT INTO public.keywords (idk, name) VALUES (181, 'irritabilité');
INSERT INTO public.keywords (idk, name) VALUES (182, 'jambe');
INSERT INTO public.keywords (idk, name) VALUES (183, 'jambes');
INSERT INTO public.keywords (idk, name) VALUES (184, 'jaune');
INSERT INTO public.keywords (idk, name) VALUES (185, 'jaunisse');
INSERT INTO public.keywords (idk, name) VALUES (186, 'joue');
INSERT INTO public.keywords (idk, name) VALUES (187, 'langue');
INSERT INTO public.keywords (idk, name) VALUES (188, 'larme');
INSERT INTO public.keywords (idk, name) VALUES (189, 'lèvre');
INSERT INTO public.keywords (idk, name) VALUES (190, 'ligaments');
INSERT INTO public.keywords (idk, name) VALUES (191, 'lombes');
INSERT INTO public.keywords (idk, name) VALUES (192, 'lourd');
INSERT INTO public.keywords (idk, name) VALUES (193, 'lourdeur');
INSERT INTO public.keywords (idk, name) VALUES (194, 'lumière');
INSERT INTO public.keywords (idk, name) VALUES (195, 'mâchoire');
INSERT INTO public.keywords (idk, name) VALUES (196, 'maigre');
INSERT INTO public.keywords (idk, name) VALUES (197, 'main');
INSERT INTO public.keywords (idk, name) VALUES (198, 'malheureux');
INSERT INTO public.keywords (idk, name) VALUES (199, 'malléole');
INSERT INTO public.keywords (idk, name) VALUES (200, 'manie');
INSERT INTO public.keywords (idk, name) VALUES (201, 'marche');
INSERT INTO public.keywords (idk, name) VALUES (202, 'mastoïde');
INSERT INTO public.keywords (idk, name) VALUES (203, 'MC');
INSERT INTO public.keywords (idk, name) VALUES (204, 'membres');
INSERT INTO public.keywords (idk, name) VALUES (205, 'membres supérieurs');
INSERT INTO public.keywords (idk, name) VALUES (206, 'menton');
INSERT INTO public.keywords (idk, name) VALUES (207, 'méridien');
INSERT INTO public.keywords (idk, name) VALUES (208, 'méridien de VB');
INSERT INTO public.keywords (idk, name) VALUES (209, 'méridien de vésicule biliaire');
INSERT INTO public.keywords (idk, name) VALUES (210, 'méridien du triple réchauffeur');
INSERT INTO public.keywords (idk, name) VALUES (211, 'méridien estomac');
INSERT INTO public.keywords (idk, name) VALUES (212, 'méridien GI');
INSERT INTO public.keywords (idk, name) VALUES (213, 'méridien IG');
INSERT INTO public.keywords (idk, name) VALUES (214, 'méridien intestin grêle');
INSERT INTO public.keywords (idk, name) VALUES (215, 'méridien poumon');
INSERT INTO public.keywords (idk, name) VALUES (216, 'méridien TR');
INSERT INTO public.keywords (idk, name) VALUES (217, 'miction');
INSERT INTO public.keywords (idk, name) VALUES (218, 'migraine');
INSERT INTO public.keywords (idk, name) VALUES (219, 'mollet');
INSERT INTO public.keywords (idk, name) VALUES (220, 'mucosité');
INSERT INTO public.keywords (idk, name) VALUES (221, 'muscles');
INSERT INTO public.keywords (idk, name) VALUES (222, 'narines');
INSERT INTO public.keywords (idk, name) VALUES (223, 'nausée');
INSERT INTO public.keywords (idk, name) VALUES (224, 'nez');
INSERT INTO public.keywords (idk, name) VALUES (225, 'noir');
INSERT INTO public.keywords (idk, name) VALUES (226, 'noirâtre');
INSERT INTO public.keywords (idk, name) VALUES (227, 'nuit');
INSERT INTO public.keywords (idk, name) VALUES (228, 'obstruction');
INSERT INTO public.keywords (idk, name) VALUES (229, 'odeur');
INSERT INTO public.keywords (idk, name) VALUES (230, 'œdème');
INSERT INTO public.keywords (idk, name) VALUES (231, 'œil');
INSERT INTO public.keywords (idk, name) VALUES (232, 'œsophage');
INSERT INTO public.keywords (idk, name) VALUES (233, 'olécrane');
INSERT INTO public.keywords (idk, name) VALUES (234, 'oligurie');
INSERT INTO public.keywords (idk, name) VALUES (235, 'ombilic');
INSERT INTO public.keywords (idk, name) VALUES (236, 'omoplate');
INSERT INTO public.keywords (idk, name) VALUES (237, 'oreille');
INSERT INTO public.keywords (idk, name) VALUES (238, 'organes génitaux');
INSERT INTO public.keywords (idk, name) VALUES (239, 'orteil');
INSERT INTO public.keywords (idk, name) VALUES (240, 'os articulation');
INSERT INTO public.keywords (idk, name) VALUES (241, 'oubli');
INSERT INTO public.keywords (idk, name) VALUES (242, 'ovaire');
INSERT INTO public.keywords (idk, name) VALUES (243, 'pâle');
INSERT INTO public.keywords (idk, name) VALUES (244, 'palpitations');
INSERT INTO public.keywords (idk, name) VALUES (245, 'paralysie');
INSERT INTO public.keywords (idk, name) VALUES (246, 'parasitose');
INSERT INTO public.keywords (idk, name) VALUES (247, 'parole');
INSERT INTO public.keywords (idk, name) VALUES (248, 'paume');
INSERT INTO public.keywords (idk, name) VALUES (249, 'paupière');
INSERT INTO public.keywords (idk, name) VALUES (250, 'peau');
INSERT INTO public.keywords (idk, name) VALUES (251, 'peï');
INSERT INTO public.keywords (idk, name) VALUES (252, 'pénis');
INSERT INTO public.keywords (idk, name) VALUES (253, 'peur');
INSERT INTO public.keywords (idk, name) VALUES (254, 'peurs névrotiques');
INSERT INTO public.keywords (idk, name) VALUES (255, 'phanères');
INSERT INTO public.keywords (idk, name) VALUES (256, 'pharyngite');
INSERT INTO public.keywords (idk, name) VALUES (257, 'pharynx');
INSERT INTO public.keywords (idk, name) VALUES (258, 'phobies');
INSERT INTO public.keywords (idk, name) VALUES (259, 'phosphène');
INSERT INTO public.keywords (idk, name) VALUES (260, 'picotement');
INSERT INTO public.keywords (idk, name) VALUES (261, 'pied');
INSERT INTO public.keywords (idk, name) VALUES (262, 'plaies');
INSERT INTO public.keywords (idk, name) VALUES (263, 'plein');
INSERT INTO public.keywords (idk, name) VALUES (264, 'plénitude');
INSERT INTO public.keywords (idk, name) VALUES (265, 'poids');
INSERT INTO public.keywords (idk, name) VALUES (266, 'poignard');
INSERT INTO public.keywords (idk, name) VALUES (267, 'poitrine');
INSERT INTO public.keywords (idk, name) VALUES (268, 'pollakiurie');
INSERT INTO public.keywords (idk, name) VALUES (269, 'pollution nocturne');
INSERT INTO public.keywords (idk, name) VALUES (270, 'post-postprandial');
INSERT INTO public.keywords (idk, name) VALUES (271, 'postprandial');
INSERT INTO public.keywords (idk, name) VALUES (272, 'posture');
INSERT INTO public.keywords (idk, name) VALUES (273, 'pouls');
INSERT INTO public.keywords (idk, name) VALUES (274, 'poumon');
INSERT INTO public.keywords (idk, name) VALUES (275, 'préoccupation');
INSERT INTO public.keywords (idk, name) VALUES (276, 'psychose');
INSERT INTO public.keywords (idk, name) VALUES (277, 'psychotique');
INSERT INTO public.keywords (idk, name) VALUES (278, 'ptôse');
INSERT INTO public.keywords (idk, name) VALUES (279, 'pu');
INSERT INTO public.keywords (idk, name) VALUES (280, 'pubis');
INSERT INTO public.keywords (idk, name) VALUES (281, 'pus');
INSERT INTO public.keywords (idk, name) VALUES (282, 'pusillanimité');
INSERT INTO public.keywords (idk, name) VALUES (283, 'racine');
INSERT INTO public.keywords (idk, name) VALUES (284, 'raide');
INSERT INTO public.keywords (idk, name) VALUES (285, 'raideur');
INSERT INTO public.keywords (idk, name) VALUES (286, 'rapide');
INSERT INTO public.keywords (idk, name) VALUES (287, 'regard');
INSERT INTO public.keywords (idk, name) VALUES (288, 'règles');
INSERT INTO public.keywords (idk, name) VALUES (289, 'rein');
INSERT INTO public.keywords (idk, name) VALUES (290, 'reins');
INSERT INTO public.keywords (idk, name) VALUES (291, 'respiration');
INSERT INTO public.keywords (idk, name) VALUES (292, 'rétractation');
INSERT INTO public.keywords (idk, name) VALUES (293, 'rhume de cerveau');
INSERT INTO public.keywords (idk, name) VALUES (294, 'rire');
INSERT INTO public.keywords (idk, name) VALUES (295, 'rotation');
INSERT INTO public.keywords (idk, name) VALUES (296, 'rouge');
INSERT INTO public.keywords (idk, name) VALUES (297, 'rythme');
INSERT INTO public.keywords (idk, name) VALUES (298, 'sacrum');
INSERT INTO public.keywords (idk, name) VALUES (299, 'saisie');
INSERT INTO public.keywords (idk, name) VALUES (300, 'sang');
INSERT INTO public.keywords (idk, name) VALUES (301, 'sclérotique');
INSERT INTO public.keywords (idk, name) VALUES (302, 'scrotum');
INSERT INTO public.keywords (idk, name) VALUES (303, 'sec');
INSERT INTO public.keywords (idk, name) VALUES (304, 'sécheresse');
INSERT INTO public.keywords (idk, name) VALUES (305, 'selles');
INSERT INTO public.keywords (idk, name) VALUES (306, 'soif');
INSERT INTO public.keywords (idk, name) VALUES (307, 'sombre');
INSERT INTO public.keywords (idk, name) VALUES (308, 'sommeil');
INSERT INTO public.keywords (idk, name) VALUES (309, 'sommet de la tête');
INSERT INTO public.keywords (idk, name) VALUES (310, 'sommet du crâne');
INSERT INTO public.keywords (idk, name) VALUES (311, 'soucis');
INSERT INTO public.keywords (idk, name) VALUES (312, 'soupir');
INSERT INTO public.keywords (idk, name) VALUES (313, 'spasme');
INSERT INTO public.keywords (idk, name) VALUES (314, 'surdité');
INSERT INTO public.keywords (idk, name) VALUES (315, 'surexcitation');
INSERT INTO public.keywords (idk, name) VALUES (316, 'sursauts');
INSERT INTO public.keywords (idk, name) VALUES (317, 'teint');
INSERT INTO public.keywords (idk, name) VALUES (318, 'température');
INSERT INTO public.keywords (idk, name) VALUES (319, 'tendinite');
INSERT INTO public.keywords (idk, name) VALUES (320, 'tendons');
INSERT INTO public.keywords (idk, name) VALUES (321, 'terne');
INSERT INTO public.keywords (idk, name) VALUES (322, 'testicule');
INSERT INTO public.keywords (idk, name) VALUES (323, 'tête');
INSERT INTO public.keywords (idk, name) VALUES (324, 'thorax');
INSERT INTO public.keywords (idk, name) VALUES (325, 'timidité');
INSERT INTO public.keywords (idk, name) VALUES (326, 'tissus');
INSERT INTO public.keywords (idk, name) VALUES (327, 'torticolis');
INSERT INTO public.keywords (idk, name) VALUES (328, 'toux');
INSERT INTO public.keywords (idk, name) VALUES (329, 'transpiration');
INSERT INTO public.keywords (idk, name) VALUES (330, 'tremblement');
INSERT INTO public.keywords (idk, name) VALUES (331, 'urine');
INSERT INTO public.keywords (idk, name) VALUES (332, 'urines');
INSERT INTO public.keywords (idk, name) VALUES (333, 'ventre');
INSERT INTO public.keywords (idk, name) VALUES (334, 'verrue');
INSERT INTO public.keywords (idk, name) VALUES (335, 'vertige');
INSERT INTO public.keywords (idk, name) VALUES (336, 'vessie');
INSERT INTO public.keywords (idk, name) VALUES (337, 'vide');
INSERT INTO public.keywords (idk, name) VALUES (338, 'visage');
INSERT INTO public.keywords (idk, name) VALUES (339, 'voix');
INSERT INTO public.keywords (idk, name) VALUES (340, 'vomissement');
INSERT INTO public.keywords (idk, name) VALUES (341, 'voûte plantaire');
INSERT INTO public.keywords (idk, name) VALUES (342, 'vue');
INSERT INTO public.keywords (idk, name) VALUES (343, 'yeux');
INSERT INTO public.keywords (idk, name) VALUES (344, 'paranoïa');
INSERT INTO public.keywords (idk, name) VALUES (345, 'talon');
INSERT INTO public.keywords (idk, name) VALUES (346, 'nuque');


--
-- TOC entry 3028 (class 0 OID 16453)
-- Dependencies: 202
-- Data for Name: meridien; Type: TABLE DATA; Schema: public; Owner: pgtidal
--

INSERT INTO public.meridien (code, nom, element, yin) VALUES ('-QM', 'Yin Qiao Mai', '', true);
INSERT INTO public.meridien (code, nom, element, yin) VALUES ('-WM', 'Yin Wei Mai', '', true);
INSERT INTO public.meridien (code, nom, element, yin) VALUES ('+QM', 'Yang Qiao Mai', '', false);
INSERT INTO public.meridien (code, nom, element, yin) VALUES ('+WM', 'Yang Wei Mai', '', false);
INSERT INTO public.meridien (code, nom, element, yin) VALUES ('C', 'Coeur', 'f', true);
INSERT INTO public.meridien (code, nom, element, yin) VALUES ('ChM', 'Chong Mai', '', true);
INSERT INTO public.meridien (code, nom, element, yin) VALUES ('DaiM', 'Dai Mai', '', false);
INSERT INTO public.meridien (code, nom, element, yin) VALUES ('DM', 'Du Mai', '', false);
INSERT INTO public.meridien (code, nom, element, yin) VALUES ('E', 'Estomac', 't', false);
INSERT INTO public.meridien (code, nom, element, yin) VALUES ('F', 'Foie', 'b', true);
INSERT INTO public.meridien (code, nom, element, yin) VALUES ('GI', 'Gros intestin', 'm', false);
INSERT INTO public.meridien (code, nom, element, yin) VALUES ('IG', 'Intestin Grêle', 'f', false);
INSERT INTO public.meridien (code, nom, element, yin) VALUES ('MC', 'Protecteur du coeur', 'f', true);
INSERT INTO public.meridien (code, nom, element, yin) VALUES ('P', 'Poumon', 'm', true);
INSERT INTO public.meridien (code, nom, element, yin) VALUES ('R', 'Rein', 'e', true);
INSERT INTO public.meridien (code, nom, element, yin) VALUES ('RM', 'Ren Mai', '', true);
INSERT INTO public.meridien (code, nom, element, yin) VALUES ('Rte', 'Rate Pancréas', 't', true);
INSERT INTO public.meridien (code, nom, element, yin) VALUES ('TR', 'Triple réchauffeur', 'f', false);
INSERT INTO public.meridien (code, nom, element, yin) VALUES ('V', 'Vessie', 'e', false);
INSERT INTO public.meridien (code, nom, element, yin) VALUES ('VB', 'Vésicule Biliaire', 'b', false);


--
-- TOC entry 3029 (class 0 OID 16459)
-- Dependencies: 203
-- Data for Name: patho; Type: TABLE DATA; Schema: public; Owner: pgtidal
--

INSERT INTO public.patho (idp, mer, type, "desc") VALUES (1, 'P', 'me', 'méridien du poumon externe');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (2, 'P', 'mi', 'méridien du poumon interne');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (3, 'P', 'lp', 'voie luo du poumon pleine');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (4, 'P', 'lv', 'voie luo du poumon vide');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (5, 'P', 'j', 'jing jin du poumon');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (6, 'P', 'tfp', 'zang poumon plein');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (7, 'P', 'tfv', 'zang poumon vide');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (8, 'P', 'tfc', 'zang poumon chaud');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (9, 'P', 'tff', 'zang poumon froid');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (10, 'GI', 'me', 'méridien du gros intestin externe');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (11, 'GI', 'mi', 'méridien du gros intestin interne');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (12, 'GI', 'lp', 'voie luo du gros intestin pleine');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (13, 'GI', 'lv', 'voie luo du gros intestin vide');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (14, 'GI', 'j', 'jing jin du gros intestin');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (15, 'GI', 'tfp', 'fu gros intestin plein');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (16, 'GI', 'tfv', 'fu gros intestin vide');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (17, 'GI', 'tfc', 'fu gros intestin chaud');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (18, 'GI', 'tff', 'fu gros intestin froid');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (19, 'E', 'me', 'méridien de l''estomac externe');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (20, 'E', 'mi', 'méridien de l''estomac interne');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (21, 'E', 'lp', 'voie luo de l''estomac pleine');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (22, 'E', 'lv', 'voie luo de l''estomac vide');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (23, 'E', 'j', 'jing jin de l''estomac');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (24, 'E', 'tfpc', 'fu estomac plein et chaud');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (25, 'E', 'tfvf', 'fu estomac vide et froid');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (26, 'Rte', 'me', 'méridien de la rate externe');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (27, 'Rte', 'mi', 'méridien de la rate interne');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (28, 'Rte', 'lp', 'voie luo de la rate pleine');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (29, 'Rte', 'lv', 'voie luo de la rate vide');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (30, 'Rte', 'l2p', 'voie grand luo de la rate pleine');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (31, 'Rte', 'l2v', 'voie grand luo de la rate vide');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (32, 'Rte', 'j', 'jing jin de la rate');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (33, 'Rte', 'tfpc', 'zang rate plein et chaud');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (34, 'Rte', 'tfvf', 'zang rate vide et froid');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (35, 'C', 'me', 'méridien du cœur externe');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (36, 'C', 'mi', 'méridien du cœur interne');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (37, 'C', 'lp', 'voie luo du cœur pleine');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (38, 'C', 'lv', 'voie luo du cœur vide');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (39, 'C', 'j', 'jing jin du cœur');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (40, 'C', 'tfp', 'zang cœur plein');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (41, 'C', 'tfv', 'zang  cœur vide');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (42, 'IG', 'me', 'méridien de l''intestin grêle externe');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (43, 'IG', 'mi', 'méridien de l''intestin grêle interne');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (44, 'IG', 'lp', 'voie luo de l''intestin grêle pleine');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (45, 'IG', 'lv', 'voie luo de l''intestin grêle vide');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (46, 'IG', 'j', 'jing jin de l''intestin grêle');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (47, 'IG', 'tfpc', 'fu intestin grêle plein et chaud');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (48, 'IG', 'tfvf', 'fu intestin grêle vide et froid');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (49, 'V', 'me', 'méridien de la vessie externe');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (50, 'V', 'mi', 'méridien de la vessie interne');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (51, 'V', 'lp', 'voie luo de la vessie pleine');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (52, 'V', 'lv', 'voie luo de la vessie vide');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (53, 'V', 'j', 'jing jin de la vessie');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (54, 'V', 'tfpc', 'fu vessie plein et chaud');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (55, 'V', 'tfvf', 'fu vessie vide et froid');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (56, 'R', 'me', 'méridien du rein externe');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (57, 'R', 'mi', 'méridien du rein interne');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (58, 'R', 'lp', 'voie luo du rein pleine');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (59, 'R', 'lv', 'voie luo du rein vide');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (60, 'R', 'j', 'jing jin du rein');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (61, 'R', 'tfv-', 'zang rein yin vide');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (62, 'R', 'tfv+', 'zang rein yang vide');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (63, 'MC', 'me', 'méridien du maître du cœur externe');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (64, 'MC', 'mi', 'méridien du maître du cœur interne');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (65, 'MC', 'lp', 'voie luo du maître du cœur pleine');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (66, 'MC', 'lv', 'voie luo du maître du cœur vide');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (67, 'MC', 'j', 'jing jin du maître du cœur');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (68, 'MC', 'tfp', 'zang maître du cœur plein');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (69, 'MC', 'tfv', 'zang maître du cœur vide');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (70, 'TR', 'me', 'méridien du triple réchauffeur externe');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (71, 'TR', 'mi', 'méridien du triple réchauffeur interne');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (72, 'TR', 'lp', 'voie luo du triple réchauffeur pleine');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (73, 'TR', 'lv', 'voie luo du triple réchauffeur vide');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (74, 'TR', 'j', 'jing jin du triple réchauffeur');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (75, 'TR', 'tfvfs', 'fu du triple réchauffeur supérieur vide et froid');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (76, 'TR', 'tfpcs', 'fu du triple réchauffeur supérieur plein et chaud');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (77, 'TR', 'tfvfm', 'fu du triple réchauffeur moyen vide et froid');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (78, 'TR', 'tfpcm', 'fu du triple réchauffeur moyen plein et chaud');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (79, 'TR', 'tfvfi', 'fu du triple réchauffeur inférieur vide et froid');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (80, 'TR', 'tfpci', 'fu du triple réchauffeur inférieur plein et chaud');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (81, 'VB', 'me', 'méridien de la vésicule biliaire externe');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (82, 'VB', 'mi', 'méridien de la vésicule biliaire interne');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (83, 'VB', 'lp', 'voie luo de la vésicule biliaire pleine');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (84, 'VB', 'lv', 'voie luo de la vésicule biliaire vide');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (85, 'VB', 'j', 'jing jin de la vésicule biliaire');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (86, 'VB', 'tfp', 'fu vésicule biliaire plein');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (87, 'VB', 'tfv', 'fu vésicule biliaire vide');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (88, 'VB', 'tfc', 'fu vésicule biliaire chaud');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (89, 'VB', 'tff', 'fu vésicule biliaire froid');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (90, 'F', 'me', 'méridien du foie externe');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (91, 'F', 'mi', 'méridien du foie interne');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (92, 'F', 'lp', 'voie luo du foie pleine');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (93, 'F', 'lv', 'voie luo du foie vide');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (94, 'F', 'j', 'jing jin du foie');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (95, 'F', 'tfp', 'zang foie plein');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (96, 'F', 'tfv', 'zang foie vide');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (97, 'F', 'tfc', 'zang foie chaud');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (98, 'F', 'tff', 'zang foie froid');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (101, 'DM', 'mv', 'Pathologie du Du Mai');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (102, 'RM', 'mv', 'Pathologie du Ren Mai');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (103, 'ChM', 'mv', 'Pathologie générale du Chong Mai');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (104, 'ChM', 'mvi', 'Pathologie de la branche inférieure du Chong Mai');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (105, 'ChM', 'mvp', 'Pathologie de la branche postérieure du Chong Mai');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (106, 'ChM', 'mva', 'Pathologie de la branche antérieure du Chong Mai');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (107, 'DaiM', 'mv', 'Pathologie du Dai Mai');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (108, '+QM', 'mv', 'Pathologie du Yang Qiao Mai');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (109, '-QM', 'mv', 'Pathologie du Yin Qiao Mai');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (110, '+WM', 'mv', 'Pathologie du Yang Wei Mai');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (111, '-WM', 'mv', 'Pathologie du Yin Wei Mai');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (112, 'DM', 'lp', 'voie luo du Du Mai pleine');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (113, 'DM', 'lv', 'voie luo du Du Mai vide');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (114, 'RM', 'lp', 'voie luo du Ren Mai pleine');
INSERT INTO public.patho (idp, mer, type, "desc") VALUES (115, 'RM', 'lv', 'voie luo du Ren Mai vide');


--
-- TOC entry 3030 (class 0 OID 16465)
-- Dependencies: 204
-- Data for Name: symptome; Type: TABLE DATA; Schema: public; Owner: pgtidal
--

INSERT INTO public.symptome (ids, "desc") VALUES (1, 'Abdomen dilaté, douloureux et chaud');
INSERT INTO public.symptome (ids, "desc") VALUES (2, 'Abdomen flasque');
INSERT INTO public.symptome (ids, "desc") VALUES (3, 'Absence d''érection');
INSERT INTO public.symptome (ids, "desc") VALUES (4, 'Absence de faim');
INSERT INTO public.symptome (ids, "desc") VALUES (5, 'Absence de soif');
INSERT INTO public.symptome (ids, "desc") VALUES (6, 'Agitation');
INSERT INTO public.symptome (ids, "desc") VALUES (7, 'Algie du creux poplité de type compression avec flexion impossible des genoux');
INSERT INTO public.symptome (ids, "desc") VALUES (8, 'Allongement et crispation musculaire des organes génitaux');
INSERT INTO public.symptome (ids, "desc") VALUES (9, 'Alopécie');
INSERT INTO public.symptome (ids, "desc") VALUES (10, 'Amygdalite, gorge irritée');
INSERT INTO public.symptome (ids, "desc") VALUES (11, 'Angoisse se manifestant par des serrements de poitrine');
INSERT INTO public.symptome (ids, "desc") VALUES (12, 'Anorexie');
INSERT INTO public.symptome (ids, "desc") VALUES (13, 'Anxiété et sentiment d''être malheureux');
INSERT INTO public.symptome (ids, "desc") VALUES (14, 'Apparition de petite verrues pédiculées sur le trajet du méridien');
INSERT INTO public.symptome (ids, "desc") VALUES (15, 'Articulation du coude relâchée, ne fonctionne plus');
INSERT INTO public.symptome (ids, "desc") VALUES (16, 'Aspect noirâtre de la face et du front');
INSERT INTO public.symptome (ids, "desc") VALUES (17, 'Asthénie et amaigrissement');
INSERT INTO public.symptome (ids, "desc") VALUES (18, 'Asthénie et hypersomnie');
INSERT INTO public.symptome (ids, "desc") VALUES (19, 'Attitude psychotique (grimper en haut, chanter, se déshabiller et courir dans tous les sens)');
INSERT INTO public.symptome (ids, "desc") VALUES (20, 'Bâillements et gémissements');
INSERT INTO public.symptome (ids, "desc") VALUES (21, 'Bâillements');
INSERT INTO public.symptome (ids, "desc") VALUES (22, 'Ballonnement abdominal');
INSERT INTO public.symptome (ids, "desc") VALUES (23, 'Ballonnements, frissons et sensation de froid à la partie antérieure du corps');
INSERT INTO public.symptome (ids, "desc") VALUES (24, 'Battement des ailes du nez');
INSERT INTO public.symptome (ids, "desc") VALUES (25, 'Blocage de la respiration, peï du 2ème mois d''hivers');
INSERT INTO public.symptome (ids, "desc") VALUES (26, 'Borborygmes');
INSERT INTO public.symptome (ids, "desc") VALUES (27, 'Bouche et lèvres sèches');
INSERT INTO public.symptome (ids, "desc") VALUES (28, 'Bouche sèche et amère');
INSERT INTO public.symptome (ids, "desc") VALUES (29, 'Bruit douloureux de l''oreille qui se répercute jusqu''au menton');
INSERT INTO public.symptome (ids, "desc") VALUES (30, 'Cardialgie');
INSERT INTO public.symptome (ids, "desc") VALUES (31, 'Cardialgie soudaine');
INSERT INTO public.symptome (ids, "desc") VALUES (32, 'Carie dentaire, surdité');
INSERT INTO public.symptome (ids, "desc") VALUES (33, 'Céphalées au sommet du crâne');
INSERT INTO public.symptome (ids, "desc") VALUES (34, 'Céphalées frontales et au sommet de la tête');
INSERT INTO public.symptome (ids, "desc") VALUES (35, 'Cervicalgie à type de torsion');
INSERT INTO public.symptome (ids, "desc") VALUES (36, 'Chaleur au milieu de la paume et tremblement des mains');
INSERT INTO public.symptome (ids, "desc") VALUES (37, 'Chaleur dans la paume de la main');
INSERT INTO public.symptome (ids, "desc") VALUES (38, 'Chaleur des mains et de l''éminence thénar');
INSERT INTO public.symptome (ids, "desc") VALUES (39, 'Chaleur du foyer supérieur entraînant bouche sèche et amère, yeux rouges et enflés');
INSERT INTO public.symptome (ids, "desc") VALUES (40, 'Chaleur et douleur à la paume des mains');
INSERT INTO public.symptome (ids, "desc") VALUES (41, 'Chaleur et enflure sur le trajet du méridien');
INSERT INTO public.symptome (ids, "desc") VALUES (42, 'Chaleur et sécheresse de la bouche, de la langue avec enflure de la gorge');
INSERT INTO public.symptome (ids, "desc") VALUES (43, 'Cicatrisation lente');
INSERT INTO public.symptome (ids, "desc") VALUES (44, 'Colères faciles');
INSERT INTO public.symptome (ids, "desc") VALUES (45, 'Colérique');
INSERT INTO public.symptome (ids, "desc") VALUES (46, 'Coliques');
INSERT INTO public.symptome (ids, "desc") VALUES (47, 'Confusion');
INSERT INTO public.symptome (ids, "desc") VALUES (48, 'Congestion des joues');
INSERT INTO public.symptome (ids, "desc") VALUES (49, 'Constipation avec spasme et douleur');
INSERT INTO public.symptome (ids, "desc") VALUES (50, 'Constipation spasmodique');
INSERT INTO public.symptome (ids, "desc") VALUES (51, 'Constipation, selles dures');
INSERT INTO public.symptome (ids, "desc") VALUES (52, 'Contraction du diaphragme');
INSERT INTO public.symptome (ids, "desc") VALUES (53, 'Contracture du coude');
INSERT INTO public.symptome (ids, "desc") VALUES (54, 'Contracture du coude et de l''avant bras');
INSERT INTO public.symptome (ids, "desc") VALUES (55, 'Coryza clair');
INSERT INTO public.symptome (ids, "desc") VALUES (56, 'Coryza et épistaxis');
INSERT INTO public.symptome (ids, "desc") VALUES (57, 'Cou gonflé si les ligaments sont atteints par le froid ou la chaleur nocive');
INSERT INTO public.symptome (ids, "desc") VALUES (58, 'Cou raide et contracté');
INSERT INTO public.symptome (ids, "desc") VALUES (59, 'Coxalgie');
INSERT INTO public.symptome (ids, "desc") VALUES (60, 'Crampe à la face antérieure de la jambe dans la région du xxxiiE');
INSERT INTO public.symptome (ids, "desc") VALUES (61, 'Crampe aux 2ème, 3ème et 4ème orteils');
INSERT INTO public.symptome (ids, "desc") VALUES (62, 'Crampe de la plante du pied');
INSERT INTO public.symptome (ids, "desc") VALUES (63, 'Crampes dans le mollet et douleur sur les surfaces articulaires');
INSERT INTO public.symptome (ids, "desc") VALUES (64, 'Crampes du 4ème orteil et du mollet');
INSERT INTO public.symptome (ids, "desc") VALUES (65, 'Crise épileptiforme, spasmes ou convulsion');
INSERT INTO public.symptome (ids, "desc") VALUES (66, 'Cystite');
INSERT INTO public.symptome (ids, "desc") VALUES (67, 'Découragement et dépression');
INSERT INTO public.symptome (ids, "desc") VALUES (68, 'Défécation et miction difficiles');
INSERT INTO public.symptome (ids, "desc") VALUES (69, 'Démangeaisons violentes');
INSERT INTO public.symptome (ids, "desc") VALUES (70, 'Dépression sévère');
INSERT INTO public.symptome (ids, "desc") VALUES (71, 'Désir de se cambrer et d''allonger les jambes');
INSERT INTO public.symptome (ids, "desc") VALUES (72, 'Désir être debout quand la personne est assise');
INSERT INTO public.symptome (ids, "desc") VALUES (73, 'Dessèchement des phanères');
INSERT INTO public.symptome (ids, "desc") VALUES (74, 'Déviation de la bouche et des yeux');
INSERT INTO public.symptome (ids, "desc") VALUES (75, 'Diarrhée');
INSERT INTO public.symptome (ids, "desc") VALUES (76, 'Diarrhée d''aliments non digérés');
INSERT INTO public.symptome (ids, "desc") VALUES (77, 'Diarrhée jaune pâle dorée');
INSERT INTO public.symptome (ids, "desc") VALUES (79, 'Diarrhées aqueuses continuelles');
INSERT INTO public.symptome (ids, "desc") VALUES (80, 'Diarrhées blanches sitôt après avoir mangé');
INSERT INTO public.symptome (ids, "desc") VALUES (81, 'Diarrhées nocturnes');
INSERT INTO public.symptome (ids, "desc") VALUES (82, 'Difficulté à la rotation');
INSERT INTO public.symptome (ids, "desc") VALUES (83, 'Difficulté de déglutition et aphonie subite');
INSERT INTO public.symptome (ids, "desc") VALUES (84, 'Difficulté respiratoire avec douleur costale');
INSERT INTO public.symptome (ids, "desc") VALUES (85, 'Distension douloureuse du ventre');
INSERT INTO public.symptome (ids, "desc") VALUES (86, 'Distension et douleur de l''abdomen et de l''anus');
INSERT INTO public.symptome (ids, "desc") VALUES (87, 'Douleur à l''aine');
INSERT INTO public.symptome (ids, "desc") VALUES (88, 'Douleur à l''épaule et au dos avec urines claires et respiration courte');
INSERT INTO public.symptome (ids, "desc") VALUES (89, 'Douleur à l''ombilic et à la colonne vertébrale');
INSERT INTO public.symptome (ids, "desc") VALUES (90, 'Douleur à la colonne vertébrale');
INSERT INTO public.symptome (ids, "desc") VALUES (91, 'Douleur à la commissure externe de l''œil');
INSERT INTO public.symptome (ids, "desc") VALUES (92, 'Douleur à la racine de la langue');
INSERT INTO public.symptome (ids, "desc") VALUES (93, 'Douleur abdominal aiguë');
INSERT INTO public.symptome (ids, "desc") VALUES (94, 'Douleur abdominale');
INSERT INTO public.symptome (ids, "desc") VALUES (95, 'Douleur au cœur en coup de poignard');
INSERT INTO public.symptome (ids, "desc") VALUES (96, 'Douleur au mollet de type déchirure');
INSERT INTO public.symptome (ids, "desc") VALUES (97, 'Douleur au scrotum et à l''abdomen');
INSERT INTO public.symptome (ids, "desc") VALUES (98, 'Douleur aux lombes avec sensation de fragilité');
INSERT INTO public.symptome (ids, "desc") VALUES (99, 'Douleur avec sensation de froid à la face interne de l''avant-bras et du bras');
INSERT INTO public.symptome (ids, "desc") VALUES (100, 'Douleur brûlante dans les reins et l''abdomen avec sensation de froid et de faiblesse aux jambes');
INSERT INTO public.symptome (ids, "desc") VALUES (101, 'Douleur cardiaque');
INSERT INTO public.symptome (ids, "desc") VALUES (102, 'Douleur constrictive de la région génitale et de l''abdomen');
INSERT INTO public.symptome (ids, "desc") VALUES (103, 'Douleur côté interne du genou avec crampes à la cuisse du même côté');
INSERT INTO public.symptome (ids, "desc") VALUES (104, 'Douleur dans la poitrine');
INSERT INTO public.symptome (ids, "desc") VALUES (105, 'Douleur dans le cou lorsqu''on tourne la tête');
INSERT INTO public.symptome (ids, "desc") VALUES (106, 'Douleur dans le trajet du méridien avec impossibilité de mouvoir le 4ème et le 5ème orteil');
INSERT INTO public.symptome (ids, "desc") VALUES (107, 'Douleur de gorge');
INSERT INTO public.symptome (ids, "desc") VALUES (108, 'Douleur de l''aisselle contournant l''omoplate jusqu''au cou');
INSERT INTO public.symptome (ids, "desc") VALUES (109, 'Douleur de l''articulation de l''épaule avec sensation de cassure');
INSERT INTO public.symptome (ids, "desc") VALUES (110, 'Douleur de l''auriculaire vers la face interne du coude jusqu''à l''olécrane et côté interne du bras');
INSERT INTO public.symptome (ids, "desc") VALUES (111, 'Douleur de l''œsophage');
INSERT INTO public.symptome (ids, "desc") VALUES (113, 'Douleur de la mâchoire inférieure');
INSERT INTO public.symptome (ids, "desc") VALUES (114, 'Douleur du gros orteil et de la malléole interne');
INSERT INTO public.symptome (ids, "desc") VALUES (115, 'Douleur du gros orteil s''étendant sur la face antérieure de la malléole interne');
INSERT INTO public.symptome (ids, "desc") VALUES (116, 'Douleur du mollet et de la face postéro-externe de la jambe avec sensation de déchirure');
INSERT INTO public.symptome (ids, "desc") VALUES (117, 'Douleur et asthénie de la région lombaire');
INSERT INTO public.symptome (ids, "desc") VALUES (118, 'Douleur et lourdeur épigastrique');
INSERT INTO public.symptome (ids, "desc") VALUES (119, 'Douleur face interne de la cuisse');
INSERT INTO public.symptome (ids, "desc") VALUES (120, 'Douleur face interne de la cuisse jusqu''au pubis, contracture douloureuse de l''appareil génital');
INSERT INTO public.symptome (ids, "desc") VALUES (121, 'Douleur lancinante au creux sus-claviculaire');
INSERT INTO public.symptome (ids, "desc") VALUES (122, 'Douleur le long du trajet du méridien');
INSERT INTO public.symptome (ids, "desc") VALUES (123, 'Douleur le long du trajet du méridien avec paralysie de l''annulaire et de l''auriculaire');
INSERT INTO public.symptome (ids, "desc") VALUES (124, 'Douleur le long du trajet du méridien avec paralysie du 3ème orteil');
INSERT INTO public.symptome (ids, "desc") VALUES (125, 'Douleur lombaire');
INSERT INTO public.symptome (ids, "desc") VALUES (126, 'Douleur oculaire avec sensation d''exophtalmie');
INSERT INTO public.symptome (ids, "desc") VALUES (127, 'Douleur œsophagienne et de l''estomac');
INSERT INTO public.symptome (ids, "desc") VALUES (128, 'Douleur soudaine sous les côtes');
INSERT INTO public.symptome (ids, "desc") VALUES (129, 'Douleur sourde à l''intérieur des intestins');
INSERT INTO public.symptome (ids, "desc") VALUES (130, 'Douleur sous l''aisselle et sus-claviculaire');
INSERT INTO public.symptome (ids, "desc") VALUES (131, 'Douleur sur le trajet du méridien');
INSERT INTO public.symptome (ids, "desc") VALUES (132, 'Douleur sur le trajet du méridien avec paralysie de l''index');
INSERT INTO public.symptome (ids, "desc") VALUES (133, 'Douleur thoracique aiguë comme un coup de poignard');
INSERT INTO public.symptome (ids, "desc") VALUES (134, 'Douleur thoracique sourde, dyspnée et toux');
INSERT INTO public.symptome (ids, "desc") VALUES (135, 'Douleur tout le long du trajet du méridien');
INSERT INTO public.symptome (ids, "desc") VALUES (136, 'Douleurs articulaires multiples');
INSERT INTO public.symptome (ids, "desc") VALUES (137, 'Douleurs cardiaques');
INSERT INTO public.symptome (ids, "desc") VALUES (138, 'Douleurs dans les os et articulations');
INSERT INTO public.symptome (ids, "desc") VALUES (139, 'Douleurs du bras');
INSERT INTO public.symptome (ids, "desc") VALUES (140, 'Dysurie et hématurie');
INSERT INTO public.symptome (ids, "desc") VALUES (141, 'Éblouissement');
INSERT INTO public.symptome (ids, "desc") VALUES (142, 'Éblouissement sans pouvoir fixer son regard');
INSERT INTO public.symptome (ids, "desc") VALUES (143, 'Écoulement nasal continuel sans pouvoir respirer');
INSERT INTO public.symptome (ids, "desc") VALUES (144, 'Écoulement rétro-nasal');
INSERT INTO public.symptome (ids, "desc") VALUES (145, 'Embarras gastrique');
INSERT INTO public.symptome (ids, "desc") VALUES (146, 'Énergie en révolte');
INSERT INTO public.symptome (ids, "desc") VALUES (147, 'Enflure de la joue');
INSERT INTO public.symptome (ids, "desc") VALUES (148, 'Enflure de la mâchoire inférieure empêchant la rotation du cou');
INSERT INTO public.symptome (ids, "desc") VALUES (149, 'Engourdissements');
INSERT INTO public.symptome (ids, "desc") VALUES (150, 'Épanchement testiculaire');
INSERT INTO public.symptome (ids, "desc") VALUES (151, 'Épaule bloquée, rotation du cou impossible, peï du premier mois d''été');
INSERT INTO public.symptome (ids, "desc") VALUES (152, 'Épaule et dos douloureux');
INSERT INTO public.symptome (ids, "desc") VALUES (153, 'Épilepsie');
INSERT INTO public.symptome (ids, "desc") VALUES (154, 'Épistaxis');
INSERT INTO public.symptome (ids, "desc") VALUES (155, 'Éructations fréquentes après défécation');
INSERT INTO public.symptome (ids, "desc") VALUES (156, 'Évacuation incomplète de la vessie');
INSERT INTO public.symptome (ids, "desc") VALUES (157, 'Excès d''appétit');
INSERT INTO public.symptome (ids, "desc") VALUES (158, 'Extrémités froides');
INSERT INTO public.symptome (ids, "desc") VALUES (159, 'Faciès rouge');
INSERT INTO public.symptome (ids, "desc") VALUES (160, 'Faiblesse');
INSERT INTO public.symptome (ids, "desc") VALUES (161, 'Faiblesse musculaire des jambes');
INSERT INTO public.symptome (ids, "desc") VALUES (162, 'Fatigable');
INSERT INTO public.symptome (ids, "desc") VALUES (163, 'Fièvre');
INSERT INTO public.symptome (ids, "desc") VALUES (164, 'Fièvre et frilosité');
INSERT INTO public.symptome (ids, "desc") VALUES (165, 'Fièvre et transpiration brutale et intermittente');
INSERT INTO public.symptome (ids, "desc") VALUES (166, 'Folie');
INSERT INTO public.symptome (ids, "desc") VALUES (167, 'Fourmillements et picotements cardiaque');
INSERT INTO public.symptome (ids, "desc") VALUES (168, 'Frayeurs (impression qu''on va l''incarcérer)');
INSERT INTO public.symptome (ids, "desc") VALUES (169, 'Frisons incontrôlables');
INSERT INTO public.symptome (ids, "desc") VALUES (170, 'Frissons, tremblements et difficultés à se réchauffer');
INSERT INTO public.symptome (ids, "desc") VALUES (171, 'Froid aux dents');
INSERT INTO public.symptome (ids, "desc") VALUES (173, 'Froid, ne peut se réchauffer');
INSERT INTO public.symptome (ids, "desc") VALUES (174, 'Ganglions');
INSERT INTO public.symptome (ids, "desc") VALUES (175, 'Gargouillis permanents');
INSERT INTO public.symptome (ids, "desc") VALUES (176, 'Gaz avec ballonnements');
INSERT INTO public.symptome (ids, "desc") VALUES (177, 'Gaz dans l''abdomen');
INSERT INTO public.symptome (ids, "desc") VALUES (178, 'Gaz de l''intestin grêle avec douleur et induration');
INSERT INTO public.symptome (ids, "desc") VALUES (179, 'Gonflement abdominal');
INSERT INTO public.symptome (ids, "desc") VALUES (180, 'Gonflement de l''aisselle');
INSERT INTO public.symptome (ids, "desc") VALUES (181, 'Gonflement du scrotum; hernie inguinale');
INSERT INTO public.symptome (ids, "desc") VALUES (182, 'Gorge enflée');
INSERT INTO public.symptome (ids, "desc") VALUES (183, 'Gorge et peau sèches');
INSERT INTO public.symptome (ids, "desc") VALUES (184, 'Gorge irritée');
INSERT INTO public.symptome (ids, "desc") VALUES (185, 'Goût amer');
INSERT INTO public.symptome (ids, "desc") VALUES (186, 'Haleine chaude ou fétide');
INSERT INTO public.symptome (ids, "desc") VALUES (187, 'Halètement');
INSERT INTO public.symptome (ids, "desc") VALUES (188, 'Hanche bloquée empêchant la flexion');
INSERT INTO public.symptome (ids, "desc") VALUES (189, 'Hématémèse');
INSERT INTO public.symptome (ids, "desc") VALUES (190, 'Hémoptysie');
INSERT INTO public.symptome (ids, "desc") VALUES (191, 'Hémorroïdes');
INSERT INTO public.symptome (ids, "desc") VALUES (192, 'Ictère');
INSERT INTO public.symptome (ids, "desc") VALUES (193, 'Impossibilité d''ouvrir les yeux par hypotonie musculaire');
INSERT INTO public.symptome (ids, "desc") VALUES (194, 'Impossibilité de fermer les paupières par contracture');
INSERT INTO public.symptome (ids, "desc") VALUES (195, 'Impossibilité de parler');
INSERT INTO public.symptome (ids, "desc") VALUES (196, 'Impressionnable');
INSERT INTO public.symptome (ids, "desc") VALUES (197, 'Impuissance');
INSERT INTO public.symptome (ids, "desc") VALUES (198, 'Indigestion');
INSERT INTO public.symptome (ids, "desc") VALUES (199, 'Inflammation axillaire');
INSERT INTO public.symptome (ids, "desc") VALUES (200, 'Inflammation de la bouche');
INSERT INTO public.symptome (ids, "desc") VALUES (201, 'Inflammation douloureuse des gencives et des dents');
INSERT INTO public.symptome (ids, "desc") VALUES (202, 'Inflammation et douleur du pharynx');
INSERT INTO public.symptome (ids, "desc") VALUES (203, 'Inquiétude');
INSERT INTO public.symptome (ids, "desc") VALUES (204, 'Insomnie');
INSERT INTO public.symptome (ids, "desc") VALUES (205, 'Insomnie imposant la station debout');
INSERT INTO public.symptome (ids, "desc") VALUES (206, 'Insomnie par soucis');
INSERT INTO public.symptome (ids, "desc") VALUES (207, 'Irradiation de la douleur du pubis au sacrum ainsi qu''aux reins, aux côtes flottantes et au xiiE');
INSERT INTO public.symptome (ids, "desc") VALUES (208, 'Irritabilité');
INSERT INTO public.symptome (ids, "desc") VALUES (209, 'Jambes affaiblies, détendues, sans force');
INSERT INTO public.symptome (ids, "desc") VALUES (210, 'Jaunisse');
INSERT INTO public.symptome (ids, "desc") VALUES (211, 'L''articulation du genou ne peut fléchir ni s''étendre');
INSERT INTO public.symptome (ids, "desc") VALUES (212, 'La langue a tendance à s''enrouler sur elle-même');
INSERT INTO public.symptome (ids, "desc") VALUES (213, 'La région de la tête et du dos est douloureuse');
INSERT INTO public.symptome (ids, "desc") VALUES (214, 'Langue rouge');
INSERT INTO public.symptome (ids, "desc") VALUES (215, 'Langue sèche');
INSERT INTO public.symptome (ids, "desc") VALUES (216, 'Larmoiements');
INSERT INTO public.symptome (ids, "desc") VALUES (217, 'Les selles peuvent contenir du sang et du pus');
INSERT INTO public.symptome (ids, "desc") VALUES (218, 'Lèvres bleues');
INSERT INTO public.symptome (ids, "desc") VALUES (219, 'Lèvres rouges et brillantes');
INSERT INTO public.symptome (ids, "desc") VALUES (220, 'Limitation de la rotation du corps');
INSERT INTO public.symptome (ids, "desc") VALUES (221, 'Lombalgie avec impossibilité de se pencher en avant ou en arrière');
INSERT INTO public.symptome (ids, "desc") VALUES (222, 'Lombalgie de type cassure');
INSERT INTO public.symptome (ids, "desc") VALUES (223, 'Lourdeur dans la poitrine');
INSERT INTO public.symptome (ids, "desc") VALUES (224, 'Maigreur');
INSERT INTO public.symptome (ids, "desc") VALUES (225, 'Mal de gorge et tuméfaction du cou');
INSERT INTO public.symptome (ids, "desc") VALUES (226, 'Manque de concentration');
INSERT INTO public.symptome (ids, "desc") VALUES (227, 'Manque de contrôle de la vessie');
INSERT INTO public.symptome (ids, "desc") VALUES (228, 'Marche en s''inclinant en avant');
INSERT INTO public.symptome (ids, "desc") VALUES (229, 'Mastoïdite');
INSERT INTO public.symptome (ids, "desc") VALUES (230, 'Mauvaise haleine');
INSERT INTO public.symptome (ids, "desc") VALUES (231, 'Membres atrophiés et froids avec douleur et chaleur dans la plante du pied');
INSERT INTO public.symptome (ids, "desc") VALUES (232, 'Membres courbés par tendons contractés');
INSERT INTO public.symptome (ids, "desc") VALUES (233, 'Membres supérieurs froids');
INSERT INTO public.symptome (ids, "desc") VALUES (234, 'Ménorragie');
INSERT INTO public.symptome (ids, "desc") VALUES (235, 'Miction excessive et hématurie');
INSERT INTO public.symptome (ids, "desc") VALUES (236, 'Miction faible mais fréquente');
INSERT INTO public.symptome (ids, "desc") VALUES (237, 'Mictions difficiles, voir arrêt des mictions');
INSERT INTO public.symptome (ids, "desc") VALUES (238, 'Mictions faibles');
INSERT INTO public.symptome (ids, "desc") VALUES (240, 'Migraines');
INSERT INTO public.symptome (ids, "desc") VALUES (241, 'Mouvements fréquents des intestins');
INSERT INTO public.symptome (ids, "desc") VALUES (242, 'Muscles des jambes atrophiés et dévitalisés');
INSERT INTO public.symptome (ids, "desc") VALUES (243, 'Nausée');
INSERT INTO public.symptome (ids, "desc") VALUES (244, 'Ne peut saisir les objets');
INSERT INTO public.symptome (ids, "desc") VALUES (245, 'Ne peut se lever quand on est assis');
INSERT INTO public.symptome (ids, "desc") VALUES (246, 'Obstruction pharyngienne');
INSERT INTO public.symptome (ids, "desc") VALUES (247, 'Œdème');
INSERT INTO public.symptome (ids, "desc") VALUES (248, 'Œdème au pubis et à l''aine');
INSERT INTO public.symptome (ids, "desc") VALUES (249, 'Œdème, distension abdominale');
INSERT INTO public.symptome (ids, "desc") VALUES (250, 'Œdèmes à la face interne des cuisses et des genoux avec refroidissement des extrémités et blocage du gros orteil');
INSERT INTO public.symptome (ids, "desc") VALUES (251, 'Œil fermé si la douleur y parvient');
INSERT INTO public.symptome (ids, "desc") VALUES (252, 'Oligurie');
INSERT INTO public.symptome (ids, "desc") VALUES (253, 'Otalgie');
INSERT INTO public.symptome (ids, "desc") VALUES (254, 'Oublieux');
INSERT INTO public.symptome (ids, "desc") VALUES (255, 'Palpitations');
INSERT INTO public.symptome (ids, "desc") VALUES (256, 'Paralysie du 5ème orteil');
INSERT INTO public.symptome (ids, "desc") VALUES (257, 'Paralysie faciale');
INSERT INTO public.symptome (ids, "desc") VALUES (258, 'Parasitose');
INSERT INTO public.symptome (ids, "desc") VALUES (259, 'Parle en dormant');
INSERT INTO public.symptome (ids, "desc") VALUES (260, 'Pas d''appétit');
INSERT INTO public.symptome (ids, "desc") VALUES (261, 'Pas de goût pour la vie');
INSERT INTO public.symptome (ids, "desc") VALUES (262, 'Peau déshydratée');
INSERT INTO public.symptome (ids, "desc") VALUES (263, 'Peau jaune et sans éclat');
INSERT INTO public.symptome (ids, "desc") VALUES (264, 'Peï du 1er mois d''hivers');
INSERT INTO public.symptome (ids, "desc") VALUES (265, 'Peï du 1er mois de l''automne');
INSERT INTO public.symptome (ids, "desc") VALUES (266, 'Peï du 1er mois de printemps');
INSERT INTO public.symptome (ids, "desc") VALUES (267, 'Peï du 2ème mois d''automne');
INSERT INTO public.symptome (ids, "desc") VALUES (268, 'Peï du 2ème mois d''été');
INSERT INTO public.symptome (ids, "desc") VALUES (269, 'Peï du 3ème mois de printemps');
INSERT INTO public.symptome (ids, "desc") VALUES (270, 'Peï du dernier mois d''automne');
INSERT INTO public.symptome (ids, "desc") VALUES (271, 'Peï du dernier mois d''été');
INSERT INTO public.symptome (ids, "desc") VALUES (272, 'Peï du dernier mois d''hivers');
INSERT INTO public.symptome (ids, "desc") VALUES (274, 'Pharyngite');
INSERT INTO public.symptome (ids, "desc") VALUES (275, 'Phobies');
INSERT INTO public.symptome (ids, "desc") VALUES (276, 'Phosphènes et surdité');
INSERT INTO public.symptome (ids, "desc") VALUES (277, 'Plaies saignantes des lèvres ou de la bouche');
INSERT INTO public.symptome (ids, "desc") VALUES (278, 'Plénitude douloureuse de la poitrine (emphysème) et des côtes entraînant dyspnée et toux avec mucosités purulentes');
INSERT INTO public.symptome (ids, "desc") VALUES (279, 'Plénitude thoracique');
INSERT INTO public.symptome (ids, "desc") VALUES (280, 'Poids sur la poitrine');
INSERT INTO public.symptome (ids, "desc") VALUES (281, 'Poitrine dilatée');
INSERT INTO public.symptome (ids, "desc") VALUES (282, 'Pollution nocturne');
INSERT INTO public.symptome (ids, "desc") VALUES (283, 'Possibilité de douleur lombaire et douleur dans les testicules ou l''aine');
INSERT INTO public.symptome (ids, "desc") VALUES (284, 'Pouls superficiel');
INSERT INTO public.symptome (ids, "desc") VALUES (285, 'Pour les femmes, inflammation du petit bassin');
INSERT INTO public.symptome (ids, "desc") VALUES (286, 'Précordialgie');
INSERT INTO public.symptome (ids, "desc") VALUES (287, 'Psychose maniaco-dépressive');
INSERT INTO public.symptome (ids, "desc") VALUES (288, 'Ptôse rectale');
INSERT INTO public.symptome (ids, "desc") VALUES (289, 'Pusillanimité');
INSERT INTO public.symptome (ids, "desc") VALUES (290, 'Quand le côté gauche réagit, l''œil droit ne peut plus s''ouvrir');
INSERT INTO public.symptome (ids, "desc") VALUES (291, 'Quand le dos est atteint, on ne peut pas se pencher en avant');
INSERT INTO public.symptome (ids, "desc") VALUES (292, 'Quand le ventre est atteint, on ne peut pas se pencher en arrière');
INSERT INTO public.symptome (ids, "desc") VALUES (293, 'Raideur linguale');
INSERT INTO public.symptome (ids, "desc") VALUES (294, 'Remontée d''énergie qui entraîne inquiétude et ennui');
INSERT INTO public.symptome (ids, "desc") VALUES (295, 'Respiration courte et rapide');
INSERT INTO public.symptome (ids, "desc") VALUES (296, 'Respiration courte et toux');
INSERT INTO public.symptome (ids, "desc") VALUES (297, 'Respiration faible');
INSERT INTO public.symptome (ids, "desc") VALUES (298, 'Respiration rapide');
INSERT INTO public.symptome (ids, "desc") VALUES (299, 'Respiration rapide et faible');
INSERT INTO public.symptome (ids, "desc") VALUES (300, 'Respiration rapide et superficielle');
INSERT INTO public.symptome (ids, "desc") VALUES (301, 'Rétention ou incontinence d''urine');
INSERT INTO public.symptome (ids, "desc") VALUES (302, 'Rhinorrhée de liquide clair');
INSERT INTO public.symptome (ids, "desc") VALUES (303, 'Rires incessants');
INSERT INTO public.symptome (ids, "desc") VALUES (304, 'S''attend à une catastrophe, toujours préoccupé');
INSERT INTO public.symptome (ids, "desc") VALUES (305, 'S’effraye facilement');
INSERT INTO public.symptome (ids, "desc") VALUES (306, 'Sang dans les selles');
INSERT INTO public.symptome (ids, "desc") VALUES (307, 'Sclérotique jaune');
INSERT INTO public.symptome (ids, "desc") VALUES (308, 'Sclérotique jaune et ictère de la face');
INSERT INTO public.symptome (ids, "desc") VALUES (309, 'Sécheresse de la bouche');
INSERT INTO public.symptome (ids, "desc") VALUES (310, 'Sécheresse de la bouche et de la gorge');
INSERT INTO public.symptome (ids, "desc") VALUES (311, 'Sécheresse de la gorge');
INSERT INTO public.symptome (ids, "desc") VALUES (312, 'Selles avec odeur nauséabonde');
INSERT INTO public.symptome (ids, "desc") VALUES (313, 'Selles fines');
INSERT INTO public.symptome (ids, "desc") VALUES (314, 'Selles rouges ou blanche avec aliments mal digérés');
INSERT INTO public.symptome (ids, "desc") VALUES (315, 'Sensation de chaleur face externe du pied');
INSERT INTO public.symptome (ids, "desc") VALUES (316, 'Sensation de corps lourd et douloureux');
INSERT INTO public.symptome (ids, "desc") VALUES (317, 'Sensation de faim; couleur du visage et des urines devient jaune');
INSERT INTO public.symptome (ids, "desc") VALUES (318, 'Sensation de froid ou de chaleur à la paume des mains');
INSERT INTO public.symptome (ids, "desc") VALUES (319, 'Si contre-courant, enflure des testicules ou des ovaires');
INSERT INTO public.symptome (ids, "desc") VALUES (320, 'Si froid, pénis rétracté vers l''intérieur');
INSERT INTO public.symptome (ids, "desc") VALUES (321, 'Si il y a blessure de la bosse frontale, le pied opposé ne peu plus remuer');
INSERT INTO public.symptome (ids, "desc") VALUES (322, 'Si la maladie s''aggrave quand le malade se couche à plat ventre sur un plan dur, état grave de sang et de pus');
INSERT INTO public.symptome (ids, "desc") VALUES (323, 'Soif');
INSERT INTO public.symptome (ids, "desc") VALUES (324, 'Soif excessive');
INSERT INTO public.symptome (ids, "desc") VALUES (325, 'Soupirs fréquents');
INSERT INTO public.symptome (ids, "desc") VALUES (326, 'Spasmes de l''appareil génital');
INSERT INTO public.symptome (ids, "desc") VALUES (327, 'Sperme froid');
INSERT INTO public.symptome (ids, "desc") VALUES (328, 'Sudation');
INSERT INTO public.symptome (ids, "desc") VALUES (329, 'Surdité');
INSERT INTO public.symptome (ids, "desc") VALUES (330, 'Surdité et troubles de l''audition');
INSERT INTO public.symptome (ids, "desc") VALUES (331, 'Surexcitation et rire facile');
INSERT INTO public.symptome (ids, "desc") VALUES (332, 'Surexcitation mentale et physique');
INSERT INTO public.symptome (ids, "desc") VALUES (333, 'Sursautes aux craquements de bois');
INSERT INTO public.symptome (ids, "desc") VALUES (334, 'Symptômes thoraco-pulmonaires (toux continuelle, dyspnée, gonflement thoracique)');
INSERT INTO public.symptome (ids, "desc") VALUES (335, 'Teint noirâtre');
INSERT INTO public.symptome (ids, "desc") VALUES (336, 'Teint sombre comme de la poussière');
INSERT INTO public.symptome (ids, "desc") VALUES (337, 'Teint terne et cendré');
INSERT INTO public.symptome (ids, "desc") VALUES (338, 'Tendance à se mordre la langue');
INSERT INTO public.symptome (ids, "desc") VALUES (339, 'Tendance à se mordre les lèvres');
INSERT INTO public.symptome (ids, "desc") VALUES (340, 'Tendinites');
INSERT INTO public.symptome (ids, "desc") VALUES (341, 'Tendons contractés et douloureux');
INSERT INTO public.symptome (ids, "desc") VALUES (342, 'Tête congestionnée');
INSERT INTO public.symptome (ids, "desc") VALUES (343, 'Tête lourde');
INSERT INTO public.symptome (ids, "desc") VALUES (344, 'Timidité');
INSERT INTO public.symptome (ids, "desc") VALUES (345, 'Tintement d''oreille');
INSERT INTO public.symptome (ids, "desc") VALUES (346, 'Torticolis');
INSERT INTO public.symptome (ids, "desc") VALUES (347, 'Tous les ligaments du trajet sont contractés');
INSERT INTO public.symptome (ids, "desc") VALUES (348, 'Tous les ligaments sont contractés');
INSERT INTO public.symptome (ids, "desc") VALUES (349, 'Tout le corps douloureux');
INSERT INTO public.symptome (ids, "desc") VALUES (350, 'Toutes les articulations sans force');
INSERT INTO public.symptome (ids, "desc") VALUES (351, 'Toutes les peurs névrotiques (du feu, des gens, des lieux)');
INSERT INTO public.symptome (ids, "desc") VALUES (352, 'Toux asthmatiforme avec sang nécessitant la position debout');
INSERT INTO public.symptome (ids, "desc") VALUES (353, 'Toux avec envie d''uriner');
INSERT INTO public.symptome (ids, "desc") VALUES (354, 'Toux avec hémoptysie');
INSERT INTO public.symptome (ids, "desc") VALUES (355, 'Toux et nez bouché');
INSERT INTO public.symptome (ids, "desc") VALUES (356, 'Transpiration');
INSERT INTO public.symptome (ids, "desc") VALUES (357, 'Transpiration au front');
INSERT INTO public.symptome (ids, "desc") VALUES (358, 'Transpiration avec pollakiurie et diminution de l''appétit');
INSERT INTO public.symptome (ids, "desc") VALUES (359, 'Transpiration brusque');
INSERT INTO public.symptome (ids, "desc") VALUES (360, 'Transpiration nocturne');
INSERT INTO public.symptome (ids, "desc") VALUES (361, 'Transpiration spontanée pendant la journée');
INSERT INTO public.symptome (ids, "desc") VALUES (362, 'Tremblements');
INSERT INTO public.symptome (ids, "desc") VALUES (363, 'Trouble du rythme cardiaque avec plénitude thoracique');
INSERT INTO public.symptome (ids, "desc") VALUES (364, 'Troubles du rythme cardiaque');
INSERT INTO public.symptome (ids, "desc") VALUES (365, 'Urine abondante et rouge');
INSERT INTO public.symptome (ids, "desc") VALUES (366, 'Urine claire et longue');
INSERT INTO public.symptome (ids, "desc") VALUES (367, 'Urine rouge ou jaune écarlate');
INSERT INTO public.symptome (ids, "desc") VALUES (368, 'Urines claires et abondantes');
INSERT INTO public.symptome (ids, "desc") VALUES (369, 'Variation de température');
INSERT INTO public.symptome (ids, "desc") VALUES (370, 'Vertige avec vomissements');
INSERT INTO public.symptome (ids, "desc") VALUES (371, 'Vertiges');
INSERT INTO public.symptome (ids, "desc") VALUES (372, 'Vertiges et céphalées');
INSERT INTO public.symptome (ids, "desc") VALUES (373, 'Visage fiévreux');
INSERT INTO public.symptome (ids, "desc") VALUES (374, 'Visage pâle');
INSERT INTO public.symptome (ids, "desc") VALUES (375, 'Visage pâle et joues rouges');
INSERT INTO public.symptome (ids, "desc") VALUES (376, 'Visage rouge');
INSERT INTO public.symptome (ids, "desc") VALUES (377, 'Visage sec, pareil à du bois sec');
INSERT INTO public.symptome (ids, "desc") VALUES (378, 'Vision avec flash');
INSERT INTO public.symptome (ids, "desc") VALUES (379, 'Vision brouillée');
INSERT INTO public.symptome (ids, "desc") VALUES (380, 'Voix faible');
INSERT INTO public.symptome (ids, "desc") VALUES (381, 'Vomissement de bile');
INSERT INTO public.symptome (ids, "desc") VALUES (382, 'Vomissements');
INSERT INTO public.symptome (ids, "desc") VALUES (383, 'Vomissements postprandiaux');
INSERT INTO public.symptome (ids, "desc") VALUES (384, 'Vue floue dans les cas graves');
INSERT INTO public.symptome (ids, "desc") VALUES (385, 'Vue trouble');
INSERT INTO public.symptome (ids, "desc") VALUES (386, 'Yeux jaunes');
INSERT INTO public.symptome (ids, "desc") VALUES (387, 'Yeux proéminents');
INSERT INTO public.symptome (ids, "desc") VALUES (388, 'Yeux rouges et enflés');
INSERT INTO public.symptome (ids, "desc") VALUES (389, 'Yeux vides');
INSERT INTO public.symptome (ids, "desc") VALUES (390, 'Paranoïa');
INSERT INTO public.symptome (ids, "desc") VALUES (391, 'Douleur et œdème du 5ème orteil');
INSERT INTO public.symptome (ids, "desc") VALUES (392, 'Douleur et œdème du talon');
INSERT INTO public.symptome (ids, "desc") VALUES (393, 'Creux poplité contracté');
INSERT INTO public.symptome (ids, "desc") VALUES (394, 'Colonne vertébrale pliée à l''envers');
INSERT INTO public.symptome (ids, "desc") VALUES (395, 'Muscles et ligaments de la nuques raidis');
INSERT INTO public.symptome (ids, "desc") VALUES (396, 'Impossibilité de lever l''épaule');
INSERT INTO public.symptome (ids, "desc") VALUES (397, 'Douleur tractive et filiforme de l''aisselle et du creux sus-claviculaire');
INSERT INTO public.symptome (ids, "desc") VALUES (398, 'Peï du 2ème mois de printemps');
INSERT INTO public.symptome (ids, "desc") VALUES (399, 'Mictions fréquentes en grande quantité');
INSERT INTO public.symptome (ids, "desc") VALUES (400, 'Convulsion épileptiforme, surtout chez les enfants');
INSERT INTO public.symptome (ids, "desc") VALUES (401, 'Dysménorrhées');
INSERT INTO public.symptome (ids, "desc") VALUES (402, 'Opisthotonos');
INSERT INTO public.symptome (ids, "desc") VALUES (403, 'Pathologies uro-génitales');
INSERT INTO public.symptome (ids, "desc") VALUES (404, 'Stérilité');
INSERT INTO public.symptome (ids, "desc") VALUES (405, 'Tête vide');
INSERT INTO public.symptome (ids, "desc") VALUES (406, 'Douleur étranglante abdominale ascendante au cœur avec racine dans le sexe (homme)');
INSERT INTO public.symptome (ids, "desc") VALUES (407, 'Spermatorrhée');
INSERT INTO public.symptome (ids, "desc") VALUES (408, 'Douleur ascendante au cœur (femme)');
INSERT INTO public.symptome (ids, "desc") VALUES (409, 'Gastralgie (femme)');
INSERT INTO public.symptome (ids, "desc") VALUES (410, 'Tumeur du bas-ventre (femme)');
INSERT INTO public.symptome (ids, "desc") VALUES (411, 'Perte blanche ou rouge avec accumulation de concrétions fécales (femme)');
INSERT INTO public.symptome (ids, "desc") VALUES (412, 'Troubles mictionnels (femme)');
INSERT INTO public.symptome (ids, "desc") VALUES (413, 'Gorge serrée');
INSERT INTO public.symptome (ids, "desc") VALUES (414, 'Sensation de remontée énergétique pelvienne');
INSERT INTO public.symptome (ids, "desc") VALUES (415, 'Douleur profonde de la face interne de la jambe et de la cuisse');
INSERT INTO public.symptome (ids, "desc") VALUES (416, 'Sécheresse O.R.L.');
INSERT INTO public.symptome (ids, "desc") VALUES (417, 'Pieds glacés');
INSERT INTO public.symptome (ids, "desc") VALUES (418, 'Chaleur au cuir chevelu');
INSERT INTO public.symptome (ids, "desc") VALUES (419, 'Blocage du diaphragme et dyspnée');
INSERT INTO public.symptome (ids, "desc") VALUES (420, 'Colites et douleur abdominale aiguë qui reste en bas');
INSERT INTO public.symptome (ids, "desc") VALUES (421, 'Désordres gynécologiques');
INSERT INTO public.symptome (ids, "desc") VALUES (422, 'Trouble de l''avers localisé au menton');
INSERT INTO public.symptome (ids, "desc") VALUES (423, 'Fatigue de la région lombaire, donne l''impression d''être assis dans de l''eau froide');
INSERT INTO public.symptome (ids, "desc") VALUES (424, 'Douleur oculaire avec rougeur (œil grand ouvert)');
INSERT INTO public.symptome (ids, "desc") VALUES (425, 'Agitation diurne');
INSERT INTO public.symptome (ids, "desc") VALUES (426, 'Pied ouvert sur l''externe');
INSERT INTO public.symptome (ids, "desc") VALUES (427, 'Fatigue des membres inférieurs');
INSERT INTO public.symptome (ids, "desc") VALUES (428, 'Goutte');
INSERT INTO public.symptome (ids, "desc") VALUES (429, 'Leucorrhée');
INSERT INTO public.symptome (ids, "desc") VALUES (430, 'Prolapsus utérin');
INSERT INTO public.symptome (ids, "desc") VALUES (431, 'Rhumatismes généralisés');
INSERT INTO public.symptome (ids, "desc") VALUES (432, 'Ventre gonflé et tendu comme la peau d''un tambour');
INSERT INTO public.symptome (ids, "desc") VALUES (433, 'Contracture de la face externe du membre inférieur');
INSERT INTO public.symptome (ids, "desc") VALUES (434, 'Douleur lombaire irradiante vers les organes sexuels et l''aine');
INSERT INTO public.symptome (ids, "desc") VALUES (435, 'Hypersomnie');
INSERT INTO public.symptome (ids, "desc") VALUES (436, 'Agitation nocturne');
INSERT INTO public.symptome (ids, "desc") VALUES (437, 'Œil fermé');
INSERT INTO public.symptome (ids, "desc") VALUES (438, 'Pied tourné vers l''intérieur');
INSERT INTO public.symptome (ids, "desc") VALUES (439, 'Asthénie');
INSERT INTO public.symptome (ids, "desc") VALUES (440, 'Alternance de froid et chaud');
INSERT INTO public.symptome (ids, "desc") VALUES (441, 'Douleur cardiaque et thoracique');
INSERT INTO public.symptome (ids, "desc") VALUES (442, 'Douleur sourde aux organes génitaux');
INSERT INTO public.symptome (ids, "desc") VALUES (443, 'Tristesse profonde');
INSERT INTO public.symptome (ids, "desc") VALUES (444, 'Gastralgie');
INSERT INTO public.symptome (ids, "desc") VALUES (445, 'Démangeaison du ventre');
INSERT INTO public.symptome (ids, "desc") VALUES (446, 'Douleur à la peau du ventre');
INSERT INTO public.symptome (ids, "desc") VALUES (447, 'Dos raide et contracté');
INSERT INTO public.symptome (ids, "desc") VALUES (448, 'Tête lourde et tremblante');


--
-- TOC entry 3031 (class 0 OID 16470)
-- Dependencies: 205
-- Data for Name: symptpatho; Type: TABLE DATA; Schema: public; Owner: pgtidal
--

INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (1, 15, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (2, 16, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (3, 94, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (4, 27, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (5, 9, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (6, 15, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (7, 49, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (8, 92, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (9, 7, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (9, 105, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (10, 11, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (11, 2, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (12, 56, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (13, 57, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (14, 45, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (15, 44, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (16, 19, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (17, 7, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (18, 57, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (19, 19, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (20, 19, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (21, 4, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (22, 2, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (22, 26, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (23, 20, true);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (24, 1, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (25, 5, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (26, 48, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (27, 17, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (28, 81, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (29, 46, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (30, 57, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (31, 95, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (32, 12, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (33, 49, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (34, 50, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (35, 49, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (36, 63, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (37, 64, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (38, 3, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (39, 97, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (40, 36, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (41, 10, true);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (42, 57, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (43, 48, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (44, 86, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (45, 95, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (46, 19, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (47, 55, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (48, 70, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (49, 95, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (50, 15, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (51, 8, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (52, 13, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (52, 37, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (52, 103, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (53, 72, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (54, 63, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (55, 20, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (56, 11, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (57, 46, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (58, 66, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (59, 50, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (60, 23, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (61, 23, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (62, 60, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (63, 32, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (64, 85, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (65, 60, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (66, 54, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (66, 91, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (67, 16, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (68, 80, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (69, 93, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (70, 96, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (71, 19, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (72, 56, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (73, 1, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (74, 23, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (75, 16, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (75, 57, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (76, 91, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (77, 47, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (79, 79, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (80, 27, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (81, 62, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (82, 81, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (83, 21, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (84, 36, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (85, 77, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (86, 17, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (87, 48, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (88, 2, true);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (89, 32, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (90, 49, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (90, 57, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (91, 71, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (92, 27, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (93, 24, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (93, 33, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (94, 18, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (95, 65, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (96, 49, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (97, 98, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (98, 59, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (99, 36, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (100, 62, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (101, 35, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (102, 23, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (103, 94, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (104, 86, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (105, 86, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (106, 82, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (107, 42, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (107, 109, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (108, 46, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (109, 42, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (110, 46, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (111, 42, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (113, 82, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (114, 32, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (115, 94, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (116, 50, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (117, 61, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (118, 27, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (119, 57, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (120, 32, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (121, 1, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (122, 2, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (123, 71, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (124, 20, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (125, 15, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (125, 105, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (125, 108, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (126, 49, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (127, 26, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (128, 41, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (128, 69, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (129, 28, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (130, 82, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (131, 67, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (132, 11, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (133, 8, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (134, 9, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (135, 43, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (136, 86, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (137, 64, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (138, 82, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (139, 50, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (140, 8, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (141, 96, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (142, 56, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (143, 51, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (144, 52, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (145, 2, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (145, 56, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (146, 83, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (147, 43, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (147, 50, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (148, 42, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (149, 96, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (150, 98, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (151, 14, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (152, 6, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (153, 50, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (154, 8, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (154, 50, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (154, 52, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (155, 26, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (156, 55, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (157, 24, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (157, 33, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (158, 18, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (158, 25, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (158, 34, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (158, 83, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (158, 110, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (159, 63, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (160, 25, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (160, 34, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (161, 81, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (162, 48, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (163, 82, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (164, 20, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (164, 50, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (165, 7, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (166, 20, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (166, 50, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (167, 40, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (167, 68, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (168, 56, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (169, 82, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (170, 11, true);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (171, 13, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (173, 16, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (174, 41, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (174, 69, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (175, 18, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (176, 47, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (177, 78, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (178, 54, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (179, 20, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (179, 27, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (179, 29, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (180, 63, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (181, 90, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (182, 76, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (183, 7, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (184, 8, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (185, 88, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (186, 24, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (186, 33, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (187, 76, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (188, 49, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (189, 40, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (189, 68, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (190, 61, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (190, 95, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (191, 17, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (191, 50, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (191, 101, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (192, 50, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (193, 23, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (194, 23, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (195, 38, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (196, 55, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (197, 62, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (197, 107, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (198, 25, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (198, 34, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (199, 71, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (200, 15, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (201, 10, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (202, 70, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (203, 64, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (204, 15, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (204, 38, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (204, 88, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (204, 89, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (204, 97, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (204, 108, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (205, 27, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (206, 87, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (207, 85, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (208, 88, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (209, 84, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (210, 27, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (210, 57, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (211, 85, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (212, 74, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (213, 51, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (214, 15, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (215, 76, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (216, 50, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (217, 80, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (218, 27, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (219, 24, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (219, 33, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (220, 27, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (221, 90, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (222, 49, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (223, 76, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (223, 88, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (224, 56, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (225, 10, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (226, 75, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (227, 55, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (228, 42, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (229, 87, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (230, 25, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (230, 34, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (231, 57, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (232, 95, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (233, 2, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (234, 40, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (234, 68, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (235, 97, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (236, 55, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (237, 27, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (238, 25, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (238, 34, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (238, 58, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (240, 82, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (240, 86, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (240, 96, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (241, 62, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (242, 22, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (243, 6, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (244, 73, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (245, 84, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (246, 70, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (247, 25, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (247, 34, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (247, 55, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (247, 104, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (248, 23, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (249, 79, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (250, 27, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (251, 46, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (252, 48, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (253, 71, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (254, 41, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (254, 69, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (255, 40, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (255, 68, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (256, 50, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (257, 20, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (258, 55, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (259, 15, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (259, 40, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (259, 68, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (260, 25, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (260, 34, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (261, 25, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (261, 34, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (262, 81, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (263, 25, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (263, 34, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (264, 67, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (265, 60, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (266, 85, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (267, 32, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (268, 46, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (269, 23, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (270, 94, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (271, 74, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (272, 39, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (274, 20, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (275, 19, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (276, 61, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (277, 20, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (278, 6, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (279, 91, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (280, 63, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (281, 24, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (281, 33, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (282, 41, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (282, 61, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (282, 69, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (283, 47, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (284, 1, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (285, 90, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (286, 81, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (287, 21, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (288, 16, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (289, 87, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (290, 85, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (291, 60, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (292, 60, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (293, 26, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (294, 58, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (295, 75, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (296, 2, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (297, 7, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (298, 41, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (298, 69, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (299, 56, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (300, 78, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (301, 91, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (302, 50, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (303, 63, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (304, 56, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (305, 41, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (305, 69, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (306, 15, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (307, 43, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (308, 36, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (309, 11, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (310, 35, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (311, 90, true);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (311, 101, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (312, 17, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (313, 18, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (314, 48, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (315, 81, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (316, 26, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (317, 19, true);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (318, 2, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (319, 93, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (320, 94, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (321, 85, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (322, 39, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (323, 2, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (323, 8, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (323, 35, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (323, 40, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (323, 68, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (324, 11, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (325, 81, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (326, 96, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (327, 62, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (328, 82, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (329, 43, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (329, 95, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (330, 70, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (331, 47, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (332, 40, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (332, 68, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (333, 19, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (334, 1, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (335, 56, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (336, 90, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (337, 81, true);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (338, 57, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (339, 27, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (340, 88, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (341, 98, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (342, 24, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (342, 33, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (343, 87, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (343, 101, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (344, 41, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (344, 69, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (345, 96, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (346, 50, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (347, 39, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (348, 74, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (349, 30, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (349, 99, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (350, 31, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (350, 100, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (351, 19, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (352, 56, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (353, 7, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (354, 8, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (355, 95, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (356, 20, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (356, 71, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (357, 76, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (358, 1, true);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (359, 15, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (360, 61, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (361, 41, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (361, 69, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (362, 87, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (363, 63, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (364, 41, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (364, 69, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (365, 47, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (366, 79, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (367, 40, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (367, 68, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (368, 18, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (369, 88, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (370, 89, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (371, 96, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (372, 97, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (373, 8, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (374, 41, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (374, 69, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (375, 7, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (376, 40, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (376, 68, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (377, 56, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (378, 61, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (379, 88, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (380, 7, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (380, 75, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (381, 95, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (382, 88, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (382, 91, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (382, 98, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (383, 26, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (384, 1, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (385, 90, true);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (386, 11, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (386, 63, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (387, 50, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (388, 40, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (388, 68, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (389, 25, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (389, 34, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (390, 41, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (390, 69, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (391, 53, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (392, 53, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (393, 53, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (394, 53, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (395, 53, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (396, 53, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (397, 53, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (398, 53, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (399, 4, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (400, 101, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (401, 101, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (402, 101, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (403, 101, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (404, 101, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (405, 101, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (406, 10, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (406, 102, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (407, 102, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (408, 102, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (409, 102, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (410, 102, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (411, 102, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (412, 102, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (413, 103, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (414, 103, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (415, 104, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (416, 104, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (417, 104, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (418, 105, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (419, 106, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (420, 106, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (421, 106, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (422, 106, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (423, 107, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (424, 108, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (425, 108, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (426, 108, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (427, 107, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (428, 107, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (429, 107, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (430, 107, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (431, 107, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (432, 107, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (433, 108, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (434, 109, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (435, 109, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (436, 109, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (437, 109, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (438, 109, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (439, 110, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (440, 110, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (441, 111, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (442, 111, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (443, 111, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (444, 111, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (445, 115, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (446, 114, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (447, 112, false);
INSERT INTO public.symptpatho (ids, idp, aggr) VALUES (448, 113, false);


--
-- TOC entry 3033 (class 0 OID 16479)
-- Dependencies: 207
-- Data for Name: userTable; Type: TABLE DATA; Schema: public; Owner: pgtidal
--

INSERT INTO public."userTable" (id, username, password, email) OVERRIDING SYSTEM VALUE VALUES (4, 'root', 'toor', 'root@root.root');
INSERT INTO public."userTable" (id, username, password, email) OVERRIDING SYSTEM VALUE VALUES (5, 'Fares06', '$2y$10$iCeP8ihf9esH1MIL3CR0y.6oie.5o0BRynHZB/1ky9ktKXH94ROQ2', 'fares@fares.com');
INSERT INTO public."userTable" (id, username, password, email) OVERRIDING SYSTEM VALUE VALUES (6, 'admin', '$2y$10$viSWowIE19JAYKdE64LyGuzI39L8jn82JhqkmwdhGjsra4OV7Tbc6', 'admin@admin.com');
INSERT INTO public."userTable" (id, username, password, email) OVERRIDING SYSTEM VALUE VALUES (7, 'Michel', '$2y$10$NsPvE8i1fWdMB6fLcAK27.bWGrEd1EMZTOs9JEVrWbOu654V2aNAi', 'jean.michel@gmail.com');
INSERT INTO public."userTable" (id, username, password, email) OVERRIDING SYSTEM VALUE VALUES (8, 'romain', '$2y$10$X5r4MLqZxBpORlQJG5ph6uZ3563nqqnc8mzE8u0wQvqJ8smmqilyq', 'romain.gaud@cpe.fr');
INSERT INTO public."userTable" (id, username, password, email) OVERRIDING SYSTEM VALUE VALUES (9, 'bubu', '$2y$10$KVihpREIj7uPUva75sguzOA5svBCb/oN11SGES8Hbe4WOOKTJ0.Iy', 'bubu@cpe.fr');


--
-- TOC entry 3064 (class 0 OID 0)
-- Dependencies: 206
-- Name: userTable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pgtidal
--

SELECT pg_catalog.setval('public."userTable_id_seq"', 9, true);


--
-- TOC entry 2881 (class 2606 OID 16446)
-- Name: keysympt pk_keysympt; Type: CONSTRAINT; Schema: public; Owner: pgtidal
--

ALTER TABLE ONLY public.keysympt
    ADD CONSTRAINT pk_keysympt PRIMARY KEY (idk, ids);


--
-- TOC entry 3065 (class 0 OID 0)
-- Dependencies: 2881
-- Name: CONSTRAINT pk_keysympt ON keysympt; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON CONSTRAINT pk_keysympt ON public.keysympt IS 'Clé primaire (cluster)';


--
-- TOC entry 2883 (class 2606 OID 16452)
-- Name: keywords pk_keywords; Type: CONSTRAINT; Schema: public; Owner: pgtidal
--

ALTER TABLE ONLY public.keywords
    ADD CONSTRAINT pk_keywords PRIMARY KEY (idk);


--
-- TOC entry 3066 (class 0 OID 0)
-- Dependencies: 2883
-- Name: CONSTRAINT pk_keywords ON keywords; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON CONSTRAINT pk_keywords ON public.keywords IS 'Clé primaire';


--
-- TOC entry 2886 (class 2606 OID 16457)
-- Name: meridien pk_meridien; Type: CONSTRAINT; Schema: public; Owner: pgtidal
--

ALTER TABLE ONLY public.meridien
    ADD CONSTRAINT pk_meridien PRIMARY KEY (code);


--
-- TOC entry 3067 (class 0 OID 0)
-- Dependencies: 2886
-- Name: CONSTRAINT pk_meridien ON meridien; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON CONSTRAINT pk_meridien ON public.meridien IS 'Clé primaire';


--
-- TOC entry 2889 (class 2606 OID 16463)
-- Name: patho pk_patho; Type: CONSTRAINT; Schema: public; Owner: pgtidal
--

ALTER TABLE ONLY public.patho
    ADD CONSTRAINT pk_patho PRIMARY KEY (idp);


--
-- TOC entry 3068 (class 0 OID 0)
-- Dependencies: 2889
-- Name: CONSTRAINT pk_patho ON patho; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON CONSTRAINT pk_patho ON public.patho IS 'Clé primaire';


--
-- TOC entry 2891 (class 2606 OID 16469)
-- Name: symptome pk_symptome; Type: CONSTRAINT; Schema: public; Owner: pgtidal
--

ALTER TABLE ONLY public.symptome
    ADD CONSTRAINT pk_symptome PRIMARY KEY (ids);


--
-- TOC entry 3069 (class 0 OID 0)
-- Dependencies: 2891
-- Name: CONSTRAINT pk_symptome ON symptome; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON CONSTRAINT pk_symptome ON public.symptome IS 'Clé primaire';


--
-- TOC entry 2893 (class 2606 OID 16475)
-- Name: symptpatho pk_symptpatho; Type: CONSTRAINT; Schema: public; Owner: pgtidal
--

ALTER TABLE ONLY public.symptpatho
    ADD CONSTRAINT pk_symptpatho PRIMARY KEY (ids, idp);


--
-- TOC entry 3070 (class 0 OID 0)
-- Dependencies: 2893
-- Name: CONSTRAINT pk_symptpatho ON symptpatho; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON CONSTRAINT pk_symptpatho ON public.symptpatho IS 'Clé primaire (cluster)';


--
-- TOC entry 2895 (class 2606 OID 16486)
-- Name: userTable userTable_pkey; Type: CONSTRAINT; Schema: public; Owner: pgtidal
--

ALTER TABLE ONLY public."userTable"
    ADD CONSTRAINT "userTable_pkey" PRIMARY KEY (id);


--
-- TOC entry 2887 (class 1259 OID 16464)
-- Name: idx_fk_patho_mer_code; Type: INDEX; Schema: public; Owner: pgtidal
--

CREATE INDEX idx_fk_patho_mer_code ON public.patho USING btree (mer);


--
-- TOC entry 3071 (class 0 OID 0)
-- Dependencies: 2887
-- Name: INDEX idx_fk_patho_mer_code; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON INDEX public.idx_fk_patho_mer_code IS 'Index sur le champ "mer" (code du méridien), clé étrangère';


--
-- TOC entry 2884 (class 1259 OID 16458)
-- Name: idx_meridien_element; Type: INDEX; Schema: public; Owner: pgtidal
--

CREATE INDEX idx_meridien_element ON public.meridien USING btree (element);


--
-- TOC entry 3072 (class 0 OID 0)
-- Dependencies: 2884
-- Name: INDEX idx_meridien_element; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON INDEX public.idx_meridien_element IS 'Index sur le champ élément';


-- Completed on 2022-03-16 08:44:32 CET

--
-- PostgreSQL database dump complete
--

