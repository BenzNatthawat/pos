--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

-- Started on 2023-01-17 17:50:18

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
-- TOC entry 5 (class 2615 OID 18826)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3338 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 212 (class 1255 OID 18827)
-- Name: trigger_set_timestamp(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.trigger_set_timestamp() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;


ALTER FUNCTION public.trigger_set_timestamp() OWNER TO postgres;

--
-- TOC entry 213 (class 1255 OID 18828)
-- Name: uuid_generate_v4(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.uuid_generate_v4() RETURNS uuid
    LANGUAGE c STRICT PARALLEL SAFE
    AS '$libdir/uuid-ossp', 'uuid_generate_v4';


ALTER FUNCTION public.uuid_generate_v4() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 211 (class 1259 OID 18851)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name json,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by character varying,
    updated_by character varying
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 18829)
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name json,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by character varying,
    updated_by character varying,
    price character varying,
    img character varying,
    category uuid
);


ALTER TABLE public.items OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 18837)
-- Name: tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tables (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying,
    img character varying,
    quantity integer,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    created_by character varying,
    updated_by character varying
);


ALTER TABLE public.tables OWNER TO postgres;

--
-- TOC entry 3332 (class 0 OID 18851)
-- Dependencies: 211
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.category (id, name, created_at, updated_at, created_by, updated_by) FROM stdin;
75c7578d-cf43-45c7-8d5d-62dfd4e87257	{"th":"ปลา"}	2023-01-17 17:00:49.142519+07	2023-01-17 17:00:49.142519+07	\N	\N
3999a11d-1742-4d57-b605-53af6bf9aba4	{"th":"กุ้ง"}	2023-01-17 17:00:49.145201+07	2023-01-17 17:00:49.145201+07	\N	\N
c53e517a-fdcc-4243-99fe-2c2e24ad03d2	{"th":"ปลาหมึก"}	2023-01-17 17:00:49.146447+07	2023-01-17 17:00:49.146447+07	\N	\N
c130da5b-54e8-4fe4-ba8a-424dd9ccb2a7	{"th":"ไก่"}	2023-01-17 17:00:49.148047+07	2023-01-17 17:00:49.148047+07	\N	\N
5d3c3b89-7266-4ebe-b8d8-0d9f0f951cc5	{"th":"ผัด"}	2023-01-17 17:00:49.149006+07	2023-01-17 17:00:49.149006+07	\N	\N
4e98d66f-1d85-45c0-b7d4-e8a396eaf632	{"th":"ข้าว"}	2023-01-17 17:00:49.150207+07	2023-01-17 17:00:49.150207+07	\N	\N
46a451af-bc19-4c74-b9c7-2411b91e15d7	{"th":"เส้น"}	2023-01-17 17:02:32.44801+07	2023-01-17 17:02:32.44801+07	\N	\N
7b0d218c-ff61-4c0e-8f6f-9fbcb9b1ff2f	{"th":"ยำ"}	2023-01-17 17:02:32.450443+07	2023-01-17 17:02:32.450443+07	\N	\N
03d4d56b-3874-46f3-9b48-6e25a79c046b	{"th":"ทานเล่น"}	2023-01-17 17:02:32.451598+07	2023-01-17 17:02:32.451598+07	\N	\N
ed758bfd-8938-42f7-bd04-2bd5ffd56d24	{"th":"น้ำ"}	2023-01-17 17:02:52.888598+07	2023-01-17 17:02:52.888598+07	\N	\N
0713a651-3e07-49e0-91b3-1718b0c7a9a0	{"th":"ปู"}	2023-01-17 17:04:21.686434+07	2023-01-17 17:04:21.686434+07	\N	\N
b724b023-2ae3-4b39-9e83-9550f96b4c6b	{"th":"ไข่"}	2023-01-17 17:04:21.688972+07	2023-01-17 17:04:21.688972+07	\N	\N
c01daa71-9d9a-4063-b1e8-990ce6a466cc	{"th":"สลัด"}	2023-01-17 17:02:52.891421+07	2023-01-17 17:04:25.520116+07	\N	\N
\.


--
-- TOC entry 3330 (class 0 OID 18829)
-- Dependencies: 209
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.items (id, name, created_at, updated_at, created_by, updated_by, price, img, category) FROM stdin;
2450e419-6bfb-49d1-a1e0-8126fc00528f	{"th":"ปลาทับทิมทอดน้ำปลา","en":"Deep-Fried Tilapia Fish with Fish Sauce","rus":"рыба жареная тилапия политая рыбным соусом"}	2023-01-17 17:10:18.166877+07	2023-01-17 17:10:18.166877+07	\N	\N	300	I0004.jpg	75c7578d-cf43-45c7-8d5d-62dfd4e87260
d1760137-d7ce-4ac0-9a4d-2cbdfa9143ce	{"th":"ปลาทับทิมแกงส้ม","en":"Sour curry with Tilapia Fish","rus":"кислый карри с рыба тилапия"}	2023-01-17 17:10:18.321686+07	2023-01-17 17:10:18.321686+07	\N	\N	180	I0011.jpg	75c7578d-cf43-45c7-8d5d-62dfd4e87267
a0e875e2-3727-4801-9be9-f6a16399d022	{"th":"ปลาทับทิมนึ่งซีอิ๋ว","en":"Steamed Tilapia Fish with Soy Sauce","rus":"рыба тилапия на пару в соевом соусе"}	2023-01-17 17:10:18.329474+07	2023-01-17 17:10:18.329474+07	\N	\N	300	I0015.jpg	75c7578d-cf43-45c7-8d5d-62dfd4e87271
cba170ab-d5b6-4bfc-923a-66f4a4a76b9b	{"th":"ปลากระพงผัดพริกไทยดำ","en":"Deep-Fried Sea Bass with Black Pepper","rus":"рыба сибасом жаренная кусочками с пастой Чили"}	2023-01-17 17:10:18.331171+07	2023-01-17 17:10:18.331171+07	\N	\N	200	I0018.jpg	75c7578d-cf43-45c7-8d5d-62dfd4e87274
b9f8b59c-b43d-4538-9219-5c2060c27d1a	{"th":"กุ้งชุปแป้งทอด","en":"Batter-Fried Shrimp","rus":"Жареные креветки"}	2023-01-17 17:10:18.333767+07	2023-01-17 17:10:18.333767+07	\N	\N	150	I0023.jpg	3999a11d-1742-4d57-b605-53af6bf9aba5
602a3438-410a-4539-81fd-257360037773	{"th":"ทอดมันกุ้ง","en":"Deep-Fried Shrimp Cakes","rus":"Жареные креветки во фритюре"}	2023-01-17 17:10:18.335461+07	2023-01-17 17:10:18.335461+07	\N	\N	180	I0027.jpg	3999a11d-1742-4d57-b605-53af6bf9aba9
2a1ccbc4-115e-4d16-b462-85be0e7d3ec9	{"th":"ปลากระพงย่าง","en":"Grilled Sea Bass","rus":"снеппер гриль"}	2023-01-17 17:10:18.166334+07	2023-01-17 17:10:18.166334+07	\N	\N	300	I0001.jpg	75c7578d-cf43-45c7-8d5d-62dfd4e87257
ff2712b2-b5fa-4740-b6df-c6ac18cc43d9	{"th":"ปลาทับทิมราดพริก (น้ำจิ้มแจ๋ว)","en":"Deep-Fried Tilapia Fish with Chili Sauce (Spicy Sauce)","rus":"жаренная рыба тилапия с соусом Чили (острый соус)"}	2023-01-17 17:10:18.321991+07	2023-01-17 17:10:18.321991+07	\N	\N	300	I0013.jpg	75c7578d-cf43-45c7-8d5d-62dfd4e87269
90cc055f-c496-4b49-add4-9824a14eaac6	{"th":"ปลากระพงผัดพริกแกง","en":"Deep-Fried Sea Bass with Curry Paste","rus":"рыба сибасом жаренная кусочками с чёрным перцем"}	2023-01-17 17:10:18.330835+07	2023-01-17 17:10:18.330835+07	\N	\N	200	I0016.jpg	75c7578d-cf43-45c7-8d5d-62dfd4e87272
8baa8e52-323a-492c-85fd-144bbea84f27	{"th":"ปลาทับทิมผัดพริกไทยดำ","en":"Deep-Fried Tilapia Fish with Black Pepper","rus":"рыба тилапия жаренная кусочками с пастой Чили"}	2023-01-17 17:10:18.332349+07	2023-01-17 17:10:18.332349+07	\N	\N	200	I0019.jpg	75c7578d-cf43-45c7-8d5d-62dfd4e87275
8bf81cb5-a3c5-4442-8354-d6213cbafd4a	{"th":"กุ้งทอดกระเทียม","en":"Shrimp Fried with Garlic","rus":"креветки жаренные с чесноком"}	2023-01-17 17:10:18.333808+07	2023-01-17 17:10:18.333808+07	\N	\N	150	I0024.jpg	3999a11d-1742-4d57-b605-53af6bf9aba6
e235b2a3-b4cb-4875-8c8d-d68ebf0c0c2f	{"th":"กุ้งอบวุ้นเส้น","en":"Baked Shrimp with Glass Noodles","rus":"Запеченные креветки со стеклянной лапшой"}	2023-01-17 17:10:18.335207+07	2023-01-17 17:10:18.335207+07	\N	\N	180	I0026.jpg	3999a11d-1742-4d57-b605-53af6bf9aba8
0ab637ef-3547-476e-90a4-16b4cd189918	{"th":"ปลาทับทิมทอดกระเทียม","en":"Deep-Fried Tilapia Fish with Garlic","rus":"рыба жареная тилапия с чесноком"}	2023-01-17 17:10:18.322666+07	2023-01-17 17:10:18.322666+07	\N	\N	300	I0006.jpg	75c7578d-cf43-45c7-8d5d-62dfd4e87262
985171e2-9c21-410e-af0c-6906d87ad8f3	{"th":"ปลากระพงทอดกระเทียม","en":"Deep-Fried Sea Bass with Garlic","rus":"рыба жаренная снеппер с чесноком"}	2023-01-17 17:10:18.322646+07	2023-01-17 17:10:18.322646+07	\N	\N	300	I0005.jpg	75c7578d-cf43-45c7-8d5d-62dfd4e87261
0dfc2222-d741-488c-a42e-6e31d6c5741e	{"th":"ปลาหมึกย่าง","en":"Grilled Squid","rus":"кальмар-гриль"}	2023-01-17 17:10:18.344243+07	2023-01-17 17:10:18.344243+07	\N	\N	250	I0035.jpg	c53e517a-fdcc-4243-99fe-2c2e24ad03d2
4f392859-71b0-44a9-8489-941d179b405d	{"th":"ปลาหมึกผัดพริกไทยดำ","en":"Stir-Fried Squid with Black Pepper","rus":"кальмар жареный с черным перцем"}	2023-01-17 17:10:18.362074+07	2023-01-17 17:10:18.362074+07	\N	\N	150	I0042.jpg	c53e517a-fdcc-4243-99fe-2c2e24ad03d9
a28ada98-2977-4c25-89ed-35799242198b	{"th":"ปูผัดน้ำพริกเผา","en":"Stir-Fried Crab with Chili Paste","rus":"жаренный краб с пастой Чили"}	2023-01-17 17:10:18.364966+07	2023-01-17 17:10:18.364966+07	\N	\N	250	I0050.jpg	0713a651-3e07-49e0-91b3-1718b0c7a9a4
13bdcc47-ef5e-489e-aa7d-2439543ea52d	{"th":"ไก่ทอดกระเทียม","en":"Chicken Fried with Garlic","rus":"курица жаренная с чесноком"}	2023-01-17 17:10:18.372095+07	2023-01-17 17:10:18.372095+07	\N	\N	150	I0055.jpg	c130da5b-54e8-4fe4-ba8a-424dd9ccb2a9
0206f13b-59cc-412b-ade7-aac668481ac8	{"th":"ปลากระพงแกงส้ม","en":"Sour curry with Sea Bass","rus":"Кислое карри с рыба сибасом"}	2023-01-17 17:10:18.324582+07	2023-01-17 17:10:18.324582+07	\N	\N	180	I0010.jpg	75c7578d-cf43-45c7-8d5d-62dfd4e87266
5635df55-0445-4944-a30d-4e62a2e3e8fe	{"th":"ปลาหมึกผัดไข่เค็ม","en":"Stir-Fried Squid with Salted Egg","rus":"Жареный кальмар с соленым яйцом"}	2023-01-17 17:10:18.360769+07	2023-01-17 17:10:18.360769+07	\N	\N	150	I0039.jpg	c53e517a-fdcc-4243-99fe-2c2e24ad03d6
68c77c60-41c1-4c36-9d12-81c990836f3c	{"th":"ปูเผา","en":"Grilled Crab","rus":"краб-гриль"}	2023-01-17 17:10:18.364506+07	2023-01-17 17:10:18.364506+07	\N	\N	200	I0047.jpg	0713a651-3e07-49e0-91b3-1718b0c7a9a1
4a6da273-7a39-4c3d-ab17-63e2d81e58fc	{"th":"ไก่ผัดกระเพรา","en":"Stir-Fried Chicken with Basil","rus":"курица жареная с базиликом"}	2023-01-17 17:10:18.371741+07	2023-01-17 17:10:18.371741+07	\N	\N	150	I0054.jpg	c130da5b-54e8-4fe4-ba8a-424dd9ccb2a8
0af56221-218e-499d-b04e-02d691d7df6f	{"th":"ปลาทับทิมนึ่งมะนาว","en":"Steamed Tilapia Fish with Lime Sauce","rus":"рыба жареная тилапия на пару с лимоном"}	2023-01-17 17:10:18.323411+07	2023-01-17 17:10:18.323411+07	\N	\N	300	I0008.jpg	75c7578d-cf43-45c7-8d5d-62dfd4e87264
7189f45c-be69-4d9b-8ee1-2a47b1118363	{"th":"ปลาหมึกผัดผงกะหรี่","en":"Stir-Fried Squid with Curry Powder","rus":"кальмар жаренный с карри-мукой"}	2023-01-17 17:10:18.361287+07	2023-01-17 17:10:18.361287+07	\N	\N	150	I0040.jpg	c53e517a-fdcc-4243-99fe-2c2e24ad03d7
9047ab35-0eab-4752-8c10-48634d45a109	{"th":"ปูผัดผงกะหรี่","en":"Stir-Fried Crab with Curry Powder","rus":"жаренный краб с карри-мукой"}	2023-01-17 17:10:18.364806+07	2023-01-17 17:10:18.364806+07	\N	\N	250	I0049.jpg	0713a651-3e07-49e0-91b3-1718b0c7a9a3
c4618387-058f-4ead-9ee4-b91322bed35e	{"th":"ปลากระพงสามรส","en":"Deep-Fried Sea Bass with 3 types of sauce (Sweet, Sour, Spicy Mixture) sauce can be separately","rus":"рыба жаренная снеппер с 3 видами соуса (сладкий,кислый,острый смесь) соус можно отдельно"}	2023-01-17 17:10:18.323902+07	2023-01-17 17:10:18.323902+07	\N	\N	300	I0009.jpg	75c7578d-cf43-45c7-8d5d-62dfd4e87265
3b72efe4-c5ce-4094-ae46-c102e32db055	{"th":"ปลาหมึกผัดพริกเผา","en":"Stir-Fried Squid with Chili Paste","rus":"кальмар жаренный с Соус-чили"}	2023-01-17 17:10:18.361694+07	2023-01-17 17:10:18.361694+07	\N	\N	150	I0041.jpg	c53e517a-fdcc-4243-99fe-2c2e24ad03d8
26a34f58-c03c-426b-926a-e0732e196d43	{"th":"ปูผัดพริกไทยดำ","en":"Stir-Fried Crab with Black Pepper","rus":"краб жаренный с чёрным перцем"}	2023-01-17 17:10:18.364615+07	2023-01-17 17:10:18.364615+07	\N	\N	250	I0048.jpg	0713a651-3e07-49e0-91b3-1718b0c7a9a2
dff87acb-8d69-4168-9080-111b6a4c9ed4	{"th":"ผัดผัก","en":"Stir-Fried Mix Vegetables","rus":"Жареная смесь овощей"}	2023-01-17 17:10:18.402321+07	2023-01-17 17:10:18.402321+07	\N	\N	100	I0066.jpg	5d3c3b89-7266-4ebe-b8d8-0d9f0f951cc5
1818183a-534d-4b9a-9767-d4912c196c51	{"th":"ผัดเห็ดเข็มทอง","en":"Stir-Fried White Mushrooms (Golden Needle)","rus":"жаренные мелкие местные белые грибы(золотая игла)"}	2023-01-17 17:10:18.40599+07	2023-01-17 17:10:18.40599+07	\N	\N	100	I0067.jpg	5d3c3b89-7266-4ebe-b8d8-0d9f0f951cc6
c30b4934-9aab-4392-875e-5e82de988d31	{"th":"ผัดผักกระเฉดไฟแดง","en":"Stir-Fried Mimosa (On High Heat)","rus":"Жареная мимоза (на сильном огне)"}	2023-01-17 17:10:18.408441+07	2023-01-17 17:10:18.408441+07	\N	\N	100	I0068.jpg	5d3c3b89-7266-4ebe-b8d8-0d9f0f951cc7
47aa84a5-95c0-4550-b52d-aa10905883bd	{"th":"ผัดผักบุ้งไฟแดง","en":"Stir-Fried Morning-Glory (On High Heat)","rus":"Жареная ипомея (на сильном огне)"}	2023-01-17 17:10:18.409985+07	2023-01-17 17:10:18.409985+07	\N	\N	100	I0069.jpg	5d3c3b89-7266-4ebe-b8d8-0d9f0f951cc8
dbf20313-dc60-4eb3-900a-258b1c462b3a	{"th":"ผัดคะน้ากุ้งสด","en":"Stir-Fried Chinese Cabbage with Shrimp","rus":"жаренная китайская капуста с креветками"}	2023-01-17 17:10:18.411326+07	2023-01-17 17:10:18.411326+07	\N	\N	100	I0070.jpg	5d3c3b89-7266-4ebe-b8d8-0d9f0f951cc9
57cf4356-ed26-4a5b-8a99-0544a824117f	{"th":"ปลากระพงนึ่งมะนาว","en":"Steamed Sea Bass with Lime Sauce","rus":"рыба жаренная снеппер на пару с лимономэ "}	2023-01-17 17:10:18.321475+07	2023-01-17 17:10:18.321475+07	\N	\N	300	I0007.jpg	75c7578d-cf43-45c7-8d5d-62dfd4e87263
2df7bd15-d7f1-4276-97c0-29d49d2e6b7c	{"th":"ปลากระพงทอดน้ำปลา","en":"Deep-Fried Sea Bass with Fish Sauce","rus":"рыба жаренная снеппер политая рыбным соусом"}	2023-01-17 17:10:18.322965+07	2023-01-17 17:10:18.322965+07	\N	\N	300	I0003.jpg	75c7578d-cf43-45c7-8d5d-62dfd4e87259
c1fe9c95-fc99-492c-9031-014b14ee38f6	{"th":"ปูนึ่ง","en":"Steamed Crab","rus":"краб на пару"}	2023-01-17 17:10:18.364393+07	2023-01-17 17:10:18.364393+07	\N	\N	200	I0046.jpg	0713a651-3e07-49e0-91b3-1718b0c7a9a0
03cc6a71-f004-44a1-b92b-9978e1085b93	{"th":"ปลาหมึกนึ่งมะนาว","en":"Steamed Squid with Lime Sauce","rus":"кальмар на пару с лимоном"}	2023-01-17 17:10:18.568193+07	2023-01-17 17:10:18.568193+07	\N	\N	180	I0037.jpg	c53e517a-fdcc-4243-99fe-2c2e24ad03d4
a04e9f5e-b1ec-4c1b-8831-5622834afc64	{"th":"ปลาหมึกทอดกระเทียม","en":"Fried Squid with Garlic","rus":"кальмар-гриль с чесноком"}	2023-01-17 17:10:18.768754+07	2023-01-17 17:10:18.768754+07	\N	\N	150	I0036.jpg	c53e517a-fdcc-4243-99fe-2c2e24ad03d3
badfa0e1-7437-4591-9c77-e83a01a4a8df	{"th":"ข้าวผัดเขียวหวาน (ไก่, ปลา)","en":"Fried Rice with Green Curry (Chicken or Fish)","rus":"жаренный рис с зелёным карри (курица или рыба)"}	2023-01-17 17:10:18.929975+07	2023-01-17 17:10:18.929975+07	\N	\N	120	I0083.jpg	4e98d66f-1d85-45c0-b7d4-e8a396eaf636
2bdab2fd-32de-49ba-a67c-312da676480e	{"th":"ข้าวผัดน้ำพริกเผา","en":"Fried Rice with Chilli Paste","rus":"жареный рис с пастой чили"}	2023-01-17 17:10:19.039395+07	2023-01-17 17:10:19.039395+07	\N	\N	120	I0086.jpg	4e98d66f-1d85-45c0-b7d4-e8a396eaf639
a60b8c19-0a6b-45f5-8b0d-7588bdf381d2	{"th":"ผัดก๋วยเตี๋ยวกุ้ง","en":"Stir-Fried Noodles with Shrimp (Wide Rice Noodles)","rus":"жаренная лапша с креветка (крупная )"}	2023-01-17 17:10:19.044696+07	2023-01-17 17:10:19.044696+07	\N	\N	150	I0092.jpg	46a451af-bc19-4c74-b9c7-2411b91e15d8
ecb6bb25-213c-4c10-b5d7-65ac019fbbf5	{"th":"ปลาหมึกชุปแป้งทอด","en":"Batter Fried Squid","rus":"Жареный кальмар"}	2023-01-17 17:10:18.768988+07	2023-01-17 17:10:18.768988+07	\N	\N	150	I0038.jpg	c53e517a-fdcc-4243-99fe-2c2e24ad03d5
aee41b22-3a65-4b69-b9e6-8e034b3496c0	{"th":"ข้าวผัดกระเทียมพริกไทย","en":"Fried Rice with Garlic and Black Pepper","rus":"жаренный рис с чесноком"}	2023-01-17 17:10:18.931225+07	2023-01-17 17:10:18.931225+07	\N	\N	100	I0085.jpg	4e98d66f-1d85-45c0-b7d4-e8a396eaf638
23e5629f-8f2b-4a07-a843-2c2c7c5753e2	{"th":"ข้าวผัดเครื่องแกง (กุ้ง, ปลา, ซีฟู๊ด, ไก่)","en":"Fried Rice with Red Curry (Shrimp, Fish or Seafood)","rus":"жаренный рис с красным карри(креветки ,рыба или морепродукты )"}	2023-01-17 17:10:19.039485+07	2023-01-17 17:10:19.039485+07	\N	\N	120	I0087.jpg	4e98d66f-1d85-45c0-b7d4-e8a396eaf640
9c670c7b-4781-4e18-bfea-47706d3ae476	{"th":"ผัดก๋วยเตี๋ยวไก่","en":"Stir-Fried Noodles with Chicken (Wide Rice Noodles)","rus":"жаренная лапша с курица (крупная )"}	2023-01-17 17:10:19.044503+07	2023-01-17 17:10:19.044503+07	\N	\N	150	I0091.jpg	46a451af-bc19-4c74-b9c7-2411b91e15d7
77ebffb2-f6c7-4751-83ed-dd05a2fcf27c	{"th":"ไก่ผัดเม็ดมะม่วง","en":"Stir-Fried Chicken with Cashew Nuts (Not spicy)","rus":"цыпленок жареный с орехами кешью (не острый)"}	2023-01-17 17:10:18.768606+07	2023-01-17 17:10:18.768606+07	\N	\N	150	I0053.jpg	c130da5b-54e8-4fe4-ba8a-424dd9ccb2a7
02f4037a-6c86-4870-8884-b7214796d781	{"th":"ข้าวผัดสัปรด","en":"Fried Rice with Pineapple","rus":"жаренный рис с ананасом"}	2023-01-17 17:10:18.930836+07	2023-01-17 17:10:18.930836+07	\N	\N	150	I0084.jpg	4e98d66f-1d85-45c0-b7d4-e8a396eaf637
3c2aec32-9f9f-44d7-a8e4-7c7e93b67cd0	{"th":"ข้าวสวย","en":"Streamed Rice","rus":"варенный рис"}	2023-01-17 17:10:19.039572+07	2023-01-17 17:10:19.039572+07	\N	\N	20	I0088.jpg	4e98d66f-1d85-45c0-b7d4-e8a396eaf641
49cf2d12-5de1-4b22-9416-27c89ad96e1e	{"th":"ผัดบะหมี่เหลือง","en":"Stir-Fried Yellow Noodles","rus":"жаренная жёлтая лапша"}	2023-01-17 17:10:19.044846+07	2023-01-17 17:10:19.044846+07	\N	\N	120	I0093.jpg	46a451af-bc19-4c74-b9c7-2411b91e15d9
f52bf711-9526-4d31-a275-34104b83014f	{"th":"ข้าวผัดกุ้ง","en":"Fried Rice with Shrimp","rus":"жареный рис с креветками"}	2023-01-17 17:10:19.044363+07	2023-01-17 17:10:19.044363+07	\N	\N	120	I0079.jpg	4e98d66f-1d85-45c0-b7d4-e8a396eaf632
405de648-1e2a-44c5-baf4-c731ae7fd744	{"th":"ข้าวผัดหมึก","en":"Fried Rice with Squid ","rus":"жареный рис с кальмарами"}	2023-01-17 17:10:19.135991+07	2023-01-17 17:10:19.135991+07	\N	\N	120	I0081.jpg	4e98d66f-1d85-45c0-b7d4-e8a396eaf634
c57c8e95-a63a-4716-8306-6eaa0615e0c1	{"th":"ยำวุ้นเส้นกุ้ง","en":"Glass Noodles Salad with Shrimp","rus":"стакан Салат с креветками"}	2023-01-17 17:10:19.230287+07	2023-01-17 17:10:19.230287+07	\N	\N	150	I0106.jpg	7b0d218c-ff61-4c0e-8f6f-9fbcb9b1ff2f
f79341de-3885-432a-b574-41c275e4fdfa	{"th":"นักเก็ตไก่","en":"Nuggets","rus":"самородки"}	2023-01-17 17:10:19.281797+07	2023-01-17 17:10:19.281797+07	\N	\N	100	I0113.jpg	03d4d56b-3874-46f3-9b48-6e25a79c046b
8d7c802c-cf26-4d46-b13a-fe610f92d819	{"th":"เกี๊ยวทอด","en":"Fried Dumplings","rus":"жареные пельмени"}	2023-01-17 17:10:19.387076+07	2023-01-17 17:10:19.387076+07	\N	\N	100	I0118.jpg	03d4d56b-3874-46f3-9b48-6e25a79c046b
98ecf4df-08be-4754-8ae3-26f6fe4587d0	{"th":"น้ำผลไม้ปั่น","en":"Mix Fruit Smoothie","rus":"шейк-фрукты"}	2023-01-17 17:10:19.400912+07	2023-01-17 17:10:19.400912+07	\N	\N	100	I0125.jpg	ed758bfd-8938-42f7-bd04-2bd5ffd56d25
c70b5dd9-adec-4f73-a146-2cb042836d1c	{"th":"น้ำมะนาวปั่น","en":"Lemonade Smoothie","rus":"шейк-лимонад"}	2023-01-17 17:10:19.434493+07	2023-01-17 17:10:19.434493+07	\N	\N	80	I0132.jpg	ed758bfd-8938-42f7-bd04-2bd5ffd56d32
9d4c3754-beaf-4861-a866-67b2818bdd74	{"th":"น้ำองุ่นปั่น","en":"Grape Smoothie","rus":"шейк-Виноград"}	2023-01-17 17:10:19.437496+07	2023-01-17 17:10:19.437496+07	\N	\N	80	I0137.jpg	ed758bfd-8938-42f7-bd04-2bd5ffd56d37
47c1e8c3-d146-46f2-af72-78558d13979b	{"th":"สิงห์","en":"Singha Beer","rus":"сингха пиво"}	2023-01-17 17:10:19.440014+07	2023-01-17 17:10:19.440014+07	\N	\N	60	I0149.jpg	ed758bfd-8938-42f7-bd04-2bd5ffd56d50
d549c00c-f045-47b3-b931-110d4e4b66e9	{"th":"สลัดกุ้ง","en":"Shrimp Salad","rus":"Салат с креветками"}	2023-01-17 17:10:19.441835+07	2023-01-17 17:10:19.441835+07	\N	\N	120	I0155.jpg	c01daa71-9d9a-4063-b1e8-990ce6a466cc
5542921f-2be3-4dc9-b7af-653868b0237e	{"th":"สลัดซีซาร์","en":"Caesar salad","rus":"Салат Цезарь"}	2023-01-17 17:10:19.444267+07	2023-01-17 17:10:19.444267+07	\N	\N	100	I0160.jpg	c01daa71-9d9a-4063-b1e8-990ce6a466cc
cc5316c0-8e57-41c6-990a-9295ed0a1244	{"th":"ไข่เจียวซีฟู้ด","en":"seafood Omelet","rus":"омлет из морепродуктов"}	2023-01-17 17:10:19.445758+07	2023-01-17 17:10:19.445758+07	\N	\N	150	I0168.jpg	b724b023-2ae3-4b39-9e83-9550f96b4c6b
dcd59053-596e-4608-b303-73a2cda99215	{"th":"ข้าวผัดไก่","en":"Fried Rice with Chicken","rus":"жареный рис с курицей"}	2023-01-17 17:10:19.136134+07	2023-01-17 17:10:19.136134+07	\N	\N	120	I0080.jpg	4e98d66f-1d85-45c0-b7d4-e8a396eaf633
fda8cdb8-b375-4d36-84b5-6deb8aed36a7	{"th":"ยำผักกูด","en":"Spicy Vegetable Salad","rus":"острый овощной салат"}	2023-01-17 17:10:19.230389+07	2023-01-17 17:10:19.230389+07	\N	\N	150	I0107.jpg	7b0d218c-ff61-4c0e-8f6f-9fbcb9b1ff2f
931f0925-440e-40ff-99dc-c43e252518fc	{"th":"ยำมะม่วง","en":"Mango Salad","rus":"салат из манго"}	2023-01-17 17:10:19.281461+07	2023-01-17 17:10:19.281461+07	\N	\N	120	I0109.jpg	7b0d218c-ff61-4c0e-8f6f-9fbcb9b1ff2f
91f817fb-0fcb-4972-98e2-ddab76ab1005	{"th":"ขนมปังทอดกระเทียม","en":"Garlic Bread","rus":"чесночный хлеб"}	2023-01-17 17:10:19.386566+07	2023-01-17 17:10:19.386566+07	\N	\N	100	I0115.jpg	03d4d56b-3874-46f3-9b48-6e25a79c046b
5818c50f-7b1e-496a-8e29-5b6a95526c98	{"th":"น้ำสัปรดปั่น","en":"Pineapple Smoothie","rus":"шейк-ананас"}	2023-01-17 17:10:19.401147+07	2023-01-17 17:10:19.401147+07	\N	\N	80	I0127.jpg	ed758bfd-8938-42f7-bd04-2bd5ffd56d27
a0d6183d-5b54-462f-9366-2ca4aeaaa91f	{"th":"น้ำมะม่วงปั่น","en":"Mango Smoothie","rus":"шейк-манго"}	2023-01-17 17:10:19.434155+07	2023-01-17 17:10:19.434155+07	\N	\N	80	I0131.jpg	ed758bfd-8938-42f7-bd04-2bd5ffd56d31
1fe92a3c-01ba-42a1-8e43-90bafc2738c2	{"th":"แฟนต้าน้ำส้ม","en":"Fanta Orange","rus":"фруктовый пунш фанта"}	2023-01-17 17:10:19.439436+07	2023-01-17 17:10:19.439436+07	\N	\N	40	I0142.jpg	ed758bfd-8938-42f7-bd04-2bd5ffd56d43
8ef26ddc-cade-443c-b79e-50dcee397c4c	{"th":"ไข่เจียว","en":"omelet","rus":"омлет"}	2023-01-17 17:10:19.444785+07	2023-01-17 17:10:19.444785+07	\N	\N	100	I0164.jpg	b724b023-2ae3-4b39-9e83-9550f96b4c6b
88a1cc2a-03df-457f-92ba-9440cdccdd2a	{"th":"ข้าวผัดกระเพรา (ไก่, กุ้ง, ปลาหมึก, ซีฟู๊ด)","en":"Fried Rice with Basil (Chicken, Shrimp, Squid or Seafood)","rus":"жаренный рис с базиликом(курица,креветки,кальмар или морепродукты)"}	2023-01-17 17:10:19.137116+07	2023-01-17 17:10:19.137116+07	\N	\N	150	I0082.jpg	4e98d66f-1d85-45c0-b7d4-e8a396eaf635
29f467d9-4746-4cbb-a022-a00a7de63389	{"th":"ยำข้าวโพด","en":"Spicy Corn Salad","rus":"острый кукурузный салат"}	2023-01-17 17:10:19.230735+07	2023-01-17 17:10:19.230735+07	\N	\N	150	I0108.jpg	7b0d218c-ff61-4c0e-8f6f-9fbcb9b1ff2f
54325759-0d24-4659-acb7-5c5db43be921	{"th":"เฟรนฟาย","en":"French Fries","rus":"картофель-фри"}	2023-01-17 17:10:19.281634+07	2023-01-17 17:10:19.281634+07	\N	\N	100	I0112.jpg	03d4d56b-3874-46f3-9b48-6e25a79c046b
93d41769-4598-4c6d-b580-fc7040b14fee	{"th":"หัวหอมทอด","en":"Onion Rings","rus":"луковые кольца"}	2023-01-17 17:10:19.387077+07	2023-01-17 17:10:19.387077+07	\N	\N	100	I0116.jpg	03d4d56b-3874-46f3-9b48-6e25a79c046b
80a441f7-dafb-43d8-9861-f16add501539	{"th":"น้ำแตงโมปั่น","en":"Watermelon Smoothie","rus":"шейк-арбуз"}	2023-01-17 17:10:19.400939+07	2023-01-17 17:10:19.400939+07	\N	\N	80	I0126.jpg	ed758bfd-8938-42f7-bd04-2bd5ffd56d26
65cd994b-cb59-432e-b3cb-0d4b5274aa8f	{"th":"น้ำส้มปั่น","en":"Orange Smoothie","rus":"шейк-апельсин"}	2023-01-17 17:10:19.434786+07	2023-01-17 17:10:19.434786+07	\N	\N	80	I0133.jpg	ed758bfd-8938-42f7-bd04-2bd5ffd56d33
2c0d2f48-2704-405b-8f52-01f206080a57	{"th":"โค้ก","en":"Coca-Cola","rus":"Кока-Кола"}	2023-01-17 17:10:19.437634+07	2023-01-17 17:10:19.437634+07	\N	\N	40	I0139.jpg	ed758bfd-8938-42f7-bd04-2bd5ffd56d40
afa2bb40-44f3-4f8c-83da-11f8099759ab	{"th":"ลิโอ","en":"LEO Beer","rus":"ЛЕО пиво"}	2023-01-17 17:10:19.439887+07	2023-01-17 17:10:19.439887+07	\N	\N	60	I0148.jpg	ed758bfd-8938-42f7-bd04-2bd5ffd56d49
0f822a78-4ee0-4804-b1fd-889970e85cf2	{"th":"สลัดผลไม้","en":"Fruit Salad","rus":"Фруктовый салат"}	2023-01-17 17:10:19.441732+07	2023-01-17 17:10:19.441732+07	\N	\N	100	I0154.jpg	c01daa71-9d9a-4063-b1e8-990ce6a466cc
39b2536d-684a-47b6-a332-c5dc6f73badd	{"th":"สลัดอกไก่พริกไทยดำ","en":"Black Pepper Chicken Breast Salad","rus":"Салат из куриной грудки с черным перцем"}	2023-01-17 17:10:19.443579+07	2023-01-17 17:10:19.443579+07	\N	\N	100	I0158.jpg	c01daa71-9d9a-4063-b1e8-990ce6a466cc
8c4ea0d6-37a6-4566-abc9-b3854572bf87	{"th":"ไข่เจียวปู","en":"crab Omelet","rus":"крабовый омлет"}	2023-01-17 17:10:19.445007+07	2023-01-17 17:10:19.445007+07	\N	\N	150	I0166.jpg	b724b023-2ae3-4b39-9e83-9550f96b4c6b
83b29c54-438e-4a70-8b1f-20a9822f02a3	{"th":"ข้าวผัดต้มยำ","en":"Tom Yum Fried Rice","rus":"Том Ям жареный рис"}	2023-01-17 17:10:19.231624+07	2023-01-17 17:10:19.231624+07	\N	\N	120	I0089.jpg	4e98d66f-1d85-45c0-b7d4-e8a396eaf642
de1b7043-dac8-4337-bcee-a251379bdd9f	{"th":"ขนมปังทอดเนย","en":"Butter Bread","rus":"масло хлеб"}	2023-01-17 17:10:19.282694+07	2023-01-17 17:10:19.282694+07	\N	\N	100	I0114.jpg	03d4d56b-3874-46f3-9b48-6e25a79c046b
bbf61913-b0c1-48cf-b1d8-5e29276a41c1	{"th":"ปีกไก่ทอด","en":"Fried Chicken Wings","rus":"жареные куриные крылышки"}	2023-01-17 17:10:19.387308+07	2023-01-17 17:10:19.387308+07	\N	\N	100	I0119.jpg	03d4d56b-3874-46f3-9b48-6e25a79c046b
f99a5adb-cf71-4d63-adc1-c0faf02f0f3d	{"th":"น้ำเปล่า","en":"Mineral Water","rus":"минеральная вода"}	2023-01-17 17:10:19.400464+07	2023-01-17 17:10:19.400464+07	\N	\N	20	I0124.jpg	ed758bfd-8938-42f7-bd04-2bd5ffd56d24
b6b5e2d7-a56f-4b79-95b2-37a3c0d48675	{"th":"น้ำกล้วยปั่น","en":"Banana Smoothie","rus":"шейк-банан"}	2023-01-17 17:10:19.4323+07	2023-01-17 17:10:19.4323+07	\N	\N	80	I0130.jpg	ed758bfd-8938-42f7-bd04-2bd5ffd56d30
19729cc7-4569-4d3f-a87e-37a226c72b85	{"th":"น้ำแก้วมังกรปั่น","en":"Dragon Fruit Smoothie","rus":"шейк-Драконий фрукт"}	2023-01-17 17:10:19.436913+07	2023-01-17 17:10:19.436913+07	\N	\N	80	I0136.jpg	ed758bfd-8938-42f7-bd04-2bd5ffd56d36
fac0cf08-0783-48b7-928e-e8ca08986577	{"th":"สไปรท์","en":"Sprite","rus":"спрайт"}	2023-01-17 17:10:19.439696+07	2023-01-17 17:10:19.439696+07	\N	\N	40	I0144.jpg	ed758bfd-8938-42f7-bd04-2bd5ffd56d45
09e21389-06a7-4eb8-841c-94a0a7f22c14	{"th":"สลัดผัก","en":"Mix Salad","rus":"Микс-салат"}	2023-01-17 17:10:19.441644+07	2023-01-17 17:10:19.441644+07	\N	\N	100	I0153.jpg	c01daa71-9d9a-4063-b1e8-990ce6a466cc
56bdbfa2-d31c-4e07-8b7c-a6e632ce24ee	{"th":"สลัดอกไก่","en":"Chicken Breast Salad","rus":"Салат с куриной грудкой"}	2023-01-17 17:10:19.443322+07	2023-01-17 17:10:19.443322+07	\N	\N	100	I0157.jpg	c01daa71-9d9a-4063-b1e8-990ce6a466cc
c58e96d1-ec4c-4762-b85e-d8056f5cfd8a	{"th":"ไข่เจียวไก่","en":"chicken omelet","rus":"куриный омлет"}	2023-01-17 17:10:19.444906+07	2023-01-17 17:10:19.444906+07	\N	\N	150	I0165.jpg	b724b023-2ae3-4b39-9e83-9550f96b4c6b
8049bf9a-80a3-4756-b9b3-b645611a5082	{"th":"ยำซีฟู๊ด","en":"Seafood Salad","rus":"салат из морепродуктов"}	2023-01-17 17:10:19.393278+07	2023-01-17 17:10:19.393278+07	\N	\N	150	I0104.jpg	7b0d218c-ff61-4c0e-8f6f-9fbcb9b1ff2f
0c436a95-4e26-45f2-afd8-f326091d176d	{"th":"น้ำส้มคั้น","en":"Orange Juice","rus":"апельсиновый сок"}	2023-01-17 17:10:19.435157+07	2023-01-17 17:10:19.435157+07	\N	\N	100	I0134.jpg	ed758bfd-8938-42f7-bd04-2bd5ffd56d34
504c8eac-306e-4cb5-81df-df418902d235	{"th":"แฟนต้าน้ำแดง","en":"Fanta Raspberry","rus":"фанта малина"}	2023-01-17 17:10:19.438006+07	2023-01-17 17:10:19.438006+07	\N	\N	40	I0141.jpg	ed758bfd-8938-42f7-bd04-2bd5ffd56d42
7e1c1aec-2773-45dd-97be-a23aae880818	{"th":"ช้าง","en":"Chang Beer","rus":"чанг пиво"}	2023-01-17 17:10:19.440012+07	2023-01-17 17:10:19.440012+07	\N	\N	60	I0147.jpg	ed758bfd-8938-42f7-bd04-2bd5ffd56d48
521b6247-bed5-4801-8edb-011885bc271e	{"th":"สลัดไก่กรอบ","en":"Crispy Chicken Salad","rus":"Салат с хрустящей курицей"}	2023-01-17 17:10:19.441952+07	2023-01-17 17:10:19.441952+07	\N	\N	100	I0156.jpg	c01daa71-9d9a-4063-b1e8-990ce6a466cc
a7ebacbe-5f94-4d85-97f8-70e121dd5845	{"th":"สลัดไข่ต้ม ","en":"Boiled Egg Salad","rus":"Салат из вареных яиц"}	2023-01-17 17:10:19.444026+07	2023-01-17 17:10:19.444026+07	\N	\N	100	I0159.jpg	c01daa71-9d9a-4063-b1e8-990ce6a466cc
bdc3a3af-3f2a-48da-b88f-0f95f8f215b6	{"th":"ไข่เจียวปููอัด","en":"crab Stick Omelet","rus":"крабовые палочки омлет"}	2023-01-17 17:10:19.445606+07	2023-01-17 17:10:19.445606+07	\N	\N	120	I0167.jpg	b724b023-2ae3-4b39-9e83-9550f96b4c6b
ecd0d8a8-97e1-47a7-bb1f-0c5f50f91a21	{"th":"ยำวุ้นเส้นไก่","en":"Glass Noodles Salad with Chicken","rus":"стакан Салат с курицей"}	2023-01-17 17:10:19.40014+07	2023-01-17 17:10:19.40014+07	\N	\N	150	I0105.jpg	7b0d218c-ff61-4c0e-8f6f-9fbcb9b1ff2f
151fd0ae-60e0-40e1-854e-93727fd7ec1b	{"th":"น้ำแอปเปิ้ลปั่น","en":"Apple Smoothie","rus":"шейк-яблоко"}	2023-01-17 17:10:19.435297+07	2023-01-17 17:10:19.435297+07	\N	\N	80	I0135.jpg	ed758bfd-8938-42f7-bd04-2bd5ffd56d35
139d67e9-1979-4e43-88ef-5e9de76fe38d	{"th":"เป๊ปซี่","en":"Pepsi","rus":"пепси"}	2023-01-17 17:10:19.437744+07	2023-01-17 17:10:19.437744+07	\N	\N	40	I0140.jpg	ed758bfd-8938-42f7-bd04-2bd5ffd56d41
d845475f-8fcc-4982-a78a-ef3fb7141068	{"th":"แฟนต้าน้ำเขียว","en":"Fanta Fruit Punch","rus":""}	2023-01-17 17:10:19.439572+07	2023-01-17 17:10:19.439572+07	\N	\N	40	I0143.jpg	ed758bfd-8938-42f7-bd04-2bd5ffd56d44
b9e43c7e-9beb-4033-888a-381d5bc45a03	{"th":"ไฮเนเก้น","en":"Heineken Beer","rus":"пиво хайнекен"}	2023-01-17 17:10:19.441343+07	2023-01-17 17:10:19.441343+07	\N	\N	60	I0150.jpg	ed758bfd-8938-42f7-bd04-2bd5ffd56d51
adb17be6-d26f-4ead-9c21-dc67d4c780d3	{"th":"สลัดปูอัด","en":"Crab Stick Salad","rus":"Салат из крабовых палочек"}	2023-01-17 17:10:19.444368+07	2023-01-17 17:10:19.444368+07	\N	\N	100	I0161.jpg	c01daa71-9d9a-4063-b1e8-990ce6a466cc
f327a8f2-a51b-4364-a946-15d320c73a8c	{"th":"ซุปเห็ด","en":"Mushroom Cream Soup","rus":"грибной крем-суп"}	2023-01-17 17:10:19.502488+07	2023-01-17 17:10:19.502488+07	\N	\N	120	I0120.jpg	03d4d56b-3874-46f3-9b48-6e25a79c046b
55f9879c-8a46-41e9-ab1f-45b264a3d6e4	{"th":"น้ำมะพร้าวปั่น","en":"Coconut Smoothie","rus":"шейк-кокос"}	2023-01-17 17:10:19.605312+07	2023-01-17 17:10:19.605312+07	\N	\N	80	I0129.jpg	ed758bfd-8938-42f7-bd04-2bd5ffd56d29
d7056050-4e68-495a-bb2d-d7bc26545985	{"th":"ซุุปข้าวโพด","en":"Corn Cream Soup","rus":"кукурузный крем-суп"}	2023-01-17 17:10:19.60253+07	2023-01-17 17:10:19.60253+07	\N	\N	120	I0121.jpg	03d4d56b-3874-46f3-9b48-6e25a79c046b
d945566e-6aab-4d7f-aad3-8e7332e74b9b	{"th":"น้ำมะพร้าว","en":"Coconut Water","rus":"кокос"}	2023-01-17 17:10:19.60231+07	2023-01-17 17:10:19.60231+07	\N	\N	60	I0128.jpg	ed758bfd-8938-42f7-bd04-2bd5ffd56d28
59d72c60-f117-4e41-9dd7-8a7e73acc234	{"th":"ปลาทับทิมย่าง","en":"Grilled Tilapia Fish","rus":"Тилапия рыба гриль"}	2023-01-17 17:10:18.166772+07	2023-01-17 17:10:18.166772+07	\N	\N	300	I0002.jpg	75c7578d-cf43-45c7-8d5d-62dfd4e87258
a79a392a-5c27-47ff-a5ec-c78eb4c44763	{"th":"ปลากระพงราดพริก (น้ำจิ้มแจ๋ว)","en":"Deep-Fried fish with Sea Bass with chili sauce (Spicy Sauce)","rus":"жаренная рыба сибасом с соусом Чили (острый соус)"}	2023-01-17 17:10:18.321875+07	2023-01-17 17:10:18.321875+07	\N	\N	300	I0012.jpg	75c7578d-cf43-45c7-8d5d-62dfd4e87268
a100cd86-587c-4316-a3dd-ec1299ada59e	{"th":"ปลากระพงนึ่งซีอิ๋ว","en":"Steamed Sea Bass with Soy Sauce","rus":"рыба сибасом на пару в соевом соусе"}	2023-01-17 17:10:18.327676+07	2023-01-17 17:10:18.327676+07	\N	\N	300	I0014.jpg	75c7578d-cf43-45c7-8d5d-62dfd4e87270
daa8566d-8f2b-48de-a97e-e4d86bec7f13	{"th":"ปลาทับทิมผัดพริกแกง","en":"Deep-Fried Tilapia Fish with Curry Paste","rus":"рыба тилапия жаренная кусочками с чёрным перцем"}	2023-01-17 17:10:18.330959+07	2023-01-17 17:10:18.330959+07	\N	\N	200	I0017.jpg	75c7578d-cf43-45c7-8d5d-62dfd4e87273
1dbb40c6-5d67-4525-b983-904be2424192	{"th":"กุ้งเผา","en":"Grilled Shrimp","rus":"креветки-гриль"}	2023-01-17 17:10:18.332753+07	2023-01-17 17:10:18.332753+07	\N	\N	350	I0022.jpg	3999a11d-1742-4d57-b605-53af6bf9aba4
9f5095c3-8adb-4a8d-b21f-3f1e8f9ae412	{"th":"กุ้งอบเกลือ","en":"Shrimp Baked with Salt","rus":"креветки запечённые в соли"}	2023-01-17 17:10:18.334043+07	2023-01-17 17:10:18.334043+07	\N	\N	150	I0025.jpg	3999a11d-1742-4d57-b605-53af6bf9aba7
\.


--
-- TOC entry 3331 (class 0 OID 18837)
-- Dependencies: 210
-- Data for Name: tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tables (id, name, img, quantity, created_at, updated_at, created_by, updated_by) FROM stdin;
\.


--
-- TOC entry 3187 (class 2606 OID 18860)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3183 (class 2606 OID 18846)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- TOC entry 3185 (class 2606 OID 18848)
-- Name: tables tables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (id);


--
-- TOC entry 3190 (class 2620 OID 18861)
-- Name: category set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON public.category FOR EACH ROW EXECUTE FUNCTION public.trigger_set_timestamp();


--
-- TOC entry 3188 (class 2620 OID 18849)
-- Name: items set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON public.items FOR EACH ROW EXECUTE FUNCTION public.trigger_set_timestamp();


--
-- TOC entry 3189 (class 2620 OID 18850)
-- Name: tables set_timestamp; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER set_timestamp BEFORE UPDATE ON public.tables FOR EACH ROW EXECUTE FUNCTION public.trigger_set_timestamp();


-- Completed on 2023-01-17 17:50:18

--
-- PostgreSQL database dump complete
--

