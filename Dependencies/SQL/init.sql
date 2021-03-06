--
-- PostgreSQL database dump
--

-- Dumped from database version 10.0
-- Dumped by pg_dump version 10.0

-- Started on 2018-05-03 09:44:06

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'WIN1252';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2828 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_with_oids = false;

--
-- TOC entry 198 (class 1259 OID 16560)
-- Name: message; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE message (
    exp double precision NOT NULL,
    contents text DEFAULT 'NullMsg'::text NOT NULL,
    userid bigint NOT NULL,
    spam boolean NOT NULL,
    consistent boolean NOT NULL,
    sameperson boolean NOT NULL,
    "time" bigint NOT NULL,
    id integer NOT NULL
);


--
-- TOC entry 197 (class 1259 OID 16558)
-- Name: Message_Id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "Message_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2829 (class 0 OID 0)
-- Dependencies: 197
-- Name: Message_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "Message_Id_seq" OWNED BY message.id;


--
-- TOC entry 201 (class 1259 OID 24827)
-- Name: messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE messages (
    "Exp" text NOT NULL,
    "Contents" text NOT NULL,
    "UserId" bigint NOT NULL,
    "Spam" boolean NOT NULL,
    "PreviousMessage" boolean NOT NULL,
    "SamePerson" boolean NOT NULL,
    "Time" bigint NOT NULL,
    "Id" bigint NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 24825)
-- Name: messages_Id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE messages ALTER COLUMN "Id" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME "messages_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 199 (class 1259 OID 24820)
-- Name: role; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE role (
    id bigint NOT NULL
);


--
-- TOC entry 196 (class 1259 OID 16553)
-- Name: user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "user" (
    exp double precision NOT NULL,
    rank integer NOT NULL,
    userid bigint NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 24833)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    "Exp" text NOT NULL,
    "Rank" integer NOT NULL,
    "UserId" bigint NOT NULL
);


--
-- TOC entry 2691 (class 2604 OID 16563)
-- Name: message id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY message ALTER COLUMN id SET DEFAULT nextval('"Message_Id_seq"'::regclass);


--
-- TOC entry 2696 (class 2606 OID 16568)
-- Name: message Message_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY message
    ADD CONSTRAINT "Message_pkey" PRIMARY KEY (id);


--
-- TOC entry 2698 (class 2606 OID 24824)
-- Name: role Role_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY role
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY (id);


--
-- TOC entry 2694 (class 2606 OID 16557)
-- Name: user users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);


--
-- TOC entry 2700 (class 2606 OID 24840)
-- Name: users users_pkey1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey1 PRIMARY KEY ("UserId");


-- Completed on 2018-05-03 09:44:06

--
-- PostgreSQL database dump complete
--

