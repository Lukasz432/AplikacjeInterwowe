--
-- PostgreSQL database dump
--

\restrict Cb9aH2X8hm8x3UFpTRp1dzPwfhzbGq0IMUM4ter5z4dVooAcfsYWpxubyLpTCEP

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO postgres;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: lanes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lanes (
    id bigint NOT NULL,
    numer_toru smallint NOT NULL,
    status character varying(30) DEFAULT 'DOSTEPNY'::character varying NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.lanes OWNER TO postgres;

--
-- Name: lanes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lanes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.lanes_id_seq OWNER TO postgres;

--
-- Name: lanes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lanes_id_seq OWNED BY public.lanes.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: news_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.news_items (
    id bigint NOT NULL,
    tytul character varying(255) NOT NULL,
    data_publikacji date NOT NULL,
    tresc text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.news_items OWNER TO postgres;

--
-- Name: news_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.news_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.news_items_id_seq OWNER TO postgres;

--
-- Name: news_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.news_items_id_seq OWNED BY public.news_items.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_id_seq OWNED BY public.roles.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.staff (
    id bigint NOT NULL,
    imie character varying(100) NOT NULL,
    nazwisko character varying(100) NOT NULL,
    stanowisko character varying(100) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- Name: staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.staff_id_seq OWNER TO postgres;

--
-- Name: staff_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.staff_id_seq OWNED BY public.staff.id;


--
-- Name: tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tickets (
    id bigint NOT NULL,
    nazwa character varying(255) NOT NULL,
    rodzaj character varying(20) NOT NULL,
    cena_brutto numeric(8,2) NOT NULL,
    dni_waznosci integer NOT NULL,
    opis text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.tickets OWNER TO postgres;

--
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tickets_id_seq OWNER TO postgres;

--
-- Name: tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tickets_id_seq OWNED BY public.tickets.id;


--
-- Name: user_tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_tickets (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    ticket_id bigint NOT NULL,
    zakupiono timestamp(0) without time zone NOT NULL
);


ALTER TABLE public.user_tickets OWNER TO postgres;

--
-- Name: user_tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_tickets_id_seq OWNER TO postgres;

--
-- Name: user_tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_tickets_id_seq OWNED BY public.user_tickets.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    role_id bigint NOT NULL,
    aktywny boolean DEFAULT true NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: lanes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lanes ALTER COLUMN id SET DEFAULT nextval('public.lanes_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: news_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news_items ALTER COLUMN id SET DEFAULT nextval('public.news_items_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN id SET DEFAULT nextval('public.roles_id_seq'::regclass);


--
-- Name: staff id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff ALTER COLUMN id SET DEFAULT nextval('public.staff_id_seq'::regclass);


--
-- Name: tickets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets ALTER COLUMN id SET DEFAULT nextval('public.tickets_id_seq'::regclass);


--
-- Name: user_tickets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tickets ALTER COLUMN id SET DEFAULT nextval('public.user_tickets_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: lanes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lanes (id, numer_toru, status, created_at, updated_at) FROM stdin;
1	1	DOSTEPNY	2026-08-29 12:59:11	2026-08-29 12:59:11
2	2	DOSTEPNY	2026-08-29 12:59:11	2026-08-29 12:59:11
3	3	AWARIA	2026-08-29 12:59:11	2026-08-29 12:59:11
4	4	ZAJECIA	2026-08-29 12:59:11	2026-08-29 12:59:11
5	5	DOSTEPNY	2026-08-29 12:59:11	2026-08-29 12:59:11
6	6	REZERWACJA	2026-08-29 12:59:11	2026-08-29 12:59:11
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2026_08_28_000100_create_roles_table	1
5	2026_08_28_000200_add_role_and_status_to_users_table	1
6	2026_08_28_000300_create_tickets_table	1
7	2026_08_28_000400_create_lanes_table	1
8	2026_08_28_000500_create_staff_table	1
9	2026_08_28_000600_create_user_tickets_table	1
10	2026_08_28_000700_create_news_items_table	1
\.


--
-- Data for Name: news_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.news_items (id, tytul, data_publikacji, tresc, created_at, updated_at) FROM stdin;
1	Zapisy na Aqua Aerobic	2026-05-24	Od poniedziałku ruszają zapisy na nowe zajęcia w wodzie.	2026-08-29 12:59:11	2026-08-29 12:59:11
2	Przerwa techniczna	2026-05-20	W najbliższy weekend brodzik będzie nieczynny z powodu konserwacji.	2026-08-29 12:59:11	2026-08-29 12:59:11
3	Zawody pływackie o Puchar MOSiR	2026-06-15	W sobotę odbędą się zawody dla dzieci i młodzieży. W godzinach 10:00 - 14:00 część torów będzie zarezerwowana dla uczestników.	2026-08-29 12:59:11	2026-08-29 12:59:11
4	Wycieczki szkolne - rezerwacje torów	2026-06-18	W środę odwiedzą nas grupy szkolne z regionu. Prosimy o sprawdzenie dostępności torów przed planowaną wizytą.	2026-08-29 12:59:11	2026-08-29 12:59:11
5	Kurs na ratownika wodnego	2026-06-22	Ruszają zapisy na wakacyjny kurs ratownika. Liczba miejsc jest ograniczona, a pierwsze zajęcia organizacyjne odbędą się pod koniec czerwca.	2026-08-29 12:59:11	2026-08-29 12:59:11
6	Nocne plywanie w piatek	2026-07-02	W każdy piątek wakacji obiekt będzie czynny do godziny 23:00 dla osób korzystających z torów sportowych.	2026-08-29 12:59:11	2026-08-29 12:59:11
7	Promocja dla rodzin wielodzietnych	2026-07-05	Wprowadzamy tańsze wejścia rodzinne dla posiadaczy Karty Dużej Rodziny.	2026-08-29 12:59:11	2026-08-29 12:59:11
8	Nowe zajecia dla seniorow	2026-07-08	W harmonogramie pojawiły się spokojne zajęcia ruchowe w wodzie dla osób 60+.	2026-08-29 12:59:11	2026-08-29 12:59:11
9	Basen otwarty w swieto miasta	2026-07-12	W dniu święta miasta obiekt będzie dostępny w godzinach 8:00 - 18:00.	2026-08-29 12:59:11	2026-08-29 12:59:11
10	Przeglad szatni i natryskow	2026-07-16	W czwartek rano część szatni będzie czasowo wyłączona z użytkowania z powodu przeglądu technicznego.	2026-08-29 12:59:11	2026-08-29 12:59:11
11	Otwarte lekcje nauki plywania	2026-07-20	Zapraszamy dzieci i dorosłych na bezpłatne zajęcia pokazowe z instruktorami.	2026-08-29 12:59:11	2026-08-29 12:59:11
12	Dzien bezpiecznego wypoczynku nad woda	2026-07-24	Ratownicy poprowadzą krótkie warsztaty z zasad bezpieczeństwa w wodzie i pierwszej pomocy.	2026-08-29 12:59:11	2026-08-29 12:59:11
13	Modernizacja systemu kasowego	2026-08-01	W godzinach porannych mogą wystąpić krótkie opóźnienia przy zakupie wejść i karnetów.	2026-08-29 12:59:11	2026-08-29 12:59:11
14	Turniej plywacki szkol srednich	2026-08-10	W poniedziałek dwa tory będą przeznaczone dla zawodników turnieju szkolnego.	2026-08-29 12:59:11	2026-08-29 12:59:11
15	Weekend z animacjami dla dzieci	2026-08-18	Na strefie rekreacyjnej pojawią się zabawy prowadzone przez instruktorów i animatorów.	2026-08-29 12:59:11	2026-08-29 12:59:11
16	Nowe godziny zajec aqua fitness	2026-08-22	Od przyszłego tygodnia zajęcia aqua fitness będą odbywać się również we wtorki wieczorem.	2026-08-29 12:59:11	2026-08-29 12:59:11
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (id, name, created_at, updated_at) FROM stdin;
1	admin	2026-08-29 12:59:07	2026-08-29 13:02:22
2	user	2026-08-29 12:59:07	2026-08-29 13:02:22
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
\.


--
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff (id, imie, nazwisko, stanowisko, created_at, updated_at) FROM stdin;
1	Michał	Zalewski	Główny ratownik	2026-08-29 12:59:11	2026-08-29 12:59:11
2	Katarzyna	Wolska	Instruktor pływania	2026-08-29 12:59:11	2026-08-29 12:59:11
3	Anna	Nowak	Recepcjonistka	2026-08-29 12:59:11	2026-08-29 12:59:11
4	Damian	Kaczmarek	Ratownik wodny	2026-08-29 12:59:11	2026-08-29 12:59:11
5	Paulina	Stepien	Ratownik wodny	2026-08-29 12:59:11	2026-08-29 12:59:11
6	Malgorzata	Baran	Instruktor aqua aerobiku	2026-08-29 12:59:11	2026-08-29 12:59:11
7	Krzysztof	Adamski	Konserwator obiektu	2026-08-29 12:59:11	2026-08-29 12:59:11
8	Joanna	Sobczak	Koordynator recepcji	2026-08-29 12:59:11	2026-08-29 12:59:11
9	Mariusz	Czerwinski	Instruktor pływania	2026-08-29 12:59:11	2026-08-29 12:59:11
10	Beata	Walczak	Obsługa klienta	2026-08-29 12:59:11	2026-08-29 12:59:11
11	Przemyslaw	Rutkowski	Ratownik zmianowy	2026-08-29 12:59:11	2026-08-29 12:59:11
12	Monika	Kurek	Specjalista ds. zajec dziecięcych	2026-08-29 12:59:11	2026-08-29 12:59:11
\.


--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tickets (id, nazwa, rodzaj, cena_brutto, dni_waznosci, opis, created_at, updated_at) FROM stdin;
1	Karnet poranny	CZASOWY	39.90	30	Idealny dla osób korzystających z basenu przed pracą.	2026-08-29 12:59:11	2026-08-29 12:59:11
2	Karnet rodzinny	CZASOWY	89.90	30	Wspólne wejścia dla rodzin odwiedzających obiekt w weekendy.	2026-08-29 12:59:11	2026-08-29 12:59:11
3	10 wejść	ILOSCIOWY	129.00	90	Pakiet dziesięciu wejść dla regularnych użytkowników.	2026-08-29 12:59:11	2026-08-29 12:59:11
4	Karnet uczniowski	ILOSCIOWY	69.00	60	Zniżkowy karnet dla uczniów i studentów.	2026-08-29 12:59:11	2026-08-29 12:59:11
5	Karnet wieczorny	CZASOWY	44.90	30	Dla osób odwiedzających basen po godzinie 18:00.	2026-08-29 12:59:11	2026-08-29 12:59:11
6	Karnet senior 60+	CZASOWY	34.90	30	Preferencyjna oferta dla seniorów korzystających z pływalni.	2026-08-29 12:59:11	2026-08-29 12:59:11
7	Karnet fitness aqua	CZASOWY	79.00	45	Wejścia na basen połączone z zajęciami aqua fitness.	2026-08-29 12:59:11	2026-08-29 12:59:11
8	Karnet weekendowy	CZASOWY	54.00	30	Przeznaczony do wizyt sobotnio-niedzielnych.	2026-08-29 12:59:11	2026-08-29 12:59:11
9	5 wejść	ILOSCIOWY	74.00	45	Mniejszy pakiet dla osób pływających okazjonalnie.	2026-08-29 12:59:11	2026-08-29 12:59:11
10	20 wejść	ILOSCIOWY	239.00	120	Rozszerzony pakiet dla stałych klientów.	2026-08-29 12:59:11	2026-08-29 12:59:11
11	Karnet nauka pływania	ILOSCIOWY	159.00	75	Pakiet wejść dla uczestników kursów nauki pływania.	2026-08-29 12:59:11	2026-08-29 12:59:11
12	Karnet firmowy	ILOSCIOWY	299.00	120	Oferta grupowa dla pracowników lokalnych firm.	2026-08-29 12:59:11	2026-08-29 12:59:11
\.


--
-- Data for Name: user_tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_tickets (id, user_id, ticket_id, zakupiono) FROM stdin;
25	2	1	2026-06-02 08:15:00
26	2	3	2026-07-14 16:40:00
27	3	2	2026-06-10 11:00:00
28	3	8	2026-08-05 18:20:00
29	4	10	2026-05-29 07:35:00
30	4	5	2026-08-16 19:15:00
31	5	7	2026-06-21 17:45:00
32	6	9	2026-07-03 09:00:00
33	7	2	2026-07-07 13:25:00
34	8	12	2026-06-18 15:10:00
35	9	4	2026-05-26 12:15:00
36	10	3	2026-08-03 08:30:00
37	11	6	2026-06-09 10:05:00
38	12	1	2026-06-30 06:55:00
39	13	11	2026-07-09 14:10:00
40	14	8	2026-08-12 20:05:00
41	15	5	2026-06-27 18:35:00
42	16	10	2026-07-19 07:50:00
43	17	7	2026-08-08 17:15:00
44	19	4	2026-06-14 11:20:00
45	3	9	2026-08-21 09:40:00
46	4	1	2026-08-24 06:45:00
47	7	2	2026-08-25 12:55:00
48	12	3	2026-08-26 16:25:00
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, role_id, aktywny) FROM stdin;
1	Administrator Basenu	admin@basen.pl	\N	$2y$12$cwlMwYfupi8Mk3b2LEG4UuwowBSuQAbz5xverhUbCWBPaOnvNESmq	\N	2026-08-29 12:59:07	2026-08-29 13:02:23	1	t
2	Jan Klient	klient@basen.pl	\N	$2y$12$na.E1Vy/3qUoiiuPeOeU/eY/y62E.W8yDvl7UzKvonp.Hc1sxpOEy	\N	2026-08-29 12:59:07	2026-08-29 13:02:23	2	t
3	Anna Kowalska	anna.kowalska@basen.pl	\N	$2y$12$N.tW5NsjYbWewdTiBlKjqOiYR/vPBqoUVs2b6gB7QWeE9z5K1UjtK	\N	2026-08-29 12:59:07	2026-08-29 13:02:23	2	t
4	Piotr Nowak	piotr.nowak@basen.pl	\N	$2y$12$2QjHaZ2jpkNbW1mkso7IheGDZw7tHFmQtePNinK6.uVnmSivpD5OW	\N	2026-08-29 12:59:08	2026-08-29 13:02:24	2	t
5	Katarzyna Wisniewska	katarzyna.wisniewska@basen.pl	\N	$2y$12$HVlXCbdfL6i2algLwCezVO.1rGygyAFoZRKReLCDQYX47ao8Zv7LG	\N	2026-08-29 12:59:08	2026-08-29 13:02:24	2	t
6	Tomasz Wojcik	tomasz.wojcik@basen.pl	\N	$2y$12$s5OQZwImQgZZreb.gDesIOZ7.qcdj00p8RDUfTLtcb5fuXxwbIeKS	\N	2026-08-29 12:59:08	2026-08-29 13:02:24	2	t
7	Magdalena Kaminska	magdalena.kaminska@basen.pl	\N	$2y$12$jhgO2JconNe2c7m4JtHQjuE13v1qmFJN6ja68cQHavMoHooq4I.hK	\N	2026-08-29 12:59:08	2026-08-29 13:02:24	2	t
8	Pawel Lewandowski	pawel.lewandowski@basen.pl	\N	$2y$12$WLkXTTcIz1IWCLJ8iSHZbuLiXmMZHzxBtU6roDBd1nGijkoDVlRji	\N	2026-08-29 12:59:09	2026-08-29 13:02:24	2	t
10	Marcin Szymanski	marcin.szymanski@basen.pl	\N	$2y$12$247.O49imK2pZY.MD6Alouzij6b.01d4/agu2K6ecweRJSJE7dwyC	\N	2026-08-29 12:59:09	2026-08-29 13:02:25	2	t
11	Ewa Dabrowska	ewa.dabrowska@basen.pl	\N	$2y$12$sQqqjcHKUHbwbGO2g2fr7.e6H3Jc8oGJ5QXOB5XsDNton9NgDk/BK	\N	2026-08-29 12:59:09	2026-08-29 13:02:25	2	t
12	Michal Kozlowski	michal.kozlowski@basen.pl	\N	$2y$12$XX.BV07oGpjtYRKJjrkVqet8he7OjYUfzB1MxXQL8KGhxKasWhOTu	\N	2026-08-29 12:59:10	2026-08-29 13:02:25	2	t
13	Joanna Jankowska	joanna.jankowska@basen.pl	\N	$2y$12$OikfNmNLKYvrF1aoOOGq7ONQUH4JRoRgnL5N3sRRPJLk3WuVdCZuC	\N	2026-08-29 12:59:10	2026-08-29 13:02:26	2	t
14	Lukasz Mazur	lukasz.mazur@basen.pl	\N	$2y$12$YnKw6Q90H6XFekpD7Bfb2.ySv4iakDQYHtmH6GMPltRC231o0/pq6	\N	2026-08-29 12:59:10	2026-08-29 13:02:26	2	t
15	Karolina Krawczyk	karolina.krawczyk@basen.pl	\N	$2y$12$HJ7KIphux9cb2hsiHDzfRevusPvE4.C76SiYQgXYsq.hycREIQTmG	\N	2026-08-29 12:59:10	2026-08-29 13:02:26	2	t
16	Rafal Piotrowski	rafal.piotrowski@basen.pl	\N	$2y$12$moLdYW8Tq8JAc.psWUY5UenfRArS4/fcNJPX0zAoHsmvVH6fvoxw2	\N	2026-08-29 12:59:10	2026-08-29 13:02:26	2	t
17	Sylwia Grabowska	sylwia.grabowska@basen.pl	\N	$2y$12$PjDcROcT0ll2pnc0iJz4feyX7tdEiOhC.GH1.MsMHs8h83ncmv2b.	\N	2026-08-29 12:59:11	2026-08-29 13:02:27	2	t
18	Marek Pawlak	marek.pawlak@basen.pl	\N	$2y$12$.aG82gUZjJf6Tod5RiUePuhLhuS3jSrjCjhWtkpOgDPFEmsHuX77e	\N	2026-08-29 12:59:11	2026-08-29 13:02:27	2	f
19	Natalia Michalska	natalia.michalska@basen.pl	\N	$2y$12$y.kQ1GYrXf8NiHpQ1TAtru3o6X.KrBnIrNX.wDFW48HMf7vv90gq.	\N	2026-08-29 12:59:11	2026-08-29 13:02:27	2	t
20	Dorota Kubiak	dorota.kubiak@basen.pl	\N	$2y$12$Nld0jz1MaAhziso98IzfGegiddZ8CYxsYo1frVk7D7Wl8OnA5Z/oy	\N	2026-08-29 12:59:11	2026-08-29 13:02:27	2	f
21	Monika Wrobel	monika.wrobel@basen.pl	\N	$2y$12$AyS9NXyO3.ZOs2AQYpZDCe03nGrJUWGfVLLzmnoRJJ2x6pH7l5WwO	\N	2026-08-29 13:02:28	2026-08-29 13:02:28	2	t
22	Sebastian Kaczynski	sebastian.kaczynski@basen.pl	\N	$2y$12$4QKb13BWdvhpwTm/969hX.OSlKlmeRE8nrFLXGeYP0TwPj/nL.phe	\N	2026-08-29 13:02:28	2026-08-29 13:02:28	2	t
23	Aleksandra Zajac	aleksandra.zajac@basen.pl	\N	$2y$12$qw5vMzW.S5x2Wibb.M32FupRM/JaoM4SMV7r/8QefXnEhEUeefLP2	\N	2026-08-29 13:02:28	2026-08-29 13:02:28	2	t
24	Grzegorz Wieczorek	grzegorz.wieczorek@basen.pl	\N	$2y$12$fgo.OdPATrPUXBlK1OviueOC6OmLPhA7ryREHdOs6Vp.fD.YCoyze	\N	2026-08-29 13:02:28	2026-08-29 13:02:28	2	t
25	Izabela Majewska	izabela.majewska@basen.pl	\N	$2y$12$K2NrNm3ZpN6LfIZfmxiNKeR1Dlbohic6xBmgHnHo3LXWvadHrOwJa	\N	2026-08-29 13:02:29	2026-08-29 13:02:29	2	t
9	Agnieszka Zielinska	agnieszka.zielinska@basen.pl	\N	$2y$12$XQWidG74VxEQm68RHmufLuCEH6PHTPD2v8g3BLPywleXFhq9/zleO	\N	2026-08-29 12:59:09	2026-08-29 13:04:38	2	f
26	Bartosz Ostrowski	bartosz.ostrowski@basen.pl	\N	$2y$12$GdnY95iH5SoQfcrDFYhvwOWjz.oLcX4h8/kjgX3nMrYkUeIotvWcu	\N	2026-08-29 13:02:29	2026-08-29 13:02:29	2	t
27	Elzbieta Sadowska	elzbieta.sadowska@basen.pl	\N	$2y$12$1G5DYwBTFZb.kYR8gwuhFeEAmua7zzu1xGZa7smJT3VmXabuRC9rm	\N	2026-08-29 13:02:29	2026-08-29 13:02:29	2	t
28	Hubert Duda	hubert.duda@basen.pl	\N	$2y$12$N7PqmaDit9li1t07fErkIeLI3h9mCGS.D1l9iHSSMtRlb9YQcFNLu	\N	2026-08-29 13:02:29	2026-08-29 13:02:29	2	t
29	Weronika Piasecka	weronika.piasecka@basen.pl	\N	$2y$12$diucEMAwdPwz19ny33BcBuJb3yL5W.Y8OGysO1OykAsw8YDikTExu	\N	2026-08-29 13:02:30	2026-08-29 13:02:30	2	t
30	Patryk Kurek	patryk.kurek@basen.pl	\N	$2y$12$rNqOY3NRqHEtdI2weIgXGunpjGs5M8RVq4ZE9IxJvFVctxi2VuAGG	\N	2026-08-29 13:02:30	2026-08-29 13:02:30	2	t
31	Renata Lis	renata.lis@basen.pl	\N	$2y$12$AXsp84tsOQjsRpJ9oYeOHO05tnmQr.YgOkrhv41qX2V0hbNXT14wG	\N	2026-08-29 13:02:30	2026-08-29 13:02:30	2	t
32	Daniel Krupa	daniel.krupa@basen.pl	\N	$2y$12$Omj0RHbO/Nr9LQjKvDenc.tRwwVwGMo/APlWZ.arLoBkRyFZFEev6	\N	2026-08-29 13:02:30	2026-08-29 13:02:30	2	t
33	Karol Gorski	karol.gorski@basen.pl	\N	$2y$12$yjLh6CWRHtmNkvsg2JBLwO620DTstp6XWCNl7WwhJ0gx3violnkom	\N	2026-08-29 13:02:30	2026-08-29 13:02:30	2	t
34	Paulina Sikora	paulina.sikora@basen.pl	\N	$2y$12$cduModQxpzJS1pah2ZayueaFTgiqcvF1AmYUsqZPegsGh40hu.MiC	\N	2026-08-29 13:02:31	2026-08-29 13:02:31	2	t
35	Michalina Urbanska	michalina.urbanska@basen.pl	\N	$2y$12$J/6LpA94ogQ5ql1.MgfZ2O0op/7lnFqZ.ysVEF3YAv0qR0oWnP4D2	\N	2026-08-29 13:02:31	2026-08-29 13:02:31	2	f
36	Kamil Witkowski	kamil.witkowski@basen.pl	\N	$2y$12$JP5lig0PdsBbj94S0Vb.TutDyG47qB4.l8WYYcSOl9VEtzMLHHCmW	\N	2026-08-29 13:02:31	2026-08-29 13:02:31	2	t
\.


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: lanes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lanes_id_seq', 6, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 10, true);


--
-- Name: news_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.news_items_id_seq', 16, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 4, true);


--
-- Name: staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_id_seq', 12, true);


--
-- Name: tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tickets_id_seq', 12, true);


--
-- Name: user_tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_tickets_id_seq', 48, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 36, true);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: lanes lanes_numer_toru_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lanes
    ADD CONSTRAINT lanes_numer_toru_unique UNIQUE (numer_toru);


--
-- Name: lanes lanes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lanes
    ADD CONSTRAINT lanes_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: news_items news_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.news_items
    ADD CONSTRAINT news_items_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: roles roles_name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_name_unique UNIQUE (name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: staff staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id);


--
-- Name: tickets tickets_nazwa_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_nazwa_unique UNIQUE (nazwa);


--
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- Name: user_tickets user_tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tickets
    ADD CONSTRAINT user_tickets_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: cache_expiration_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cache_expiration_index ON public.cache USING btree (expiration);


--
-- Name: cache_locks_expiration_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cache_locks_expiration_index ON public.cache_locks USING btree (expiration);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: lanes_status_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX lanes_status_index ON public.lanes USING btree (status);


--
-- Name: news_items_data_publikacji_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX news_items_data_publikacji_index ON public.news_items USING btree (data_publikacji);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: staff_nazwisko_imie_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX staff_nazwisko_imie_index ON public.staff USING btree (nazwisko, imie);


--
-- Name: tickets_rodzaj_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tickets_rodzaj_index ON public.tickets USING btree (rodzaj);


--
-- Name: user_tickets_user_id_zakupiono_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX user_tickets_user_id_zakupiono_index ON public.user_tickets USING btree (user_id, zakupiono);


--
-- Name: user_tickets user_tickets_ticket_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tickets
    ADD CONSTRAINT user_tickets_ticket_id_foreign FOREIGN KEY (ticket_id) REFERENCES public.tickets(id) ON DELETE CASCADE;


--
-- Name: user_tickets user_tickets_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_tickets
    ADD CONSTRAINT user_tickets_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: users users_role_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_foreign FOREIGN KEY (role_id) REFERENCES public.roles(id) ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

\unrestrict Cb9aH2X8hm8x3UFpTRp1dzPwfhzbGq0IMUM4ter5z4dVooAcfsYWpxubyLpTCEP

