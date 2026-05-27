--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth numeric(15,2),
    galaxy_id integer
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_type character varying(30),
    distance_from_earth numeric(15,2)
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
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean,
    age_in_million_years integer,
    distance_from_earth numeric(15,2),
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
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean,
    age_in_million_years integer,
    distance_from_earth numeric(15,2),
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
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_million_years integer,
    distance_from_earth numeric(15,2),
    galaxy_id integer NOT NULL
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
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sagittarius A*', 26000.00, 1);
INSERT INTO public.black_hole VALUES (2, 'M31 Black Hole', 2537000.00, 2);
INSERT INTO public.black_hole VALUES (3, 'Triangulum X-1', 3000000.00, 3);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Galaxia donde se encuentra el Sistema Solar', 'Espiral', 0.00);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Galaxia grande más cercana a la Vía Láctea', 'Espiral', 2537000.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Miembro del Grupo Local', 'Espiral', 3000000.00);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Galaxia con brazos espirales muy definidos', 'Espiral', 23000000.00);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Galaxia con núcleo brillante y forma de sombrero', 'Espiral', 29000000.00);
INSERT INTO public.galaxy VALUES (6, 'Large Magellanic Cloud', 'Galaxia satélite cercana a la Vía Láctea', 'Irregular', 163000.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'Satélite natural de la Tierra', true, 4500, 0.00, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Luna más grande de Marte', true, 4500, 0.00, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Luna pequeña de Marte', true, 4500, 0.00, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Luna volcánica de Júpiter', true, 4500, 0.00, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Luna helada con océano subterráneo', true, 4500, 0.00, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Luna más grande del Sistema Solar', true, 4500, 0.00, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'Luna con muchos cráteres', true, 4500, 0.00, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'Luna más grande de Saturno', true, 4500, 0.00, 6);
INSERT INTO public.moon VALUES (9, 'Enceladus', 'Luna con géiseres de hielo', true, 4500, 0.00, 6);
INSERT INTO public.moon VALUES (10, 'Rhea', 'Segunda luna más grande de Saturno', true, 4500, 0.00, 6);
INSERT INTO public.moon VALUES (11, 'Iapetus', 'Luna con coloración bicolor', true, 4500, 0.00, 6);
INSERT INTO public.moon VALUES (12, 'Titania', 'Luna más grande de Urano', true, 4500, 0.00, 7);
INSERT INTO public.moon VALUES (13, 'Oberon', 'Luna exterior de Urano', true, 4500, 0.00, 7);
INSERT INTO public.moon VALUES (14, 'Miranda', 'Luna con superficie deformada', true, 4500, 0.00, 7);
INSERT INTO public.moon VALUES (15, 'Triton', 'Luna más grande de Neptuno', true, 4500, 0.00, 8);
INSERT INTO public.moon VALUES (16, 'Nereid', 'Luna irregular de Neptuno', true, 4500, 0.00, 8);
INSERT INTO public.moon VALUES (17, 'Proxima b Moon 1', 'Luna hipotética de Proxima b', true, 4800, 4.24, 9);
INSERT INTO public.moon VALUES (18, 'Sirius b1 Moon', 'Satélite ficticio orbitando Sirius b1', true, 180, 8.60, 10);
INSERT INTO public.moon VALUES (19, 'Rigel x Alpha', 'Luna rocosa de Rigel x', true, 6, 860.00, 11);
INSERT INTO public.moon VALUES (20, 'Andromeda p1 Moon', 'Satélite natural del planeta Andromeda p1', true, 50, 97.00, 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Planeta más cercano al Sol', true, 4500, 0.00, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Planeta con atmósfera muy densa', true, 4500, 0.00, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Planeta con vida conocida', true, 4500, 0.00, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Planeta rojo con evidencia de agua antigua', true, 4500, 0.00, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Planeta más grande del Sistema Solar', true, 4500, 0.00, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Planeta famoso por sus anillos', true, 4500, 0.00, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Gigante helado con inclinación extrema', true, 4500, 0.00, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Planeta más lejano del Sol', true, 4500, 0.00, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'Exoplaneta potencialmente habitable', true, 4850, 4.24, 2);
INSERT INTO public.planet VALUES (10, 'Sirius b1', 'Planeta ficticio orbitando Sirius', true, 200, 8.60, 3);
INSERT INTO public.planet VALUES (11, 'Rigel x', 'Exoplaneta gaseoso cercano a Rigel', true, 7, 860.00, 4);
INSERT INTO public.planet VALUES (12, 'Andromeda p1', 'Planeta rocoso de Alpha Andromedae', true, 55, 97.00, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Estrella del Sistema Solar', true, true, 4600, 0.00, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'Estrella más cercana al Sol', true, true, 4850, 4.24, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'Estrella más brillante del cielo nocturno', false, true, 242, 8.60, 1);
INSERT INTO public.star VALUES (4, 'Rigel', 'Supergigante azul de la constelación Orión', false, true, 8, 860.00, 1);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 'Supergigante roja cercana a explotar', false, true, 10, 642.00, 1);
INSERT INTO public.star VALUES (6, 'Alpha Andromedae', 'Estrella brillante de la galaxia Andromeda', false, true, 60, 97.00, 2);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key1 UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: black_hole black_hole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

