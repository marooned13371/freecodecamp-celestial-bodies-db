--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: blackhole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.blackhole (
    blackhole_id integer NOT NULL,
    name character varying(30),
    type character varying(50) NOT NULL,
    speed integer NOT NULL,
    mass_kilograms numeric(30,5) NOT NULL,
    diameter_km numeric(20,5) NOT NULL,
    notable_features text
);


ALTER TABLE public.blackhole OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.blackhole_blackhole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blackhole_blackhole_id_seq OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.blackhole_blackhole_id_seq OWNED BY public.blackhole.blackhole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(35),
    type character varying(50) NOT NULL,
    speed_in_km integer NOT NULL,
    size_in_km numeric(20,2),
    notable_features text
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
    name character varying(35),
    type character varying(50),
    size_in_km numeric(15,2),
    notable_features text,
    has_life boolean NOT NULL,
    has_water boolean NOT NULL,
    planet_id integer NOT NULL
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
    name character varying(35),
    type character varying(50) NOT NULL,
    size_in_km numeric(15,2),
    notable_features text,
    has_life boolean NOT NULL,
    star_id integer NOT NULL,
    moons_in_orbit integer NOT NULL,
    has_water boolean NOT NULL
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
    name character varying(35),
    type character varying(50) NOT NULL,
    size_in_km numeric(20,2),
    notable_features text,
    galaxy_id integer NOT NULL,
    temperature_in_kelvin integer NOT NULL
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
-- Name: blackhole blackhole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole ALTER COLUMN blackhole_id SET DEFAULT nextval('public.blackhole_blackhole_id_seq'::regclass);


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
-- Data for Name: blackhole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.blackhole VALUES (1, 'Sagittarius A*', 'Supermassive', 299792, 1500000000000000000000.00000, 2.00000, 'Located at the center of the Milky Way galaxy');
INSERT INTO public.blackhole VALUES (2, 'Cygnus X-1', 'Stellar', 250000, 500000000000000000000.00000, 1.00000, 'First black hole to be identified as a black hole candidate');
INSERT INTO public.blackhole VALUES (3, 'Messier 87*', 'Supermassive', 231441, 2000000000000000000000.00000, 3.00000, 'Located in the center of the Virgo Cluster');
INSERT INTO public.blackhole VALUES (4, 'V616 Monocerotis', 'Stellar', 167800, 300000000000000000000.00000, 0.80000, 'First black hole discovered in a binary star system');
INSERT INTO public.blackhole VALUES (5, 'XTE J1650-500', 'Stellar', 245000, 1000000000000000000000.00000, 1.50000, 'Discovered in 2001, located in the constellation Ara');
INSERT INTO public.blackhole VALUES (6, 'V404 Cygni', 'Stellar', 155000, 250000000000000000000.00000, 0.70000, 'Known for periodic outbursts and high-energy emissions');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral', 100000, 2000000000000.00, 'Largest galaxy in the Local Group');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Spiral', 90000, 1500000000000.00, 'Home galaxy of the Solar System');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 80000, 1000000000000.00, 'Third-largest galaxy in the Local Group');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'Elliptical', 120000, 4000000000000.00, 'Located in the Virgo Cluster');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Spiral', 95000, 1800000000000.00, 'Interacting galaxy with a companion');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Elliptical', 110000, 3000000000000.00, 'Distinctive hat-shaped galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Luna', 'Terrestrial', 3476.00, 'Earth''s only natural satellite', false, false, 13);
INSERT INTO public.moon VALUES (22, 'Phobos', 'Terrestrial', 22.20, 'Mars''s larger moon', false, false, 14);
INSERT INTO public.moon VALUES (23, 'Deimos', 'Terrestrial', 12.40, 'Mars''s smaller moon', false, false, 14);
INSERT INTO public.moon VALUES (24, 'Titan', 'Terrestrial', 5150.00, 'Largest moon of Saturn, has a thick atmosphere', false, false, 17);
INSERT INTO public.moon VALUES (25, 'Ganymede', 'Terrestrial', 5262.00, 'Largest moon of Jupiter', false, false, 16);
INSERT INTO public.moon VALUES (26, 'Callisto', 'Terrestrial', 4820.00, 'Second largest moon of Jupiter', false, false, 16);
INSERT INTO public.moon VALUES (27, 'Io', 'Terrestrial', 3660.00, 'Most volcanically active body in the Solar System', false, false, 16);
INSERT INTO public.moon VALUES (28, 'Europa', 'Terrestrial', 3121.60, 'Possibility of subsurface ocean', false, false, 16);
INSERT INTO public.moon VALUES (29, 'Enceladus', 'Terrestrial', 504.20, 'Active water ice geysers', false, false, 17);
INSERT INTO public.moon VALUES (30, 'Triton', 'Terrestrial', 2706.80, 'Largest moon of Neptune', false, false, 19);
INSERT INTO public.moon VALUES (31, 'Rhea', 'Terrestrial', 1528.00, 'Second largest moon of Saturn', false, false, 17);
INSERT INTO public.moon VALUES (32, 'Charon', 'Terrestrial', 1208.00, 'Largest moon of Pluto', false, false, 21);
INSERT INTO public.moon VALUES (33, 'Tethys', 'Terrestrial', 1062.00, 'Third largest moon of Saturn', false, false, 17);
INSERT INTO public.moon VALUES (34, 'Dione', 'Terrestrial', 1122.80, 'Fourth largest moon of Saturn', false, false, 17);
INSERT INTO public.moon VALUES (35, 'Iapetus', 'Terrestrial', 1468.00, 'Third largest moon of Saturn', false, false, 17);
INSERT INTO public.moon VALUES (36, 'Ariel', 'Terrestrial', 1157.80, 'Moon of Uranus', false, false, 18);
INSERT INTO public.moon VALUES (37, 'Umbriel', 'Terrestrial', 1169.40, 'Moon of Uranus', false, false, 18);
INSERT INTO public.moon VALUES (38, 'Titania', 'Terrestrial', 1577.80, 'Moon of Uranus', false, false, 18);
INSERT INTO public.moon VALUES (39, 'Miranda', 'Terrestrial', 471.60, 'Moon of Uranus', false, false, 18);
INSERT INTO public.moon VALUES (40, 'Hyperion', 'Terrestrial', 360.00, 'Moon of Saturn with irregular shape', false, false, 17);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (13, 'Earth', 'Terrestrial', 12742.00, 'Only known planet to support life', true, 1, 1, true);
INSERT INTO public.planet VALUES (14, 'Mars', 'Terrestrial', 6779.00, 'Known as the "Red Planet"', false, 1, 2, false);
INSERT INTO public.planet VALUES (15, 'Venus', 'Terrestrial', 12104.00, 'Known for its thick atmosphere of carbon dioxide', false, 1, 0, false);
INSERT INTO public.planet VALUES (16, 'Jupiter', 'Gas Giant', 139822.00, 'Largest planet in the Solar System', false, 2, 79, false);
INSERT INTO public.planet VALUES (17, 'Saturn', 'Gas Giant', 116464.00, 'Known for its prominent ring system', false, 2, 82, false);
INSERT INTO public.planet VALUES (18, 'Uranus', 'Ice Giant', 50724.00, 'Rotates on its side', false, 3, 27, false);
INSERT INTO public.planet VALUES (19, 'Neptune', 'Ice Giant', 49244.00, 'Known for its blue coloration', false, 3, 14, false);
INSERT INTO public.planet VALUES (20, 'Mercury', 'Terrestrial', 4879.00, 'Closest planet to the Sun', false, 4, 0, false);
INSERT INTO public.planet VALUES (21, 'Pluto', 'Dwarf', 2376.00, 'Former ninth planet in the Solar System', false, 4, 5, false);
INSERT INTO public.planet VALUES (22, 'Kepler-186f', 'Exoplanet', 12104.00, 'Located within the habitable zone of its star', true, 5, 0, true);
INSERT INTO public.planet VALUES (23, 'HD 209458 b', 'Exoplanet', 48794.00, 'First exoplanet to be observed transiting its star', false, 5, 0, false);
INSERT INTO public.planet VALUES (24, 'Gliese 581g', 'Exoplanet', 48794.00, 'Located within the habitable zone of its star', true, 5, 0, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Yellow Dwarf', 1391000.00, 'Center of the Solar System', 2, 5778);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 'Red Giant', 1183000000.00, 'One of the largest stars known', 1, 3500);
INSERT INTO public.star VALUES (3, 'Sirius', 'Main Sequence', 1960000000.00, 'Brightest star in the night sky', 2, 9940);
INSERT INTO public.star VALUES (4, 'VY Canis Majoris', 'Red Hypergiant', 14270000000.00, 'One of the largest known stars by radius', 1, 3650);
INSERT INTO public.star VALUES (5, 'Alpha Centauri A', 'Main Sequence', 1873000000.00, 'Closest star system to the Solar System', 2, 5790);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 'Red Dwarf', 198000000.00, 'Closest known exoplanetary system to the Solar System', 2, 3040);


--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.blackhole_blackhole_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 24, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: blackhole blackhole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_name_key UNIQUE (name);


--
-- Name: blackhole blackhole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_pkey PRIMARY KEY (blackhole_id);


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
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--


