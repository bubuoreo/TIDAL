--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5 (Debian 13.5-0+deb11u1)
-- Dumped by pg_dump version 13.5 (Debian 13.5-0+deb11u1)

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
-- Name: TABLE "userTable"; Type: COMMENT; Schema: public; Owner: pgtidal
--

COMMENT ON TABLE public."userTable" IS 'Table des utilisateurs';


--
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
-- Data for Name: userTable; Type: TABLE DATA; Schema: public; Owner: pgtidal
--

INSERT INTO public."userTable" (id, username, password, email) OVERRIDING SYSTEM VALUE VALUES (5, 'Fares06', '$2y$10$iCeP8ihf9esH1MIL3CR0y.6oie.5o0BRynHZB/1ky9ktKXH94ROQ2', 'fares@fares.com');
INSERT INTO public."userTable" (id, username, password, email) OVERRIDING SYSTEM VALUE VALUES (6, 'admin', '$2y$10$viSWowIE19JAYKdE64LyGuzI39L8jn82JhqkmwdhGjsra4OV7Tbc6', 'admin@admin.com');
INSERT INTO public."userTable" (id, username, password, email) OVERRIDING SYSTEM VALUE VALUES (7, 'Michel', '$2y$10$NsPvE8i1fWdMB6fLcAK27.bWGrEd1EMZTOs9JEVrWbOu654V2aNAi', 'jean.michel@gmail.com');
INSERT INTO public."userTable" (id, username, password, email) OVERRIDING SYSTEM VALUE VALUES (8, 'romain', '$2y$10$X5r4MLqZxBpORlQJG5ph6uZ3563nqqnc8mzE8u0wQvqJ8smmqilyq', 'romain.gaud@cpe.fr');
INSERT INTO public."userTable" (id, username, password, email) OVERRIDING SYSTEM VALUE VALUES (9, 'bubu', '$2y$10$KVihpREIj7uPUva75sguzOA5svBCb/oN11SGES8Hbe4WOOKTJ0.Iy', 'bubu@cpe.fr');
INSERT INTO public."userTable" (id, username, password, email) OVERRIDING SYSTEM VALUE VALUES (4, 'root', '$2y$10$Aa4WSa24RUhIz2E/4.lHy.esBHsOhiU0AgZkGW4Ks0Cyl1jeHClE2', 'root@root.root');
INSERT INTO public."userTable" (id, username, password, email) OVERRIDING SYSTEM VALUE VALUES (11, 'test', '$2y$10$kfy7/7jQkwI9gZrvSOR7xu.rplh.ijIz.fAptEYiMr57q15RHwE7G', 'test@test.test');


--
-- Name: userTable_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pgtidal
--

SELECT pg_catalog.setval('public."userTable_id_seq"', 11, true);


--
-- PostgreSQL database dump complete
--

