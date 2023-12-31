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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying(30) NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(15) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (49, 2018, 'Final', 434, 435, 4, 2);
INSERT INTO public.games VALUES (50, 2018, 'Third Place', 436, 437, 2, 0);
INSERT INTO public.games VALUES (51, 2018, 'Semi-Final', 435, 437, 2, 1);
INSERT INTO public.games VALUES (52, 2018, 'Semi-Final', 434, 436, 1, 0);
INSERT INTO public.games VALUES (53, 2018, 'Quarter-Final', 435, 443, 3, 2);
INSERT INTO public.games VALUES (54, 2018, 'Quarter-Final', 437, 445, 2, 0);
INSERT INTO public.games VALUES (55, 2018, 'Quarter-Final', 436, 447, 2, 1);
INSERT INTO public.games VALUES (56, 2018, 'Quarter-Final', 434, 449, 2, 0);
INSERT INTO public.games VALUES (57, 2018, 'Eighth-Final', 437, 451, 2, 1);
INSERT INTO public.games VALUES (58, 2018, 'Eighth-Final', 445, 453, 1, 0);
INSERT INTO public.games VALUES (59, 2018, 'Eighth-Final', 436, 455, 3, 2);
INSERT INTO public.games VALUES (60, 2018, 'Eighth-Final', 447, 457, 2, 0);
INSERT INTO public.games VALUES (61, 2018, 'Eighth-Final', 435, 459, 2, 1);
INSERT INTO public.games VALUES (62, 2018, 'Eighth-Final', 443, 461, 2, 1);
INSERT INTO public.games VALUES (63, 2018, 'Eighth-Final', 449, 463, 2, 1);
INSERT INTO public.games VALUES (64, 2018, 'Eighth-Final', 434, 465, 4, 3);
INSERT INTO public.games VALUES (65, 2014, 'Final', 466, 465, 1, 0);
INSERT INTO public.games VALUES (66, 2014, 'Third Place', 468, 447, 3, 0);
INSERT INTO public.games VALUES (67, 2014, 'Semi-Final', 465, 468, 1, 0);
INSERT INTO public.games VALUES (68, 2014, 'Semi-Final', 466, 447, 7, 1);
INSERT INTO public.games VALUES (69, 2014, 'Quarter-Final', 468, 475, 1, 0);
INSERT INTO public.games VALUES (70, 2014, 'Quarter-Final', 465, 436, 1, 0);
INSERT INTO public.games VALUES (71, 2014, 'Quarter-Final', 447, 451, 2, 1);
INSERT INTO public.games VALUES (72, 2014, 'Quarter-Final', 466, 434, 1, 0);
INSERT INTO public.games VALUES (73, 2014, 'Eighth-Final', 447, 483, 2, 1);
INSERT INTO public.games VALUES (74, 2014, 'Eighth-Final', 451, 449, 2, 0);
INSERT INTO public.games VALUES (75, 2014, 'Eighth-Final', 434, 487, 2, 0);
INSERT INTO public.games VALUES (76, 2014, 'Eighth-Final', 466, 489, 2, 1);
INSERT INTO public.games VALUES (77, 2014, 'Eighth-Final', 468, 457, 2, 1);
INSERT INTO public.games VALUES (78, 2014, 'Eighth-Final', 475, 493, 2, 1);
INSERT INTO public.games VALUES (79, 2014, 'Eighth-Final', 465, 453, 1, 0);
INSERT INTO public.games VALUES (80, 2014, 'Eighth-Final', 436, 497, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (434, 'France');
INSERT INTO public.teams VALUES (435, 'Croatia');
INSERT INTO public.teams VALUES (436, 'Belgium');
INSERT INTO public.teams VALUES (437, 'England');
INSERT INTO public.teams VALUES (443, 'Russia');
INSERT INTO public.teams VALUES (445, 'Sweden');
INSERT INTO public.teams VALUES (447, 'Brazil');
INSERT INTO public.teams VALUES (449, 'Uruguay');
INSERT INTO public.teams VALUES (451, 'Colombia');
INSERT INTO public.teams VALUES (453, 'Switzerland');
INSERT INTO public.teams VALUES (455, 'Japan');
INSERT INTO public.teams VALUES (457, 'Mexico');
INSERT INTO public.teams VALUES (459, 'Denmark');
INSERT INTO public.teams VALUES (461, 'Spain');
INSERT INTO public.teams VALUES (463, 'Portugal');
INSERT INTO public.teams VALUES (465, 'Argentina');
INSERT INTO public.teams VALUES (466, 'Germany');
INSERT INTO public.teams VALUES (468, 'Netherlands');
INSERT INTO public.teams VALUES (475, 'Costa Rica');
INSERT INTO public.teams VALUES (483, 'Chile');
INSERT INTO public.teams VALUES (487, 'Nigeria');
INSERT INTO public.teams VALUES (489, 'Algeria');
INSERT INTO public.teams VALUES (493, 'Greece');
INSERT INTO public.teams VALUES (497, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 80, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 497, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

