--
-- PostgreSQL database dump
--

\restrict w56ew2tdBhsI26v1X3PFdHj8rV2N7u4j5jKH2mPjyAXK64qgKXYKBcyE9utrduI

-- Dumped from database version 18.1
-- Dumped by pg_dump version 18.1

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

--
-- Name: dodajzakup(integer, character varying, date); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.dodajzakup(IN p_ticket_id integer, IN p_imie character varying, IN p_data date)
    LANGUAGE plpgsql
    AS $$
DECLARE
    ticket_exists INT;
BEGIN
    SELECT COUNT(*) INTO ticket_exists FROM tickets WHERE id = p_ticket_id;
    
    IF ticket_exists = 0 THEN
        RAISE EXCEPTION 'Błąd: Taki karnet nie istnieje w bazie cennika!';
    ELSE
        INSERT INTO purchases (ticket_id, imie_klienta, data_zakupu) VALUES (p_ticket_id, p_imie, p_data);
    END IF;
END;
$$;


ALTER PROCEDURE public.dodajzakup(IN p_ticket_id integer, IN p_imie character varying, IN p_data date) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

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
-- Name: lane_statuses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lane_statuses (
    id integer NOT NULL,
    numer_toru integer NOT NULL,
    status_toru character varying(20) NOT NULL
);


ALTER TABLE public.lane_statuses OWNER TO postgres;

--
-- Name: lanes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lanes (
    id integer NOT NULL,
    nazwa character varying(50) NOT NULL,
    status character varying(30) DEFAULT 'DOSTEPNY'::character varying NOT NULL
);


ALTER TABLE public.lanes OWNER TO postgres;

--
-- Name: lanes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lanes_id_seq
    AS integer
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
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- Name: purchases; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchases (
    id integer NOT NULL,
    ticket_id integer NOT NULL,
    imie_klienta character varying(255) NOT NULL,
    data_zakupu date NOT NULL
);


ALTER TABLE public.purchases OWNER TO postgres;

--
-- Name: purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.purchases_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.purchases_id_seq OWNER TO postgres;

--
-- Name: purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.purchases_id_seq OWNED BY public.purchases.id;


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
    id integer NOT NULL,
    imie character varying(100) NOT NULL,
    nazwisko character varying(100) NOT NULL,
    stanowisko character varying(100) NOT NULL
);


ALTER TABLE public.staff OWNER TO postgres;

--
-- Name: staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.staff_id_seq
    AS integer
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
    id integer NOT NULL,
    nazwa character varying(255) NOT NULL,
    rodzaj character varying(50) NOT NULL,
    cena_brutto numeric(8,2) NOT NULL,
    dni_waznosci integer NOT NULL,
    aktywny boolean DEFAULT true NOT NULL
);


ALTER TABLE public.tickets OWNER TO postgres;

--
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tickets_id_seq
    AS integer
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
    id integer NOT NULL,
    user_id integer NOT NULL,
    ticket_id integer NOT NULL,
    zakupiono timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.user_tickets OWNER TO postgres;

--
-- Name: user_tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_tickets_id_seq
    AS integer
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
    role character varying(50) DEFAULT 'client'::character varying,
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
-- Name: purchases id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases ALTER COLUMN id SET DEFAULT nextval('public.purchases_id_seq'::regclass);


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
-- Data for Name: lane_statuses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lane_statuses (id, numer_toru, status_toru) FROM stdin;
2	2	DOSTEPNY
3	3	AWARIA
4	4	ZAJECIA
1	1	AWARIA
\.


--
-- Data for Name: lanes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lanes (id, nazwa, status) FROM stdin;
1	Tor 1	AWARIA
2	Tor 2	DOSTEPNY
4	Tor 4	ZAJECIA
5	Tor 5	DOSTEPNY
6	Tor 6	DOSTEPNY
3	Tor 3	ZAJECIA
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: purchases; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.purchases (id, ticket_id, imie_klienta, data_zakupu) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
\.


--
-- Data for Name: staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.staff (id, imie, nazwisko, stanowisko) FROM stdin;
10	Michal	Zalewski	Glowny Ratownik
11	Katarzyna	Wolska	Instruktor Plywania
12	Bartek	Nowicki	Kasjer
13	Anna	Kowalska	Kasjer
14	Piotr	Nowak	Ratownik WOPR
15	Tomasz	Wisniewski	Konserwator
16	Magdalena	Dabrowska	Sprzataczka
17	Kamil	Lewandowski	Ratownik
18	Agnieszka	Kaminska	Kierownik Zmiany
19	Pawel	Zielinski	Ratownik
20	Monika	Kaczmarek	Kasjer
21	Jakub	Wojcik	Instruktor Plywania
22	Natalia	Mazur	Sprzataczka
23	Mateusz	Krawczyk	Ratownik WOPR
24	Aleksandra	Piotrowska	Kasjer
25	Damian	Grabowski	Ratownik
26	Weronika	Michalak	Instruktor Plywania
27	Marcin	Pawlak	Konserwator
28	Patrycja	Adamczyk	Sprzataczka
29	Sebastian	Dudek	Ratownik
30	Karolina	Sikora	Kasjer
31	Adrian	Jankowski	Ratownik
32	Ewelina	Witkowska	Kierownik Zmiany
33	Lukasz	Baran	Ratownik WOPR
34	Joanna	Szymczak	Instruktor Plywania
35	Krzysztof	Czarnecki	Konserwator
36	Sylwia	Ostrowska	Kasjer
37	Marek	Wrobel	Ratownik
38	Paulina	Gorska	Sprzataczka
39	Rafal	Kozlowski	Ratownik
\.


--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tickets (id, nazwa, rodzaj, cena_brutto, dni_waznosci, aktywny) FROM stdin;
8	Bilet jednorazowy ulgowy	CZASOWY	22.00	1	t
9	Karnet dzienny	CZASOWY	45.00	1	t
10	Karnet rodzinny 2+2	ILOSCIOWY	90.00	1	t
11	Karnet 5 wejsc	ILOSCIOWY	120.00	30	t
12	Karnet 10 wejsc	ILOSCIOWY	210.00	60	t
13	Karnet 20 wejsc	ILOSCIOWY	380.00	90	t
14	Karnet miesieczny normalny	CZASOWY	170.00	30	t
15	Karnet miesieczny ulgowy	CZASOWY	130.00	30	t
16	Karnet studencki miesieczny	CZASOWY	115.00	30	t
17	Karnet senior 60+	CZASOWY	100.00	30	t
18	Karnet roczny VIP	CZASOWY	1200.00	365	t
7	test	CZASOWY	67.00	1	t
20	jakiss	CZASOWY	67777.00	677	f
19	Jakiś	CZASOWY	23.00	5	t
\.


--
-- Data for Name: user_tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_tickets (id, user_id, ticket_id, zakupiono) FROM stdin;
8	36	7	2026-06-07 16:54:50.128415
10	8	7	2026-06-08 09:52:27.638226
11	8	11	2026-06-08 22:27:35.606208
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, role, aktywny) FROM stdin;
1	Szef	admin@basen.pl	\N	$2y$12$IN/33d5eyuvzdXBBLwOcfeAzfpOAzJ0yUeESqFlC5EWwMxirOytDO	\N	\N	\N	admin	t
7	Test Test	test@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
8	Jan Klient	klient@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
9	Anna Nowak	anna.nowak@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
10	Tomasz Wisniewski	tomasz.wisniewski@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
11	Katarzyna Wojcik	katarzyna.wojcik@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
12	Michal Kowalczyk	michal.kowalczyk@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
13	Agnieszka Kaminska	agnieszka.kaminska@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
14	Pawel Zielinski	pawel.zielinski@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
15	Monika Lewandowska	monika.lewandowska@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
16	Jakub Szymanski	jakub.szymanski@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
17	Natalia Wozniak	natalia.wozniak@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
18	Kamil Dabrowski	kamil.dabrowski@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
19	Aleksandra Kozlowska	aleksandra.kozlowska@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
20	Mateusz Jankowski	mateusz.jankowski@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
21	Weronika Mazur	weronika.mazur@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
22	Damian Krawczyk	damian.krawczyk@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
23	Joanna Pawlak	joanna.pawlak@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
24	Sebastian Dudek	sebastian.dudek@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
25	Karolina Sikora	karolina.sikora@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
26	Adrian Baran	adrian.baran@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
27	Ewelina Ostrowska	ewelina.ostrowska@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
28	Lukasz Wrobel	lukasz.wrobel@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
29	Paulina Gorska	paulina.gorska@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
30	Rafal Czarnecki	rafal.czarnecki@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
31	Sylwia Michalak	sylwia.michalak@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
32	Krzysztof Adamczyk	krzysztof.adamczyk@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
33	Patrycja Grabowska	patrycja.grabowska@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
34	Marcin Zajac	marcin.zajac@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
35	Julia Kaczmarek	julia.kaczmarek@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	t
6	Piotr Kowal	piotr@basen.pl	\N	$2y$12$14IwUq1kukoHXM85Rzxc.eN/kh8hIvWfuwOh5nQhQ981S1zRELp5O	\N	2026-06-05 19:39:06	2026-06-05 19:39:06	client	f
36	Nowy Użytkownik	nowy@basen.pl	\N	$2y$12$GiBHeFz6MHt7tM4AselO4.t1w/FKLfq81Hu5PKuq51/nrcA7kpwgm	\N	\N	\N	client	t
39	Kacper Nowak	08@basen.pl	\N	$2y$12$EvwzFg5Yv/lgfnUC1vCbH.YQ4tXziFVEdSMz1vNbVuT69akdMRFBS	\N	\N	\N	client	t
40	Piotr Kalka	2@basen.pl	\N	$2y$12$rLTpqcKH3XbeRDHfxI51But09C5w02UZrhii.N6OXaKomLS0aKvTK	\N	\N	\N	client	t
41	Tomasz Niecik	tomasz@basen.pl	\N	$2y$12$Y7VZAL.Xc8aUhtYg6i6QtemO.VpoNv5uIzffU8dedNBMWZ3e5v6zK	\N	\N	\N	client	t
42	Test Dwa	test2@basen.pl	\N	$2y$12$1EqUWAR6faeyP8q5WjokTOfTonefXKbijfzENZizHkIfCU/hrn8vW	\N	\N	\N	client	t
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

SELECT pg_catalog.setval('public.migrations_id_seq', 3, true);


--
-- Name: purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchases_id_seq', 1, false);


--
-- Name: staff_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.staff_id_seq', 40, true);


--
-- Name: tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tickets_id_seq', 21, true);


--
-- Name: user_tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_tickets_id_seq', 11, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 42, true);


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
-- Name: lane_statuses lane_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lane_statuses
    ADD CONSTRAINT lane_statuses_pkey PRIMARY KEY (id);


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
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: purchases purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT purchases_pkey PRIMARY KEY (id);


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
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: purchases fk_ticket; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchases
    ADD CONSTRAINT fk_ticket FOREIGN KEY (ticket_id) REFERENCES public.tickets(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict w56ew2tdBhsI26v1X3PFdHj8rV2N7u4j5jKH2mPjyAXK64qgKXYKBcyE9utrduI

