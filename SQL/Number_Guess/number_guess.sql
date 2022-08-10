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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    username character varying(50),
    games_played integer,
    best_game integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES ('me', 30, 4);
INSERT INTO public.games VALUES ('momo', 0, NULL);
INSERT INTO public.games VALUES ('MOMO', 0, NULL);
INSERT INTO public.games VALUES ('Momo', 0, NULL);
INSERT INTO public.games VALUES ('dsfg', 1, NULL);
INSERT INTO public.games VALUES ('utrr', 1, NULL);
INSERT INTO public.games VALUES ('kopk', 1, NULL);
INSERT INTO public.games VALUES ('poiiuz', 1, NULL);
INSERT INTO public.games VALUES ('bksdfald', 1, 10);
INSERT INTO public.games VALUES ('user_1660119780721', 2, 59);
INSERT INTO public.games VALUES ('user_1660119780722', 5, 22);
INSERT INTO public.games VALUES ('user_1660119983113', 2, 308);
INSERT INTO public.games VALUES ('user_1660119983114', 5, 29);


--
-- PostgreSQL database dump complete
--

