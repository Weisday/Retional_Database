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
-- Name: celestial_objects; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_objects (
    celestial_objects_id integer NOT NULL,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    moon_id integer,
    name character varying(30) NOT NULL
);


ALTER TABLE public.celestial_objects OWNER TO freecodecamp;

--
-- Name: celestial_objects_celestial_object_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_objects_celestial_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_objects_celestial_object_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_objects_celestial_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_objects_celestial_object_id_seq OWNED BY public.celestial_objects.celestial_objects_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(30),
    description text,
    distance_from_earth numeric(10,1),
    has_life boolean
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
    name character varying(30),
    distance_from_planet integer NOT NULL,
    is_satellite boolean NOT NULL,
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
    age_in_millions_of_years integer,
    star_id integer,
    is_habitable boolean
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
    star_type character varying(30),
    galaxy_id integer,
    is_spherical boolean,
    age_in_millions_of_years integer
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
-- Name: celestial_objects celestial_objects_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_objects ALTER COLUMN celestial_objects_id SET DEFAULT nextval('public.celestial_objects_celestial_object_id_seq'::regclass);


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
-- Data for Name: celestial_objects; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_objects VALUES (2, 1, 1, 1, 1, 'Object 1');
INSERT INTO public.celestial_objects VALUES (3, 2, 2, 2, 2, 'Object 2');
INSERT INTO public.celestial_objects VALUES (4, 3, 3, 3, 3, 'Object 3');
INSERT INTO public.celestial_objects VALUES (5, 4, 4, 4, 4, 'Object 4');
INSERT INTO public.celestial_objects VALUES (6, 5, 5, 5, 5, 'Object 5');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 'Unable to read from the browser''s clipboard. Please make sure you have granted access for this website to read from the clipboard.', 25000.5, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'The Andromeda Galaxy is the nearest major galaxy to the Milky Way.', 2000000.0, false);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'Elliptical', 'Messier 87 is a supergiant elliptical galaxy in the constellation Virgo.', 55000000.0, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral', 'The Sombrero Galaxy is a spiral galaxy in the constellation Virgo.', 30000000.0, false);
INSERT INTO public.galaxy VALUES (5, 'Centaurus A', 'Elliptical', 'Centaurus A is a giant elliptical galaxy in the constellation Centaurus.', 13000000.0, false);
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Spiral', 'The Whirlpool Galaxy is a grand-design spiral galaxy.', 37000000.0, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 384400, true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 9377, true, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 23460, true, 2);
INSERT INTO public.moon VALUES (4, 'Europa', 671100, true, 10);
INSERT INTO public.moon VALUES (5, 'Ganymede', 1070400, true, 10);
INSERT INTO public.moon VALUES (6, 'Callisto', 1882700, true, 10);
INSERT INTO public.moon VALUES (7, 'Titan', 1221850, true, 4);
INSERT INTO public.moon VALUES (8, 'Rhea', 527108, true, 4);
INSERT INTO public.moon VALUES (9, 'Triton', 354800, true, 6);
INSERT INTO public.moon VALUES (10, 'Charon', 19591, true, 9);
INSERT INTO public.moon VALUES (11, 'Dione', 377396, true, 4);
INSERT INTO public.moon VALUES (12, 'Io', 421700, true, 10);
INSERT INTO public.moon VALUES (13, 'Enceladus', 237948, true, 4);
INSERT INTO public.moon VALUES (14, 'Tethys', 294619, true, 4);
INSERT INTO public.moon VALUES (15, 'Mimas', 185539, true, 4);
INSERT INTO public.moon VALUES (16, 'Oberon', 582600, true, 7);
INSERT INTO public.moon VALUES (17, 'Titania', 435910, true, 7);
INSERT INTO public.moon VALUES (18, 'Miranda', 129390, true, 6);
INSERT INTO public.moon VALUES (19, 'Ariel', 190900, true, 7);
INSERT INTO public.moon VALUES (20, 'Umbriel', 266300, true, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4500, 1, true);
INSERT INTO public.planet VALUES (2, 'Mars', 4000, 1, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 4600, 1, false);
INSERT INTO public.planet VALUES (4, 'Saturn', 4600, 1, false);
INSERT INTO public.planet VALUES (5, 'Venus', 4600, 1, false);
INSERT INTO public.planet VALUES (6, 'Neptune', 4500, 1, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 4500, 1, false);
INSERT INTO public.planet VALUES (8, 'Mercury', 4600, 1, false);
INSERT INTO public.planet VALUES (9, 'Pluto', 4000, 1, false);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri b', 1300, 6, false);
INSERT INTO public.planet VALUES (11, 'Kepler-186f', 3000, 2, true);
INSERT INTO public.planet VALUES (12, 'Gliese 581 d', 8000, 2, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type', 1, true, 4600);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Red supergiant', 2, false, 8000);
INSERT INTO public.star VALUES (3, 'Sirius', 'A-type', 1, false, 250);
INSERT INTO public.star VALUES (4, 'Vega', 'A-type', 1, true, 600);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'G-type', 5, true, 6000);
INSERT INTO public.star VALUES (6, 'Antares', 'Red supergiant', 1, true, 15000);


--
-- Name: celestial_objects_celestial_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_objects_celestial_object_id_seq', 6, true);


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
-- Name: celestial_objects celestial_objects_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_objects
    ADD CONSTRAINT celestial_objects_name_key UNIQUE (name);


--
-- Name: celestial_objects celestial_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_objects
    ADD CONSTRAINT celestial_objects_pkey PRIMARY KEY (celestial_objects_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


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
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: celestial_objects celestial_objects_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_objects
    ADD CONSTRAINT celestial_objects_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: celestial_objects celestial_objects_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_objects
    ADD CONSTRAINT celestial_objects_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: celestial_objects celestial_objects_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_objects
    ADD CONSTRAINT celestial_objects_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: celestial_objects celestial_objects_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_objects
    ADD CONSTRAINT celestial_objects_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

