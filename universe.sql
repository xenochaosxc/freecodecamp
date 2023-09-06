--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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
    name character varying NOT NULL,
    type text,
    diameter integer,
    magnetic boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer,
    tidal boolean,
    mean_diameter integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    star_id integer,
    diameter numeric(5,3),
    mass numeric(5,2),
    axis numeric(4,2),
    period numeric(5,2),
    inclination numeric(4,3),
    eccentricity numeric(4,3),
    rotation numeric(5,2),
    moons integer,
    tilt numeric(5,2),
    rings boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    solar_system_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer,
    star_id integer,
    galaxy_id integer,
    moon_id integer
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_system_solar_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_system_solar_system_id_seq OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_system_solar_system_id_seq OWNED BY public.solar_system.solar_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer,
    type text,
    diameter integer,
    magnetic boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: solar_system solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system ALTER COLUMN solar_system_id SET DEFAULT nextval('public.solar_system_solar_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'E0', 'elliptical', 9999, true);
INSERT INTO public.galaxy VALUES (2, 'E3', 'elliptical', 9999, true);
INSERT INTO public.galaxy VALUES (3, 'E7', 'shell', 9999, true);
INSERT INTO public.galaxy VALUES (4, 'S0', 'shell', 9999, true);
INSERT INTO public.galaxy VALUES (5, 'Sa', 'spiral', 9999, true);
INSERT INTO public.galaxy VALUES (6, 'SBa', 'spiral', 9999, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, true, 3500);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, false, 17);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, false, 17);
INSERT INTO public.moon VALUES (4, 'Ganymede', 5, false, 5000);
INSERT INTO public.moon VALUES (5, 'Callisto', 5, false, 5000);
INSERT INTO public.moon VALUES (6, 'Io', 5, false, 3500);
INSERT INTO public.moon VALUES (7, 'Europa', 5, false, 3500);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, false, 175);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, false, 175);
INSERT INTO public.moon VALUES (10, 'Thebe', 5, false, 175);
INSERT INTO public.moon VALUES (11, 'Elara', 5, false, 75);
INSERT INTO public.moon VALUES (12, 'Pasiphae', 5, false, 75);
INSERT INTO public.moon VALUES (13, 'Carme', 5, false, 42);
INSERT INTO public.moon VALUES (14, 'Metis', 5, false, 42);
INSERT INTO public.moon VALUES (15, 'Sinope', 5, false, 42);
INSERT INTO public.moon VALUES (16, 'Lysithea', 5, false, 42);
INSERT INTO public.moon VALUES (17, 'Ananke', 5, false, 42);
INSERT INTO public.moon VALUES (18, 'Leda', 5, false, 17);
INSERT INTO public.moon VALUES (19, 'Adrastea', 5, false, 17);
INSERT INTO public.moon VALUES (20, 'Titan', 6, false, 5000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 5, 0.383, 0.06, 0.39, 0.24, 7.000, 0.206, 58.65, 0, 0.04, false);
INSERT INTO public.planet VALUES (2, 'Venus', 5, 0.949, 0.81, 0.72, 0.62, 3.390, 0.007, 243.02, 0, 177.30, false);
INSERT INTO public.planet VALUES (3, 'Earth', 5, 1.000, 1.00, 1.00, 1.00, 0.000, 0.017, 1.00, 1, 23.44, false);
INSERT INTO public.planet VALUES (4, 'Mars', 5, 0.532, 0.11, 1.52, 1.88, 1.850, 0.093, 1.03, 2, 25.19, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 5, 11.209, 317.83, 5.20, 11.86, 1.300, 0.048, 0.41, 95, 3.13, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 5, 9.449, 95.16, 9.54, 29.45, 2.490, 0.054, 0.44, 146, 26.73, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 5, 4.007, 14.54, 19.19, 84.02, 0.773, 0.047, 0.72, 27, 97.77, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 5, 3.883, 17.15, 30.07, 164.79, 1.770, 0.009, 0.67, 14, 28.32, true);
INSERT INTO public.planet VALUES (9, 'Ceres', 5, 0.074, 0.00, 2.77, 4.60, 9.990, 0.080, 0.38, 0, 4.00, false);
INSERT INTO public.planet VALUES (10, 'Orcus', 5, 0.072, 0.00, 39.42, 247.50, 9.990, 0.226, 9.54, 1, 0.00, false);
INSERT INTO public.planet VALUES (11, 'Pluto', 5, 0.186, 0.00, 39.48, 247.90, 9.990, 0.249, 6.39, 5, 119.60, false);
INSERT INTO public.planet VALUES (12, 'Haumea', 5, 0.130, 0.00, 43.34, 283.80, 9.990, 0.195, 0.16, 2, 126.00, true);


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES (1, 'local', 3, 5, 1, 1);
INSERT INTO public.solar_system VALUES (2, 'local', 3, 5, 1, 1);
INSERT INTO public.solar_system VALUES (3, 'local', 3, 5, 1, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Zeta Ophiuchi', 1, 'O', 4300, true);
INSERT INTO public.star VALUES (2, 'Rigel', 1, 'B', 3420, true);
INSERT INTO public.star VALUES (3, 'Altair', 3, 'A', 6030, true);
INSERT INTO public.star VALUES (4, 'Procyon A', 2, 'F', 2040, true);
INSERT INTO public.star VALUES (5, 'Sun', 2, 'G', 4235, true);
INSERT INTO public.star VALUES (6, 'Epsilon Indi', 2, 'K', 6099, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_system_solar_system_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id UNIQUE (moon_id);


--
-- Name: galaxy pk_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT pk_galaxy PRIMARY KEY (galaxy_id);


--
-- Name: moon pk_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT pk_moon PRIMARY KEY (moon_id);


--
-- Name: planet pk_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT pk_planet PRIMARY KEY (planet_id);


--
-- Name: solar_system pk_solar_system; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT pk_solar_system PRIMARY KEY (solar_system_id);


--
-- Name: star pk_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT pk_star PRIMARY KEY (star_id);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id UNIQUE (planet_id);


--
-- Name: solar_system solar_system_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_id UNIQUE (solar_system_id);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id UNIQUE (star_id);


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

