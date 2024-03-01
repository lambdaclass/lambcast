--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2 (Homebrew)

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
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: generate_ulid(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.generate_ulid() RETURNS uuid
    LANGUAGE sql STRICT PARALLEL SAFE
    RETURN ((lpad(to_hex((floor((EXTRACT(epoch FROM clock_timestamp()) * (1000)::numeric)))::bigint), 12, '0'::text) || encode(public.gen_random_bytes(10), 'hex'::text)))::uuid;


ALTER FUNCTION public.generate_ulid() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: casts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.casts (
    id uuid DEFAULT public.generate_ulid() NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    fid bigint NOT NULL,
    parent_fid bigint,
    hash bytea NOT NULL,
    root_parent_hash bytea,
    parent_hash bytea,
    root_parent_url text,
    parent_url text,
    text text NOT NULL,
    embeds json DEFAULT '[]'::json NOT NULL,
    mentions json DEFAULT '[]'::json NOT NULL,
    mentions_positions json DEFAULT '[]'::json NOT NULL
);


ALTER TABLE public.casts OWNER TO postgres;

--
-- Name: chain_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chain_events (
    id uuid DEFAULT public.generate_ulid() NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    block_timestamp timestamp with time zone NOT NULL,
    fid bigint NOT NULL,
    chain_id bigint NOT NULL,
    block_number bigint NOT NULL,
    transaction_index smallint NOT NULL,
    log_index smallint NOT NULL,
    type smallint NOT NULL,
    block_hash bytea NOT NULL,
    transaction_hash bytea NOT NULL,
    body json NOT NULL,
    raw bytea NOT NULL
);


ALTER TABLE public.chain_events OWNER TO postgres;

--
-- Name: fids; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fids (
    fid bigint NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    registered_at timestamp with time zone NOT NULL,
    chain_event_id uuid NOT NULL,
    custody_address bytea NOT NULL,
    recovery_address bytea NOT NULL
);


ALTER TABLE public.fids OWNER TO postgres;

--
-- Name: fnames; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fnames (
    id uuid DEFAULT public.generate_ulid() NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    registered_at timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    fid bigint NOT NULL,
    type smallint NOT NULL,
    username text NOT NULL
);


ALTER TABLE public.fnames OWNER TO postgres;

--
-- Name: kysely_migration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kysely_migration (
    name character varying(255) NOT NULL,
    "timestamp" character varying(255) NOT NULL
);


ALTER TABLE public.kysely_migration OWNER TO postgres;

--
-- Name: kysely_migration_lock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kysely_migration_lock (
    id character varying(255) NOT NULL,
    is_locked integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.kysely_migration_lock OWNER TO postgres;

--
-- Name: links; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.links (
    id uuid DEFAULT public.generate_ulid() NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    fid bigint NOT NULL,
    target_fid bigint NOT NULL,
    display_timestamp timestamp with time zone,
    type text NOT NULL,
    hash bytea NOT NULL
);


ALTER TABLE public.links OWNER TO postgres;

--
-- Name: messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.messages (
    id uuid DEFAULT public.generate_ulid() NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    pruned_at timestamp with time zone,
    revoked_at timestamp with time zone,
    fid bigint NOT NULL,
    type smallint NOT NULL,
    hash_scheme smallint NOT NULL,
    signature_scheme smallint NOT NULL,
    hash bytea NOT NULL,
    signature bytea NOT NULL,
    signer bytea NOT NULL,
    body json NOT NULL,
    raw bytea NOT NULL
);


ALTER TABLE public.messages OWNER TO postgres;

--
-- Name: reactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reactions (
    id uuid DEFAULT public.generate_ulid() NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    fid bigint NOT NULL,
    target_cast_fid bigint,
    type smallint NOT NULL,
    hash bytea NOT NULL,
    target_cast_hash bytea,
    target_url text
);


ALTER TABLE public.reactions OWNER TO postgres;

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schema_migrations (
    version bigint NOT NULL,
    inserted_at timestamp(0) without time zone
);


ALTER TABLE public.schema_migrations OWNER TO postgres;

--
-- Name: signers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.signers (
    id uuid DEFAULT public.generate_ulid() NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    added_at timestamp with time zone NOT NULL,
    removed_at timestamp with time zone,
    fid bigint NOT NULL,
    requester_fid bigint NOT NULL,
    add_chain_event_id uuid NOT NULL,
    remove_chain_event_id uuid,
    key_type smallint NOT NULL,
    metadata_type smallint NOT NULL,
    key bytea NOT NULL,
    metadata json NOT NULL
);


ALTER TABLE public.signers OWNER TO postgres;

--
-- Name: storage_allocations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.storage_allocations (
    id uuid DEFAULT public.generate_ulid() NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    rented_at timestamp with time zone NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    chain_event_id uuid NOT NULL,
    fid bigint NOT NULL,
    units smallint NOT NULL,
    payer bytea NOT NULL
);


ALTER TABLE public.storage_allocations OWNER TO postgres;

--
-- Name: user_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_data (
    id uuid DEFAULT public.generate_ulid() NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    fid bigint NOT NULL,
    type smallint NOT NULL,
    hash bytea NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.user_data OWNER TO postgres;

--
-- Name: username_proofs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.username_proofs (
    id uuid DEFAULT public.generate_ulid() NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    fid bigint NOT NULL,
    type smallint NOT NULL,
    username text NOT NULL,
    signature bytea NOT NULL,
    owner bytea NOT NULL
);


ALTER TABLE public.username_proofs OWNER TO postgres;

--
-- Name: verifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.verifications (
    id uuid DEFAULT public.generate_ulid() NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    deleted_at timestamp with time zone,
    fid bigint NOT NULL,
    hash bytea NOT NULL,
    signer_address bytea NOT NULL,
    block_hash bytea NOT NULL,
    signature bytea NOT NULL
);


ALTER TABLE public.verifications OWNER TO postgres;

--
-- Name: casts casts_hash_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.casts
    ADD CONSTRAINT casts_hash_unique UNIQUE (hash);


--
-- Name: casts casts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.casts
    ADD CONSTRAINT casts_pkey PRIMARY KEY (id);


--
-- Name: chain_events chain_events_block_number_log_index_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chain_events
    ADD CONSTRAINT chain_events_block_number_log_index_unique UNIQUE (block_number, log_index);


--
-- Name: chain_events chain_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chain_events
    ADD CONSTRAINT chain_events_pkey PRIMARY KEY (id);


--
-- Name: fids fids_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fids
    ADD CONSTRAINT fids_pkey PRIMARY KEY (fid);


--
-- Name: fnames fnames_fid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fnames
    ADD CONSTRAINT fnames_fid_unique UNIQUE (fid);


--
-- Name: fnames fnames_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fnames
    ADD CONSTRAINT fnames_pkey PRIMARY KEY (id);


--
-- Name: fnames fnames_username_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fnames
    ADD CONSTRAINT fnames_username_unique UNIQUE (username);


--
-- Name: kysely_migration_lock kysely_migration_lock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kysely_migration_lock
    ADD CONSTRAINT kysely_migration_lock_pkey PRIMARY KEY (id);


--
-- Name: kysely_migration kysely_migration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kysely_migration
    ADD CONSTRAINT kysely_migration_pkey PRIMARY KEY (name);


--
-- Name: links links_hash_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_hash_unique UNIQUE (hash);


--
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: messages messages_hash_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_hash_unique UNIQUE (hash);


--
-- Name: messages messages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_pkey PRIMARY KEY (id);


--
-- Name: reactions reactions_fid_type_target_cast_hash_target_url_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reactions
    ADD CONSTRAINT reactions_fid_type_target_cast_hash_target_url_unique UNIQUE NULLS NOT DISTINCT (fid, type, target_cast_hash, target_url);


--
-- Name: reactions reactions_hash_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reactions
    ADD CONSTRAINT reactions_hash_unique UNIQUE (hash);


--
-- Name: reactions reactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reactions
    ADD CONSTRAINT reactions_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: signers signers_fid_key_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.signers
    ADD CONSTRAINT signers_fid_key_unique UNIQUE (fid, key);


--
-- Name: signers signers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.signers
    ADD CONSTRAINT signers_pkey PRIMARY KEY (id);


--
-- Name: storage_allocations storage_allocations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage_allocations
    ADD CONSTRAINT storage_allocations_pkey PRIMARY KEY (id);


--
-- Name: storage_allocations storage_chain_event_id_fid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage_allocations
    ADD CONSTRAINT storage_chain_event_id_fid_unique UNIQUE (chain_event_id, fid);


--
-- Name: user_data user_data_fid_type_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_data
    ADD CONSTRAINT user_data_fid_type_unique UNIQUE (fid, type);


--
-- Name: user_data user_data_hash_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_data
    ADD CONSTRAINT user_data_hash_unique UNIQUE (hash);


--
-- Name: user_data user_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_data
    ADD CONSTRAINT user_data_pkey PRIMARY KEY (id);


--
-- Name: username_proofs username_proofs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.username_proofs
    ADD CONSTRAINT username_proofs_pkey PRIMARY KEY (id);


--
-- Name: username_proofs username_proofs_username_timestamp_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.username_proofs
    ADD CONSTRAINT username_proofs_username_timestamp_unique UNIQUE (username, "timestamp");


--
-- Name: verifications verifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verifications
    ADD CONSTRAINT verifications_pkey PRIMARY KEY (id);


--
-- Name: verifications verifications_signer_address_fid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verifications
    ADD CONSTRAINT verifications_signer_address_fid_unique UNIQUE (signer_address, fid);


--
-- Name: casts_active_fid_timestamp_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX casts_active_fid_timestamp_index ON public.casts USING btree (fid, "timestamp") WHERE (deleted_at IS NULL);


--
-- Name: casts_parent_hash_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX casts_parent_hash_index ON public.casts USING btree (parent_hash) WHERE (parent_hash IS NOT NULL);


--
-- Name: casts_parent_url_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX casts_parent_url_index ON public.casts USING btree (parent_url) WHERE (parent_url IS NOT NULL);


--
-- Name: casts_root_parent_hash_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX casts_root_parent_hash_index ON public.casts USING btree (root_parent_hash) WHERE (root_parent_hash IS NOT NULL);


--
-- Name: casts_root_parent_url_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX casts_root_parent_url_index ON public.casts USING btree (root_parent_url) WHERE (root_parent_url IS NOT NULL);


--
-- Name: casts_timestamp_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX casts_timestamp_index ON public.casts USING btree ("timestamp");


--
-- Name: chain_events_block_hash_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chain_events_block_hash_index ON public.chain_events USING hash (block_hash);


--
-- Name: chain_events_block_timestamp_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chain_events_block_timestamp_index ON public.chain_events USING btree (block_timestamp);


--
-- Name: chain_events_fid_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chain_events_fid_index ON public.chain_events USING btree (fid);


--
-- Name: chain_events_transaction_hash_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX chain_events_transaction_hash_index ON public.chain_events USING hash (transaction_hash);


--
-- Name: links_fid_target_fid_type_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX links_fid_target_fid_type_unique ON public.links USING btree (fid, target_fid, type) NULLS NOT DISTINCT;


--
-- Name: messages_fid_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX messages_fid_index ON public.messages USING btree (fid);


--
-- Name: messages_signer_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX messages_signer_index ON public.messages USING btree (signer);


--
-- Name: messages_timestamp_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX messages_timestamp_index ON public.messages USING btree ("timestamp");


--
-- Name: reactions_active_fid_timestamp_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reactions_active_fid_timestamp_index ON public.reactions USING btree (fid, "timestamp") WHERE (deleted_at IS NULL);


--
-- Name: reactions_target_cast_hash_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reactions_target_cast_hash_index ON public.reactions USING btree (target_cast_hash) WHERE (target_cast_hash IS NOT NULL);


--
-- Name: reactions_target_url_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reactions_target_url_index ON public.reactions USING btree (target_url) WHERE (target_url IS NOT NULL);


--
-- Name: signers_fid_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX signers_fid_index ON public.signers USING btree (fid);


--
-- Name: signers_requester_fid_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX signers_requester_fid_index ON public.signers USING btree (requester_fid);


--
-- Name: storage_allocations_fid_expires_at_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX storage_allocations_fid_expires_at_index ON public.storage_allocations USING btree (fid, expires_at);


--
-- Name: verifications_fid_timestamp_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX verifications_fid_timestamp_index ON public.verifications USING btree (fid, "timestamp");


--
-- Name: casts casts_fid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.casts
    ADD CONSTRAINT casts_fid_foreign FOREIGN KEY (fid) REFERENCES public.fids(fid) ON DELETE CASCADE;


--
-- Name: casts casts_hash_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.casts
    ADD CONSTRAINT casts_hash_foreign FOREIGN KEY (hash) REFERENCES public.messages(hash) ON DELETE CASCADE;


--
-- Name: fids fids_chain_event_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fids
    ADD CONSTRAINT fids_chain_event_id_foreign FOREIGN KEY (chain_event_id) REFERENCES public.chain_events(id) ON DELETE CASCADE;


--
-- Name: storage_allocations fids_chain_event_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.storage_allocations
    ADD CONSTRAINT fids_chain_event_id_foreign FOREIGN KEY (chain_event_id) REFERENCES public.chain_events(id) ON DELETE CASCADE;


--
-- Name: fnames fnames_fid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fnames
    ADD CONSTRAINT fnames_fid_foreign FOREIGN KEY (fid) REFERENCES public.fids(fid) ON DELETE CASCADE;


--
-- Name: links links_fid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_fid_foreign FOREIGN KEY (fid) REFERENCES public.fids(fid) ON DELETE CASCADE;


--
-- Name: links links_target_fid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_target_fid_foreign FOREIGN KEY (target_fid) REFERENCES public.fids(fid) ON DELETE CASCADE;


--
-- Name: messages messages_fid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_fid_foreign FOREIGN KEY (fid) REFERENCES public.fids(fid) ON DELETE CASCADE;


--
-- Name: messages messages_signer_fid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT messages_signer_fid_foreign FOREIGN KEY (fid, signer) REFERENCES public.signers(fid, key) ON DELETE CASCADE;


--
-- Name: reactions reactions_fid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reactions
    ADD CONSTRAINT reactions_fid_foreign FOREIGN KEY (fid) REFERENCES public.fids(fid) ON DELETE CASCADE;


--
-- Name: reactions reactions_hash_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reactions
    ADD CONSTRAINT reactions_hash_foreign FOREIGN KEY (hash) REFERENCES public.messages(hash) ON DELETE CASCADE;


--
-- Name: reactions reactions_target_hash_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reactions
    ADD CONSTRAINT reactions_target_hash_foreign FOREIGN KEY (target_cast_hash) REFERENCES public.casts(hash) ON DELETE CASCADE;


--
-- Name: signers signers_add_chain_event_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.signers
    ADD CONSTRAINT signers_add_chain_event_id_foreign FOREIGN KEY (add_chain_event_id) REFERENCES public.chain_events(id) ON DELETE CASCADE;


--
-- Name: signers signers_fid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.signers
    ADD CONSTRAINT signers_fid_foreign FOREIGN KEY (fid) REFERENCES public.fids(fid) ON DELETE CASCADE;


--
-- Name: signers signers_remove_chain_event_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.signers
    ADD CONSTRAINT signers_remove_chain_event_id_foreign FOREIGN KEY (remove_chain_event_id) REFERENCES public.chain_events(id) ON DELETE CASCADE;


--
-- Name: signers signers_requester_fid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.signers
    ADD CONSTRAINT signers_requester_fid_foreign FOREIGN KEY (requester_fid) REFERENCES public.fids(fid) ON DELETE CASCADE;


--
-- Name: user_data user_data_fid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_data
    ADD CONSTRAINT user_data_fid_foreign FOREIGN KEY (fid) REFERENCES public.fids(fid) ON DELETE CASCADE;


--
-- Name: user_data user_data_hash_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_data
    ADD CONSTRAINT user_data_hash_foreign FOREIGN KEY (hash) REFERENCES public.messages(hash) ON DELETE CASCADE;


--
-- Name: username_proofs username_proofs_fid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.username_proofs
    ADD CONSTRAINT username_proofs_fid_foreign FOREIGN KEY (fid) REFERENCES public.fids(fid) ON DELETE CASCADE;


--
-- Name: verifications verifications_fid_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verifications
    ADD CONSTRAINT verifications_fid_foreign FOREIGN KEY (fid) REFERENCES public.fids(fid) ON DELETE CASCADE;


--
-- Name: verifications verifications_hash_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.verifications
    ADD CONSTRAINT verifications_hash_foreign FOREIGN KEY (hash) REFERENCES public.messages(hash) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

