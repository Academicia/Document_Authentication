--
-- PostgreSQL database dump
--

\restrict UeToMAnKAH8XM28UJrsKSU5Bxg8LGnTkJFciPVJ0dH7t9R2yhygdCQ8aazdcrnL

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

DROP INDEX IF EXISTS public.ix_users_username;
DROP INDEX IF EXISTS public.ix_users_id;
DROP INDEX IF EXISTS public.ix_documents_verification_id;
DROP INDEX IF EXISTS public.ix_documents_id;
DROP INDEX IF EXISTS public.ix_document_types_id;
DROP INDEX IF EXISTS public.ix_audit_logs_id;
DROP INDEX IF EXISTS public.ix_approvals_id;
DROP INDEX IF EXISTS public.ix_approval_workflows_id;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_pkey;
ALTER TABLE IF EXISTS ONLY public.documents DROP CONSTRAINT IF EXISTS documents_pkey;
ALTER TABLE IF EXISTS ONLY public.document_types DROP CONSTRAINT IF EXISTS document_types_pkey;
ALTER TABLE IF EXISTS ONLY public.document_types DROP CONSTRAINT IF EXISTS document_types_name_key;
ALTER TABLE IF EXISTS ONLY public.audit_logs DROP CONSTRAINT IF EXISTS audit_logs_pkey;
ALTER TABLE IF EXISTS ONLY public.approvals DROP CONSTRAINT IF EXISTS approvals_pkey;
ALTER TABLE IF EXISTS ONLY public.approval_workflows DROP CONSTRAINT IF EXISTS approval_workflows_pkey;
DROP TABLE IF EXISTS public.users;
DROP TABLE IF EXISTS public.documents;
DROP TABLE IF EXISTS public.document_types;
DROP TABLE IF EXISTS public.audit_logs;
DROP TABLE IF EXISTS public.approvals;
DROP TABLE IF EXISTS public.approval_workflows;
DROP TABLE IF EXISTS public."Demo_Request";
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Demo_Request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Demo_Request" (
    "Name" character(25)[] NOT NULL,
    "Institute_Name" character(75)[] NOT NULL,
    "Email" character(75)[] NOT NULL,
    "Phone_No" character(10) NOT NULL
);


ALTER TABLE public."Demo_Request" OWNER TO postgres;

--
-- Name: approval_workflows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.approval_workflows (
    id character varying NOT NULL,
    document_type_id character varying,
    step_order integer,
    signer_role character varying,
    created_at timestamp without time zone
);


ALTER TABLE public.approval_workflows OWNER TO postgres;

--
-- Name: approvals; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.approvals (
    id character varying NOT NULL,
    document_id character varying,
    approver_id character varying,
    step_order integer,
    status character varying,
    comment text,
    created_at timestamp without time zone
);


ALTER TABLE public.approvals OWNER TO postgres;

--
-- Name: audit_logs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audit_logs (
    id character varying NOT NULL,
    document_id character varying,
    action character varying,
    performed_by character varying,
    "timestamp" timestamp without time zone
);


ALTER TABLE public.audit_logs OWNER TO postgres;

--
-- Name: document_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.document_types (
    id character varying NOT NULL,
    name character varying,
    description text,
    created_at timestamp without time zone
);


ALTER TABLE public.document_types OWNER TO postgres;

--
-- Name: documents; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents (
    id character varying NOT NULL,
    file_path character varying,
    uploaded_by character varying,
    signer_id character varying,
    document_type_id character varying,
    signature_path character varying,
    signed_pdf_path character varying,
    status character varying,
    rejection_reason text,
    current_step integer,
    created_at timestamp without time zone,
    document_name character varying,
    verification_id character varying
);


ALTER TABLE public.documents OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id character varying NOT NULL,
    username character varying,
    hashed_password character varying,
    role character varying,
    email character varying,
    full_name character varying,
    department character varying,
    created_at timestamp without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: Demo_Request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Demo_Request" ("Name", "Institute_Name", "Email", "Phone_No") FROM stdin;
\.


--
-- Data for Name: approval_workflows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.approval_workflows (id, document_type_id, step_order, signer_role, created_at) FROM stdin;
\.


--
-- Data for Name: approvals; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.approvals (id, document_id, approver_id, step_order, status, comment, created_at) FROM stdin;
\.


--
-- Data for Name: audit_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audit_logs (id, document_id, action, performed_by, "timestamp") FROM stdin;
b287d97d-f2d1-47e6-8f77-f77e89e81247	210387c0-219e-4848-8e5e-a63765d45d70	UPLOAD	5274	2026-06-16 06:56:53.163662
77fb1c23-e66f-49a9-9e0e-a491fac43257	210387c0-219e-4848-8e5e-a63765d45d70	SIGN	5274	2026-06-16 06:57:03.68013
273f4a89-102d-42d9-b04f-367b02726413	ba05aa4c-1890-4c98-8ad7-c923173f22bb	UPLOAD	123	2026-06-16 07:01:07.055205
23fe021e-8e23-4109-9bd7-8ae9aa69ab99	ba05aa4c-1890-4c98-8ad7-c923173f22bb	SIGN	5274	2026-06-16 07:01:49.123017
7902a459-8a7d-4904-8945-15039fef68d8	ee6fd816-5052-4ba9-881c-ee70a41dfba8	UPLOAD	123	2026-06-16 08:57:39.9032
e7506f64-f577-474a-9361-4fd5826b006d	ee6fd816-5052-4ba9-881c-ee70a41dfba8	SIGN	5274	2026-06-16 08:58:04.934981
fc3aa6d0-5242-405d-b37c-94315e94e098	0ead2062-a35b-45c8-952a-c80937511607	UPLOAD	123	2026-06-16 09:11:08.597351
fbfef36b-e64b-470f-abd3-b4959f128302	0ead2062-a35b-45c8-952a-c80937511607	SIGN	5225	2026-06-16 09:11:28.240401
50c64171-67cc-4b97-9096-b86989c1dc62	3951a83e-582e-4914-8b3d-0aa89eff103c	UPLOAD	5225	2026-06-16 09:15:04.807762
a5c09cb1-369b-4b13-8728-7bc7a3c68fb7	3951a83e-582e-4914-8b3d-0aa89eff103c	SIGN	5225	2026-06-16 09:15:24.845511
3d7e2e62-fe1b-4a62-ba2e-2c8c1ed028db	d68115c6-092c-4976-b792-b4872985c1d1	UPLOAD	5225	2026-06-16 09:25:51.335568
49819f69-b639-44be-b004-bb015493a539	d68115c6-092c-4976-b792-b4872985c1d1	SIGN	5225	2026-06-16 09:25:58.09101
379765e7-ff97-4d51-a605-2709da21fa5a	f96d48df-3b82-4912-b537-96cf8f943f7c	UPLOAD	5225	2026-06-16 09:26:47.565033
4aa9dfb2-671e-4c4e-b7de-6eb7e67e9b46	f96d48df-3b82-4912-b537-96cf8f943f7c	SIGN	5225	2026-06-16 09:27:48.829332
35732846-8470-4e4c-a4a0-779eb7595910	fa94c9a1-6159-4f63-b6dc-ece03b1e7c6f	UPLOAD	123	2026-06-16 09:43:53.413875
e7ba18d1-a925-488b-b92d-9806d707a007	fa94c9a1-6159-4f63-b6dc-ece03b1e7c6f	SIGN	5274	2026-06-16 09:44:20.897852
23015881-31ad-4949-b0ce-718abbc8d36f	6f230a6a-43a1-4698-9cae-7f18cf58ed8d	UPLOAD	5274	2026-06-16 09:49:08.468058
8e008265-13ff-46ad-8e38-cbe30027e5ca	6f230a6a-43a1-4698-9cae-7f18cf58ed8d	SIGN	5274	2026-06-16 09:49:29.390283
7868b6ec-5bed-43a3-aa1a-e64eaf8669b8	d6f56956-fdaf-4ace-9aac-5015a559d48e	UPLOAD	5274	2026-06-16 09:52:03.160531
7ccf2b9b-230f-4d2a-be24-66c858074477	d6f56956-fdaf-4ace-9aac-5015a559d48e	SIGN	5274	2026-06-16 09:52:15.670394
\.


--
-- Data for Name: document_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.document_types (id, name, description, created_at) FROM stdin;
\.


--
-- Data for Name: documents; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documents (id, file_path, uploaded_by, signer_id, document_type_id, signature_path, signed_pdf_path, status, rejection_reason, current_step, created_at, document_name, verification_id) FROM stdin;
f96d48df-3b82-4912-b537-96cf8f943f7c	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\documents/f96d48df-3b82-4912-b537-96cf8f943f7c.pdf	cc7561d7-abf2-41c5-8713-dd44127c6081	cc7561d7-abf2-41c5-8713-dd44127c6081	\N	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\output\\f96d48df-3b82-4912-b537-96cf8f943f7c_signature.bin	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\output\\f96d48df-3b82-4912-b537-96cf8f943f7c_signed.pdf	SIGNED	\N	0	2026-06-16 09:26:47.562035	32f80a43-c464-4c0c-930c-f35e4acc90a5.pdf	359525e8-223f-4c84-945e-a57eaac54fb9
210387c0-219e-4848-8e5e-a63765d45d70	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\documents/210387c0-219e-4848-8e5e-a63765d45d70.pdf	e56280f0-b4cf-47cb-98fd-bc5ff2f2bf62	e56280f0-b4cf-47cb-98fd-bc5ff2f2bf62	\N	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\output\\210387c0-219e-4848-8e5e-a63765d45d70_signature.bin	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\output\\210387c0-219e-4848-8e5e-a63765d45d70_signed.pdf	SIGNED	\N	0	2026-06-16 06:56:53.155663	\N	\N
ba05aa4c-1890-4c98-8ad7-c923173f22bb	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\documents/ba05aa4c-1890-4c98-8ad7-c923173f22bb.pdf	bb3a618e-ba96-4683-94d3-798e9e721f36	e56280f0-b4cf-47cb-98fd-bc5ff2f2bf62	\N	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\output\\ba05aa4c-1890-4c98-8ad7-c923173f22bb_signature.bin	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\output\\ba05aa4c-1890-4c98-8ad7-c923173f22bb_signed.pdf	SIGNED	\N	0	2026-06-16 07:01:07.049746	\N	\N
ee6fd816-5052-4ba9-881c-ee70a41dfba8	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\documents/ee6fd816-5052-4ba9-881c-ee70a41dfba8.pdf	bb3a618e-ba96-4683-94d3-798e9e721f36	e56280f0-b4cf-47cb-98fd-bc5ff2f2bf62	\N	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\output\\ee6fd816-5052-4ba9-881c-ee70a41dfba8_signature.bin	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\output\\ee6fd816-5052-4ba9-881c-ee70a41dfba8_signed.pdf	SIGNED	\N	0	2026-06-16 08:57:39.898176	\N	\N
0ead2062-a35b-45c8-952a-c80937511607	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\documents/0ead2062-a35b-45c8-952a-c80937511607.pdf	bb3a618e-ba96-4683-94d3-798e9e721f36	cc7561d7-abf2-41c5-8713-dd44127c6081	\N	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\output\\0ead2062-a35b-45c8-952a-c80937511607_signature.bin	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\output\\0ead2062-a35b-45c8-952a-c80937511607_signed.pdf	SIGNED	\N	0	2026-06-16 09:11:08.59008	32f1022e-e670-4bb4-8603-fc2f53f3b59c.pdf	c30ca670-e3df-461c-99d8-7ed41da0e30c
3951a83e-582e-4914-8b3d-0aa89eff103c	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\documents/3951a83e-582e-4914-8b3d-0aa89eff103c.pdf	cc7561d7-abf2-41c5-8713-dd44127c6081	cc7561d7-abf2-41c5-8713-dd44127c6081	\N	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\output\\3951a83e-582e-4914-8b3d-0aa89eff103c_signature.bin	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\output\\3951a83e-582e-4914-8b3d-0aa89eff103c_signed.pdf	SIGNED	\N	0	2026-06-16 09:15:04.803296	648a29fc-43b5-4e50-9d7c-88588f933f96.pdf	af5cce00-dd28-47c8-8e8a-bb75af1a87d4
d68115c6-092c-4976-b792-b4872985c1d1	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\documents/d68115c6-092c-4976-b792-b4872985c1d1.pdf	cc7561d7-abf2-41c5-8713-dd44127c6081	cc7561d7-abf2-41c5-8713-dd44127c6081	\N	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\output\\d68115c6-092c-4976-b792-b4872985c1d1_signature.bin	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\output\\d68115c6-092c-4976-b792-b4872985c1d1_signed.pdf	SIGNED	\N	0	2026-06-16 09:25:51.317335	7d983f6b-7c3e-4d42-a5e8-bc641808c949.pdf	59f3b13e-8d38-47e3-bc20-fb59b6270b5b
fa94c9a1-6159-4f63-b6dc-ece03b1e7c6f	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\documents/fa94c9a1-6159-4f63-b6dc-ece03b1e7c6f.pdf	bb3a618e-ba96-4683-94d3-798e9e721f36	e56280f0-b4cf-47cb-98fd-bc5ff2f2bf62	\N	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\output\\fa94c9a1-6159-4f63-b6dc-ece03b1e7c6f_signature.bin	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\output\\fa94c9a1-6159-4f63-b6dc-ece03b1e7c6f_signed.pdf	SIGNED	\N	0	2026-06-16 09:43:53.408355	7d56d0d0-e908-44ec-ae17-9f8927a43848.pdf	f3b653ec-cb39-4b36-a9c8-99801ce098b1
6f230a6a-43a1-4698-9cae-7f18cf58ed8d	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\documents/6f230a6a-43a1-4698-9cae-7f18cf58ed8d.pdf	e56280f0-b4cf-47cb-98fd-bc5ff2f2bf62	e56280f0-b4cf-47cb-98fd-bc5ff2f2bf62	\N	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\output\\6f230a6a-43a1-4698-9cae-7f18cf58ed8d_signature.bin	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\output\\6f230a6a-43a1-4698-9cae-7f18cf58ed8d_signed.pdf	SIGNED	\N	0	2026-06-16 09:49:08.462343	7d56d0d0-e908-44ec-ae17-9f8927a43848.pdf	2adfe7df-a297-4bea-9e5a-5d77dca85d3f
d6f56956-fdaf-4ace-9aac-5015a559d48e	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\documents/d6f56956-fdaf-4ace-9aac-5015a559d48e.pdf	e56280f0-b4cf-47cb-98fd-bc5ff2f2bf62	e56280f0-b4cf-47cb-98fd-bc5ff2f2bf62	\N	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\output\\d6f56956-fdaf-4ace-9aac-5015a559d48e_signature.bin	D:\\Project\\academicia-document-auth-main\\academicia-document-auth-main\\backend\\output\\d6f56956-fdaf-4ace-9aac-5015a559d48e_signed.pdf	SIGNED	\N	0	2026-06-16 09:52:03.157012	8b56ecb9-2d0d-4aca-92a3-11456bc16170.pdf	9c6f9af1-ca9c-498a-967c-7b0e11c69dde
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, hashed_password, role, email, full_name, department, created_at) FROM stdin;
34e5d2b8-fa75-4e77-b689-33d1fdac4be5	admin	$2b$12$lLh9wXA00WfFd3PN33naK.5Rterkjv0PvZMVgZjuuZLqmnRIXw0iS	admin	admin@academia.com	System Admin	Administration	2026-06-11 20:03:08.356628
1a439b74-ae54-4595-abce-80157e51c25f	0801CA251038	$2b$12$3y6oin.QoXdJfOAgizNI0umJLpX5ijW0YJkUnGMI4q.wmIROMgXza	student	aharwar007@gmail.com	Chanchlesh Aharwar	CTA	2026-06-11 20:42:06.548416
cc7561d7-abf2-41c5-8713-dd44127c6081	5225	$2b$12$eyVpLaOWxSm6n/tTOJv4ROcxHhEJKWlFL7UlGhSoDCpBDqW3y1bHy	SIGNER	deepesh @gmail.com	deepesh agrawal	Assistant Professor	2026-06-16 06:52:00.792916
e56280f0-b4cf-47cb-98fd-bc5ff2f2bf62	5274	$2b$12$stEMhCLx4k27ISlEBOj4Lui6ubgzuXUAn5nzac82pQs/Sr3s98qQS	SIGNER	khushi@gmail.com	Khushi Solanki	Assistant Professor	2026-06-16 06:53:17.475327
bb3a618e-ba96-4683-94d3-798e9e721f36	123	$2b$12$XO7motgk2pOK1quGmQ1Oj.6S/vCBdd5ZDsFKX3XQ/RwOYg27jOYsG	student	chanchu@gmsail.com	chanchu	CTA	2026-06-16 07:00:46.363623
\.


--
-- Name: approval_workflows approval_workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.approval_workflows
    ADD CONSTRAINT approval_workflows_pkey PRIMARY KEY (id);


--
-- Name: approvals approvals_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.approvals
    ADD CONSTRAINT approvals_pkey PRIMARY KEY (id);


--
-- Name: audit_logs audit_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_logs
    ADD CONSTRAINT audit_logs_pkey PRIMARY KEY (id);


--
-- Name: document_types document_types_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document_types
    ADD CONSTRAINT document_types_name_key UNIQUE (name);


--
-- Name: document_types document_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.document_types
    ADD CONSTRAINT document_types_pkey PRIMARY KEY (id);


--
-- Name: documents documents_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents
    ADD CONSTRAINT documents_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: ix_approval_workflows_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_approval_workflows_id ON public.approval_workflows USING btree (id);


--
-- Name: ix_approvals_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_approvals_id ON public.approvals USING btree (id);


--
-- Name: ix_audit_logs_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_audit_logs_id ON public.audit_logs USING btree (id);


--
-- Name: ix_document_types_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_document_types_id ON public.document_types USING btree (id);


--
-- Name: ix_documents_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_documents_id ON public.documents USING btree (id);


--
-- Name: ix_documents_verification_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_documents_verification_id ON public.documents USING btree (verification_id);


--
-- Name: ix_users_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_users_id ON public.users USING btree (id);


--
-- Name: ix_users_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_users_username ON public.users USING btree (username);


--
-- PostgreSQL database dump complete
--

\unrestrict UeToMAnKAH8XM28UJrsKSU5Bxg8LGnTkJFciPVJ0dH7t9R2yhygdCQ8aazdcrnL

