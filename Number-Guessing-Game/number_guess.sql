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
    game_id integer NOT NULL,
    user_id integer,
    guesses integer NOT NULL
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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 15);
INSERT INTO public.games VALUES (2, 2, 650);
INSERT INTO public.games VALUES (3, 2, 795);
INSERT INTO public.games VALUES (4, 3, 624);
INSERT INTO public.games VALUES (5, 3, 418);
INSERT INTO public.games VALUES (6, 2, 975);
INSERT INTO public.games VALUES (7, 2, 892);
INSERT INTO public.games VALUES (8, 2, 614);
INSERT INTO public.games VALUES (9, 4, 842);
INSERT INTO public.games VALUES (10, 4, 896);
INSERT INTO public.games VALUES (11, 5, 724);
INSERT INTO public.games VALUES (12, 5, 818);
INSERT INTO public.games VALUES (13, 4, 146);
INSERT INTO public.games VALUES (14, 4, 247);
INSERT INTO public.games VALUES (15, 4, 959);
INSERT INTO public.games VALUES (16, 6, 30);
INSERT INTO public.games VALUES (17, 6, 185);
INSERT INTO public.games VALUES (18, 7, 414);
INSERT INTO public.games VALUES (19, 7, 745);
INSERT INTO public.games VALUES (20, 6, 912);
INSERT INTO public.games VALUES (21, 6, 61);
INSERT INTO public.games VALUES (22, 6, 590);
INSERT INTO public.games VALUES (23, 8, 963);
INSERT INTO public.games VALUES (24, 8, 90);
INSERT INTO public.games VALUES (25, 9, 747);
INSERT INTO public.games VALUES (26, 9, 937);
INSERT INTO public.games VALUES (27, 8, 324);
INSERT INTO public.games VALUES (28, 8, 805);
INSERT INTO public.games VALUES (29, 8, 615);
INSERT INTO public.games VALUES (30, 10, 818);
INSERT INTO public.games VALUES (31, 10, 323);
INSERT INTO public.games VALUES (32, 11, 257);
INSERT INTO public.games VALUES (33, 11, 18);
INSERT INTO public.games VALUES (34, 10, 275);
INSERT INTO public.games VALUES (35, 10, 750);
INSERT INTO public.games VALUES (36, 10, 401);
INSERT INTO public.games VALUES (37, 12, 203);
INSERT INTO public.games VALUES (38, 12, 334);
INSERT INTO public.games VALUES (39, 13, 537);
INSERT INTO public.games VALUES (40, 13, 288);
INSERT INTO public.games VALUES (41, 12, 671);
INSERT INTO public.games VALUES (42, 12, 432);
INSERT INTO public.games VALUES (43, 12, 566);
INSERT INTO public.games VALUES (44, 14, 640);
INSERT INTO public.games VALUES (45, 14, 54);
INSERT INTO public.games VALUES (46, 15, 932);
INSERT INTO public.games VALUES (47, 15, 252);
INSERT INTO public.games VALUES (48, 14, 324);
INSERT INTO public.games VALUES (49, 14, 826);
INSERT INTO public.games VALUES (50, 14, 722);
INSERT INTO public.games VALUES (51, 16, 978);
INSERT INTO public.games VALUES (52, 16, 10);
INSERT INTO public.games VALUES (53, 17, 569);
INSERT INTO public.games VALUES (54, 17, 428);
INSERT INTO public.games VALUES (55, 16, 132);
INSERT INTO public.games VALUES (56, 16, 19);
INSERT INTO public.games VALUES (57, 16, 329);
INSERT INTO public.games VALUES (58, 18, 156);
INSERT INTO public.games VALUES (59, 18, 965);
INSERT INTO public.games VALUES (60, 19, 397);
INSERT INTO public.games VALUES (61, 19, 411);
INSERT INTO public.games VALUES (62, 18, 581);
INSERT INTO public.games VALUES (63, 18, 893);
INSERT INTO public.games VALUES (64, 18, 680);
INSERT INTO public.games VALUES (65, 20, 510);
INSERT INTO public.games VALUES (66, 20, 9);
INSERT INTO public.games VALUES (67, 21, 735);
INSERT INTO public.games VALUES (68, 21, 332);
INSERT INTO public.games VALUES (69, 20, 739);
INSERT INTO public.games VALUES (70, 20, 949);
INSERT INTO public.games VALUES (71, 20, 670);
INSERT INTO public.games VALUES (72, 22, 274);
INSERT INTO public.games VALUES (73, 22, 817);
INSERT INTO public.games VALUES (74, 23, 6);
INSERT INTO public.games VALUES (75, 23, 746);
INSERT INTO public.games VALUES (76, 22, 2);
INSERT INTO public.games VALUES (77, 22, 521);
INSERT INTO public.games VALUES (78, 22, 957);
INSERT INTO public.games VALUES (79, 24, 998);
INSERT INTO public.games VALUES (80, 24, 722);
INSERT INTO public.games VALUES (81, 25, 4);
INSERT INTO public.games VALUES (82, 25, 943);
INSERT INTO public.games VALUES (83, 24, 281);
INSERT INTO public.games VALUES (84, 24, 30);
INSERT INTO public.games VALUES (85, 24, 312);
INSERT INTO public.games VALUES (86, 26, 479);
INSERT INTO public.games VALUES (87, 26, 65);
INSERT INTO public.games VALUES (88, 27, 290);
INSERT INTO public.games VALUES (89, 27, 379);
INSERT INTO public.games VALUES (90, 26, 311);
INSERT INTO public.games VALUES (91, 26, 520);
INSERT INTO public.games VALUES (92, 26, 695);
INSERT INTO public.games VALUES (93, 28, 201);
INSERT INTO public.games VALUES (94, 28, 617);
INSERT INTO public.games VALUES (95, 29, 243);
INSERT INTO public.games VALUES (96, 29, 219);
INSERT INTO public.games VALUES (97, 28, 33);
INSERT INTO public.games VALUES (98, 28, 100);
INSERT INTO public.games VALUES (99, 28, 644);
INSERT INTO public.games VALUES (100, 30, 690);
INSERT INTO public.games VALUES (101, 30, 232);
INSERT INTO public.games VALUES (102, 31, 755);
INSERT INTO public.games VALUES (103, 31, 894);
INSERT INTO public.games VALUES (104, 30, 503);
INSERT INTO public.games VALUES (105, 30, 768);
INSERT INTO public.games VALUES (106, 30, 202);
INSERT INTO public.games VALUES (107, 32, 570);
INSERT INTO public.games VALUES (108, 32, 394);
INSERT INTO public.games VALUES (109, 33, 957);
INSERT INTO public.games VALUES (110, 33, 279);
INSERT INTO public.games VALUES (111, 32, 903);
INSERT INTO public.games VALUES (112, 32, 510);
INSERT INTO public.games VALUES (113, 32, 413);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'rty');
INSERT INTO public.users VALUES (2, 'user_1758868647277');
INSERT INTO public.users VALUES (3, 'user_1758868647276');
INSERT INTO public.users VALUES (4, 'user_1758868822924');
INSERT INTO public.users VALUES (5, 'user_1758868822923');
INSERT INTO public.users VALUES (6, 'user_1758869185388');
INSERT INTO public.users VALUES (7, 'user_1758869185387');
INSERT INTO public.users VALUES (8, 'user_1758869549604');
INSERT INTO public.users VALUES (9, 'user_1758869549603');
INSERT INTO public.users VALUES (10, 'user_1758869775517');
INSERT INTO public.users VALUES (11, 'user_1758869775516');
INSERT INTO public.users VALUES (12, 'user_1758869826335');
INSERT INTO public.users VALUES (13, 'user_1758869826334');
INSERT INTO public.users VALUES (14, 'user_1758870481502');
INSERT INTO public.users VALUES (15, 'user_1758870481501');
INSERT INTO public.users VALUES (16, 'user_1758870520151');
INSERT INTO public.users VALUES (17, 'user_1758870520150');
INSERT INTO public.users VALUES (18, 'user_1758870705003');
INSERT INTO public.users VALUES (19, 'user_1758870705002');
INSERT INTO public.users VALUES (20, 'user_1758870732264');
INSERT INTO public.users VALUES (21, 'user_1758870732263');
INSERT INTO public.users VALUES (22, 'user_1758870775770');
INSERT INTO public.users VALUES (23, 'user_1758870775769');
INSERT INTO public.users VALUES (24, 'user_1758870803496');
INSERT INTO public.users VALUES (25, 'user_1758870803495');
INSERT INTO public.users VALUES (26, 'user_1758870817794');
INSERT INTO public.users VALUES (27, 'user_1758870817793');
INSERT INTO public.users VALUES (28, 'user_1758870828520');
INSERT INTO public.users VALUES (29, 'user_1758870828519');
INSERT INTO public.users VALUES (30, 'user_1758870903996');
INSERT INTO public.users VALUES (31, 'user_1758870903995');
INSERT INTO public.users VALUES (32, 'user_1758870971599');
INSERT INTO public.users VALUES (33, 'user_1758870971598');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 113, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 33, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

