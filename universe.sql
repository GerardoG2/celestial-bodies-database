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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    average_diameter numeric(15,2),
    age numeric(15,2)
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
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    year_discovered integer,
    moon_id integer NOT NULL
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
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    number_of_moons integer,
    has_life boolean
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text NOT NULL,
    number_of_planets integer,
    observable boolean DEFAULT true,
    distance_from_earth numeric(15,3)
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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'A barred spiral galaxy that is home to our solar system.', 105000.00, 13.51);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'A spiral galaxy and the nearest major galaxy to the Milky Way, expected to collide with it in about 4.5 billion years.', 220000.00, 10.00);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A smaller sprial galaxy in the Local Group, known for its bright star-forming regions.', 60000.00, 10.00);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 'A massive eliptical galaxy in the Virgo Cluster, famous for is supermassive black hole observed by the Event Horizon', 120000.00, 13.00);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'A satellite galaxy of the Milky Way, irregular in shape, and rich in star-forming regions.', 14000.00, 13.00);
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'A lenticular galaxy with a bright central bulge and a distinct dust lane, resembling a sombrero hat', 50000.00, 12.00);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (3, 'Moon', 'Earth''s only natural satellite, influencing tides and climate.', NULL, 1);
INSERT INTO public.moon VALUES (4, 'Phobos', 'Larger of the two Martian moons, heavily cratered.', 1877, 2);
INSERT INTO public.moon VALUES (4, 'Deimos', 'Smaller of the two Martian moons, irregularly shaped.', 1877, 3);
INSERT INTO public.moon VALUES (5, 'Io', 'Most volcanically active moon in the solar system.', 1610, 4);
INSERT INTO public.moon VALUES (5, 'Europa', 'Icy moon with a potential subsurface ocean, possibly harboring life.', 1610, 5);
INSERT INTO public.moon VALUES (5, 'Ganymede', 'Largest moon in the solar system, larger than Mercury', 1610, 6);
INSERT INTO public.moon VALUES (5, 'Callisto', 'Heaviliy cratered and ancient moon', 1610, 7);
INSERT INTO public.moon VALUES (5, 'Amalthea', 'Irregularly shaped moon with reddish coloring due to sulfur.', 1892, 8);
INSERT INTO public.moon VALUES (6, 'Titan', 'The largest moon of Saturn, with a thick atmoshpere and methane lakes.', 1655, 9);
INSERT INTO public.moon VALUES (6, 'Enceladus', 'Icy moon with water plumes and a suspected subsurface ocean.', 1789, 10);
INSERT INTO public.moon VALUES (6, 'Mimas', 'Icy moon with water plumes and a suspected subsurface ocean.', 1789, 11);
INSERT INTO public.moon VALUES (6, 'Rhea', 'Icy moon with traces of oxygen in its atmosphere.', 1672, 12);
INSERT INTO public.moon VALUES (6, 'Iapetus', 'A two-toned moon with one dark and one light hemisphere', 1671, 13);
INSERT INTO public.moon VALUES (7, 'Titania', 'The largest moon of Uranus, with valleys and canyons.', 1787, 14);
INSERT INTO public.moon VALUES (7, 'Oberon', 'A heavily cratered and icy moon.', 1787, 15);
INSERT INTO public.moon VALUES (7, 'Ariel', 'Bright and smooth surface with signs of geological activity.', 1851, 16);
INSERT INTO public.moon VALUES (7, 'Miranda', 'Extreme topography with cliffs and canyons.', 1948, 17);
INSERT INTO public.moon VALUES (8, 'Triton', 'Largest moon of Neptune, with retrogade orbit and geysers.', 1846, 18);
INSERT INTO public.moon VALUES (8, 'Proteus', 'Irregularly shaped and one of Neptune''s largest moons.', 1989, 19);
INSERT INTO public.moon VALUES (8, 'Nereid', 'Known for its eccentric orbit, possibly a captured object.', 1949, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 'The smallest planet in the solar system and the closest to the Sun.', 0, false);
INSERT INTO public.planet VALUES (1, 2, 'Venus', 'Known for its thick, toxic, atmosphere and surface temperatures hot enough to melt lead.', 0, false);
INSERT INTO public.planet VALUES (1, 3, 'Earth', 'The only planet know to support life, covered 70 percent by water.', 1, true);
INSERT INTO public.planet VALUES (1, 4, 'Mars', 'A cold, desert-like planet with the tallest volcano and the largest canyon in the solar system.', 2, false);
INSERT INTO public.planet VALUES (1, 5, 'Jupiter', 'The largest planet in our solar system, a gas giant with dozens of moons, including the four Galilean moons.', 95, false);
INSERT INTO public.planet VALUES (1, 6, 'Saturn', 'Known for its iconic ring system and its many moons, including Titan, which has an atmosphere.', 146, false);
INSERT INTO public.planet VALUES (1, 7, 'Uranus', 'An ice giant with a pale blue color, tilted on its side, and surrounded by faint rings.', 27, false);
INSERT INTO public.planet VALUES (1, 8, 'Neptune', 'The farthest planet from the Sun, an ice giant with the strongest winds in the solar system.', 14, false);
INSERT INTO public.planet VALUES (2, 9, 'Proxima b', 'A potentially habitable exoplanet in the habitable zone of its star.', NULL, NULL);
INSERT INTO public.planet VALUES (3, 10, 'Rigel 1', 'A hypothetical planet orbiting Rigel, likely a gas giant.', 8, false);
INSERT INTO public.planet VALUES (5, 11, 'M32-V1a', 'A rocky exoplanet in the Andromeda galaxy near the cepheid variable star M32-V1.', 2, false);
INSERT INTO public.planet VALUES (5, 12, 'M32-V1b', 'A potentially habitable planet oribiting M32-V1 in the Andromeda Galaxy.', NULL, NULL);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Rocky planets with solid surfaces, primarily composed of silicate rocks and metals. These planets are usually smaller and closer to their host stars.');
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Large planets composed mostly of hydrogen and helium, with no well-defined solid surface. They often have extensive systems of rings and many moons.');
INSERT INTO public.planet_type VALUES (3, 'ice Giant', 'Planets with a significant proportion of water, ammonia, and methane ices in addition to hydrogen and helium. These are typically colder and smaller than gas giants.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 'The central star of our solar system', 8, true, 0.000);
INSERT INTO public.star VALUES (1, 2, 'Proxima Centauri', 'The closest star to the Sun, part of the Alpha Centauri system.', 3, true, 4.240);
INSERT INTO public.star VALUES (1, 3, 'Rigel', 'A blue supergiant star in the Orion constellation', NULL, true, 860.000);
INSERT INTO public.star VALUES (1, 4, 'Betelgeuse', 'A red supergiant star, one of the brightest in the night sky.', NULL, true, 642.000);
INSERT INTO public.star VALUES (2, 5, 'M32-V1', 'A classical Cepheid variable star in the Andromeda galaxy', NULL, true, 2540000.000);
INSERT INTO public.star VALUES (3, 6, 'TRI-1', 'A star located in the Triangulum galaxy, known for its brightness', NULL, true, 3000000.000);


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
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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

