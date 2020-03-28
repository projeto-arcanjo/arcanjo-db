--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Debian 11.5-3.pgdg90+1)
-- Dumped by pg_dump version 11.5 (Debian 11.5-3.pgdg90+1)

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: access_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.access_log (
    log_id bigint NOT NULL,
    date timestamp without time zone,
    header text,
    method character varying(20),
    querystring character varying(255),
    remoteaddr character varying(50),
    remotehost character varying(50),
    remoteuser character varying(100),
    remoteuserid bigint,
    remoteusername character varying(255),
    requesturl character varying(255),
    accesstype character varying(255),
    profileimage character varying(100),
    access_type character varying(255)
);


ALTER TABLE public.access_log OWNER TO postgres;

--
-- Name: access_log_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.access_log_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.access_log_log_id_seq OWNER TO postgres;

--
-- Name: access_log_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.access_log_log_id_seq OWNED BY public.access_log.log_id;


--
-- Name: oauth_access_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_access_token (
    authentication_id character varying(255) NOT NULL,
    authentication bytea,
    client_id character varying(255),
    refresh_token character varying(255),
    token bytea,
    token_id character varying(255),
    user_name character varying(255)
);


ALTER TABLE public.oauth_access_token OWNER TO postgres;

--
-- Name: oauth_approvals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_approvals (
    pk_id bigint NOT NULL,
    clientid character varying(255),
    expiresat date,
    lastmodifiedat date,
    scope character varying(255),
    status character varying(10),
    userid character varying(255),
    client_id character varying(255),
    expires_at date,
    last_modified_at date,
    user_id character varying(255)
);


ALTER TABLE public.oauth_approvals OWNER TO postgres;

--
-- Name: oauth_approvals_pk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth_approvals_pk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_approvals_pk_id_seq OWNER TO postgres;

--
-- Name: oauth_approvals_pk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth_approvals_pk_id_seq OWNED BY public.oauth_approvals.pk_id;


--
-- Name: oauth_client_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_client_details (
    client_id character varying(255) NOT NULL,
    access_token_validity integer,
    additional_information text,
    authorities character varying(255),
    authorized_grant_types character varying(255),
    autoapprove character varying(50),
    client_secret character varying(255),
    refresh_token_validity integer,
    resource_ids character varying(255),
    scope character varying(255),
    web_server_redirect_uri character varying(255)
);


ALTER TABLE public.oauth_client_details OWNER TO postgres;

--
-- Name: oauth_client_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_client_token (
    authentication_id character varying(255) NOT NULL,
    client_id character varying(255),
    token bytea,
    token_id character varying(255),
    user_name character varying(255)
);


ALTER TABLE public.oauth_client_token OWNER TO postgres;

--
-- Name: oauth_code; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_code (
    pk_id bigint NOT NULL,
    authentication bytea,
    code character varying(255)
);


ALTER TABLE public.oauth_code OWNER TO postgres;

--
-- Name: oauth_code_pk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth_code_pk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_code_pk_id_seq OWNER TO postgres;

--
-- Name: oauth_code_pk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth_code_pk_id_seq OWNED BY public.oauth_code.pk_id;


--
-- Name: oauth_refresh_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.oauth_refresh_token (
    pk_id bigint NOT NULL,
    authentication bytea,
    token bytea,
    token_id character varying(255)
);


ALTER TABLE public.oauth_refresh_token OWNER TO postgres;

--
-- Name: oauth_refresh_token_pk_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.oauth_refresh_token_pk_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oauth_refresh_token_pk_id_seq OWNER TO postgres;

--
-- Name: oauth_refresh_token_pk_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.oauth_refresh_token_pk_id_seq OWNED BY public.oauth_refresh_token.pk_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id bigint NOT NULL,
    enabled boolean NOT NULL,
    full_name character varying(200) NOT NULL,
    funcao character varying(100),
    user_name character varying(100) NOT NULL,
    origem character varying(200),
    password character varying(100) NOT NULL,
    profile_image character varying(255) NOT NULL,
    setor character varying(100),
    telefone character varying(20),
    cpf character varying(14),
    email character varying(100)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_clients (
    client_client_id character varying(255) NOT NULL,
    user_user_id bigint NOT NULL,
    dt_final timestamp without time zone,
    dt_inicial timestamp without time zone,
    sysadmin boolean,
    dt_alteracao timestamp without time zone,
    respalteracao character varying(255),
    tipoalteracao character varying(255)
);


ALTER TABLE public.users_clients OWNER TO postgres;

--
-- Name: users_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users_roles (
    user_role_id bigint NOT NULL,
    role_name character varying(255) NOT NULL,
    user_id bigint
);


ALTER TABLE public.users_roles OWNER TO postgres;

--
-- Name: users_roles_user_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_roles_user_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_roles_user_role_id_seq OWNER TO postgres;

--
-- Name: users_roles_user_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_roles_user_role_id_seq OWNED BY public.users_roles.user_role_id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: access_log log_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access_log ALTER COLUMN log_id SET DEFAULT nextval('public.access_log_log_id_seq'::regclass);


--
-- Name: oauth_approvals pk_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_approvals ALTER COLUMN pk_id SET DEFAULT nextval('public.oauth_approvals_pk_id_seq'::regclass);


--
-- Name: oauth_code pk_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_code ALTER COLUMN pk_id SET DEFAULT nextval('public.oauth_code_pk_id_seq'::regclass);


--
-- Name: oauth_refresh_token pk_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_refresh_token ALTER COLUMN pk_id SET DEFAULT nextval('public.oauth_refresh_token_pk_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_roles user_role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles ALTER COLUMN user_role_id SET DEFAULT nextval('public.users_roles_user_role_id_seq'::regclass);


--
-- Data for Name: access_log; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: oauth_access_token; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: oauth_approvals; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: oauth_client_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.oauth_client_details (client_id, access_token_validity, additional_information, authorities, authorized_grant_types, autoapprove, client_secret, refresh_token_validity, resource_ids, scope, web_server_redirect_uri) VALUES ('arcanjo', 3600, '{"nome":"Arcanjo", "logotipo":"/resources/img/sisclaten-symbol.png","descricao":"descricao", "homePath":"homePath"}', 'ROLE_CLIENT,ROLE_TRUSTED_CLIENT', 'password,authorization_code,refresh_token,implicit', 'true', '$2a$09$lILtQ14UWv.OfGJ6AZtOEeGwmG/MOwa/sXz1Bjul4cjI.6J2JEkiS', 600, NULL, 'read,write,trust,user_info', 'http://cmabreu.com.br/');


--
-- Data for Name: oauth_client_token; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: oauth_code; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: oauth_refresh_token; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (user_id, enabled, full_name, funcao, user_name, origem, password, profile_image, setor, telefone, cpf, email) VALUES (1, true, 'System Admin', 'System Admin', 'admin@admin', 'Arcanjo', '$2a$08$9vYjNx/HABQAdLnBiHzHAumB8w4Wwn.N1lHoFdXdJ.7MzVF81jYkC', '601aeab282f94aaeb4f706042d6427fe.png', 'Arcanjo', '(21) 3456-7654', '123.123.123-12', 'magno.mabreu@gmail.com');


--
-- Data for Name: users_clients; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users_roles (user_role_id, role_name, user_id) VALUES (442, 'ROLE_ADMIN', 1);


--
-- Name: access_log_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.access_log_log_id_seq', 193, true);


--
-- Name: oauth_approvals_pk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth_approvals_pk_id_seq', 1, false);


--
-- Name: oauth_code_pk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth_code_pk_id_seq', 1, false);


--
-- Name: oauth_refresh_token_pk_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.oauth_refresh_token_pk_id_seq', 115, true);


--
-- Name: users_roles_user_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_roles_user_role_id_seq', 453, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 561, true);


--
-- Name: access_log access_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access_log
    ADD CONSTRAINT access_log_pkey PRIMARY KEY (log_id);


--
-- Name: oauth_access_token oauth_access_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_access_token
    ADD CONSTRAINT oauth_access_token_pkey PRIMARY KEY (authentication_id);


--
-- Name: oauth_approvals oauth_approvals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_approvals
    ADD CONSTRAINT oauth_approvals_pkey PRIMARY KEY (pk_id);


--
-- Name: oauth_client_details oauth_client_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_client_details
    ADD CONSTRAINT oauth_client_details_pkey PRIMARY KEY (client_id);


--
-- Name: oauth_client_token oauth_client_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_client_token
    ADD CONSTRAINT oauth_client_token_pkey PRIMARY KEY (authentication_id);


--
-- Name: oauth_code oauth_code_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_code
    ADD CONSTRAINT oauth_code_pkey PRIMARY KEY (pk_id);


--
-- Name: oauth_refresh_token oauth_refresh_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.oauth_refresh_token
    ADD CONSTRAINT oauth_refresh_token_pkey PRIMARY KEY (pk_id);


--
-- Name: users uk_k8d0f2n7n88w1a16yhua64onx; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_k8d0f2n7n88w1a16yhua64onx UNIQUE (user_name);


--
-- Name: users_clients users_clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_clients
    ADD CONSTRAINT users_clients_pkey PRIMARY KEY (client_client_id, user_user_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users_roles users_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (user_role_id);


--
-- Name: users_clients fk24srl1mfr8r3qvdqj94d9k9d5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_clients
    ADD CONSTRAINT fk24srl1mfr8r3qvdqj94d9k9d5 FOREIGN KEY (user_user_id) REFERENCES public.users(user_id);


--
-- Name: users_roles fk_datalayer_server; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_roles
    ADD CONSTRAINT fk_datalayer_server FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: users_clients fkkvrf67oq0dsiwmt3uylmh3efy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users_clients
    ADD CONSTRAINT fkkvrf67oq0dsiwmt3uylmh3efy FOREIGN KEY (client_client_id) REFERENCES public.oauth_client_details(client_id);


--
-- PostgreSQL database dump complete
--

