--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    size integer,
    mass numeric,
    temperature integer,
    in_our_system boolean,
    remarks text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: iss; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.iss (
    planet_id integer,
    star_id integer,
    moon_id integer,
    name character varying(20) NOT NULL,
    iss_id integer NOT NULL,
    is_real boolean,
    persons_on_board integer,
    remarks text
);


ALTER TABLE public.iss OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(20) NOT NULL,
    size integer,
    mass numeric,
    temperature integer,
    in_our_system boolean,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    remarks text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(20),
    size integer,
    mass numeric,
    temperature integer,
    in_our_system boolean,
    galaxy_id integer,
    star_id integer NOT NULL,
    moon_id integer,
    remarks text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    size integer,
    mass numeric,
    temperature integer,
    in_our_system boolean,
    galaxy_id integer,
    remarks text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Goodi', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Badi', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Steffen', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Karlos', NULL, 999999999999999999999999999995, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Stargalaxy', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'creative_galaxy_name', NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: iss; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.iss VALUES (1, NULL, NULL, 'ISS', 1, true, 11, NULL);
INSERT INTO public.iss VALUES (5, NULL, NULL, 'OSS', 2, false, 9, NULL);
INSERT INTO public.iss VALUES (12, NULL, NULL, 'MSS', 3, true, 512, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Mooni', NULL, NULL, NULL, true, NULL, NULL, 1, NULL);
INSERT INTO public.moon VALUES (2, 'Moon2', NULL, NULL, 345, true, NULL, NULL, 3, NULL);
INSERT INTO public.moon VALUES (3, 'Moon3', NULL, NULL, -56, true, NULL, NULL, 4, NULL);
INSERT INTO public.moon VALUES (4, 'Moon4', NULL, NULL, 558, false, NULL, NULL, 10, NULL);
INSERT INTO public.moon VALUES (5, 'Moon5', NULL, NULL, 585, false, NULL, NULL, 10, NULL);
INSERT INTO public.moon VALUES (6, 'Moon6', NULL, NULL, 554, false, NULL, NULL, 11, NULL);
INSERT INTO public.moon VALUES (7, 'Moon7', NULL, NULL, -56, true, NULL, NULL, 5, NULL);
INSERT INTO public.moon VALUES (8, 'Moon8', NULL, NULL, -300, true, NULL, NULL, 7, NULL);
INSERT INTO public.moon VALUES (9, 'Moon9', NULL, NULL, 3522, false, NULL, NULL, 12, NULL);
INSERT INTO public.moon VALUES (10, 'Moon10', NULL, NULL, 0, false, NULL, NULL, 11, NULL);
INSERT INTO public.moon VALUES (11, 'Moon11', NULL, NULL, 55, true, NULL, NULL, 4, NULL);
INSERT INTO public.moon VALUES (12, 'Moon12', NULL, NULL, 125, false, NULL, NULL, 10, NULL);
INSERT INTO public.moon VALUES (13, 'Moon13', NULL, NULL, -312, true, NULL, NULL, 3, NULL);
INSERT INTO public.moon VALUES (14, 'Moon14', NULL, NULL, 200, true, NULL, NULL, 8, NULL);
INSERT INTO public.moon VALUES (15, 'Moon15', NULL, NULL, -265, false, NULL, NULL, 10, NULL);
INSERT INTO public.moon VALUES (16, 'Moon16', NULL, NULL, 400, false, NULL, NULL, 12, NULL);
INSERT INTO public.moon VALUES (17, 'Moonika', NULL, NULL, 65, false, NULL, NULL, 11, NULL);
INSERT INTO public.moon VALUES (18, 'Moon18', NULL, NULL, -158, true, NULL, NULL, 7, NULL);
INSERT INTO public.moon VALUES (19, 'Moon19', NULL, NULL, 1258, false, NULL, NULL, 12, NULL);
INSERT INTO public.moon VALUES (20, 'Moon20', NULL, NULL, -301, true, NULL, NULL, 9, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 6371000, 5973000000000000000000000, NULL, true, 1, 1, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Jupiter', 69911000, 18981027, -238, NULL, NULL, 1, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'Mars', 3389500, 6391023, -81, NULL, NULL, 1, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'Merkur', 2439700, 32851023, 354, NULL, NULL, 1, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'Saturn', 58232, 56831026, -285, NULL, NULL, 1, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'Uranus', 25362, 86811025, -352, NULL, NULL, 1, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Venus', 6051800, 48671024, 900, NULL, NULL, 1, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Neptun', 24622000, 10241026, -373, NULL, NULL, 1, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Pluto', 1188300, 13091022, -387, NULL, NULL, 1, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Planet1', 22566, 15231025, 25, NULL, NULL, 3, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Planet2', 556999853, 1215551035, 30, NULL, NULL, 2, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Planet3', 225522, 21030, 559, NULL, NULL, 5, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sterni', 5699982, 10000, NULL, true, 1, NULL);
INSERT INTO public.star VALUES (2, 'Sonni', NULL, NULL, 9956, false, 3, NULL);
INSERT INTO public.star VALUES (3, 'Stern', NULL, NULL, 556875, false, 3, NULL);
INSERT INTO public.star VALUES (4, 'NoNameStar', NULL, NULL, 2200012, false, 4, NULL);
INSERT INTO public.star VALUES (5, 'Steffi', NULL, NULL, 1, true, 1, NULL);
INSERT INTO public.star VALUES (6, 'Brezel', NULL, NULL, 9970, false, 2, NULL);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: iss iss_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.iss
    ADD CONSTRAINT iss_pkey PRIMARY KEY (iss_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy UNIQUE (galaxy_id);


--
-- Name: iss unique_iss; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.iss
    ADD CONSTRAINT unique_iss UNIQUE (iss_id);


--
-- Name: planet unique_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet UNIQUE (planet_id);


--
-- Name: star unique_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star UNIQUE (star_id);


--
-- Name: moon uniqueness; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT uniqueness UNIQUE (name);


--
-- Name: iss iss_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.iss
    ADD CONSTRAINT iss_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

