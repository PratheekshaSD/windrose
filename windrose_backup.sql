--
-- PostgreSQL database dump
--

\restrict A5gio14LPrNXSDdIiHE0ksc94h3mi2pk3WGCEjYt7p2fIwMhYoc8K5EFAtTyaWC

-- Dumped from database version 16.14 (Debian 16.14-1.pgdg13+1)
-- Dumped by pg_dump version 16.14 (Debian 16.14-1.pgdg13+1)

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
-- Name: agent_decisions; Type: TABLE; Schema: public; Owner: windrose
--

CREATE TABLE public.agent_decisions (
    id integer NOT NULL,
    city text NOT NULL,
    error_message text,
    action text,
    reasoning text,
    source text,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.agent_decisions OWNER TO windrose;

--
-- Name: agent_decisions_id_seq; Type: SEQUENCE; Schema: public; Owner: windrose
--

CREATE SEQUENCE public.agent_decisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.agent_decisions_id_seq OWNER TO windrose;

--
-- Name: agent_decisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: windrose
--

ALTER SEQUENCE public.agent_decisions_id_seq OWNED BY public.agent_decisions.id;


--
-- Name: weather_aqi; Type: TABLE; Schema: public; Owner: windrose
--

CREATE TABLE public.weather_aqi (
    city text NOT NULL,
    temperature double precision,
    humidity double precision,
    wind_speed double precision,
    aqi_available boolean,
    pm25 double precision,
    pm10 double precision,
    co double precision,
    no2 double precision,
    o3 double precision,
    so2 double precision,
    fetched_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.weather_aqi OWNER TO windrose;

--
-- Name: agent_decisions id; Type: DEFAULT; Schema: public; Owner: windrose
--

ALTER TABLE ONLY public.agent_decisions ALTER COLUMN id SET DEFAULT nextval('public.agent_decisions_id_seq'::regclass);


--
-- Data for Name: agent_decisions; Type: TABLE DATA; Schema: public; Owner: windrose
--

COPY public.agent_decisions (id, city, error_message, action, reasoning, source, created_at) FROM stdin;
1	TestBrokenCity	Bruh give valid values!!	skip	The error indicates invalid input values, so retrying the same data will not succeed.	llm	2026-08-23 18:07:38.538797
2	TestBrokenCity	Bruh give valid values!!	skip	Validation failed due to invalid input values; retrying with the same data will not succeed.	llm	2026-08-24 09:09:41.015319
3	TestBrokenCity	Bruh give valid values!!	skip	The error indicates invalid input data, which will not succeed on retry.	llm	2026-09-01 14:40:40.294186
4	TestBrokenCity	Bruh give valid values!!	alert	The error message is informal and unclear about which specific values are invalid, requiring human investigation.	llm	2026-09-01 14:41:31.590749
5	TestBrokenCity	Bruh give valid values!!	skip	The error indicates invalid input data was provided, which is a deterministic failure that will not succeed upon retrying.	llm	2026-09-01 17:05:49.17613
6	TestBrokenCity	Bruh give valid values!!	skip	Validation error indicates invalid input data, which will not succeed upon retrying.	llm	2026-09-02 11:52:05.868001
7	TestBrokenCity	Bruh give valid values!!	alert	LLM call failed or response unparseable: 429 You exceeded your current quota, please check your plan and billing details. For more information on this error, head to: https://ai.google.dev/gemini-api/docs/rate-limits. To monitor your current usage, head to: https://ai.dev/rate-limit. \n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_requests, limit: 20, model: gemini-3.6-flash\nPlease retry in 22.323598157s. [links {\n  description: "Learn more about Gemini API quotas"\n  url: "https://ai.google.dev/gemini-api/docs/rate-limits"\n}\n, violations {\n  quota_metric: "generativelanguage.googleapis.com/generate_content_free_tier_requests"\n  quota_id: "GenerateRequestsPerDayPerProjectPerModel-FreeTier"\n  quota_dimensions {\n    key: "model"\n    value: "gemini-3.6-flash"\n  }\n  quota_dimensions {\n    key: "location"\n    value: "global"\n  }\n  quota_value: 20\n}\n, retry_delay {\n  seconds: 22\n}\n]	llm	2026-09-02 11:59:37.433703
8	TestBrokenCity	Bruh give valid values!!	alert	LLM call failed or response unparseable: 429 You exceeded your current quota, please check your plan and billing details. For more information on this error, head to: https://ai.google.dev/gemini-api/docs/rate-limits. To monitor your current usage, head to: https://ai.dev/rate-limit. \n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_requests, limit: 20, model: gemini-3.6-flash\nPlease retry in 8.366806376s. [links {\n  description: "Learn more about Gemini API quotas"\n  url: "https://ai.google.dev/gemini-api/docs/rate-limits"\n}\n, violations {\n  quota_metric: "generativelanguage.googleapis.com/generate_content_free_tier_requests"\n  quota_id: "GenerateRequestsPerDayPerProjectPerModel-FreeTier"\n  quota_dimensions {\n    key: "model"\n    value: "gemini-3.6-flash"\n  }\n  quota_dimensions {\n    key: "location"\n    value: "global"\n  }\n  quota_value: 20\n}\n, retry_delay {\n  seconds: 8\n}\n]	llm	2026-09-02 12:12:51.453134
9	TestBrokenCity	Bruh give valid values!!	alert	LLM call failed or response unparseable: 429 You exceeded your current quota, please check your plan and billing details. For more information on this error, head to: https://ai.google.dev/gemini-api/docs/rate-limits. To monitor your current usage, head to: https://ai.dev/rate-limit. \n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_requests, limit: 20, model: gemini-3.6-flash\nPlease retry in 19.260385409s. [links {\n  description: "Learn more about Gemini API quotas"\n  url: "https://ai.google.dev/gemini-api/docs/rate-limits"\n}\n, violations {\n  quota_metric: "generativelanguage.googleapis.com/generate_content_free_tier_requests"\n  quota_id: "GenerateRequestsPerDayPerProjectPerModel-FreeTier"\n  quota_dimensions {\n    key: "model"\n    value: "gemini-3.6-flash"\n  }\n  quota_dimensions {\n    key: "location"\n    value: "global"\n  }\n  quota_value: 20\n}\n, retry_delay {\n  seconds: 19\n}\n]	llm	2026-09-02 12:18:40.565368
10	Guwahati	Failed to fetch for the Guwahati after 3 attempts	alert	LLM call failed or response unparseable: 429 You exceeded your current quota, please check your plan and billing details. For more information on this error, head to: https://ai.google.dev/gemini-api/docs/rate-limits. To monitor your current usage, head to: https://ai.dev/rate-limit. \n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_requests, limit: 20, model: gemini-3.6-flash\nPlease retry in 50.621144251s. [links {\n  description: "Learn more about Gemini API quotas"\n  url: "https://ai.google.dev/gemini-api/docs/rate-limits"\n}\n, violations {\n  quota_metric: "generativelanguage.googleapis.com/generate_content_free_tier_requests"\n  quota_id: "GenerateRequestsPerDayPerProjectPerModel-FreeTier"\n  quota_dimensions {\n    key: "model"\n    value: "gemini-3.6-flash"\n  }\n  quota_dimensions {\n    key: "location"\n    value: "global"\n  }\n  quota_value: 20\n}\n, retry_delay {\n  seconds: 50\n}\n]	llm	2026-09-02 12:25:09.128534
11	TestBrokenCity	Bruh give valid values!!	alert	LLM call failed or response unparseable: 429 You exceeded your current quota, please check your plan and billing details. For more information on this error, head to: https://ai.google.dev/gemini-api/docs/rate-limits. To monitor your current usage, head to: https://ai.dev/rate-limit. \n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_requests, limit: 20, model: gemini-3.6-flash\nPlease retry in 50.417715995s. [links {\n  description: "Learn more about Gemini API quotas"\n  url: "https://ai.google.dev/gemini-api/docs/rate-limits"\n}\n, violations {\n  quota_metric: "generativelanguage.googleapis.com/generate_content_free_tier_requests"\n  quota_id: "GenerateRequestsPerDayPerProjectPerModel-FreeTier"\n  quota_dimensions {\n    key: "model"\n    value: "gemini-3.6-flash"\n  }\n  quota_dimensions {\n    key: "location"\n    value: "global"\n  }\n  quota_value: 20\n}\n, retry_delay {\n  seconds: 50\n}\n]	llm	2026-09-02 12:25:09.341167
12	TestBrokenCity	Bruh give valid values!!	skip	The error indicates invalid input values, meaning this specific record cannot succeed without data corrections and should not be retried.	llm	2026-10-19 04:28:23.645961
13	TestBrokenCity	Bruh give valid values!!	skip	This is a data validation error indicating invalid input values; retrying the same payload will not succeed.	llm	2026-10-19 04:34:19.683979
14	TestBrokenCity	Bruh give valid values!!	skip	The error indicates invalid input values, so retrying with the same data will not succeed.	llm	2026-10-19 05:17:10.95763
\.


--
-- Data for Name: weather_aqi; Type: TABLE DATA; Schema: public; Owner: windrose
--

COPY public.weather_aqi (city, temperature, humidity, wind_speed, aqi_available, pm25, pm10, co, no2, o3, so2, fetched_at) FROM stdin;
Karwar	26.7	86	9.8	t	22	41.8	0.85	22.74	18.92	17.2	2026-07-28 10:40:50.065063
Karwar	27.1	84	9.6	t	22	41.8	0.85	22.74	18.92	17.2	2026-07-28 11:05:20.71651
Bengaluru	28.5	53	23.4	f	\N	\N	\N	\N	\N	\N	2026-07-28 11:05:24.96356
Delhi	33.1	67	0.5	f	\N	\N	\N	\N	\N	\N	2026-07-28 11:05:29.158941
Mumbai	28.4	80	18.6	f	\N	\N	\N	\N	\N	\N	2026-07-28 11:05:34.873576
Chennai	35.3	49	14.9	f	\N	\N	\N	\N	\N	\N	2026-07-28 11:05:39.081891
Karwar	27.1	84	9.6	t	22	41.8	0.85	22.74	18.92	17.2	2026-07-28 11:06:38.494876
Bengaluru	28.5	53	23.4	f	\N	\N	\N	\N	\N	\N	2026-07-28 11:06:41.458646
Delhi	33.1	67	0.5	f	\N	\N	\N	\N	\N	\N	2026-07-28 11:06:43.84163
Mumbai	28.4	80	18.6	f	\N	\N	\N	\N	\N	\N	2026-07-28 11:06:46.447572
Chennai	35.3	49	14.9	f	\N	\N	\N	\N	\N	\N	2026-07-28 11:06:49.149064
Karwar	27.8	88	18.4	t	23	43.7	0.49	24.53	17.43	17.58	2026-07-30 07:25:35.55202
Bengaluru	28.2	55	25.4	f	\N	\N	\N	\N	\N	\N	2026-07-30 07:25:39.278873
Delhi	33.3	64	5.4	f	\N	\N	\N	\N	\N	\N	2026-07-30 07:25:43.263677
Mumbai	27.7	85	16.1	f	\N	\N	\N	\N	\N	\N	2026-07-30 07:25:47.411813
Chennai	36.3	41	19.4	f	\N	\N	\N	\N	\N	\N	2026-07-30 07:25:51.364744
Karwar	25.2	97	15.7	t	14	28.9	0	33.93	17.32	10.94	2026-07-31 09:56:41.331311
Bengaluru	29.6	51	23.3	f	\N	\N	\N	\N	\N	\N	2026-07-31 09:56:47.119001
Delhi	32.9	68	9.6	f	\N	\N	\N	\N	\N	\N	2026-07-31 09:56:56.404481
Mumbai	27.8	83	24.3	f	\N	\N	\N	\N	\N	\N	2026-07-31 09:57:03.676614
Chennai	33.7	56	15.3	f	\N	\N	\N	\N	\N	\N	2026-07-31 09:57:11.106537
Karwar	23.9	99	5.3	t	36	68.4	0.67	20.63	17.76	20.76	2026-08-08 18:30:33.018338
Karwar	23.9	99	5.3	t	36	68.4	0.67	20.63	17.76	20.76	2026-08-08 18:30:34.097548
Bengaluru	20.5	92	15.4	f	\N	\N	\N	\N	\N	\N	2026-08-08 18:30:36.447749
Bengaluru	20.5	92	15.4	f	\N	\N	\N	\N	\N	\N	2026-08-08 18:30:37.27634
Delhi	27.6	92	5	f	\N	\N	\N	\N	\N	\N	2026-08-08 18:30:39.520536
Delhi	27.6	92	5	f	\N	\N	\N	\N	\N	\N	2026-08-08 18:30:40.137061
Mumbai	26.9	86	12.7	f	\N	\N	\N	\N	\N	\N	2026-08-08 18:30:42.321896
Mumbai	26.9	86	12.7	f	\N	\N	\N	\N	\N	\N	2026-08-08 18:30:43.212066
Chennai	25.6	90	10.2	f	\N	\N	\N	\N	\N	\N	2026-08-08 18:30:45.359916
Chennai	25.6	90	10.2	f	\N	\N	\N	\N	\N	\N	2026-08-08 18:30:45.980084
Karwar	29	74	21.9	t	13	27.05	0	24.18	16.55	12.83	2026-08-23 08:27:28.081932
Bengaluru	27.2	60	18.2	f	\N	\N	\N	\N	\N	\N	2026-08-23 08:27:31.297636
Delhi	32.8	63	5.6	f	\N	\N	\N	\N	\N	\N	2026-08-23 08:27:34.824152
Mumbai	28.9	73	16.4	f	\N	\N	\N	\N	\N	\N	2026-08-23 08:27:37.368039
Chennai	35.1	46	2.7	f	\N	\N	\N	\N	\N	\N	2026-08-23 08:27:40.410545
Karwar	29	74	21.9	t	13	27.05	0	24.18	16.55	12.83	2026-08-23 08:28:13.597875
Bengaluru	27.2	60	18.2	f	\N	\N	\N	\N	\N	\N	2026-08-23 08:28:19.540856
Delhi	32.8	63	5.6	f	\N	\N	\N	\N	\N	\N	2026-08-23 08:28:23.885639
Mumbai	28.9	73	16.4	f	\N	\N	\N	\N	\N	\N	2026-08-23 08:28:26.909059
Chennai	35.1	46	2.7	f	\N	\N	\N	\N	\N	\N	2026-08-23 08:28:29.363177
Karwar	29.2	74	21.4	t	13	27.05	0	24.18	16.55	12.83	2026-08-23 08:32:51.027976
Bengaluru	26.7	62	18.4	f	\N	\N	\N	\N	\N	\N	2026-08-23 08:32:53.681045
Delhi	33	62	5.8	f	\N	\N	\N	\N	\N	\N	2026-08-23 08:32:55.932428
Mumbai	28.9	73	16.4	f	\N	\N	\N	\N	\N	\N	2026-08-23 08:32:58.481276
Chennai	34.9	47	1.5	f	\N	\N	\N	\N	\N	\N	2026-08-23 08:33:02.294904
Karwar	29.2	74	21.4	t	13	27.05	0	24.18	16.55	12.83	2026-08-23 08:34:03.07786
Bengaluru	26.7	62	18.4	f	\N	\N	\N	\N	\N	\N	2026-08-23 08:34:06.34168
Delhi	33	62	5.8	f	\N	\N	\N	\N	\N	\N	2026-08-23 08:34:09.655652
Mumbai	28.9	73	16.4	f	\N	\N	\N	\N	\N	\N	2026-08-23 08:34:12.521173
Chennai	34.9	47	1.5	f	\N	\N	\N	\N	\N	\N	2026-08-23 08:34:15.898088
Karwar	25.6	96	6.2	t	12	25.2	0	13.08	16.55	12.83	2026-08-23 18:07:09.966495
Bengaluru	21.1	90	14.3	f	\N	\N	\N	\N	\N	\N	2026-08-23 18:07:12.586603
Delhi	29.3	88	0.8	f	\N	\N	\N	\N	\N	\N	2026-08-23 18:07:14.843037
Mumbai	26.4	89	8.5	f	\N	\N	\N	\N	\N	\N	2026-08-23 18:07:16.966042
Chennai	25.5	95	14.6	f	\N	\N	\N	\N	\N	\N	2026-08-23 18:07:20.074771
Karwar	27.9	80	15.1	t	8	17.8	0	40.54	16.55	12.83	2026-08-24 09:08:45.890688
Bengaluru	24.7	81	14.5	f	\N	\N	\N	\N	\N	\N	2026-08-24 09:08:49.386791
Delhi	33.6	60	6.6	f	\N	\N	\N	\N	\N	\N	2026-08-24 09:09:00.280648
Mumbai	29.2	75	15.5	f	\N	\N	\N	\N	\N	\N	2026-08-24 09:09:05.023169
Chennai	32.6	60	11	f	\N	\N	\N	\N	\N	\N	2026-08-24 09:09:08.9969
Karwar	25.5	93	5.9	f	\N	\N	\N	\N	\N	\N	2026-09-01 14:40:11.93917
Karwar	25.5	93	5.9	f	\N	\N	\N	\N	\N	\N	2026-09-01 14:40:11.93706
Bengaluru	22.7	85	7.5	f	\N	\N	\N	\N	\N	\N	2026-09-01 14:40:15.299029
Bengaluru	22.7	85	7.5	f	\N	\N	\N	\N	\N	\N	2026-09-01 14:40:15.677626
Delhi	28.3	81	2.1	f	\N	\N	\N	\N	\N	\N	2026-09-01 14:40:19.994603
Delhi	28.3	81	2.1	f	\N	\N	\N	\N	\N	\N	2026-09-01 14:40:20.848067
Mumbai	27.3	81	8.6	f	\N	\N	\N	\N	\N	\N	2026-09-01 14:40:22.893612
Mumbai	27.3	81	8.6	f	\N	\N	\N	\N	\N	\N	2026-09-01 14:40:24.043295
Chennai	30.1	71	10.4	f	\N	\N	\N	\N	\N	\N	2026-09-01 14:40:27.519923
Chennai	30.1	71	10.4	f	\N	\N	\N	\N	\N	\N	2026-09-01 14:40:27.892303
Karwar	25.1	95	1.9	f	\N	\N	\N	\N	\N	\N	2026-09-01 17:04:35.340675
Bengaluru	21.6	87	8.5	f	\N	\N	\N	\N	\N	\N	2026-09-01 17:04:39.316352
Delhi	27.8	90	5.4	f	\N	\N	\N	\N	\N	\N	2026-09-01 17:04:43.209957
Mumbai	27.2	78	7.5	f	\N	\N	\N	\N	\N	\N	2026-09-01 17:04:46.604909
Chennai	29.5	77	10.3	f	\N	\N	\N	\N	\N	\N	2026-09-01 17:04:50.302654
Hyderabad	25.3	79	5.4	f	\N	\N	\N	\N	\N	\N	2026-09-01 17:04:53.561402
Pune	23.3	87	11.4	f	\N	\N	\N	\N	\N	\N	2026-09-01 17:04:57.226247
Kolkata	26.3	95	9.5	f	\N	\N	\N	\N	\N	\N	2026-09-01 17:05:00.5126
Ahmedabad	30.1	66	6	f	\N	\N	\N	\N	\N	\N	2026-09-01 17:05:04.110522
Jaipur	27.5	65	10.2	f	\N	\N	\N	\N	\N	\N	2026-09-01 17:05:07.688481
Lucknow	26.3	95	7.8	f	\N	\N	\N	\N	\N	\N	2026-09-01 17:05:11.887362
Kochi	26.6	91	3.7	f	\N	\N	\N	\N	\N	\N	2026-09-01 17:05:15.797239
Mysuru	21.9	90	13.1	f	\N	\N	\N	\N	\N	\N	2026-09-01 17:05:17.790848
Shimoga	22.8	90	9.1	f	\N	\N	\N	\N	\N	\N	2026-09-01 17:05:20.402944
Hampi	23.9	89	18.1	f	\N	\N	\N	\N	\N	\N	2026-09-01 17:05:21.809819
Nagpur	25.8	81	8.1	f	\N	\N	\N	\N	\N	\N	2026-09-01 17:05:25.201763
Bhopal	23.9	91	6.7	f	\N	\N	\N	\N	\N	\N	2026-09-01 17:05:28.883255
Guwahati	24.3	92	8.8	f	\N	\N	\N	\N	\N	\N	2026-09-01 17:05:32.474955
Chandigarh	24.8	97	4.1	f	\N	\N	\N	\N	\N	\N	2026-09-01 17:05:37.30849
Coimbatore	23.8	94	12.4	f	\N	\N	\N	\N	\N	\N	2026-09-01 17:05:40.470527
Karwar	26.9	82	10.2	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:50:29.900805
Bengaluru	27.3	57	16.5	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:50:34.099153
Delhi	30.1	72	9.1	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:50:39.002339
Mumbai	26.8	82	10.6	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:50:43.309925
Chennai	31.9	64	13.7	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:50:47.297326
Hyderabad	29.9	51	12.2	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:50:51.291525
Pune	25.6	73	17.3	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:50:55.031962
Kolkata	27.5	96	7.6	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:51:01.021539
Ahmedabad	34.5	41	14.1	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:51:06.351285
Jaipur	31.5	53	12.6	t	17.2	\N	\N	\N	\N	\N	2026-09-02 11:51:08.908741
Lucknow	28.1	87	7.6	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:51:13.620812
Malappuram	28	76	16.7	t	1.5	\N	\N	\N	\N	\N	2026-09-02 11:51:16.1711
Mysuru	26.5	69	19.3	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:51:17.611207
Shimoga	26	73	18	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:51:21.403542
Hampi	28	71	17.9	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:51:24.480036
Nagpur	25.4	87	13.5	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:51:29.086327
Bhopal	25.7	83	10.6	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:51:33.48923
Guwahati	29.2	77	5.4	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:51:38.405846
Chandigarh	29.8	70	2.8	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:51:42.192782
Coimbatore	28.9	62	20.7	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:51:45.567105
Araria	28.8	89	10.3	t	17.1	\N	\N	\N	\N	\N	2026-09-02 11:51:49.558534
Karwar	26.9	82	10.2	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:58:02.809802
Bengaluru	27.3	57	16.5	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:58:08.556228
Delhi	30.1	72	9.1	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:58:13.082283
Mumbai	26.8	82	10.6	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:58:18.584509
Chennai	31.9	64	13.7	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:58:23.802505
Hyderabad	29.9	51	12.2	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:58:28.867049
Pune	25.6	73	17.3	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:58:33.744828
Kolkata	27.5	96	7.6	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:58:39.262705
Ahmedabad	34.5	41	14.1	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:58:45.109422
Jaipur	31.5	53	12.6	t	17.2	\N	\N	\N	\N	\N	2026-09-02 11:58:47.636694
Lucknow	28.1	87	7.6	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:58:53.295015
Malappuram	28	76	16.7	t	1.5	\N	\N	\N	\N	\N	2026-09-02 11:58:56.467368
Mysuru	26.5	69	19.3	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:59:01.376863
Shimoga	26	73	18	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:59:05.78896
Hampi	28	71	17.9	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:59:07.82953
Nagpur	25.4	87	13.5	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:59:14.008943
Bhopal	25.7	83	10.6	t	45.8	\N	\N	\N	\N	\N	2026-09-02 11:59:17.661773
Guwahati	29.2	77	5.4	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:59:22.374092
Chandigarh	29.8	70	2.8	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:59:29.133439
Coimbatore	28.9	62	20.7	f	\N	\N	\N	\N	\N	\N	2026-09-02 11:59:33.345463
Araria	28.8	89	10.3	t	17.1	\N	\N	\N	\N	\N	2026-09-02 11:59:36.71413
Karwar	26.8	83	9.8	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:11:08.865341
Bengaluru	26.4	61	17	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:11:13.039522
Delhi	29.7	75	8.2	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:11:16.517159
Mumbai	26.7	83	10.2	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:11:22.255163
Chennai	31.7	65	14	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:11:25.951634
Hyderabad	29.7	52	11.9	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:11:30.364921
Pune	25.4	74	17.5	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:11:34.850533
Kolkata	27.4	97	7.1	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:11:41.207564
Ahmedabad	34.3	42	14	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:11:46.0185
Jaipur	31.3	54	12.6	t	17.2	\N	\N	\N	\N	\N	2026-09-02 12:11:48.396327
Lucknow	28	88	7.3	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:11:52.877832
Malappuram	27.8	77	16.1	t	1.5	\N	\N	\N	\N	\N	2026-09-02 12:11:54.718754
Mysuru	26.2	71	18.6	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:12:01.982833
Shimoga	25.8	74	17.6	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:12:04.240237
Hampi	28	69	20.1	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:12:05.66896
Nagpur	25.2	87	13.2	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:12:31.394133
Bhopal	25.7	83	10.5	t	45.8	\N	\N	\N	\N	\N	2026-09-02 12:12:36.292924
Guwahati	28.9	78	4.7	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:12:40.599783
Chandigarh	29.5	72	2.6	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:12:45.609793
Coimbatore	28.5	64	20.9	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:12:48.080489
Araria	28.7	89	10.5	t	17.1	\N	\N	\N	\N	\N	2026-09-02 12:12:50.732194
Karwar	26.7	83	9.5	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:17:02.721782
Bengaluru	25.8	63	16	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:17:10.026026
Delhi	29.5	76	7.4	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:17:17.173369
Mumbai	26.7	83	10.1	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:17:23.942977
Chennai	31.6	66	14.4	t	22	\N	\N	\N	\N	\N	2026-09-02 12:17:28.356198
Hyderabad	29.5	52	11.4	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:17:34.714837
Pune	25.1	76	17.2	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:17:41.39221
Kolkata	27.4	97	6.7	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:17:48.349581
Ahmedabad	34.1	42	13.7	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:17:54.292767
Jaipur	31	55	12.4	t	18.6	\N	\N	\N	\N	\N	2026-09-02 12:17:56.724056
Lucknow	27.7	89	6.7	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:18:01.741468
Malappuram	27.5	79	15.4	t	13.7	\N	\N	\N	\N	\N	2026-09-02 12:18:05.380174
Mysuru	25.9	73	17.9	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:18:07.903801
Shimoga	25.5	76	17.3	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:18:10.684951
Hampi	27.8	69	20.4	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:18:12.813164
Nagpur	25.1	88	12.3	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:18:19.191813
Bhopal	25.7	83	10.1	t	115.3	\N	\N	\N	\N	\N	2026-09-02 12:18:23.653312
Guwahati	28.6	79	4.2	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:18:29.375843
Chandigarh	29	76	3.3	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:18:34.232855
Coimbatore	28	66	21	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:18:37.283177
Araria	28.5	89	10.8	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:18:39.723774
Karwar	26.7	83	9.5	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:23:44.89104
Bengaluru	25.8	63	16	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:23:50.727218
Delhi	29.5	76	7.4	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:23:57.174193
Mumbai	26.7	83	10.1	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:24:04.134272
Chennai	31.6	66	14.4	t	22	\N	\N	\N	\N	\N	2026-09-02 12:24:08.213141
Hyderabad	29.5	52	11.4	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:24:13.266896
Pune	25.1	76	17.2	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:24:18.472592
Kolkata	27.4	97	6.7	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:24:24.111739
Ahmedabad	34.1	42	13.7	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:24:29.041237
Jaipur	31	55	12.4	t	18.6	\N	\N	\N	\N	\N	2026-09-02 12:24:31.285747
Lucknow	27.7	89	6.7	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:24:36.331017
Malappuram	27.5	79	15.4	t	13.7	\N	\N	\N	\N	\N	2026-09-02 12:24:38.668819
Mysuru	25.9	73	17.9	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:24:40.154141
Shimoga	25.5	76	17.3	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:24:42.137062
Hampi	27.8	69	20.4	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:24:43.242214
Nagpur	25.1	88	12.3	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:24:47.098871
Bhopal	25.7	83	10.1	t	115.3	\N	\N	\N	\N	\N	2026-09-02 12:24:50.271345
Chandigarh	29	76	3.3	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:25:04.607531
Coimbatore	28	66	21	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:25:07.434116
Araria	28.5	89	10.8	f	\N	\N	\N	\N	\N	\N	2026-09-02 12:25:08.513629
Karwar	26.6	89	3.5	t	34	64.6	0.54	12.12	11.44	10.29	2026-10-18 20:52:48.464956
Karwar	30.1	72	1	t	34	64.6	0.54	12.12	11.44	10.29	2026-10-19 04:27:38.323353
Bengaluru	20.8	93	4	f	\N	\N	\N	\N	\N	\N	2026-10-19 04:27:39.09236
Bengaluru	25.2	70	10.4	f	\N	\N	\N	\N	\N	\N	2026-10-19 04:27:41.382453
Delhi	25.1	66	3.5	t	201	339	4300	77.6	95.33	56.9	2026-10-19 04:27:41.425325
Delhi	25.1	66	3.5	t	201	339	4300	77.6	95.33	56.9	2026-10-19 04:27:43.250322
Mumbai	31.5	62	3	t	72	67	640	38.05	37.15	12.58	2026-10-19 04:27:43.420871
Mumbai	31.5	62	3	t	72	67	640	38.05	37.15	12.58	2026-10-19 04:27:44.799361
Chennai	28	83	8.9	t	14.56	12.07	3030	16.86	4.09	7.99	2026-10-19 04:27:45.876585
Chennai	28	83	8.9	t	14.56	12.07	3030	16.86	4.09	7.99	2026-10-19 04:27:46.596529
Hyderabad	28.9	53	5.8	t	33.78	26.55	520	3.22	18.88	5.58	2026-10-19 04:27:49.147513
Hyderabad	28.9	53	5.8	t	33.78	26.55	520	3.22	18.88	5.58	2026-10-19 04:27:50.117002
Pune	29.4	51	8.5	t	29.02	45.43	750	10.97	11	\N	2026-10-19 04:27:52.186165
Kolkata	30	59	6.8	t	40.8	66.6	70	19.4	20.55	15.45	2026-10-19 04:27:55.516173
Ahmedabad	32.5	37	2.3	t	52.61	60.03	760	32.58	1.78	3.09	2026-10-19 04:27:57.459745
Jaipur	26.7	60	11.9	t	67.6	\N	\N	\N	\N	\N	2026-10-19 04:27:58.907993
Lucknow	27.9	55	5.6	t	90.89	251.3	880	64.18	12.24	9.8	2026-10-19 04:28:01.341195
Malappuram	28.6	81	1.7	t	35.3	\N	\N	\N	\N	\N	2026-10-19 04:28:03.112104
Mysuru	26.5	69	2.1	f	\N	\N	\N	\N	\N	\N	2026-10-19 04:28:04.177516
Shimoga	26.6	74	5.3	t	25.67	52.32	560	952.91	28.24	5.97	2026-10-19 04:28:05.554355
Hampi	27.7	71	5.2	f	\N	\N	\N	\N	\N	\N	2026-10-19 04:28:06.594498
Nagpur	30.4	48	4.6	t	78.81	140.17	0.16	9.24	74.77	19.9	2026-10-19 04:28:09.209339
Bhopal	29.1	48	8.2	t	116	304	3530	56.7	0.9	20.8	2026-10-19 04:28:11.118873
Guwahati	29.3	56	5.6	t	32	87	930	3.73	10.71	26.36	2026-10-19 04:28:13.204673
Chandigarh	23.1	59	5.9	t	19.17	\N	640	23.34	39.29	4.93	2026-10-19 04:28:14.58605
Coimbatore	27.8	74	3.1	t	21.5	30.07	0.48	18.95	19.61	23.81	2026-10-19 04:28:16.874311
Araria	27.8	69	4.1	f	\N	\N	\N	\N	\N	\N	2026-10-19 04:28:17.896141
Karwar	30.3	71	1.5	t	34	64.6	0.54	12.12	11.44	10.29	2026-10-19 04:33:23.549833
Bengaluru	25.5	68	10.9	f	\N	\N	\N	\N	\N	\N	2026-10-19 04:33:30.382273
Delhi	25.6	64	3.7	t	201	339	4300	77.6	95.33	56.9	2026-10-19 04:33:32.22587
Mumbai	32	59	3.6	t	72	67	640	38.05	37.15	12.58	2026-10-19 04:33:33.6445
Chennai	28.3	82	9.2	t	14.56	12.07	3030	16.86	4.09	7.99	2026-10-19 04:33:35.478059
Hyderabad	29.3	51	6	t	33.78	26.55	520	3.22	18.88	5.58	2026-10-19 04:33:40.021726
Pune	29.8	49	8.8	t	29.02	45.43	750	10.97	11	\N	2026-10-19 04:33:42.877161
Kolkata	30.2	58	6.9	t	40.8	66.6	70	19.4	20.55	15.45	2026-10-19 04:33:45.41782
Ahmedabad	33.1	35	2	t	52.61	60.03	760	32.58	1.78	3.09	2026-10-19 04:33:48.194077
Jaipur	27.1	59	11	t	67.6	\N	\N	\N	\N	\N	2026-10-19 04:33:50.006473
Lucknow	28.2	53	6.4	t	90.89	251.3	880	64.18	12.24	9.8	2026-10-19 04:33:51.80793
Malappuram	28.9	80	2.4	t	35.3	\N	\N	\N	\N	\N	2026-10-19 04:33:53.651867
Mysuru	26.8	67	2.9	f	\N	\N	\N	\N	\N	\N	2026-10-19 04:33:54.878497
Shimoga	27	72	5.6	t	25.67	52.32	560	952.91	28.24	5.97	2026-10-19 04:33:56.636214
Hampi	28.1	68	6	f	\N	\N	\N	\N	\N	\N	2026-10-19 04:33:58.130081
Nagpur	30.8	47	5	t	78.81	140.17	0.16	9.24	74.77	19.9	2026-10-19 04:33:59.989282
Bhopal	29.5	46	8.1	t	116	304	3530	56.7	0.9	20.8	2026-10-19 04:34:02.117195
Guwahati	29.6	55	5.9	t	32	87	930	3.73	10.71	26.36	2026-10-19 04:34:05.482282
Chandigarh	23.6	57	6.6	t	19.17	\N	640	23.34	39.29	4.93	2026-10-19 04:34:07.320678
Coimbatore	27.6	74	3.8	t	21.5	30.07	0.48	18.95	19.61	23.81	2026-10-19 04:34:09.328029
Araria	28.1	66	4.6	f	\N	\N	\N	\N	\N	\N	2026-10-19 04:34:11.099301
Karwar	30.3	71	1.5	t	34	64.6	0.54	12.12	11.44	10.29	2026-10-19 04:38:39.735294
Bengaluru	25.5	68	10.9	f	\N	\N	\N	\N	\N	\N	2026-10-19 04:38:46.94005
Delhi	25.6	64	3.7	t	201	339	4300	77.6	95.33	56.9	2026-10-19 04:38:49.903548
Mumbai	32	59	3.6	t	72	67	640	38.05	37.15	12.58	2026-10-19 04:38:51.75432
Chennai	28.3	82	9.2	t	14.56	12.07	3030	16.86	4.09	7.99	2026-10-19 04:38:55.053977
Hyderabad	29.3	51	6	t	33.78	26.55	520	3.22	18.88	5.58	2026-10-19 04:38:59.37179
Pune	29.8	49	8.8	t	29.02	45.43	750	10.97	11	\N	2026-10-19 04:39:01.971207
Kolkata	30.2	58	6.9	t	40.8	66.6	70	19.4	20.55	15.45	2026-10-19 04:39:04.525773
Ahmedabad	33.1	35	2	t	52.61	60.03	760	32.58	1.78	3.09	2026-10-19 04:39:06.605385
Jaipur	27.1	59	11	t	67.6	\N	\N	\N	\N	\N	2026-10-19 04:39:08.861666
Lucknow	28.2	53	6.4	t	90.89	251.3	880	64.18	12.24	9.8	2026-10-19 04:39:11.43045
Malappuram	28.9	80	2.4	t	35.3	\N	\N	\N	\N	\N	2026-10-19 04:39:12.869281
Mysuru	26.8	67	2.9	f	\N	\N	\N	\N	\N	\N	2026-10-19 04:39:14.405164
Shimoga	27	72	5.6	t	25.67	52.32	560	952.91	28.24	5.97	2026-10-19 04:39:16.117382
Hampi	28.1	68	6	f	\N	\N	\N	\N	\N	\N	2026-10-19 04:39:17.652556
Nagpur	30.8	47	5	t	78.81	140.17	0.16	9.24	74.77	19.9	2026-10-19 04:39:20.337874
Bhopal	29.5	46	8.1	t	116	304	3530	56.7	0.9	20.8	2026-10-19 04:39:22.741177
Guwahati	29.6	55	5.9	t	32	87	930	3.73	10.71	26.36	2026-10-19 04:39:25.748685
Chandigarh	23.6	57	6.6	t	19.17	\N	640	23.34	39.29	4.93	2026-10-19 04:39:27.559681
Coimbatore	27.6	74	3.8	t	21.5	30.07	0.48	18.95	19.61	23.81	2026-10-19 04:39:29.475867
Araria	28.1	66	4.6	f	\N	\N	\N	\N	\N	\N	2026-10-19 04:39:30.508202
Karwar	30.3	71	1.5	t	34	64.6	0.54	12.12	11.44	10.29	2026-10-19 04:42:45.424256
Bengaluru	25.5	68	10.9	f	\N	\N	\N	\N	\N	\N	2026-10-19 04:42:49.74334
Delhi	25.6	64	3.7	t	201	339	4300	77.6	95.33	56.9	2026-10-19 04:42:52.903048
Mumbai	32	59	3.6	t	72	67	640	38.05	37.15	12.58	2026-10-19 04:42:54.728212
Chennai	28.3	82	9.2	t	14.56	12.07	3030	16.86	4.09	7.99	2026-10-19 04:42:57.413252
Hyderabad	29.3	51	6	t	33.78	26.55	520	3.22	18.88	5.58	2026-10-19 04:43:01.10903
Pune	29.8	49	8.8	t	29.02	45.43	750	10.97	11	\N	2026-10-19 04:43:03.543971
Kolkata	30.2	58	6.9	t	40.8	66.6	70	19.4	20.55	15.45	2026-10-19 04:43:06.926317
Ahmedabad	33.1	35	2	t	52.61	60.03	760	32.58	1.78	3.09	2026-10-19 04:43:08.852057
Jaipur	27.1	59	11	t	67.6	\N	\N	\N	\N	\N	2026-10-19 04:43:10.348921
Lucknow	28.2	53	6.4	t	90.89	251.3	880	64.18	12.24	9.8	2026-10-19 04:43:12.21755
Malappuram	28.9	80	2.4	t	35.3	\N	\N	\N	\N	\N	2026-10-19 04:43:13.683254
Mysuru	26.8	67	2.9	f	\N	\N	\N	\N	\N	\N	2026-10-19 04:43:14.989403
Shimoga	27	72	5.6	t	25.67	52.32	560	952.91	28.24	5.97	2026-10-19 04:43:17.006513
Hampi	28.1	68	6	f	\N	\N	\N	\N	\N	\N	2026-10-19 04:43:18.28436
Nagpur	30.8	47	5	t	78.81	140.17	0.16	9.24	74.77	19.9	2026-10-19 04:43:20.559486
Bhopal	29.5	46	8.1	t	116	304	3530	56.7	0.9	20.8	2026-10-19 04:43:22.70934
Guwahati	29.6	55	5.9	t	32	87	930	3.73	10.71	26.36	2026-10-19 04:43:26.198377
Chandigarh	23.6	57	6.6	t	19.17	\N	640	23.34	39.29	4.93	2026-10-19 04:43:29.753465
Coimbatore	27.6	74	3.8	t	21.5	30.07	0.48	18.95	19.61	23.81	2026-10-19 04:43:32.236674
Araria	28.1	66	4.6	f	\N	\N	\N	\N	\N	\N	2026-10-19 04:43:33.762443
Karwar	30.5	70	2.4	t	34	64.6	0.54	12.12	11.44	10.29	2026-10-19 04:50:19.772576
Bengaluru	25.8	66	11	f	\N	\N	\N	\N	\N	\N	2026-10-19 04:50:23.561959
Delhi	26.1	62	3.9	t	201	339	4300	77.6	95.33	56.9	2026-10-19 04:50:25.482045
Mumbai	32.6	56	4.3	t	72	67	640	38.05	37.15	12.58	2026-10-19 04:50:27.55234
Chennai	28.6	81	9.5	t	14.56	12.07	3030	16.86	4.09	7.99	2026-10-19 04:50:29.366575
Hyderabad	29.7	49	6.2	t	33.78	26.55	520	3.22	18.88	5.58	2026-10-19 04:50:33.272223
Pune	30.3	47	9.2	t	29.02	45.43	750	10.97	11	\N	2026-10-19 04:50:36.567017
Kolkata	30.4	56	6.8	t	40.8	66.6	70	19.4	20.55	15.45	2026-10-19 04:50:39.749014
Ahmedabad	33.6	33	1.7	t	52.61	60.03	760	32.58	1.78	3.09	2026-10-19 04:50:41.607052
Jaipur	27.5	57	9.8	t	67.6	\N	\N	\N	\N	\N	2026-10-19 04:50:44.075744
Lucknow	28.5	52	7.2	t	90.89	251.3	880	64.18	12.24	9.8	2026-10-19 04:50:46.029493
Malappuram	29.2	79	3.1	t	35.3	\N	\N	\N	\N	\N	2026-10-19 04:50:48.051323
Mysuru	27.1	66	3.6	f	\N	\N	\N	\N	\N	\N	2026-10-19 04:50:49.85159
Shimoga	27.4	70	5.8	t	25.67	52.32	560	952.91	28.24	5.97	2026-10-19 04:50:51.47875
Hampi	28.5	66	6.5	f	\N	\N	\N	\N	\N	\N	2026-10-19 04:50:52.714465
Nagpur	31.1	45	5.3	t	78.81	140.17	0.16	9.24	74.77	19.9	2026-10-19 04:50:54.616171
Bhopal	29.9	45	7.7	t	116	304	3530	56.7	0.9	20.8	2026-10-19 04:50:56.148275
Guwahati	29.8	54	6	t	32	87	930	3.73	10.71	26.36	2026-10-19 04:50:59.306272
Chandigarh	24.1	55	7.3	t	19.17	\N	640	23.34	39.29	4.93	2026-10-19 04:51:01.196858
Coimbatore	27.4	76	4.4	t	21.5	30.07	0.48	18.95	19.61	23.81	2026-10-19 04:51:02.637402
Araria	28.3	64	5.1	f	\N	\N	\N	\N	\N	\N	2026-10-19 04:51:04.275038
Karwar	30.7	69	4.4	t	34	64.6	0.54	12.12	11.44	10.29	2026-10-19 05:16:08.696725
Bengaluru	26.3	64	10.9	f	\N	\N	\N	\N	\N	\N	2026-10-19 05:16:14.662818
Delhi	26.8	58	4.7	t	201	339	4300	77.6	95.33	56.9	2026-10-19 05:16:19.313746
Mumbai	33.5	52	5.7	t	72	67	640	38.05	37.15	12.58	2026-10-19 05:16:21.567001
Chennai	29.1	79	9.7	t	14.56	12.07	3030	16.86	4.09	7.99	2026-10-19 05:16:25.416999
Hyderabad	30.5	46	7	t	33.78	26.55	520	3.22	18.88	5.58	2026-10-19 05:16:30.912832
Pune	31.1	44	9.4	t	29.02	45.43	750	10.97	11	\N	2026-10-19 05:16:33.093678
Kolkata	30.8	54	6.9	t	40.8	66.6	70	19.4	20.55	15.45	2026-10-19 05:16:35.842115
Ahmedabad	34.6	31	1.3	t	52.61	60.03	760	32.58	1.78	3.09	2026-10-19 05:16:38.85769
Jaipur	28.3	54	8.8	t	67.6	\N	\N	\N	\N	\N	2026-10-19 05:16:40.900737
Lucknow	29.1	50	8.3	t	90.89	251.3	880	64.18	12.24	9.8	2026-10-19 05:16:43.509851
Malappuram	29.5	77	4.4	t	36.8	\N	\N	\N	\N	\N	2026-10-19 05:16:45.321731
Mysuru	27.8	63	4.4	f	\N	\N	\N	\N	\N	\N	2026-10-19 05:16:46.569135
Shimoga	28.1	66	6.5	t	25.67	52.32	560	952.91	28.24	5.97	2026-10-19 05:16:48.309299
Hampi	29.2	62	7.7	f	\N	\N	\N	\N	\N	\N	2026-10-19 05:16:49.535873
Nagpur	31.8	42	6.3	t	78.81	140.17	0.16	9.24	74.77	19.9	2026-10-19 05:16:51.877625
Bhopal	30.5	43	7.3	t	116	304	3530	56.7	0.9	20.8	2026-10-19 05:16:53.900243
Guwahati	30.3	52	6	t	32	87	930	3.73	10.71	26.36	2026-10-19 05:16:56.188848
Chandigarh	25.1	51	8.8	t	19.17	\N	640	23.34	39.29	4.93	2026-10-19 05:16:59.08858
Coimbatore	27	77	5.6	t	21.5	30.07	0.48	18.95	19.61	23.81	2026-10-19 05:17:02.30476
Araria	28.7	62	6.2	f	\N	\N	\N	\N	\N	\N	2026-10-19 05:17:03.819233
\.


--
-- Name: agent_decisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: windrose
--

SELECT pg_catalog.setval('public.agent_decisions_id_seq', 14, true);


--
-- Name: agent_decisions agent_decisions_pkey; Type: CONSTRAINT; Schema: public; Owner: windrose
--

ALTER TABLE ONLY public.agent_decisions
    ADD CONSTRAINT agent_decisions_pkey PRIMARY KEY (id);


--
-- Name: weather_aqi weather_aqi_pkey; Type: CONSTRAINT; Schema: public; Owner: windrose
--

ALTER TABLE ONLY public.weather_aqi
    ADD CONSTRAINT weather_aqi_pkey PRIMARY KEY (city, fetched_at);


--
-- PostgreSQL database dump complete
--

\unrestrict A5gio14LPrNXSDdIiHE0ksc94h3mi2pk3WGCEjYt7p2fIwMhYoc8K5EFAtTyaWC

