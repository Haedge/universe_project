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
    name character varying(255) NOT NULL,
    galaxy_types text,
    age_in_millions_of_years integer,
    contains_life boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: meteor; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.meteor (
    meteor_id integer NOT NULL,
    distance_from_earth numeric,
    galaxy_id integer,
    is_spherical boolean,
    temp numeric,
    name character varying(255) NOT NULL,
    age_in_millions_of_years integer
);


ALTER TABLE public.meteor OWNER TO freecodecamp;

--
-- Name: meteor_meteor_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.meteor_meteor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meteor_meteor_id_seq OWNER TO freecodecamp;

--
-- Name: meteor_meteor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.meteor_meteor_id_seq OWNED BY public.meteor.meteor_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age_in_millions_of_years numeric,
    distance_from_earth numeric,
    has_life boolean,
    is_spherical boolean,
    description text,
    planet_id integer
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
    name character varying(255) NOT NULL,
    age_in_millions_of_years numeric,
    has_life boolean,
    is_spherical boolean,
    description text,
    star_id integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    age_in_millions_of_years numeric,
    distance_from_earth numeric,
    is_spherical boolean,
    galaxy_id integer
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

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: meteor meteor_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor ALTER COLUMN meteor_id SET DEFAULT nextval('public.meteor_meteor_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way Galaxy', 'Spiral Galaxy', 13600, true);
INSERT INTO public.galaxy VALUES (0, 'Andromeda Galaxy', 'Spiral Galaxy', 10000, false);
INSERT INTO public.galaxy VALUES (2, 'Triangulum Galaxy', 'Spiral Galaxy', 24000, false);
INSERT INTO public.galaxy VALUES (3, 'Sombrero Galaxy', 'Spiral Galaxy', 8200, false);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Eliptical Galaxy', 12400, false);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'Irregular Galaxy', 13200, false);


--
-- Data for Name: meteor; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.meteor VALUES (1, 1500, 2, true, 6000, 'Chelyabinsk Meteor', 300);
INSERT INTO public.meteor VALUES (2, 0, 1, true, 4000, 'Tunguska Meteor', 250);
INSERT INTO public.meteor VALUES (3, 0, 1, true, 5000, 'Allende Meteorite', 300);
INSERT INTO public.meteor VALUES (4, 1000, 2, true, 4800, 'Murchison Meteorite', 200);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4600, 0, false, true, 'Earths only natural sattelite', 11);
INSERT INTO public.moon VALUES (2, 'Phobos', 4300, 139, false, false, 'One of Mars two, small, irregularly shaped moons', 12);
INSERT INTO public.moon VALUES (3, 'Deimos', 4300, 139, false, false, 'The second of Mars small, irregularly shaped moons', 12);
INSERT INTO public.moon VALUES (4, 'Ganymede', 4600, 392, false, true, 'The largest moon in our solar system.', 13);
INSERT INTO public.moon VALUES (5, 'Titan', 4500, 746, false, true, 'Saturns largest moon, has lakes of molten metals', 14);
INSERT INTO public.moon VALUES (6, 'Io', 4600, 384, false, true, 'The most volcanically active moon in our solar system', 13);
INSERT INTO public.moon VALUES (7, 'Europa', 4600, 423, false, true, 'Believed to have a subsurface ocean with possible life', 13);
INSERT INTO public.moon VALUES (8, 'Encladus', 4600, 792, false, true, 'Known for its geysers of water ice shooting into space', 14);
INSERT INTO public.moon VALUES (9, 'Callisto', 4600, 394, false, true, 'One of Jupiters Galleon moon, has a heavily cratered surface', 13);
INSERT INTO public.moon VALUES (10, 'Dione', 4600, 886, false, true, 'A moon of Saturn known for their bright, icy surface.', 14);
INSERT INTO public.moon VALUES (11, 'Rhea', 4600, 1124, false, true, 'Saturns second largest moon with a heavily cratered surface', 14);
INSERT INTO public.moon VALUES (12, 'Triton', 4600, 2743, false, true, 'Neptunes largest moon, known for retrograde orbit and geysers of nitrogen', 16);
INSERT INTO public.moon VALUES (13, 'Miranda', 4600, 2399, false, true, 'One of Uranuss five major moons and has a geometrically complex surface', 15);
INSERT INTO public.moon VALUES (14, 'Iapetus', 4600, 868, false, true, 'Has a unique, two-toned appearance, with one hemisphere being much darker', 14);
INSERT INTO public.moon VALUES (15, 'Hyperion', 4600, 932, false, false, 'Known for their irregular shape, and sponge-like appearance', 14);
INSERT INTO public.moon VALUES (16, 'Ariel', 4600, 1175, false, false, 'A Uranus major moon, known for a young surface', 15);
INSERT INTO public.moon VALUES (17, 'Oberon', 4600, 1175, false, true, 'A Uranus major moon with a heavily cratered surface', 15);
INSERT INTO public.moon VALUES (18, 'Tethys', 4600, 907, false, true, 'Known for its prominant impact crater, Odysseus', 14);
INSERT INTO public.moon VALUES (19, 'Mimas', 4600, 824, false, true, 'Known also as the Death Star because of its prominant crater', 14);
INSERT INTO public.moon VALUES (20, 'Umbriel', 4600, 1173, false, true, 'Known for its dark, heavily cratered surface.', 15);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (9, 'Mercury', 4560, false, true, 'A barren planet closest to the Sun.', 1);
INSERT INTO public.planet VALUES (10, 'Venus', 4560, false, true, 'Has a thick, acidic astmosphere making it the hottest in our Solar System.', 1);
INSERT INTO public.planet VALUES (11, 'Earth', 4560, true, true, 'Home to the only known life in our Solar System.', 1);
INSERT INTO public.planet VALUES (12, 'Mars', 4600, false, true, 'Mostly knownbeing the big red planet with a large red mark that is observable.', 1);
INSERT INTO public.planet VALUES (13, 'Jupiter', 4560, false, true, 'The first of the Gas Giants found in our Solar System with numerous moons.', 1);
INSERT INTO public.planet VALUES (14, 'Saturn', 4560, false, true, 'Known for its ring system and numerous moons', 1);
INSERT INTO public.planet VALUES (15, 'Uranus', 4560, false, true, 'Uranus is considered an Ice Giant, with a blue/green color', 1);
INSERT INTO public.planet VALUES (16, 'Neptune', 4560, false, false, 'Neptune is the furthest planet from the sun, with a deep blue color', 1);
INSERT INTO public.planet VALUES (20, 'TRAPPIST-1d', 7600, false, true, 'TRAPPIST-1d is found within the habitable zone of their host star.', 1);
INSERT INTO public.planet VALUES (17, 'Kepler-62e', 7000, false, true, 'Kepler-62e is named after the host star in their planet system, Kepler-62', 2);
INSERT INTO public.planet VALUES (19, 'Kepler-186f', 4500, false, true, 'Kepler-186f is another exoplanet that is in a habitable zone.', 2);
INSERT INTO public.planet VALUES (18, 'Kepler-22b', 6000, false, true, 'Kepler-22b is one of the first exoplanets to be found.', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, 93, true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 5350, 4.24, true, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 8, 643, false, 1);
INSERT INTO public.star VALUES (4, 'Polaris', 75, 431, true, 1);
INSERT INTO public.star VALUES (5, 'Vega', 455, 25, true, 1);
INSERT INTO public.star VALUES (6, 'Aldebaran', 6.8, 65, false, 1);
INSERT INTO public.star VALUES (7, 'Antares', 12, 550, false, 1);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 5, true);


--
-- Name: meteor_meteor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.meteor_meteor_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy gname; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT gname UNIQUE (name);


--
-- Name: meteor meteor_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor
    ADD CONSTRAINT meteor_pkey PRIMARY KEY (meteor_id);


--
-- Name: meteor metname; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor
    ADD CONSTRAINT metname UNIQUE (name);


--
-- Name: moon mname; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT mname UNIQUE (name);


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
-- Name: planet pname; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT pname UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: meteor meteor_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.meteor
    ADD CONSTRAINT meteor_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

