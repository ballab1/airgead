
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


CREATE SCHEMA public;
ALTER SCHEMA public OWNER TO pg_database_owner;
COMMENT ON SCHEMA public IS 'standard public schema';
SET default_tablespace = '';
SET default_table_access_method = heap;


CREATE TABLE history (
    date_time character varying NOT NULL,
    bank character varying,
    payload jsonb
);
ALTER TABLE history OWNER TO postgres;
GRANT SELECT,REFERENCES ON TABLE history TO PUBLIC;


CREATE VIEW acct_history AS
 SELECT ((payload ->> 'date_time'::text))::timestamp with time zone AS datetime,
    (payload ->> 'date_time'::text) AS date_time,
    (payload ->> 'Name'::text) AS name,
    ((payload ->> 'Value'::text))::money AS value,
    (payload ->> 'Type'::text) AS acct_type,
    (payload ->> 'Subtype'::text) AS subtype,
    ((payload ->> 'Rate'::text))::real AS rate,
    (payload ->> 'Account'::text) AS acct_num,
    payload
   FROM history;
ALTER VIEW acct_history OWNER TO postgres;
GRANT SELECT,REFERENCES ON TABLE acct_history TO PUBLIC;


CREATE TABLE banks (
    name character varying NOT NULL,
    url character varying,
    tel character varying,
    routing character varying
);
ALTER TABLE banks OWNER TO postgres;
ALTER TABLE ONLY banks ADD CONSTRAINT banks_pkey PRIMARY KEY (name);
GRANT SELECT,REFERENCES ON TABLE banks TO PUBLIC;
