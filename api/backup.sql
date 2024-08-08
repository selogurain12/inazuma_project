--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg120+1)
-- Dumped by pg_dump version 16.2

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
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: episode; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.episode (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    titre character varying NOT NULL,
    titre_original character varying NOT NULL,
    numepisode integer NOT NULL,
    saison integer NOT NULL,
    scenario character varying NOT NULL,
    diffusion_originale date NOT NULL,
    resume character varying NOT NULL,
    note character varying,
    video character varying NOT NULL,
    "serieId" uuid
);


ALTER TABLE public.episode OWNER TO lora;

--
-- Name: episode_equipes_equipe; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.episode_equipes_equipe (
    "episodeId" uuid NOT NULL,
    "equipeId" uuid NOT NULL
);


ALTER TABLE public.episode_equipes_equipe OWNER TO lora;

--
-- Name: episode_matchs_match; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.episode_matchs_match (
    "episodeId" uuid NOT NULL,
    "matchId" uuid NOT NULL
);


ALTER TABLE public.episode_matchs_match OWNER TO lora;

--
-- Name: episode_personnages_personnage; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.episode_personnages_personnage (
    "episodeId" uuid NOT NULL,
    "personnageId" uuid NOT NULL
);


ALTER TABLE public.episode_personnages_personnage OWNER TO lora;

--
-- Name: episode_supertactiques_supertactique; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.episode_supertactiques_supertactique (
    "episodeId" uuid NOT NULL,
    "supertactiqueId" uuid NOT NULL
);


ALTER TABLE public.episode_supertactiques_supertactique OWNER TO lora;

--
-- Name: episode_supertechniques_supertechnique; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.episode_supertechniques_supertechnique (
    "episodeId" uuid NOT NULL,
    "supertechniqueId" uuid NOT NULL
);


ALTER TABLE public.episode_supertechniques_supertechnique OWNER TO lora;

--
-- Name: equipe; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.equipe (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    nom_francais_equipe character varying NOT NULL,
    nom_original_equipe character varying,
    note character varying,
    "serieId" uuid
);


ALTER TABLE public.equipe OWNER TO lora;

--
-- Name: equipe_capitaines_personnage; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.equipe_capitaines_personnage (
    "equipeId" uuid NOT NULL,
    "personnageId" uuid NOT NULL
);


ALTER TABLE public.equipe_capitaines_personnage OWNER TO lora;

--
-- Name: equipe_entraineur_personnage; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.equipe_entraineur_personnage (
    "equipeId" uuid NOT NULL,
    "personnageId" uuid NOT NULL
);


ALTER TABLE public.equipe_entraineur_personnage OWNER TO lora;

--
-- Name: equipe_episodes_episode; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.equipe_episodes_episode (
    "equipeId" uuid NOT NULL,
    "episodeId" uuid NOT NULL
);


ALTER TABLE public.equipe_episodes_episode OWNER TO lora;

--
-- Name: equipe_images_image; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.equipe_images_image (
    "equipeId" uuid NOT NULL,
    "imageId" uuid NOT NULL
);


ALTER TABLE public.equipe_images_image OWNER TO lora;

--
-- Name: equipe_joueurs_personnage; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.equipe_joueurs_personnage (
    "equipeId" uuid NOT NULL,
    "personnageId" uuid NOT NULL
);


ALTER TABLE public.equipe_joueurs_personnage OWNER TO lora;

--
-- Name: equipe_manageurs_personnage; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.equipe_manageurs_personnage (
    "equipeId" uuid NOT NULL,
    "personnageId" uuid NOT NULL
);


ALTER TABLE public.equipe_manageurs_personnage OWNER TO lora;

--
-- Name: equipe_matchs_match; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.equipe_matchs_match (
    "equipeId" uuid NOT NULL,
    "matchId" uuid NOT NULL
);


ALTER TABLE public.equipe_matchs_match OWNER TO lora;

--
-- Name: equipe_supertactiques_supertactique; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.equipe_supertactiques_supertactique (
    "equipeId" uuid NOT NULL,
    "supertactiqueId" uuid NOT NULL
);


ALTER TABLE public.equipe_supertactiques_supertactique OWNER TO lora;

--
-- Name: equipe_supertechniques_supertechnique; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.equipe_supertechniques_supertechnique (
    "equipeId" uuid NOT NULL,
    "supertechniqueId" uuid NOT NULL
);


ALTER TABLE public.equipe_supertechniques_supertechnique OWNER TO lora;

--
-- Name: image; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.image (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    note character varying,
    images character varying,
    "serieId" uuid,
    "episodeId" uuid
);


ALTER TABLE public.image OWNER TO lora;

--
-- Name: image_equipe_equipe; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.image_equipe_equipe (
    "imageId" uuid NOT NULL,
    "equipeId" uuid NOT NULL
);


ALTER TABLE public.image_equipe_equipe OWNER TO lora;

--
-- Name: image_personnages_personnage; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.image_personnages_personnage (
    "imageId" uuid NOT NULL,
    "personnageId" uuid NOT NULL
);


ALTER TABLE public.image_personnages_personnage OWNER TO lora;

--
-- Name: match; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.match (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    notes character varying,
    compo_equipe_1 character varying,
    compo_equipe_2 character varying,
    "idEquipe1Id" uuid,
    "idEquipe2Id" uuid,
    "serieId" uuid
);


ALTER TABLE public.match OWNER TO lora;

--
-- Name: match_episodes_episode; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.match_episodes_episode (
    "matchId" uuid NOT NULL,
    "episodeId" uuid NOT NULL
);


ALTER TABLE public.match_episodes_episode OWNER TO lora;

--
-- Name: match_supertactiques_supertactique; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.match_supertactiques_supertactique (
    "matchId" uuid NOT NULL,
    "supertactiqueId" uuid NOT NULL
);


ALTER TABLE public.match_supertactiques_supertactique OWNER TO lora;

--
-- Name: match_supertechniques_supertechnique; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.match_supertechniques_supertechnique (
    "matchId" uuid NOT NULL,
    "supertechniqueId" uuid NOT NULL
);


ALTER TABLE public.match_supertechniques_supertechnique OWNER TO lora;

--
-- Name: personnage; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.personnage (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "nom_français_personnage" character varying NOT NULL,
    nom_original_personnage character varying,
    position_personnage character varying,
    note character varying,
    "serieId" uuid
);


ALTER TABLE public.personnage OWNER TO lora;

--
-- Name: personnage_episode_episode; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.personnage_episode_episode (
    "personnageId" uuid NOT NULL,
    "episodeId" uuid NOT NULL
);


ALTER TABLE public.personnage_episode_episode OWNER TO lora;

--
-- Name: personnage_equipes_equipe; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.personnage_equipes_equipe (
    "personnageId" uuid NOT NULL,
    "equipeId" uuid NOT NULL
);


ALTER TABLE public.personnage_equipes_equipe OWNER TO lora;

--
-- Name: personnage_images_image; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.personnage_images_image (
    "personnageId" uuid NOT NULL,
    "imageId" uuid NOT NULL
);


ALTER TABLE public.personnage_images_image OWNER TO lora;

--
-- Name: personnage_supertechniques_supertechnique; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.personnage_supertechniques_supertechnique (
    "personnageId" uuid NOT NULL,
    "supertechniqueId" uuid NOT NULL
);


ALTER TABLE public.personnage_supertechniques_supertechnique OWNER TO lora;

--
-- Name: serie; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.serie (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    nom character varying NOT NULL
);


ALTER TABLE public.serie OWNER TO lora;

--
-- Name: supertactique; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.supertactique (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    nom character varying NOT NULL,
    video text[],
    "serieId" uuid
);


ALTER TABLE public.supertactique OWNER TO lora;

--
-- Name: supertactique_episodes_episode; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.supertactique_episodes_episode (
    "supertactiqueId" uuid NOT NULL,
    "episodeId" uuid NOT NULL
);


ALTER TABLE public.supertactique_episodes_episode OWNER TO lora;

--
-- Name: supertactique_equipes_equipe; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.supertactique_equipes_equipe (
    "supertactiqueId" uuid NOT NULL,
    "equipeId" uuid NOT NULL
);


ALTER TABLE public.supertactique_equipes_equipe OWNER TO lora;

--
-- Name: supertactique_matchs_match; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.supertactique_matchs_match (
    "supertactiqueId" uuid NOT NULL,
    "matchId" uuid NOT NULL
);


ALTER TABLE public.supertactique_matchs_match OWNER TO lora;

--
-- Name: supertechnique; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.supertechnique (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "nom_français_supertechniques" character varying NOT NULL,
    nom_original_supertechniques character varying,
    type_supertechniques character varying NOT NULL,
    notes_supertechniques character varying,
    obtention_supertechniques character varying,
    video text[],
    "serieId" uuid
);


ALTER TABLE public.supertechnique OWNER TO lora;

--
-- Name: supertechnique_episodes_episode; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.supertechnique_episodes_episode (
    "supertechniqueId" uuid NOT NULL,
    "episodeId" uuid NOT NULL
);


ALTER TABLE public.supertechnique_episodes_episode OWNER TO lora;

--
-- Name: supertechnique_equipes_equipe; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.supertechnique_equipes_equipe (
    "supertechniqueId" uuid NOT NULL,
    "equipeId" uuid NOT NULL
);


ALTER TABLE public.supertechnique_equipes_equipe OWNER TO lora;

--
-- Name: supertechnique_matchs_match; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.supertechnique_matchs_match (
    "supertechniqueId" uuid NOT NULL,
    "matchId" uuid NOT NULL
);


ALTER TABLE public.supertechnique_matchs_match OWNER TO lora;

--
-- Name: supertechnique_personnages_personnage; Type: TABLE; Schema: public; Owner: lora
--

CREATE TABLE public.supertechnique_personnages_personnage (
    "supertechniqueId" uuid NOT NULL,
    "personnageId" uuid NOT NULL
);


ALTER TABLE public.supertechnique_personnages_personnage OWNER TO lora;

--
-- Data for Name: episode; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.episode (id, titre, titre_original, numepisode, saison, scenario, diffusion_originale, resume, note, video, "serieId") FROM stdin;
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	À la recherche de la meilleure technique	Amidase Hissatsu-waza!	3	1	Atsuhiro Tomioka	2008-10-19	L’institut Occulte défie le collège Raimon en match amical. L'équipe compte seulement sur le talent d'Axel, ce qui rend jaloux Kevin. Par sa rage, Kevin parvient à créer sa Supertechnique : le Choc du Dragon.	- Lors de cet épisode, Kevin Dragonfly apprend sa première supertechnique.	https://www.youtube.com/watch?v=c-72WaeVHZQ	2451ef9f-9bd1-499b-83fc-5505be405ed5
fea90bfd-2d11-424f-ad2f-507e1562c1af	Jouons au football	Sakkā yarō ze!	1	1	Atsuhiro Tomioka	2008-10-05	L'équipe de football du collège Raimon ne compte que sept joueurs à son actif. Mark Evans, le capitaine du club, doit recruter quatre autres joueurs pour faire face à la prestigieuse Royal Academy, au risque d'une suppression du club de football du collège.	- Cet épisode est l'un des seuls durant lequel aucune Supertechnique n'est montrée.	https://www.youtube.com/watch?v=jNwzLzN0RiY	2451ef9f-9bd1-499b-83fc-5505be405ed5
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	Face à face avec la Royal Academy !	Teikoku ga Kita!	2	1	Atsuhiro Tomioka	2008-10-12	Axel Blaze, un nouvel élève, est arrivé au collège Raimon. Mark apprend que la Royal Academy, la meilleure équipe du pays, défie l'équipe de Raimon en match amical. Avant le début du match, Jack va se cacher dans un casier car il a peur. Pendant que l'équipe de Raimon vient juste d'être formée, la Royal Academy mène le match sur le score de 20-0. En constatant l'impuissance de Raimon face à leur adversaire, William Glass abandonne l'équipe. Axel Blaze arrive à la rescousse et marque un but avec la Tornade de Feu, avant que la Royal Academy ne déclare forfait en partant car les joueurs disent qu'ils ont obtenu ce qu'ils voulaient.	- Il s'agit du premier match commenté par Chester Horse Junior.\n- On découvre le caractère peureux de Jack.\n- Malgré son intervention en leur faveur, Axel ne rejoint pas encore l'équipe de Raimon.	https://www.youtube.com/watch?v=oBNzsXWp7b0	2451ef9f-9bd1-499b-83fc-5505be405ed5
be80eb60-f867-454f-97e7-86a675c09f53	La Tornade du Dragon !	Doragon ga deta!	4	1	Atsuhiro Tomioka	2008-10-26	Kevin et Axel, incapables de marquer un but face à l'Institut Occulte, forment une Supertechnique combinée, la Tornade du Dragon, qui est l'union du Choc du Dragon et de la Tornade de Feu. Cette-ci vainc la Distorsion du gardien d'Occulte. Finalement, l'équipe de Raimon gagne. Nelly inscrit le club au tournoi Football Frontier.	- Le Blocage Spectral est la première Supertactique utilisée dans l'Anime.\n- On voit pour la première fois une technique combinée	https://www.youtube.com/watch?v=XXvwmV77a1c	2451ef9f-9bd1-499b-83fc-5505be405ed5
84593a3b-1264-49e0-8ffb-7383132558c0	Où est le cahier secret !	Hiden-sho wa dokoda!	5	1	Atsuhiro Tomioka	2008-11-02	Mark trouve un cahier secret contenant des Supertechniques de son défunt grand-père, David Evans, ancien gardien et entraîneur de Raimon. Ceci dit, Mark va essayer de les apprendre !	- Bobby Shearer rejoint l'équipe de Raimon.\n- Il y a un nouveau cahier d'entraînement.	https://www.youtube.com/watch?v=MGW4ITkfGoA	2451ef9f-9bd1-499b-83fc-5505be405ed5
66abafd9-5110-4c47-a81c-9a2a4f74cb08	Le Trampoline du Tonnerre !	Kore ga Inazuma Otoshi da!	6	1	Atsuhiro Tomioka	2008-11-09	Afin de vaincre le collège Wild (le premier adversaire du collège Raimon dans le tournoi de qualification au Football Frontier), Axel et Jack apprennent le Trampoline du Tonnerre, une Supertechnique surpuissante inscrite dans le cahier de David Evans.	- Jack vainc sa peur du vide pour exécuter le Trampoline du Tonnerre	https://www.youtube.com/watch?v=A3pfZyZHVlM	2451ef9f-9bd1-499b-83fc-5505be405ed5
b1806a16-509d-49e5-a2e2-3a484cd16455	Le centre d'entraînement secret !	Kasenjiki no kettō!	7	1	Atsuhiro Tomioka	2008-11-16	Afin d'éviter la foule d'espions, venue analyser leurs Supertechniques pendant les séances d'entrainement, l'équipe de Raimon commence un programme intensif dans un centre secret du nom d'Inabikari, découvert par le plus grand des hasards par Nelly Raimon.	- Neil Turner, joueur de l'équipe de Cybertech, connaît lui aussi la Tornade de Feu.\n- Découverte du coup de tonnerre, un centre d'entraînement secret	https://www.youtube.com/watch?v=bkCx3sK4ibw	2451ef9f-9bd1-499b-83fc-5505be405ed5
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	Les Cyber Joueurs de foot !	Kyōfu no Sakkāsaibōgu!	8	1	Atsuhiro Tomioka	2008-11-23	Pour le deuxième tour des éliminatoires, l'équipe de Raimon doit affronter l'équipe de Cybertech. Néanmoins, les joueurs adverses connaissent tout sur eux et sur leurs Supertechniques, leur permettant de connaitre l'issue d'un match grâce à leur technologie de pointe.	- L'équipe de Raimon parvient à vaincre le collège Cybertech.\n- Mark inscrit un but avec Axel.\n- Axel se blesse à la fin du match	https://www.youtube.com/watch?v=L8rOtacNSyE	2451ef9f-9bd1-499b-83fc-5505be405ed5
22a06b40-2b8c-46a1-bc90-df535a96e07e	Willy entre en scène !	Megane, tatsu!	9	1	Atsuhiro Tomioka	2008-11-30	L'équipe de Raimon affronte une équipe spéciale, qui correspond aux passions de Willy. Comment une équipe aussi nulle a-t-elle pu arriver à ce stade de la compétition ?	- Parmi tous les matchs disputés, il s'agit du seul but que Willy a marqué.	https://www.dailymotion.com/video/x11bmjx	2451ef9f-9bd1-499b-83fc-5505be405ed5
e3d98622-d761-402e-a105-cff6c35f7a58	L’Espion de la Royal Academy	Teikoku no Supai!	10	1	Atsuhiro Tomioka	2008-12-07	Les progrès des joueurs de Mark sont tels que les autres clubs de foot les espionnent. Les membres de Raimon se montreront-ils tous dignes de confiance?	- M. Wintersea n'est plus l'entraîneur de Raimon (il est renvoyé par Nelly car il a saboté le bus).\n- L'équipe apprend que Bobby est un espion de la Royal Academy.\n- Dans un flashback, on voit l'accident qu'à eu Erik Eagle.	https://www.youtube.com/watch?v=kWNQCFQslqY	2451ef9f-9bd1-499b-83fc-5505be405ed5
d102057f-4e62-4e78-b37d-a764e8256a1b	Recherche entraîneur désespérément	Shin Kantoku o Sagase!	11	1	Atsuhiro Tomioka	2008-12-14	Le match de l’équipe de Raimon face à celle de la Royal Academy est dans quelques jours, mais un problème se pose. L'équipe manque clairement d’un entraineur, vu que le dernier, M.Wintersea, a été exclu par Nelly Raimon. L'équipe tente alors le tout pour le tout, afin de trouver un nouvel entraineur dans les plus brefs délais.	- Seymour Hillman devient entraineur de l’équipe de Raimon.	https://www.youtube.com/watch?v=eTgsfdcQgoo	2451ef9f-9bd1-499b-83fc-5505be405ed5
9c282416-79fc-4340-bd9c-b0f42652c9a5	Finale contre la Royal Academy - Première partie !	Kessen! Teikoku Gakuen - Zenpen!!	12	1	Atsuhiro Tomioka	2008-12-21	Jour de match, l’équipe de Raimon affronte celle de la Royal Academy. Avant même que ce dernier ne débute, Jude cherche à connaitre la manière dont Ray Dark compte saboter le match, afin d’assurer la victoire de l’équipe de la Royal Academy.	- Il s’agit du premier match de Seymour Hillman en tant qu'entraineur de l’équipe de Raimon.\n- A la fin de l'épisode, Ray Dark est arrêté par la police car il a tenté de tuer les joueurs de Raimon en desserrant les boulons de poutres métalliques qui sont tombées sur la terrain.	https://www.youtube.com/watch?v=MrbbMD6ELxM	2451ef9f-9bd1-499b-83fc-5505be405ed5
99519aee-5871-4ab9-a5b5-2309e4e11117	Finale contre la Royal Academy - Deuxième partie !	Kessen! Teikoku Gakuen・Kōhen!!	13	1	Atsuhiro Tomioka	2008-12-28	Une arrestation a lieu. L'attaque menée sur la Royal Academy commence à porter ses fruits et laisse entrevoir une place au championnat national.	- Jude se blesse légèrement à la cheville durant le match.\n- A force d'encaisser des frappes, Bobby se blesse et sort. Il est remplacé par Jim.\n- Pour arrêter le Manchot Empereur Numéro 2, Mark utilise la Main Céleste avec ses deux mains.\n- Cette victoire de Raimon met fin à la série de victoire de 40 ans de la Royal Academy.	https://www.youtube.com/watch?v=bViWO4-pA_I	2451ef9f-9bd1-499b-83fc-5505be405ed5
2228af33-de0e-4227-916f-e958fea744cf	Le Onze Légendaire !	Densetsu no Irebun!	14	1	Atsuhiro Tomioka	2009-01-04	L’équipe de Raimon joue un match contre l’équipe du Onze d'Inazuma, qui sont complètement démotivés.		https://www.youtube.com/watch?v=R9XqeK3nLWo	2451ef9f-9bd1-499b-83fc-5505be405ed5
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	Et c'est parti pour le Championnat National !	Kita ze! Zenkoku taikai!!	15	1	Atsuhiro Tomioka	2009-01-11	Après leur entrainement, Miles Ryan, un ami de Nathan, lui demande de revenir dans le club d’athlétisme, mais Nathan hésite entre le football et l’athlétisme.	- Lors de l'épisode, Nathan est tiraillé entre le foot et l'athlétisme.\n- Le père de Nelly se retrouve à l'hôpital à cause d'un accident survenu lors de l'inspection du stade où se déroulera le football frontier.\n- Ray Dark est libéré de prison.	https://www.youtube.com/watch?v=5U4kqNl1WQg	2451ef9f-9bd1-499b-83fc-5505be405ed5
aeb63f75-d22d-492b-bfb3-700d2343c915	Les joueurs de foot Ninjas !	Yabure! Ninja sakkā!!	16	1	Atsuhiro Tomioka	2009-01-18	C'est le premier match de Raimon au Football Frontier. Les joueurs affrontent l'équipe Shuriken, un collège mystérieux qui utiliserait des techniques de ninja apprises par leur entraineur, qui s'appelle Igajima.	- Le coach de Shuriken enseigne à ces joueurs des techniques Ninja.\n- Le capitaine de Shuriken lance un défi à Axel que celui ce refuse. C'est finalement Nathan qui le relève.\n- Mark se blesse à la main durant le match.	https://youtu.be/aLSz45c3adc	2451ef9f-9bd1-499b-83fc-5505be405ed5
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	La décision de Jude !	Kidō no ketsui!	17	1	Atsuhiro Tomioka	2009-01-25	La Royal Academy subit une grande défaite et de nombreuses blessures. Alors que l'avenir d'un joueur est incertain, Mark fait une proposition surprenante.	- On apprend que la Royal Academy a perdu contre le collège Zeus 10 à 0. Le match a même du être interrompu.\n- On apprend que les parents de Jude et Célia sont mort dans un accident d'avion. La seule chose qui reste d'eux c'est un magazine de foot.\n- A cause de leurs progrès, le jeu des joueurs de Raimon se dérègle.\n- Axel propose à Jude de rejoindre les Raimon pour prendre sa revanche sur le collège Zeus.	https://www.youtube.com/watch?v=FmqM99yLnpQ	2451ef9f-9bd1-499b-83fc-5505be405ed5
4016b5fa-c380-496f-a3a5-251e48a9db66	Il faut pulvériser la Muraille Infinie !	Kudake! Mugen no Kabe!!	18	1	Atsuhiro Tomioka	2009-02-01	L'équipe de Raimon affronte le collège Terria, réputé pour son extraordinaire défense grâce à sa Muraille Infinie.	- Jude Sharp rejoint l'équipe de Raimon car Seymour Hillman le lui a demandé, afin que les joueurs de Raimon rejouent correctement, se fassent des passes correctes et réussissent leurs Supertechniques combinées.\n- Le collège Terria encaisse ses premiers buts dans le tournoi.\n- A la fin de l'épisode, Silvia reçoit un appel d'Erik qu'elle croyait mort.	https://www.youtube.com/watch?v=8cBVh6LkLVM	2451ef9f-9bd1-499b-83fc-5505be405ed5
926f5ca0-3486-4b57-97db-5d0e8f417d43	Le retour du petit génie du ballon rond !	Yomigaetta tensai!	19	1	Atsuhiro Tomioka	2009-02-08	Silvia et Bobby sont surpris de retrouver Erik, un ami d'enfance qu'ils croyaient mort et venu d'Amérique pour leur rendre visite.	- Erik rejoint Raimon. \n- Durant cet épisode, le Tir Hélicoptère s'appelle "Toupie Hurlante".	https://www.youtube.com/watch?v=U8u4Q9GPiR4	2451ef9f-9bd1-499b-83fc-5505be405ed5
69125a81-1480-486f-a2f1-2a6c6624187e	La super technique du Triangle Z !	Hissatsu no Toraianguru Z!	20	1	Atsuhiro Tomioka	2009-02-15	Raimon doit affronter Kirkwood, l'ancienne école d'Axel, lors du prochain match, mais les anciens coéquipiers d'Axel lui en veulent toujours d'être parti.	- Malcolm Night de Kirkwood est un ancien ami de Erik, Bobby et Silvia.\n - C'est la première fois que nous voyons la Supertechnique du Triangle Z dans l'Anime.	https://www.youtube.com/watch?v=OisLsqZf60M	2451ef9f-9bd1-499b-83fc-5505be405ed5
1ea85325-d23b-4700-8a5b-40884b779c52	Bataille féroce contre le collège Kirkwood	Gekitō! Kidokawa Sei Osamu!!	21	1	Atsuhiro Tomioka	2009-02-22	Les triplés se laissent tellement emporter par leur soif de vengeance envers Axel qu'ils risquent d'anéantir leurs propres chances de gagner.	- Raimon est en finale après quarante ans d'attente grâce à une victoire face au collège Kirkwood sur le score de 3-2.	https://www.youtube.com/watch?v=1198W2-WiS0	2451ef9f-9bd1-499b-83fc-5505be405ed5
d1564e33-79a5-42e2-a7fb-38f59297432b	Surpasser la Main Céleste !	God Hand o Koero!	22	1	Atsuhiro Tomioka	2009-03-01	Mark trouve une nouvelle Supertechnique de gardien, la Main Magique, mais ne parvient malheureusement pas à la maîtriser…	- On apprend que Ray Dark est le responsable de l'accident de Julia Blaze, la soeur d'Axel.	https://www.youtube.com/watch?v=XjuKnfiUEbA	2451ef9f-9bd1-499b-83fc-5505be405ed5
3b138675-1889-4e1e-b772-1a5189ff6301	Le défi de Byron !	Kami no chōsen-jō!	23	1	Atsuhiro Tomioka	2009-03-08	Le match contre le collège Zeus approche. Mark s'entraîne sans répit mais reste pessimiste sur l'issue du match, et il n'est pas le seul.	- Mark tente de maîtriser la main magique. \n- L'équipe de Raimon rencontre pour la première fois Byron Love, le capitaine de Zeus.	https://www.youtube.com/watch?v=mF-s_4G4--A	2451ef9f-9bd1-499b-83fc-5505be405ed5
a85b89de-2acd-4e95-a83a-31bf1edd6244	Au camp d'entraînement !	Gasshuku Yarō Ze!	24	1	Atsuhiro Tomioka	2009-03-15	Les enfants participent à un camp d'entraînement. L'équipe reprend confiance en s'entraînant à utiliser de nouvelles techniques pour le match contre Zeus.	- Afin que Mark réussisse à maîtriser la Main Magique, l'équipe organise un camp d'entraînement au collège./n - L'éclair Pulvérisant est réalisé avec Seymour, Axel et Jude.	https://www.youtube.com/watch?v=g5a-CDBibkc	2451ef9f-9bd1-499b-83fc-5505be405ed5
10c29f7a-f084-4eb4-87ab-419707c80fb4	Le grand match ! - Première partie	Saigo no Kessen!	25	1	Atsuhiro Tomioka	2009-03-22	Le match entre Zeus et Raimon commence enfin, et Zeus ne tarde pas à marquer trois buts. L'équipe Raimon arrivera-t-elle à se ressaisir?	- De nombreux joueurs sortent sur blessure du côté de Raimon (Timmy, Tod, Maxwell, Kevin et Willy). De ce fait, tous les joueurs de l'équipe ont joué.	https://www.youtube.com/watch?v=g5a-CDBibkc	2451ef9f-9bd1-499b-83fc-5505be405ed5
f453fce2-0cb7-4e97-952e-a72d4347a756	Le grand match ! -Deuxième partie - La Magie contre les Dieux	Gekitotsu! Kami VS Majin!!	26	1	Atsuhiro Tomioka	2009-03-29	Rien ne semble pouvoir arrêter Zeus et ses joueurs aux pouvoirs surnaturels, mais Mark maîtrise soudain une technique qui pourrait s'avérer précieuse.	- Mark Evans apprend la Main Magique.\n- On apprend que les boissons que boivent les joueurs de Zeus permettent d'augmenter leurs capacités, c'est le nectar des Dieux.	https://www.youtube.com/watch?v=ZVR_zNc1QiY	2451ef9f-9bd1-499b-83fc-5505be405ed5
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	Les extraterrestres débarquent !	Uchū-jin ga kita!	27	2	Atsuhiro Tomioka	2009-04-08	Après avoir gagné le Tournoi Frontier, le Raimon retourne dans sa ville pour célébrer la victoire avec leurs amis et leurs voisins. En ce moment, une étrange soucoupe tombe du ciel, juste sur les terrains du Collège Raimon ! Il s'agit de l'Académie Alius, des extraterrestres qui les mettent au défi dans un match de football. Il se peut que l'avenir de la planète Terre dépende de ce résultat...	- La Tempête des Gémeaux est la première équipe (à part Raimon) vue dans la Saison 2.	https://www.youtube.com/watch?v=aPpkkTh8WZk	2451ef9f-9bd1-499b-83fc-5505be405ed5
\.


--
-- Data for Name: episode_equipes_equipe; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.episode_equipes_equipe ("episodeId", "equipeId") FROM stdin;
fea90bfd-2d11-424f-ad2f-507e1562c1af	1065b087-500b-4129-b4aa-ff5247c15bfc
fea90bfd-2d11-424f-ad2f-507e1562c1af	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
fea90bfd-2d11-424f-ad2f-507e1562c1af	cf9a2353-f632-428d-b12e-a81c86a023cb
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	1065b087-500b-4129-b4aa-ff5247c15bfc
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	1065b087-500b-4129-b4aa-ff5247c15bfc
be80eb60-f867-454f-97e7-86a675c09f53	57e1080f-926b-4f05-a4fa-3d56704221c2
be80eb60-f867-454f-97e7-86a675c09f53	1065b087-500b-4129-b4aa-ff5247c15bfc
84593a3b-1264-49e0-8ffb-7383132558c0	1065b087-500b-4129-b4aa-ff5247c15bfc
66abafd9-5110-4c47-a81c-9a2a4f74cb08	1065b087-500b-4129-b4aa-ff5247c15bfc
66abafd9-5110-4c47-a81c-9a2a4f74cb08	0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00
b1806a16-509d-49e5-a2e2-3a484cd16455	1065b087-500b-4129-b4aa-ff5247c15bfc
b1806a16-509d-49e5-a2e2-3a484cd16455	1c35f137-9ba2-4536-ba1a-87de80e704a4
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	1065b087-500b-4129-b4aa-ff5247c15bfc
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	1c35f137-9ba2-4536-ba1a-87de80e704a4
22a06b40-2b8c-46a1-bc90-df535a96e07e	1065b087-500b-4129-b4aa-ff5247c15bfc
22a06b40-2b8c-46a1-bc90-df535a96e07e	1c35f137-9ba2-4536-ba1a-87de80e704a4
e3d98622-d761-402e-a105-cff6c35f7a58	1065b087-500b-4129-b4aa-ff5247c15bfc
e3d98622-d761-402e-a105-cff6c35f7a58	cf9a2353-f632-428d-b12e-a81c86a023cb
d102057f-4e62-4e78-b37d-a764e8256a1b	cf9a2353-f632-428d-b12e-a81c86a023cb
d102057f-4e62-4e78-b37d-a764e8256a1b	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
9c282416-79fc-4340-bd9c-b0f42652c9a5	cf9a2353-f632-428d-b12e-a81c86a023cb
9c282416-79fc-4340-bd9c-b0f42652c9a5	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
99519aee-5871-4ab9-a5b5-2309e4e11117	cf9a2353-f632-428d-b12e-a81c86a023cb
99519aee-5871-4ab9-a5b5-2309e4e11117	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
2228af33-de0e-4227-916f-e958fea744cf	1065b087-500b-4129-b4aa-ff5247c15bfc
2228af33-de0e-4227-916f-e958fea744cf	79de6a43-1c49-449e-bed9-a67965d23a37
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	1065b087-500b-4129-b4aa-ff5247c15bfc
aeb63f75-d22d-492b-bfb3-700d2343c915	1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5
aeb63f75-d22d-492b-bfb3-700d2343c915	1065b087-500b-4129-b4aa-ff5247c15bfc
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	1065b087-500b-4129-b4aa-ff5247c15bfc
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	2d695421-8627-4982-a86a-6e810e07f354
4016b5fa-c380-496f-a3a5-251e48a9db66	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
4016b5fa-c380-496f-a3a5-251e48a9db66	1065b087-500b-4129-b4aa-ff5247c15bfc
4016b5fa-c380-496f-a3a5-251e48a9db66	2d695421-8627-4982-a86a-6e810e07f354
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5
926f5ca0-3486-4b57-97db-5d0e8f417d43	1065b087-500b-4129-b4aa-ff5247c15bfc
69125a81-1480-486f-a2f1-2a6c6624187e	1065b087-500b-4129-b4aa-ff5247c15bfc
69125a81-1480-486f-a2f1-2a6c6624187e	5222805c-7848-4c9c-865d-0e6d6b71f885
1ea85325-d23b-4700-8a5b-40884b779c52	1065b087-500b-4129-b4aa-ff5247c15bfc
1ea85325-d23b-4700-8a5b-40884b779c52	5222805c-7848-4c9c-865d-0e6d6b71f885
d1564e33-79a5-42e2-a7fb-38f59297432b	1065b087-500b-4129-b4aa-ff5247c15bfc
3b138675-1889-4e1e-b772-1a5189ff6301	1065b087-500b-4129-b4aa-ff5247c15bfc
3b138675-1889-4e1e-b772-1a5189ff6301	82290c3e-1d64-407e-becb-7fcfe8fab4b6
a85b89de-2acd-4e95-a83a-31bf1edd6244	1065b087-500b-4129-b4aa-ff5247c15bfc
10c29f7a-f084-4eb4-87ab-419707c80fb4	1065b087-500b-4129-b4aa-ff5247c15bfc
10c29f7a-f084-4eb4-87ab-419707c80fb4	82290c3e-1d64-407e-becb-7fcfe8fab4b6
f453fce2-0cb7-4e97-952e-a72d4347a756	1065b087-500b-4129-b4aa-ff5247c15bfc
f453fce2-0cb7-4e97-952e-a72d4347a756	82290c3e-1d64-407e-becb-7fcfe8fab4b6
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	1065b087-500b-4129-b4aa-ff5247c15bfc
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	79de6a43-1c49-449e-bed9-a67965d23a37
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	890e4960-ab2b-4186-b351-568ff9092b27
\.


--
-- Data for Name: episode_matchs_match; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.episode_matchs_match ("episodeId", "matchId") FROM stdin;
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	b019f860-ba93-42b1-a67d-9de9755a595e
be80eb60-f867-454f-97e7-86a675c09f53	68a00b4a-ba72-4c2a-ba08-d1c2bc44b348
66abafd9-5110-4c47-a81c-9a2a4f74cb08	00282566-2519-4aef-9c52-805b2fc50f5d
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	c3847f17-5aac-4521-b7f8-4e11e39f96a9
22a06b40-2b8c-46a1-bc90-df535a96e07e	30e325d2-6051-42ca-a89d-f4296dc3c0b5
9c282416-79fc-4340-bd9c-b0f42652c9a5	38cd4e40-8bde-4cda-a758-106487cd52ba
99519aee-5871-4ab9-a5b5-2309e4e11117	38cd4e40-8bde-4cda-a758-106487cd52ba
2228af33-de0e-4227-916f-e958fea744cf	309dbe3a-6c37-4842-acd8-521a6e19c9a1
aeb63f75-d22d-492b-bfb3-700d2343c915	90b08eb9-3508-4129-8560-60db3686a580
4016b5fa-c380-496f-a3a5-251e48a9db66	847cb605-72f3-4c60-b254-55e9bfcbf7cf
1ea85325-d23b-4700-8a5b-40884b779c52	d3b1787f-9750-4e08-8437-6ebd521bec94
69125a81-1480-486f-a2f1-2a6c6624187e	d3b1787f-9750-4e08-8437-6ebd521bec94
f453fce2-0cb7-4e97-952e-a72d4347a756	345c2d60-a9d0-40e9-9055-00eb22bb6ad2
10c29f7a-f084-4eb4-87ab-419707c80fb4	345c2d60-a9d0-40e9-9055-00eb22bb6ad2
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	0a8c5e7d-a06b-453e-a1ed-74140f3e27d1
\.


--
-- Data for Name: episode_personnages_personnage; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.episode_personnages_personnage ("episodeId", "personnageId") FROM stdin;
fea90bfd-2d11-424f-ad2f-507e1562c1af	8cec069d-4385-4399-8949-dd221bcc2225
fea90bfd-2d11-424f-ad2f-507e1562c1af	03f04e6f-690c-43f0-a037-0bb816a768bc
fea90bfd-2d11-424f-ad2f-507e1562c1af	dee66d99-2fe1-4ff8-a327-cee3a0a284e9
fea90bfd-2d11-424f-ad2f-507e1562c1af	abc7ef7c-3342-41c8-94e8-0d1168acbbd4
fea90bfd-2d11-424f-ad2f-507e1562c1af	cbad2a62-82da-4c7f-bdd1-6c3b3666aa0c
fea90bfd-2d11-424f-ad2f-507e1562c1af	2262a0fd-6a23-4b63-840d-270ba57265f1
fea90bfd-2d11-424f-ad2f-507e1562c1af	d39825c3-b0fe-4a00-a481-f262a33d0843
fea90bfd-2d11-424f-ad2f-507e1562c1af	b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba
fea90bfd-2d11-424f-ad2f-507e1562c1af	71228913-c490-4f69-b53f-e610b64da380
fea90bfd-2d11-424f-ad2f-507e1562c1af	15130df5-6095-4a8a-8fb6-bc4dd33dc2b5
fea90bfd-2d11-424f-ad2f-507e1562c1af	2054bb43-179d-42d6-b601-31eb342745a9
fea90bfd-2d11-424f-ad2f-507e1562c1af	659b157a-8cc9-4442-ae93-3f8f635a81a6
fea90bfd-2d11-424f-ad2f-507e1562c1af	0ac890a8-3e5f-4267-8261-830d39b0b62d
fea90bfd-2d11-424f-ad2f-507e1562c1af	6f500bde-c229-48d8-9a48-6d38f2ce7191
fea90bfd-2d11-424f-ad2f-507e1562c1af	c5aabd21-29cd-4d77-b7b0-f071f971ed47
fea90bfd-2d11-424f-ad2f-507e1562c1af	dab55b53-7354-46fd-8914-ef48b8c695f0
fea90bfd-2d11-424f-ad2f-507e1562c1af	a1c91aa2-a103-41bc-a545-1590f1cb0547
fea90bfd-2d11-424f-ad2f-507e1562c1af	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
fea90bfd-2d11-424f-ad2f-507e1562c1af	747633f6-9821-4db8-81b5-cf2374cf773e
fea90bfd-2d11-424f-ad2f-507e1562c1af	4d076373-8444-4909-b28d-b7665c8b76f7
fea90bfd-2d11-424f-ad2f-507e1562c1af	3769c2dd-cf78-4848-9231-e780aa4fee69
fea90bfd-2d11-424f-ad2f-507e1562c1af	263138da-c55c-4347-925c-fb9e191d9aa8
fea90bfd-2d11-424f-ad2f-507e1562c1af	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
fea90bfd-2d11-424f-ad2f-507e1562c1af	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
fea90bfd-2d11-424f-ad2f-507e1562c1af	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
fea90bfd-2d11-424f-ad2f-507e1562c1af	ecbdf902-a03b-41d1-a25a-a267fcfa2a68
fea90bfd-2d11-424f-ad2f-507e1562c1af	f2fd840a-cde9-4152-84d0-849c05ac1c62
fea90bfd-2d11-424f-ad2f-507e1562c1af	abf2d23a-1707-44f1-8112-84ec5a76cbdf
fea90bfd-2d11-424f-ad2f-507e1562c1af	d89ca943-cde6-4aac-b755-7501f5373a23
fea90bfd-2d11-424f-ad2f-507e1562c1af	953bd7d8-4f95-491c-8b57-8476d0eb3687
fea90bfd-2d11-424f-ad2f-507e1562c1af	b4a5c408-a348-4cf0-852a-03c33447a3c5
fea90bfd-2d11-424f-ad2f-507e1562c1af	92533be6-64c4-4f6c-9efd-aee2097b2db2
fea90bfd-2d11-424f-ad2f-507e1562c1af	340ccd0c-f985-4ad7-a6ed-c61ee38774fa
fea90bfd-2d11-424f-ad2f-507e1562c1af	3a5352b6-d7a0-4b51-a013-7f2b005174c3
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	8cec069d-4385-4399-8949-dd221bcc2225
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	03f04e6f-690c-43f0-a037-0bb816a768bc
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	dee66d99-2fe1-4ff8-a327-cee3a0a284e9
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	abc7ef7c-3342-41c8-94e8-0d1168acbbd4
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	cbad2a62-82da-4c7f-bdd1-6c3b3666aa0c
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	2262a0fd-6a23-4b63-840d-270ba57265f1
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	d39825c3-b0fe-4a00-a481-f262a33d0843
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	71228913-c490-4f69-b53f-e610b64da380
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	15130df5-6095-4a8a-8fb6-bc4dd33dc2b5
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	2054bb43-179d-42d6-b601-31eb342745a9
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	659b157a-8cc9-4442-ae93-3f8f635a81a6
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	0ac890a8-3e5f-4267-8261-830d39b0b62d
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	6f500bde-c229-48d8-9a48-6d38f2ce7191
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	c5aabd21-29cd-4d77-b7b0-f071f971ed47
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	dab55b53-7354-46fd-8914-ef48b8c695f0
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	a1c91aa2-a103-41bc-a545-1590f1cb0547
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	747633f6-9821-4db8-81b5-cf2374cf773e
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	4d076373-8444-4909-b28d-b7665c8b76f7
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	3769c2dd-cf78-4848-9231-e780aa4fee69
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	263138da-c55c-4347-925c-fb9e191d9aa8
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	3a5352b6-d7a0-4b51-a013-7f2b005174c3
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	6161a098-a4c3-44ab-bd85-27de181c04ab
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	32506b0a-9ce3-43af-a8ea-c45fbffec805
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	b19604ab-673d-4030-99eb-b4b37ac73477
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	ddd9acce-0eb6-4141-bafd-6191c5fb0bc6
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	8cec069d-4385-4399-8949-dd221bcc2225
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	03f04e6f-690c-43f0-a037-0bb816a768bc
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	dee66d99-2fe1-4ff8-a327-cee3a0a284e9
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	abc7ef7c-3342-41c8-94e8-0d1168acbbd4
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	cbad2a62-82da-4c7f-bdd1-6c3b3666aa0c
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	2262a0fd-6a23-4b63-840d-270ba57265f1
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	d39825c3-b0fe-4a00-a481-f262a33d0843
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	71228913-c490-4f69-b53f-e610b64da380
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	2054bb43-179d-42d6-b601-31eb342745a9
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	659b157a-8cc9-4442-ae93-3f8f635a81a6
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	0ac890a8-3e5f-4267-8261-830d39b0b62d
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	6f500bde-c229-48d8-9a48-6d38f2ce7191
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	c5aabd21-29cd-4d77-b7b0-f071f971ed47
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	dab55b53-7354-46fd-8914-ef48b8c695f0
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	a1c91aa2-a103-41bc-a545-1590f1cb0547
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	747633f6-9821-4db8-81b5-cf2374cf773e
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	4d076373-8444-4909-b28d-b7665c8b76f7
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	3769c2dd-cf78-4848-9231-e780aa4fee69
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	263138da-c55c-4347-925c-fb9e191d9aa8
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	3a5352b6-d7a0-4b51-a013-7f2b005174c3
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	6161a098-a4c3-44ab-bd85-27de181c04ab
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	32506b0a-9ce3-43af-a8ea-c45fbffec805
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	662af6fd-27e6-4fd1-b37d-5e0cd51854fd
be80eb60-f867-454f-97e7-86a675c09f53	b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba
be80eb60-f867-454f-97e7-86a675c09f53	71228913-c490-4f69-b53f-e610b64da380
be80eb60-f867-454f-97e7-86a675c09f53	2054bb43-179d-42d6-b601-31eb342745a9
be80eb60-f867-454f-97e7-86a675c09f53	659b157a-8cc9-4442-ae93-3f8f635a81a6
be80eb60-f867-454f-97e7-86a675c09f53	0ac890a8-3e5f-4267-8261-830d39b0b62d
be80eb60-f867-454f-97e7-86a675c09f53	6f500bde-c229-48d8-9a48-6d38f2ce7191
be80eb60-f867-454f-97e7-86a675c09f53	c5aabd21-29cd-4d77-b7b0-f071f971ed47
be80eb60-f867-454f-97e7-86a675c09f53	dab55b53-7354-46fd-8914-ef48b8c695f0
be80eb60-f867-454f-97e7-86a675c09f53	a1c91aa2-a103-41bc-a545-1590f1cb0547
be80eb60-f867-454f-97e7-86a675c09f53	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
be80eb60-f867-454f-97e7-86a675c09f53	747633f6-9821-4db8-81b5-cf2374cf773e
be80eb60-f867-454f-97e7-86a675c09f53	4d076373-8444-4909-b28d-b7665c8b76f7
be80eb60-f867-454f-97e7-86a675c09f53	3769c2dd-cf78-4848-9231-e780aa4fee69
be80eb60-f867-454f-97e7-86a675c09f53	263138da-c55c-4347-925c-fb9e191d9aa8
be80eb60-f867-454f-97e7-86a675c09f53	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
be80eb60-f867-454f-97e7-86a675c09f53	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
be80eb60-f867-454f-97e7-86a675c09f53	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
be80eb60-f867-454f-97e7-86a675c09f53	3a5352b6-d7a0-4b51-a013-7f2b005174c3
be80eb60-f867-454f-97e7-86a675c09f53	15130df5-6095-4a8a-8fb6-bc4dd33dc2b5
be80eb60-f867-454f-97e7-86a675c09f53	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
be80eb60-f867-454f-97e7-86a675c09f53	b19604ab-673d-4030-99eb-b4b37ac73477
be80eb60-f867-454f-97e7-86a675c09f53	b6bd3c06-c2cb-4778-bbfe-beaa53a0c08c
be80eb60-f867-454f-97e7-86a675c09f53	67ae090d-cbdf-4abe-87e9-25175d91b2ce
be80eb60-f867-454f-97e7-86a675c09f53	f5c97f0c-cc65-4988-93ba-3aba38d62b7d
be80eb60-f867-454f-97e7-86a675c09f53	e36c919a-ae19-49d1-87b3-e9e8fa7cbfe7
be80eb60-f867-454f-97e7-86a675c09f53	9c54352d-5f66-4807-8848-4ae47a876066
be80eb60-f867-454f-97e7-86a675c09f53	3ba1c774-d82c-4875-b9f0-3bbcd9a145d5
be80eb60-f867-454f-97e7-86a675c09f53	03cb1061-77a8-4795-b8c8-2f1f056253e1
be80eb60-f867-454f-97e7-86a675c09f53	6b5b1c34-e2cc-44c4-806d-a2927a62368b
be80eb60-f867-454f-97e7-86a675c09f53	de217141-cfb6-4a2a-bb74-689764d901b8
be80eb60-f867-454f-97e7-86a675c09f53	68419050-a862-4810-b4a4-1a35cfa72991
be80eb60-f867-454f-97e7-86a675c09f53	174f1e51-e6fe-4277-af06-d71e9ee4066a
be80eb60-f867-454f-97e7-86a675c09f53	0312c39a-a06e-4259-9d3f-7619ba5603a4
84593a3b-1264-49e0-8ffb-7383132558c0	71228913-c490-4f69-b53f-e610b64da380
84593a3b-1264-49e0-8ffb-7383132558c0	2054bb43-179d-42d6-b601-31eb342745a9
84593a3b-1264-49e0-8ffb-7383132558c0	659b157a-8cc9-4442-ae93-3f8f635a81a6
84593a3b-1264-49e0-8ffb-7383132558c0	0ac890a8-3e5f-4267-8261-830d39b0b62d
84593a3b-1264-49e0-8ffb-7383132558c0	6f500bde-c229-48d8-9a48-6d38f2ce7191
84593a3b-1264-49e0-8ffb-7383132558c0	c5aabd21-29cd-4d77-b7b0-f071f971ed47
84593a3b-1264-49e0-8ffb-7383132558c0	dab55b53-7354-46fd-8914-ef48b8c695f0
84593a3b-1264-49e0-8ffb-7383132558c0	a1c91aa2-a103-41bc-a545-1590f1cb0547
84593a3b-1264-49e0-8ffb-7383132558c0	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
84593a3b-1264-49e0-8ffb-7383132558c0	747633f6-9821-4db8-81b5-cf2374cf773e
84593a3b-1264-49e0-8ffb-7383132558c0	4d076373-8444-4909-b28d-b7665c8b76f7
84593a3b-1264-49e0-8ffb-7383132558c0	3769c2dd-cf78-4848-9231-e780aa4fee69
84593a3b-1264-49e0-8ffb-7383132558c0	263138da-c55c-4347-925c-fb9e191d9aa8
84593a3b-1264-49e0-8ffb-7383132558c0	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
84593a3b-1264-49e0-8ffb-7383132558c0	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
84593a3b-1264-49e0-8ffb-7383132558c0	3a5352b6-d7a0-4b51-a013-7f2b005174c3
84593a3b-1264-49e0-8ffb-7383132558c0	15130df5-6095-4a8a-8fb6-bc4dd33dc2b5
84593a3b-1264-49e0-8ffb-7383132558c0	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
84593a3b-1264-49e0-8ffb-7383132558c0	ecbdf902-a03b-41d1-a25a-a267fcfa2a68
84593a3b-1264-49e0-8ffb-7383132558c0	ddd9acce-0eb6-4141-bafd-6191c5fb0bc6
84593a3b-1264-49e0-8ffb-7383132558c0	ef13a8be-9aff-484c-881d-5dd0e8631f66
84593a3b-1264-49e0-8ffb-7383132558c0	677ac23b-3140-4ef4-a71b-6821191f067b
84593a3b-1264-49e0-8ffb-7383132558c0	9ca1f59f-d79b-4297-bc5b-c37760ddd7c0
66abafd9-5110-4c47-a81c-9a2a4f74cb08	2054bb43-179d-42d6-b601-31eb342745a9
66abafd9-5110-4c47-a81c-9a2a4f74cb08	659b157a-8cc9-4442-ae93-3f8f635a81a6
66abafd9-5110-4c47-a81c-9a2a4f74cb08	0ac890a8-3e5f-4267-8261-830d39b0b62d
66abafd9-5110-4c47-a81c-9a2a4f74cb08	6f500bde-c229-48d8-9a48-6d38f2ce7191
66abafd9-5110-4c47-a81c-9a2a4f74cb08	c5aabd21-29cd-4d77-b7b0-f071f971ed47
66abafd9-5110-4c47-a81c-9a2a4f74cb08	dab55b53-7354-46fd-8914-ef48b8c695f0
66abafd9-5110-4c47-a81c-9a2a4f74cb08	a1c91aa2-a103-41bc-a545-1590f1cb0547
66abafd9-5110-4c47-a81c-9a2a4f74cb08	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
66abafd9-5110-4c47-a81c-9a2a4f74cb08	747633f6-9821-4db8-81b5-cf2374cf773e
66abafd9-5110-4c47-a81c-9a2a4f74cb08	4d076373-8444-4909-b28d-b7665c8b76f7
66abafd9-5110-4c47-a81c-9a2a4f74cb08	3769c2dd-cf78-4848-9231-e780aa4fee69
66abafd9-5110-4c47-a81c-9a2a4f74cb08	263138da-c55c-4347-925c-fb9e191d9aa8
66abafd9-5110-4c47-a81c-9a2a4f74cb08	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
66abafd9-5110-4c47-a81c-9a2a4f74cb08	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
66abafd9-5110-4c47-a81c-9a2a4f74cb08	3a5352b6-d7a0-4b51-a013-7f2b005174c3
66abafd9-5110-4c47-a81c-9a2a4f74cb08	15130df5-6095-4a8a-8fb6-bc4dd33dc2b5
66abafd9-5110-4c47-a81c-9a2a4f74cb08	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
66abafd9-5110-4c47-a81c-9a2a4f74cb08	ddd9acce-0eb6-4141-bafd-6191c5fb0bc6
66abafd9-5110-4c47-a81c-9a2a4f74cb08	677ac23b-3140-4ef4-a71b-6821191f067b
66abafd9-5110-4c47-a81c-9a2a4f74cb08	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
66abafd9-5110-4c47-a81c-9a2a4f74cb08	662af6fd-27e6-4fd1-b37d-5e0cd51854fd
66abafd9-5110-4c47-a81c-9a2a4f74cb08	b19604ab-673d-4030-99eb-b4b37ac73477
66abafd9-5110-4c47-a81c-9a2a4f74cb08	e0aad6ef-b183-45c5-a2a5-69f7ac7577c5
66abafd9-5110-4c47-a81c-9a2a4f74cb08	1d16af31-8260-4617-a678-9b4a69af14c7
66abafd9-5110-4c47-a81c-9a2a4f74cb08	75842ba4-b8b1-46f3-a69b-d79627616252
66abafd9-5110-4c47-a81c-9a2a4f74cb08	68649379-8432-432d-8c2a-9e9da6f85b4f
66abafd9-5110-4c47-a81c-9a2a4f74cb08	7b05699b-226e-4242-b58f-f651cfe9dce0
66abafd9-5110-4c47-a81c-9a2a4f74cb08	e5d26f46-92f6-466f-ad34-2a96c4db2feb
66abafd9-5110-4c47-a81c-9a2a4f74cb08	208caad5-f36d-4897-bc92-ea51f2c170d8
66abafd9-5110-4c47-a81c-9a2a4f74cb08	da361f3b-8118-4ca1-a85b-3a24dad64f39
66abafd9-5110-4c47-a81c-9a2a4f74cb08	e7e060a0-88ee-4fd4-8c7e-0ea64fcb49b8
66abafd9-5110-4c47-a81c-9a2a4f74cb08	c7424678-8012-408c-9619-67d859a6ec68
66abafd9-5110-4c47-a81c-9a2a4f74cb08	9531a2cd-8613-4103-948c-846a9ba434d1
66abafd9-5110-4c47-a81c-9a2a4f74cb08	874b6396-3f54-4c0d-b3c5-34603de4587a
66abafd9-5110-4c47-a81c-9a2a4f74cb08	699e1215-8ec3-42aa-96fa-317b3ba0064c
66abafd9-5110-4c47-a81c-9a2a4f74cb08	17c637de-a2b5-430d-bb67-b36a3315039c
b1806a16-509d-49e5-a2e2-3a484cd16455	71228913-c490-4f69-b53f-e610b64da380
b1806a16-509d-49e5-a2e2-3a484cd16455	2054bb43-179d-42d6-b601-31eb342745a9
b1806a16-509d-49e5-a2e2-3a484cd16455	659b157a-8cc9-4442-ae93-3f8f635a81a6
b1806a16-509d-49e5-a2e2-3a484cd16455	0ac890a8-3e5f-4267-8261-830d39b0b62d
b1806a16-509d-49e5-a2e2-3a484cd16455	6f500bde-c229-48d8-9a48-6d38f2ce7191
b1806a16-509d-49e5-a2e2-3a484cd16455	c5aabd21-29cd-4d77-b7b0-f071f971ed47
b1806a16-509d-49e5-a2e2-3a484cd16455	dab55b53-7354-46fd-8914-ef48b8c695f0
b1806a16-509d-49e5-a2e2-3a484cd16455	a1c91aa2-a103-41bc-a545-1590f1cb0547
b1806a16-509d-49e5-a2e2-3a484cd16455	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
b1806a16-509d-49e5-a2e2-3a484cd16455	747633f6-9821-4db8-81b5-cf2374cf773e
b1806a16-509d-49e5-a2e2-3a484cd16455	4d076373-8444-4909-b28d-b7665c8b76f7
b1806a16-509d-49e5-a2e2-3a484cd16455	3769c2dd-cf78-4848-9231-e780aa4fee69
b1806a16-509d-49e5-a2e2-3a484cd16455	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
b1806a16-509d-49e5-a2e2-3a484cd16455	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
b1806a16-509d-49e5-a2e2-3a484cd16455	3a5352b6-d7a0-4b51-a013-7f2b005174c3
b1806a16-509d-49e5-a2e2-3a484cd16455	15130df5-6095-4a8a-8fb6-bc4dd33dc2b5
b1806a16-509d-49e5-a2e2-3a484cd16455	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
b1806a16-509d-49e5-a2e2-3a484cd16455	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
b1806a16-509d-49e5-a2e2-3a484cd16455	b7df9bbc-f07e-49ce-9656-b3a9aa28599c
b1806a16-509d-49e5-a2e2-3a484cd16455	5e6d1787-b640-4298-9eb6-1b0bb16cfe0e
b1806a16-509d-49e5-a2e2-3a484cd16455	d82544c2-17f7-4220-8eee-14a1bb9db0bf
b1806a16-509d-49e5-a2e2-3a484cd16455	b21cb196-f946-4dff-a692-99a51cd10f60
b1806a16-509d-49e5-a2e2-3a484cd16455	d5da612b-ce45-4031-a1bc-b1b69dd41402
b1806a16-509d-49e5-a2e2-3a484cd16455	3b78b8c1-6f1a-4e7e-96f3-b78f53cc4223
b1806a16-509d-49e5-a2e2-3a484cd16455	e30fff21-0043-4c3a-9374-1b909054355c
b1806a16-509d-49e5-a2e2-3a484cd16455	4aba2444-d816-4b4d-b1a7-8d41a39843ac
b1806a16-509d-49e5-a2e2-3a484cd16455	1b288bd9-dd9d-4c04-9871-438c5bd55011
b1806a16-509d-49e5-a2e2-3a484cd16455	620231b8-ee3a-4fce-a3ae-619dec3fc8b9
b1806a16-509d-49e5-a2e2-3a484cd16455	56b727e0-dd56-4dbb-a3b3-8e9bbaafdea5
b1806a16-509d-49e5-a2e2-3a484cd16455	7fa3bcd9-3c9c-495a-9a83-484413865cab
b1806a16-509d-49e5-a2e2-3a484cd16455	f0b62557-ee52-4bed-912d-8592f4020873
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	71228913-c490-4f69-b53f-e610b64da380
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	2054bb43-179d-42d6-b601-31eb342745a9
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	659b157a-8cc9-4442-ae93-3f8f635a81a6
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	0ac890a8-3e5f-4267-8261-830d39b0b62d
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	6f500bde-c229-48d8-9a48-6d38f2ce7191
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	c5aabd21-29cd-4d77-b7b0-f071f971ed47
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	dab55b53-7354-46fd-8914-ef48b8c695f0
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	a1c91aa2-a103-41bc-a545-1590f1cb0547
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	747633f6-9821-4db8-81b5-cf2374cf773e
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	4d076373-8444-4909-b28d-b7665c8b76f7
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	3769c2dd-cf78-4848-9231-e780aa4fee69
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	3a5352b6-d7a0-4b51-a013-7f2b005174c3
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	15130df5-6095-4a8a-8fb6-bc4dd33dc2b5
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	b7df9bbc-f07e-49ce-9656-b3a9aa28599c
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	5e6d1787-b640-4298-9eb6-1b0bb16cfe0e
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	d82544c2-17f7-4220-8eee-14a1bb9db0bf
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	b21cb196-f946-4dff-a692-99a51cd10f60
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	d5da612b-ce45-4031-a1bc-b1b69dd41402
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	3b78b8c1-6f1a-4e7e-96f3-b78f53cc4223
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	e30fff21-0043-4c3a-9374-1b909054355c
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	4aba2444-d816-4b4d-b1a7-8d41a39843ac
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	1b288bd9-dd9d-4c04-9871-438c5bd55011
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	620231b8-ee3a-4fce-a3ae-619dec3fc8b9
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	56b727e0-dd56-4dbb-a3b3-8e9bbaafdea5
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	7fa3bcd9-3c9c-495a-9a83-484413865cab
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	263138da-c55c-4347-925c-fb9e191d9aa8
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	b19604ab-673d-4030-99eb-b4b37ac73477
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	ddd9acce-0eb6-4141-bafd-6191c5fb0bc6
22a06b40-2b8c-46a1-bc90-df535a96e07e	2054bb43-179d-42d6-b601-31eb342745a9
22a06b40-2b8c-46a1-bc90-df535a96e07e	659b157a-8cc9-4442-ae93-3f8f635a81a6
22a06b40-2b8c-46a1-bc90-df535a96e07e	0ac890a8-3e5f-4267-8261-830d39b0b62d
22a06b40-2b8c-46a1-bc90-df535a96e07e	6f500bde-c229-48d8-9a48-6d38f2ce7191
22a06b40-2b8c-46a1-bc90-df535a96e07e	c5aabd21-29cd-4d77-b7b0-f071f971ed47
22a06b40-2b8c-46a1-bc90-df535a96e07e	dab55b53-7354-46fd-8914-ef48b8c695f0
22a06b40-2b8c-46a1-bc90-df535a96e07e	a1c91aa2-a103-41bc-a545-1590f1cb0547
22a06b40-2b8c-46a1-bc90-df535a96e07e	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
22a06b40-2b8c-46a1-bc90-df535a96e07e	747633f6-9821-4db8-81b5-cf2374cf773e
22a06b40-2b8c-46a1-bc90-df535a96e07e	4d076373-8444-4909-b28d-b7665c8b76f7
22a06b40-2b8c-46a1-bc90-df535a96e07e	3769c2dd-cf78-4848-9231-e780aa4fee69
22a06b40-2b8c-46a1-bc90-df535a96e07e	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
22a06b40-2b8c-46a1-bc90-df535a96e07e	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
22a06b40-2b8c-46a1-bc90-df535a96e07e	3a5352b6-d7a0-4b51-a013-7f2b005174c3
22a06b40-2b8c-46a1-bc90-df535a96e07e	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
22a06b40-2b8c-46a1-bc90-df535a96e07e	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
22a06b40-2b8c-46a1-bc90-df535a96e07e	b19604ab-673d-4030-99eb-b4b37ac73477
22a06b40-2b8c-46a1-bc90-df535a96e07e	58ef1277-fec8-4518-ab58-ab16373ec581
22a06b40-2b8c-46a1-bc90-df535a96e07e	ad37155a-e705-40fd-88ad-e55ffc322494
22a06b40-2b8c-46a1-bc90-df535a96e07e	e9119b2e-1b37-493b-a4d0-7279d2e8daf1
22a06b40-2b8c-46a1-bc90-df535a96e07e	80f3cc8a-5da9-47c3-94c2-6f424d395155
22a06b40-2b8c-46a1-bc90-df535a96e07e	fe856efa-7e36-480f-a7cf-9988b6cef346
22a06b40-2b8c-46a1-bc90-df535a96e07e	a2306519-360f-4c44-a0d3-bd6633f73d8b
22a06b40-2b8c-46a1-bc90-df535a96e07e	16ef9970-c3d7-4a88-b9ef-d40071a17d43
22a06b40-2b8c-46a1-bc90-df535a96e07e	15190503-fc61-43ad-8a91-4e8b0009dbf8
22a06b40-2b8c-46a1-bc90-df535a96e07e	2f7ed9f8-e502-4cb3-b095-da1099fc6b84
22a06b40-2b8c-46a1-bc90-df535a96e07e	cbad2a62-82da-4c7f-bdd1-6c3b3666aa0c
22a06b40-2b8c-46a1-bc90-df535a96e07e	7cda746f-c186-4f88-bc9f-9e402a84c0e8
22a06b40-2b8c-46a1-bc90-df535a96e07e	5294f95e-ca64-4d59-8130-fe405ea6e50a
e3d98622-d761-402e-a105-cff6c35f7a58	2054bb43-179d-42d6-b601-31eb342745a9
e3d98622-d761-402e-a105-cff6c35f7a58	659b157a-8cc9-4442-ae93-3f8f635a81a6
e3d98622-d761-402e-a105-cff6c35f7a58	0ac890a8-3e5f-4267-8261-830d39b0b62d
e3d98622-d761-402e-a105-cff6c35f7a58	6f500bde-c229-48d8-9a48-6d38f2ce7191
e3d98622-d761-402e-a105-cff6c35f7a58	c5aabd21-29cd-4d77-b7b0-f071f971ed47
e3d98622-d761-402e-a105-cff6c35f7a58	dab55b53-7354-46fd-8914-ef48b8c695f0
e3d98622-d761-402e-a105-cff6c35f7a58	a1c91aa2-a103-41bc-a545-1590f1cb0547
e3d98622-d761-402e-a105-cff6c35f7a58	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
e3d98622-d761-402e-a105-cff6c35f7a58	747633f6-9821-4db8-81b5-cf2374cf773e
e3d98622-d761-402e-a105-cff6c35f7a58	4d076373-8444-4909-b28d-b7665c8b76f7
e3d98622-d761-402e-a105-cff6c35f7a58	3769c2dd-cf78-4848-9231-e780aa4fee69
e3d98622-d761-402e-a105-cff6c35f7a58	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
e3d98622-d761-402e-a105-cff6c35f7a58	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
e3d98622-d761-402e-a105-cff6c35f7a58	3a5352b6-d7a0-4b51-a013-7f2b005174c3
e3d98622-d761-402e-a105-cff6c35f7a58	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
e3d98622-d761-402e-a105-cff6c35f7a58	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
e3d98622-d761-402e-a105-cff6c35f7a58	31550e7f-09a0-42f6-8fb2-b53579ba3f95
e3d98622-d761-402e-a105-cff6c35f7a58	d49dd7a8-3943-4f1a-9264-4d2760b83753
e3d98622-d761-402e-a105-cff6c35f7a58	abf2d23a-1707-44f1-8112-84ec5a76cbdf
e3d98622-d761-402e-a105-cff6c35f7a58	d89ca943-cde6-4aac-b755-7501f5373a23
e3d98622-d761-402e-a105-cff6c35f7a58	340ccd0c-f985-4ad7-a6ed-c61ee38774fa
e3d98622-d761-402e-a105-cff6c35f7a58	953bd7d8-4f95-491c-8b57-8476d0eb3687
e3d98622-d761-402e-a105-cff6c35f7a58	b4a5c408-a348-4cf0-852a-03c33447a3c5
e3d98622-d761-402e-a105-cff6c35f7a58	92533be6-64c4-4f6c-9efd-aee2097b2db2
e3d98622-d761-402e-a105-cff6c35f7a58	f2fd840a-cde9-4152-84d0-849c05ac1c62
e3d98622-d761-402e-a105-cff6c35f7a58	15130df5-6095-4a8a-8fb6-bc4dd33dc2b5
e3d98622-d761-402e-a105-cff6c35f7a58	263138da-c55c-4347-925c-fb9e191d9aa8
e3d98622-d761-402e-a105-cff6c35f7a58	71228913-c490-4f69-b53f-e610b64da380
d102057f-4e62-4e78-b37d-a764e8256a1b	3a5352b6-d7a0-4b51-a013-7f2b005174c3
d102057f-4e62-4e78-b37d-a764e8256a1b	8cec069d-4385-4399-8949-dd221bcc2225
d102057f-4e62-4e78-b37d-a764e8256a1b	03f04e6f-690c-43f0-a037-0bb816a768bc
d102057f-4e62-4e78-b37d-a764e8256a1b	dee66d99-2fe1-4ff8-a327-cee3a0a284e9
d102057f-4e62-4e78-b37d-a764e8256a1b	abc7ef7c-3342-41c8-94e8-0d1168acbbd4
d102057f-4e62-4e78-b37d-a764e8256a1b	cbad2a62-82da-4c7f-bdd1-6c3b3666aa0c
d102057f-4e62-4e78-b37d-a764e8256a1b	2262a0fd-6a23-4b63-840d-270ba57265f1
d102057f-4e62-4e78-b37d-a764e8256a1b	d39825c3-b0fe-4a00-a481-f262a33d0843
d102057f-4e62-4e78-b37d-a764e8256a1b	b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba
d102057f-4e62-4e78-b37d-a764e8256a1b	71228913-c490-4f69-b53f-e610b64da380
d102057f-4e62-4e78-b37d-a764e8256a1b	15130df5-6095-4a8a-8fb6-bc4dd33dc2b5
d102057f-4e62-4e78-b37d-a764e8256a1b	2054bb43-179d-42d6-b601-31eb342745a9
d102057f-4e62-4e78-b37d-a764e8256a1b	659b157a-8cc9-4442-ae93-3f8f635a81a6
d102057f-4e62-4e78-b37d-a764e8256a1b	0ac890a8-3e5f-4267-8261-830d39b0b62d
d102057f-4e62-4e78-b37d-a764e8256a1b	6f500bde-c229-48d8-9a48-6d38f2ce7191
d102057f-4e62-4e78-b37d-a764e8256a1b	c5aabd21-29cd-4d77-b7b0-f071f971ed47
d102057f-4e62-4e78-b37d-a764e8256a1b	dab55b53-7354-46fd-8914-ef48b8c695f0
d102057f-4e62-4e78-b37d-a764e8256a1b	a1c91aa2-a103-41bc-a545-1590f1cb0547
d102057f-4e62-4e78-b37d-a764e8256a1b	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
d102057f-4e62-4e78-b37d-a764e8256a1b	747633f6-9821-4db8-81b5-cf2374cf773e
d102057f-4e62-4e78-b37d-a764e8256a1b	4d076373-8444-4909-b28d-b7665c8b76f7
d102057f-4e62-4e78-b37d-a764e8256a1b	3769c2dd-cf78-4848-9231-e780aa4fee69
d102057f-4e62-4e78-b37d-a764e8256a1b	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
d102057f-4e62-4e78-b37d-a764e8256a1b	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
d102057f-4e62-4e78-b37d-a764e8256a1b	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
d102057f-4e62-4e78-b37d-a764e8256a1b	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
d102057f-4e62-4e78-b37d-a764e8256a1b	677ac23b-3140-4ef4-a71b-6821191f067b
d102057f-4e62-4e78-b37d-a764e8256a1b	d7dc7c66-c665-45e1-9352-0f246b765a37
d102057f-4e62-4e78-b37d-a764e8256a1b	ddd9acce-0eb6-4141-bafd-6191c5fb0bc6
d102057f-4e62-4e78-b37d-a764e8256a1b	32506b0a-9ce3-43af-a8ea-c45fbffec805
d102057f-4e62-4e78-b37d-a764e8256a1b	6161a098-a4c3-44ab-bd85-27de181c04ab
9c282416-79fc-4340-bd9c-b0f42652c9a5	3a5352b6-d7a0-4b51-a013-7f2b005174c3
9c282416-79fc-4340-bd9c-b0f42652c9a5	8cec069d-4385-4399-8949-dd221bcc2225
9c282416-79fc-4340-bd9c-b0f42652c9a5	03f04e6f-690c-43f0-a037-0bb816a768bc
9c282416-79fc-4340-bd9c-b0f42652c9a5	dee66d99-2fe1-4ff8-a327-cee3a0a284e9
9c282416-79fc-4340-bd9c-b0f42652c9a5	abc7ef7c-3342-41c8-94e8-0d1168acbbd4
9c282416-79fc-4340-bd9c-b0f42652c9a5	cbad2a62-82da-4c7f-bdd1-6c3b3666aa0c
9c282416-79fc-4340-bd9c-b0f42652c9a5	2262a0fd-6a23-4b63-840d-270ba57265f1
9c282416-79fc-4340-bd9c-b0f42652c9a5	d39825c3-b0fe-4a00-a481-f262a33d0843
9c282416-79fc-4340-bd9c-b0f42652c9a5	b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba
9c282416-79fc-4340-bd9c-b0f42652c9a5	71228913-c490-4f69-b53f-e610b64da380
9c282416-79fc-4340-bd9c-b0f42652c9a5	15130df5-6095-4a8a-8fb6-bc4dd33dc2b5
9c282416-79fc-4340-bd9c-b0f42652c9a5	2054bb43-179d-42d6-b601-31eb342745a9
9c282416-79fc-4340-bd9c-b0f42652c9a5	659b157a-8cc9-4442-ae93-3f8f635a81a6
9c282416-79fc-4340-bd9c-b0f42652c9a5	0ac890a8-3e5f-4267-8261-830d39b0b62d
9c282416-79fc-4340-bd9c-b0f42652c9a5	6f500bde-c229-48d8-9a48-6d38f2ce7191
9c282416-79fc-4340-bd9c-b0f42652c9a5	c5aabd21-29cd-4d77-b7b0-f071f971ed47
9c282416-79fc-4340-bd9c-b0f42652c9a5	dab55b53-7354-46fd-8914-ef48b8c695f0
9c282416-79fc-4340-bd9c-b0f42652c9a5	a1c91aa2-a103-41bc-a545-1590f1cb0547
9c282416-79fc-4340-bd9c-b0f42652c9a5	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
9c282416-79fc-4340-bd9c-b0f42652c9a5	747633f6-9821-4db8-81b5-cf2374cf773e
9c282416-79fc-4340-bd9c-b0f42652c9a5	4d076373-8444-4909-b28d-b7665c8b76f7
9c282416-79fc-4340-bd9c-b0f42652c9a5	3769c2dd-cf78-4848-9231-e780aa4fee69
9c282416-79fc-4340-bd9c-b0f42652c9a5	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
9c282416-79fc-4340-bd9c-b0f42652c9a5	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
9c282416-79fc-4340-bd9c-b0f42652c9a5	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
9c282416-79fc-4340-bd9c-b0f42652c9a5	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
9c282416-79fc-4340-bd9c-b0f42652c9a5	677ac23b-3140-4ef4-a71b-6821191f067b
9c282416-79fc-4340-bd9c-b0f42652c9a5	ddd9acce-0eb6-4141-bafd-6191c5fb0bc6
9c282416-79fc-4340-bd9c-b0f42652c9a5	32506b0a-9ce3-43af-a8ea-c45fbffec805
9c282416-79fc-4340-bd9c-b0f42652c9a5	6161a098-a4c3-44ab-bd85-27de181c04ab
9c282416-79fc-4340-bd9c-b0f42652c9a5	b19604ab-673d-4030-99eb-b4b37ac73477
9c282416-79fc-4340-bd9c-b0f42652c9a5	d7dc7c66-c665-45e1-9352-0f246b765a37
99519aee-5871-4ab9-a5b5-2309e4e11117	3a5352b6-d7a0-4b51-a013-7f2b005174c3
99519aee-5871-4ab9-a5b5-2309e4e11117	8cec069d-4385-4399-8949-dd221bcc2225
99519aee-5871-4ab9-a5b5-2309e4e11117	03f04e6f-690c-43f0-a037-0bb816a768bc
99519aee-5871-4ab9-a5b5-2309e4e11117	dee66d99-2fe1-4ff8-a327-cee3a0a284e9
99519aee-5871-4ab9-a5b5-2309e4e11117	abc7ef7c-3342-41c8-94e8-0d1168acbbd4
99519aee-5871-4ab9-a5b5-2309e4e11117	cbad2a62-82da-4c7f-bdd1-6c3b3666aa0c
99519aee-5871-4ab9-a5b5-2309e4e11117	2262a0fd-6a23-4b63-840d-270ba57265f1
99519aee-5871-4ab9-a5b5-2309e4e11117	d39825c3-b0fe-4a00-a481-f262a33d0843
99519aee-5871-4ab9-a5b5-2309e4e11117	b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba
99519aee-5871-4ab9-a5b5-2309e4e11117	71228913-c490-4f69-b53f-e610b64da380
99519aee-5871-4ab9-a5b5-2309e4e11117	15130df5-6095-4a8a-8fb6-bc4dd33dc2b5
99519aee-5871-4ab9-a5b5-2309e4e11117	2054bb43-179d-42d6-b601-31eb342745a9
99519aee-5871-4ab9-a5b5-2309e4e11117	659b157a-8cc9-4442-ae93-3f8f635a81a6
99519aee-5871-4ab9-a5b5-2309e4e11117	0ac890a8-3e5f-4267-8261-830d39b0b62d
99519aee-5871-4ab9-a5b5-2309e4e11117	6f500bde-c229-48d8-9a48-6d38f2ce7191
99519aee-5871-4ab9-a5b5-2309e4e11117	c5aabd21-29cd-4d77-b7b0-f071f971ed47
99519aee-5871-4ab9-a5b5-2309e4e11117	dab55b53-7354-46fd-8914-ef48b8c695f0
99519aee-5871-4ab9-a5b5-2309e4e11117	a1c91aa2-a103-41bc-a545-1590f1cb0547
99519aee-5871-4ab9-a5b5-2309e4e11117	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
99519aee-5871-4ab9-a5b5-2309e4e11117	747633f6-9821-4db8-81b5-cf2374cf773e
99519aee-5871-4ab9-a5b5-2309e4e11117	4d076373-8444-4909-b28d-b7665c8b76f7
99519aee-5871-4ab9-a5b5-2309e4e11117	3769c2dd-cf78-4848-9231-e780aa4fee69
99519aee-5871-4ab9-a5b5-2309e4e11117	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
99519aee-5871-4ab9-a5b5-2309e4e11117	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
99519aee-5871-4ab9-a5b5-2309e4e11117	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
99519aee-5871-4ab9-a5b5-2309e4e11117	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
99519aee-5871-4ab9-a5b5-2309e4e11117	677ac23b-3140-4ef4-a71b-6821191f067b
99519aee-5871-4ab9-a5b5-2309e4e11117	ddd9acce-0eb6-4141-bafd-6191c5fb0bc6
99519aee-5871-4ab9-a5b5-2309e4e11117	32506b0a-9ce3-43af-a8ea-c45fbffec805
99519aee-5871-4ab9-a5b5-2309e4e11117	6161a098-a4c3-44ab-bd85-27de181c04ab
99519aee-5871-4ab9-a5b5-2309e4e11117	b19604ab-673d-4030-99eb-b4b37ac73477
99519aee-5871-4ab9-a5b5-2309e4e11117	662af6fd-27e6-4fd1-b37d-5e0cd51854fd
2228af33-de0e-4227-916f-e958fea744cf	3a5352b6-d7a0-4b51-a013-7f2b005174c3
2228af33-de0e-4227-916f-e958fea744cf	71228913-c490-4f69-b53f-e610b64da380
2228af33-de0e-4227-916f-e958fea744cf	2054bb43-179d-42d6-b601-31eb342745a9
2228af33-de0e-4227-916f-e958fea744cf	659b157a-8cc9-4442-ae93-3f8f635a81a6
2228af33-de0e-4227-916f-e958fea744cf	0ac890a8-3e5f-4267-8261-830d39b0b62d
2228af33-de0e-4227-916f-e958fea744cf	6f500bde-c229-48d8-9a48-6d38f2ce7191
2228af33-de0e-4227-916f-e958fea744cf	c5aabd21-29cd-4d77-b7b0-f071f971ed47
2228af33-de0e-4227-916f-e958fea744cf	dab55b53-7354-46fd-8914-ef48b8c695f0
2228af33-de0e-4227-916f-e958fea744cf	a1c91aa2-a103-41bc-a545-1590f1cb0547
2228af33-de0e-4227-916f-e958fea744cf	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
2228af33-de0e-4227-916f-e958fea744cf	747633f6-9821-4db8-81b5-cf2374cf773e
2228af33-de0e-4227-916f-e958fea744cf	4d076373-8444-4909-b28d-b7665c8b76f7
2228af33-de0e-4227-916f-e958fea744cf	3769c2dd-cf78-4848-9231-e780aa4fee69
2228af33-de0e-4227-916f-e958fea744cf	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
2228af33-de0e-4227-916f-e958fea744cf	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
2228af33-de0e-4227-916f-e958fea744cf	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
2228af33-de0e-4227-916f-e958fea744cf	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
2228af33-de0e-4227-916f-e958fea744cf	677ac23b-3140-4ef4-a71b-6821191f067b
2228af33-de0e-4227-916f-e958fea744cf	cc364f58-137d-4afe-b16b-edd8a8dc7b8b
2228af33-de0e-4227-916f-e958fea744cf	f9401078-3c51-4a72-a43f-bd81a83bc724
2228af33-de0e-4227-916f-e958fea744cf	699e1215-8ec3-42aa-96fa-317b3ba0064c
2228af33-de0e-4227-916f-e958fea744cf	b6a5161f-7a10-4a31-b06c-65803682bcfc
2228af33-de0e-4227-916f-e958fea744cf	e536088e-f3c2-4bcb-a862-da890a7e1a39
2228af33-de0e-4227-916f-e958fea744cf	54413027-9466-4433-af3f-48c047f1207d
2228af33-de0e-4227-916f-e958fea744cf	1fcf9196-0db5-4f3c-a465-563b2f2eca76
2228af33-de0e-4227-916f-e958fea744cf	4489ff9f-6ffd-4331-a70b-f70fb744d824
2228af33-de0e-4227-916f-e958fea744cf	c050c6c1-1d2a-4dda-9365-dec2acfa96b0
2228af33-de0e-4227-916f-e958fea744cf	2fb8ba8f-9b3e-401d-90e6-e5f95442f7ba
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	2262a0fd-6a23-4b63-840d-270ba57265f1
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	cbad2a62-82da-4c7f-bdd1-6c3b3666aa0c
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	abc7ef7c-3342-41c8-94e8-0d1168acbbd4
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	dee66d99-2fe1-4ff8-a327-cee3a0a284e9
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	03f04e6f-690c-43f0-a037-0bb816a768bc
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	8cec069d-4385-4399-8949-dd221bcc2225
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	3a5352b6-d7a0-4b51-a013-7f2b005174c3
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	d39825c3-b0fe-4a00-a481-f262a33d0843
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	b19604ab-673d-4030-99eb-b4b37ac73477
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	6161a098-a4c3-44ab-bd85-27de181c04ab
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	32506b0a-9ce3-43af-a8ea-c45fbffec805
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	ddd9acce-0eb6-4141-bafd-6191c5fb0bc6
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	677ac23b-3140-4ef4-a71b-6821191f067b
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	3769c2dd-cf78-4848-9231-e780aa4fee69
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	4d076373-8444-4909-b28d-b7665c8b76f7
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	747633f6-9821-4db8-81b5-cf2374cf773e
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	a1c91aa2-a103-41bc-a545-1590f1cb0547
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	dab55b53-7354-46fd-8914-ef48b8c695f0
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	c5aabd21-29cd-4d77-b7b0-f071f971ed47
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	6f500bde-c229-48d8-9a48-6d38f2ce7191
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	0ac890a8-3e5f-4267-8261-830d39b0b62d
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	659b157a-8cc9-4442-ae93-3f8f635a81a6
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	2054bb43-179d-42d6-b601-31eb342745a9
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	15130df5-6095-4a8a-8fb6-bc4dd33dc2b5
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	71228913-c490-4f69-b53f-e610b64da380
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	699e1215-8ec3-42aa-96fa-317b3ba0064c
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	f0b62557-ee52-4bed-912d-8592f4020873
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	96d83900-d6fc-48c1-bd7c-50275e74e8ad
aeb63f75-d22d-492b-bfb3-700d2343c915	3a5352b6-d7a0-4b51-a013-7f2b005174c3
aeb63f75-d22d-492b-bfb3-700d2343c915	677ac23b-3140-4ef4-a71b-6821191f067b
aeb63f75-d22d-492b-bfb3-700d2343c915	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
aeb63f75-d22d-492b-bfb3-700d2343c915	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
aeb63f75-d22d-492b-bfb3-700d2343c915	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
aeb63f75-d22d-492b-bfb3-700d2343c915	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
aeb63f75-d22d-492b-bfb3-700d2343c915	3769c2dd-cf78-4848-9231-e780aa4fee69
aeb63f75-d22d-492b-bfb3-700d2343c915	4d076373-8444-4909-b28d-b7665c8b76f7
aeb63f75-d22d-492b-bfb3-700d2343c915	747633f6-9821-4db8-81b5-cf2374cf773e
aeb63f75-d22d-492b-bfb3-700d2343c915	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
aeb63f75-d22d-492b-bfb3-700d2343c915	a1c91aa2-a103-41bc-a545-1590f1cb0547
aeb63f75-d22d-492b-bfb3-700d2343c915	dab55b53-7354-46fd-8914-ef48b8c695f0
aeb63f75-d22d-492b-bfb3-700d2343c915	c5aabd21-29cd-4d77-b7b0-f071f971ed47
aeb63f75-d22d-492b-bfb3-700d2343c915	6f500bde-c229-48d8-9a48-6d38f2ce7191
aeb63f75-d22d-492b-bfb3-700d2343c915	0ac890a8-3e5f-4267-8261-830d39b0b62d
aeb63f75-d22d-492b-bfb3-700d2343c915	659b157a-8cc9-4442-ae93-3f8f635a81a6
aeb63f75-d22d-492b-bfb3-700d2343c915	2054bb43-179d-42d6-b601-31eb342745a9
aeb63f75-d22d-492b-bfb3-700d2343c915	71228913-c490-4f69-b53f-e610b64da380
aeb63f75-d22d-492b-bfb3-700d2343c915	f0b62557-ee52-4bed-912d-8592f4020873
aeb63f75-d22d-492b-bfb3-700d2343c915	96d83900-d6fc-48c1-bd7c-50275e74e8ad
aeb63f75-d22d-492b-bfb3-700d2343c915	f6799d62-0e60-4dcd-b3be-a8e9ecb60ea5
aeb63f75-d22d-492b-bfb3-700d2343c915	7f296a30-104f-4803-b711-ea7fff34de1c
aeb63f75-d22d-492b-bfb3-700d2343c915	457cea5b-6cd2-4dc7-9e38-8d0f23f88ef8
aeb63f75-d22d-492b-bfb3-700d2343c915	0c8c9915-327c-414d-80db-4e16a0e8e9dc
aeb63f75-d22d-492b-bfb3-700d2343c915	3359d42e-77e7-4a33-b08c-abad892c829e
aeb63f75-d22d-492b-bfb3-700d2343c915	172cb42c-94e9-4b8b-9d45-aad21d0c2552
aeb63f75-d22d-492b-bfb3-700d2343c915	6be300b6-aff9-4c3c-91ce-ddab2217b2a3
aeb63f75-d22d-492b-bfb3-700d2343c915	75401584-d7cc-4ef2-b3aa-bb293ba8ff2c
aeb63f75-d22d-492b-bfb3-700d2343c915	18ce93b1-e30d-48db-9dc9-57c555dde8a1
aeb63f75-d22d-492b-bfb3-700d2343c915	b4ce3897-6134-439b-b071-2c68f4cd65e9
aeb63f75-d22d-492b-bfb3-700d2343c915	06876434-2c1d-4c96-b18c-ca13f5b93f3e
aeb63f75-d22d-492b-bfb3-700d2343c915	caf4be28-0825-49d3-81c8-f2b88b6aeeec
aeb63f75-d22d-492b-bfb3-700d2343c915	6428bcc4-0d35-4e1a-be7b-1e71ccd5cde4
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	3a5352b6-d7a0-4b51-a013-7f2b005174c3
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	677ac23b-3140-4ef4-a71b-6821191f067b
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	3769c2dd-cf78-4848-9231-e780aa4fee69
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	4d076373-8444-4909-b28d-b7665c8b76f7
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	747633f6-9821-4db8-81b5-cf2374cf773e
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	a1c91aa2-a103-41bc-a545-1590f1cb0547
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	dab55b53-7354-46fd-8914-ef48b8c695f0
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	c5aabd21-29cd-4d77-b7b0-f071f971ed47
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	6f500bde-c229-48d8-9a48-6d38f2ce7191
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	0ac890a8-3e5f-4267-8261-830d39b0b62d
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	659b157a-8cc9-4442-ae93-3f8f635a81a6
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	2054bb43-179d-42d6-b601-31eb342745a9
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	71228913-c490-4f69-b53f-e610b64da380
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	8cec069d-4385-4399-8949-dd221bcc2225
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	dee66d99-2fe1-4ff8-a327-cee3a0a284e9
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	abc7ef7c-3342-41c8-94e8-0d1168acbbd4
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	ab24eb32-8578-461c-8e2c-5638b29a3123
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	6161a098-a4c3-44ab-bd85-27de181c04ab
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	32506b0a-9ce3-43af-a8ea-c45fbffec805
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	2262a0fd-6a23-4b63-840d-270ba57265f1
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	d39825c3-b0fe-4a00-a481-f262a33d0843
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	03f04e6f-690c-43f0-a037-0bb816a768bc
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	15130df5-6095-4a8a-8fb6-bc4dd33dc2b5
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	007caf86-1bf9-42a9-a163-a95ed8663eb0
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	f0435863-c6f2-471f-bb14-84623acae1af
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	1bcbe7f3-bc0d-4f8e-a8f9-63de56b6e23e
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	5a5edb3c-0f9d-49e5-a05d-431224792e30
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	6203bb89-4dab-4f4f-a147-70f1e20f3a23
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	94cddb77-77e6-4cd4-a3cf-1ca582d7bafa
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	3fb4a546-96fa-4bd2-a312-cd3629c3e391
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	31e32402-8790-4d6d-bc25-05b327645ac2
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	4a3b664b-bb2d-4f8a-8eed-16e67d2d533e
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	60a80520-1f58-4701-8d3c-3d82d530e956
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	33fa83e0-37c4-4f3e-b3c5-ce344ca305d8
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	4fe3495f-7aef-428f-8563-c2c8209b2583
4016b5fa-c380-496f-a3a5-251e48a9db66	3a5352b6-d7a0-4b51-a013-7f2b005174c3
4016b5fa-c380-496f-a3a5-251e48a9db66	677ac23b-3140-4ef4-a71b-6821191f067b
4016b5fa-c380-496f-a3a5-251e48a9db66	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
4016b5fa-c380-496f-a3a5-251e48a9db66	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
4016b5fa-c380-496f-a3a5-251e48a9db66	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
4016b5fa-c380-496f-a3a5-251e48a9db66	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
4016b5fa-c380-496f-a3a5-251e48a9db66	3769c2dd-cf78-4848-9231-e780aa4fee69
4016b5fa-c380-496f-a3a5-251e48a9db66	4d076373-8444-4909-b28d-b7665c8b76f7
4016b5fa-c380-496f-a3a5-251e48a9db66	747633f6-9821-4db8-81b5-cf2374cf773e
4016b5fa-c380-496f-a3a5-251e48a9db66	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
4016b5fa-c380-496f-a3a5-251e48a9db66	a1c91aa2-a103-41bc-a545-1590f1cb0547
4016b5fa-c380-496f-a3a5-251e48a9db66	dab55b53-7354-46fd-8914-ef48b8c695f0
4016b5fa-c380-496f-a3a5-251e48a9db66	c5aabd21-29cd-4d77-b7b0-f071f971ed47
4016b5fa-c380-496f-a3a5-251e48a9db66	6f500bde-c229-48d8-9a48-6d38f2ce7191
4016b5fa-c380-496f-a3a5-251e48a9db66	0ac890a8-3e5f-4267-8261-830d39b0b62d
4016b5fa-c380-496f-a3a5-251e48a9db66	659b157a-8cc9-4442-ae93-3f8f635a81a6
4016b5fa-c380-496f-a3a5-251e48a9db66	2054bb43-179d-42d6-b601-31eb342745a9
4016b5fa-c380-496f-a3a5-251e48a9db66	71228913-c490-4f69-b53f-e610b64da380
4016b5fa-c380-496f-a3a5-251e48a9db66	007caf86-1bf9-42a9-a163-a95ed8663eb0
4016b5fa-c380-496f-a3a5-251e48a9db66	f0435863-c6f2-471f-bb14-84623acae1af
4016b5fa-c380-496f-a3a5-251e48a9db66	1bcbe7f3-bc0d-4f8e-a8f9-63de56b6e23e
4016b5fa-c380-496f-a3a5-251e48a9db66	5a5edb3c-0f9d-49e5-a05d-431224792e30
4016b5fa-c380-496f-a3a5-251e48a9db66	6203bb89-4dab-4f4f-a147-70f1e20f3a23
4016b5fa-c380-496f-a3a5-251e48a9db66	94cddb77-77e6-4cd4-a3cf-1ca582d7bafa
4016b5fa-c380-496f-a3a5-251e48a9db66	3fb4a546-96fa-4bd2-a312-cd3629c3e391
4016b5fa-c380-496f-a3a5-251e48a9db66	31e32402-8790-4d6d-bc25-05b327645ac2
4016b5fa-c380-496f-a3a5-251e48a9db66	4a3b664b-bb2d-4f8a-8eed-16e67d2d533e
4016b5fa-c380-496f-a3a5-251e48a9db66	60a80520-1f58-4701-8d3c-3d82d530e956
4016b5fa-c380-496f-a3a5-251e48a9db66	33fa83e0-37c4-4f3e-b3c5-ce344ca305d8
4016b5fa-c380-496f-a3a5-251e48a9db66	4fe3495f-7aef-428f-8563-c2c8209b2583
4016b5fa-c380-496f-a3a5-251e48a9db66	f6799d62-0e60-4dcd-b3be-a8e9ecb60ea5
99519aee-5871-4ab9-a5b5-2309e4e11117	97c4b6c5-8604-4d6d-a76b-6816816d1e87
99519aee-5871-4ab9-a5b5-2309e4e11117	d7dc7c66-c665-45e1-9352-0f246b765a37
fea90bfd-2d11-424f-ad2f-507e1562c1af	6161a098-a4c3-44ab-bd85-27de181c04ab
fea90bfd-2d11-424f-ad2f-507e1562c1af	32506b0a-9ce3-43af-a8ea-c45fbffec805
84593a3b-1264-49e0-8ffb-7383132558c0	17c637de-a2b5-430d-bb67-b36a3315039c
84593a3b-1264-49e0-8ffb-7383132558c0	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
b1806a16-509d-49e5-a2e2-3a484cd16455	677ac23b-3140-4ef4-a71b-6821191f067b
e3d98622-d761-402e-a105-cff6c35f7a58	41ed930e-fdde-455c-b75f-305ff5c59d7c
d102057f-4e62-4e78-b37d-a764e8256a1b	f0b62557-ee52-4bed-912d-8592f4020873
e3d98622-d761-402e-a105-cff6c35f7a58	97c4b6c5-8604-4d6d-a76b-6816816d1e87
d102057f-4e62-4e78-b37d-a764e8256a1b	97c4b6c5-8604-4d6d-a76b-6816816d1e87
d102057f-4e62-4e78-b37d-a764e8256a1b	6373b006-878f-4a40-8729-349c2a27fa20
2228af33-de0e-4227-916f-e958fea744cf	97c4b6c5-8604-4d6d-a76b-6816816d1e87
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	7f296a30-104f-4803-b711-ea7fff34de1c
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	457cea5b-6cd2-4dc7-9e38-8d0f23f88ef8
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	0c8c9915-327c-414d-80db-4e16a0e8e9dc
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	3359d42e-77e7-4a33-b08c-abad892c829e
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	172cb42c-94e9-4b8b-9d45-aad21d0c2552
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	6be300b6-aff9-4c3c-91ce-ddab2217b2a3
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	75401584-d7cc-4ef2-b3aa-bb293ba8ff2c
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	18ce93b1-e30d-48db-9dc9-57c555dde8a1
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	b4ce3897-6134-439b-b071-2c68f4cd65e9
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	06876434-2c1d-4c96-b18c-ca13f5b93f3e
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	caf4be28-0825-49d3-81c8-f2b88b6aeeec
926f5ca0-3486-4b57-97db-5d0e8f417d43	3a5352b6-d7a0-4b51-a013-7f2b005174c3
926f5ca0-3486-4b57-97db-5d0e8f417d43	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
926f5ca0-3486-4b57-97db-5d0e8f417d43	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
926f5ca0-3486-4b57-97db-5d0e8f417d43	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
926f5ca0-3486-4b57-97db-5d0e8f417d43	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
926f5ca0-3486-4b57-97db-5d0e8f417d43	3769c2dd-cf78-4848-9231-e780aa4fee69
926f5ca0-3486-4b57-97db-5d0e8f417d43	4d076373-8444-4909-b28d-b7665c8b76f7
926f5ca0-3486-4b57-97db-5d0e8f417d43	747633f6-9821-4db8-81b5-cf2374cf773e
926f5ca0-3486-4b57-97db-5d0e8f417d43	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
926f5ca0-3486-4b57-97db-5d0e8f417d43	a1c91aa2-a103-41bc-a545-1590f1cb0547
926f5ca0-3486-4b57-97db-5d0e8f417d43	dab55b53-7354-46fd-8914-ef48b8c695f0
926f5ca0-3486-4b57-97db-5d0e8f417d43	c5aabd21-29cd-4d77-b7b0-f071f971ed47
926f5ca0-3486-4b57-97db-5d0e8f417d43	6f500bde-c229-48d8-9a48-6d38f2ce7191
926f5ca0-3486-4b57-97db-5d0e8f417d43	0ac890a8-3e5f-4267-8261-830d39b0b62d
926f5ca0-3486-4b57-97db-5d0e8f417d43	659b157a-8cc9-4442-ae93-3f8f635a81a6
926f5ca0-3486-4b57-97db-5d0e8f417d43	2054bb43-179d-42d6-b601-31eb342745a9
926f5ca0-3486-4b57-97db-5d0e8f417d43	71228913-c490-4f69-b53f-e610b64da380
926f5ca0-3486-4b57-97db-5d0e8f417d43	41ed930e-fdde-455c-b75f-305ff5c59d7c
926f5ca0-3486-4b57-97db-5d0e8f417d43	03f04e6f-690c-43f0-a037-0bb816a768bc
926f5ca0-3486-4b57-97db-5d0e8f417d43	f0b62557-ee52-4bed-912d-8592f4020873
926f5ca0-3486-4b57-97db-5d0e8f417d43	ecbdf902-a03b-41d1-a25a-a267fcfa2a68
926f5ca0-3486-4b57-97db-5d0e8f417d43	ad246772-bdd1-4423-9dd6-8435ac38b82d
69125a81-1480-486f-a2f1-2a6c6624187e	3769c2dd-cf78-4848-9231-e780aa4fee69
69125a81-1480-486f-a2f1-2a6c6624187e	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
69125a81-1480-486f-a2f1-2a6c6624187e	71228913-c490-4f69-b53f-e610b64da380
69125a81-1480-486f-a2f1-2a6c6624187e	41ed930e-fdde-455c-b75f-305ff5c59d7c
69125a81-1480-486f-a2f1-2a6c6624187e	2054bb43-179d-42d6-b601-31eb342745a9
69125a81-1480-486f-a2f1-2a6c6624187e	659b157a-8cc9-4442-ae93-3f8f635a81a6
69125a81-1480-486f-a2f1-2a6c6624187e	0ac890a8-3e5f-4267-8261-830d39b0b62d
69125a81-1480-486f-a2f1-2a6c6624187e	6f500bde-c229-48d8-9a48-6d38f2ce7191
69125a81-1480-486f-a2f1-2a6c6624187e	c5aabd21-29cd-4d77-b7b0-f071f971ed47
69125a81-1480-486f-a2f1-2a6c6624187e	dab55b53-7354-46fd-8914-ef48b8c695f0
69125a81-1480-486f-a2f1-2a6c6624187e	3a5352b6-d7a0-4b51-a013-7f2b005174c3
69125a81-1480-486f-a2f1-2a6c6624187e	a1c91aa2-a103-41bc-a545-1590f1cb0547
69125a81-1480-486f-a2f1-2a6c6624187e	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
69125a81-1480-486f-a2f1-2a6c6624187e	747633f6-9821-4db8-81b5-cf2374cf773e
69125a81-1480-486f-a2f1-2a6c6624187e	4d076373-8444-4909-b28d-b7665c8b76f7
69125a81-1480-486f-a2f1-2a6c6624187e	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
69125a81-1480-486f-a2f1-2a6c6624187e	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
69125a81-1480-486f-a2f1-2a6c6624187e	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
69125a81-1480-486f-a2f1-2a6c6624187e	677ac23b-3140-4ef4-a71b-6821191f067b
69125a81-1480-486f-a2f1-2a6c6624187e	cec9c8ae-b54b-4698-a647-1cf2b645431a
69125a81-1480-486f-a2f1-2a6c6624187e	98af9d29-90fb-40e6-88e9-11203916e16a
69125a81-1480-486f-a2f1-2a6c6624187e	2b957305-0b01-4a68-90e6-a3393b771611
69125a81-1480-486f-a2f1-2a6c6624187e	76660524-10cb-42bd-a244-abdbf741be47
69125a81-1480-486f-a2f1-2a6c6624187e	d19e52a3-0b47-4532-aebc-230cbd2afb39
69125a81-1480-486f-a2f1-2a6c6624187e	70d67fb6-ab9c-411b-833c-044844bd014b
69125a81-1480-486f-a2f1-2a6c6624187e	0cd35f43-95e6-4cc8-a61c-24219e8c7b28
69125a81-1480-486f-a2f1-2a6c6624187e	92e565b0-9b87-4979-99a9-1a6867af1d0b
69125a81-1480-486f-a2f1-2a6c6624187e	9275d22c-5b74-4419-a28e-c97f8de72204
69125a81-1480-486f-a2f1-2a6c6624187e	ad246772-bdd1-4423-9dd6-8435ac38b82d
69125a81-1480-486f-a2f1-2a6c6624187e	34d4b5ff-39da-4a9f-ba98-4fab806a64ec
69125a81-1480-486f-a2f1-2a6c6624187e	06ee5357-6494-4ce5-b0ed-912d5f16b346
69125a81-1480-486f-a2f1-2a6c6624187e	b4a5c408-a348-4cf0-852a-03c33447a3c5
69125a81-1480-486f-a2f1-2a6c6624187e	abf2d23a-1707-44f1-8112-84ec5a76cbdf
69125a81-1480-486f-a2f1-2a6c6624187e	d49e4a1c-2b6e-4161-a035-e4de5431dfcf
69125a81-1480-486f-a2f1-2a6c6624187e	f6799d62-0e60-4dcd-b3be-a8e9ecb60ea5
69125a81-1480-486f-a2f1-2a6c6624187e	0f5bd1ea-3bdd-4199-8a83-2c42e066d7ed
1ea85325-d23b-4700-8a5b-40884b779c52	3769c2dd-cf78-4848-9231-e780aa4fee69
1ea85325-d23b-4700-8a5b-40884b779c52	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
1ea85325-d23b-4700-8a5b-40884b779c52	71228913-c490-4f69-b53f-e610b64da380
1ea85325-d23b-4700-8a5b-40884b779c52	41ed930e-fdde-455c-b75f-305ff5c59d7c
1ea85325-d23b-4700-8a5b-40884b779c52	2054bb43-179d-42d6-b601-31eb342745a9
1ea85325-d23b-4700-8a5b-40884b779c52	659b157a-8cc9-4442-ae93-3f8f635a81a6
1ea85325-d23b-4700-8a5b-40884b779c52	0ac890a8-3e5f-4267-8261-830d39b0b62d
1ea85325-d23b-4700-8a5b-40884b779c52	6f500bde-c229-48d8-9a48-6d38f2ce7191
1ea85325-d23b-4700-8a5b-40884b779c52	c5aabd21-29cd-4d77-b7b0-f071f971ed47
1ea85325-d23b-4700-8a5b-40884b779c52	dab55b53-7354-46fd-8914-ef48b8c695f0
1ea85325-d23b-4700-8a5b-40884b779c52	3a5352b6-d7a0-4b51-a013-7f2b005174c3
1ea85325-d23b-4700-8a5b-40884b779c52	a1c91aa2-a103-41bc-a545-1590f1cb0547
1ea85325-d23b-4700-8a5b-40884b779c52	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
1ea85325-d23b-4700-8a5b-40884b779c52	747633f6-9821-4db8-81b5-cf2374cf773e
1ea85325-d23b-4700-8a5b-40884b779c52	4d076373-8444-4909-b28d-b7665c8b76f7
1ea85325-d23b-4700-8a5b-40884b779c52	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
1ea85325-d23b-4700-8a5b-40884b779c52	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
1ea85325-d23b-4700-8a5b-40884b779c52	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
1ea85325-d23b-4700-8a5b-40884b779c52	677ac23b-3140-4ef4-a71b-6821191f067b
1ea85325-d23b-4700-8a5b-40884b779c52	cec9c8ae-b54b-4698-a647-1cf2b645431a
1ea85325-d23b-4700-8a5b-40884b779c52	98af9d29-90fb-40e6-88e9-11203916e16a
1ea85325-d23b-4700-8a5b-40884b779c52	2b957305-0b01-4a68-90e6-a3393b771611
1ea85325-d23b-4700-8a5b-40884b779c52	76660524-10cb-42bd-a244-abdbf741be47
1ea85325-d23b-4700-8a5b-40884b779c52	d19e52a3-0b47-4532-aebc-230cbd2afb39
1ea85325-d23b-4700-8a5b-40884b779c52	70d67fb6-ab9c-411b-833c-044844bd014b
1ea85325-d23b-4700-8a5b-40884b779c52	0cd35f43-95e6-4cc8-a61c-24219e8c7b28
1ea85325-d23b-4700-8a5b-40884b779c52	92e565b0-9b87-4979-99a9-1a6867af1d0b
1ea85325-d23b-4700-8a5b-40884b779c52	9275d22c-5b74-4419-a28e-c97f8de72204
1ea85325-d23b-4700-8a5b-40884b779c52	ad246772-bdd1-4423-9dd6-8435ac38b82d
1ea85325-d23b-4700-8a5b-40884b779c52	34d4b5ff-39da-4a9f-ba98-4fab806a64ec
1ea85325-d23b-4700-8a5b-40884b779c52	06ee5357-6494-4ce5-b0ed-912d5f16b346
1ea85325-d23b-4700-8a5b-40884b779c52	f6799d62-0e60-4dcd-b3be-a8e9ecb60ea5
1ea85325-d23b-4700-8a5b-40884b779c52	f0b62557-ee52-4bed-912d-8592f4020873
1ea85325-d23b-4700-8a5b-40884b779c52	ddd9acce-0eb6-4141-bafd-6191c5fb0bc6
d1564e33-79a5-42e2-a7fb-38f59297432b	3769c2dd-cf78-4848-9231-e780aa4fee69
d1564e33-79a5-42e2-a7fb-38f59297432b	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
d1564e33-79a5-42e2-a7fb-38f59297432b	71228913-c490-4f69-b53f-e610b64da380
d1564e33-79a5-42e2-a7fb-38f59297432b	41ed930e-fdde-455c-b75f-305ff5c59d7c
d1564e33-79a5-42e2-a7fb-38f59297432b	2054bb43-179d-42d6-b601-31eb342745a9
d1564e33-79a5-42e2-a7fb-38f59297432b	659b157a-8cc9-4442-ae93-3f8f635a81a6
d1564e33-79a5-42e2-a7fb-38f59297432b	0ac890a8-3e5f-4267-8261-830d39b0b62d
d1564e33-79a5-42e2-a7fb-38f59297432b	6f500bde-c229-48d8-9a48-6d38f2ce7191
d1564e33-79a5-42e2-a7fb-38f59297432b	c5aabd21-29cd-4d77-b7b0-f071f971ed47
d1564e33-79a5-42e2-a7fb-38f59297432b	dab55b53-7354-46fd-8914-ef48b8c695f0
d1564e33-79a5-42e2-a7fb-38f59297432b	3a5352b6-d7a0-4b51-a013-7f2b005174c3
d1564e33-79a5-42e2-a7fb-38f59297432b	a1c91aa2-a103-41bc-a545-1590f1cb0547
d1564e33-79a5-42e2-a7fb-38f59297432b	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
d1564e33-79a5-42e2-a7fb-38f59297432b	747633f6-9821-4db8-81b5-cf2374cf773e
d1564e33-79a5-42e2-a7fb-38f59297432b	4d076373-8444-4909-b28d-b7665c8b76f7
d1564e33-79a5-42e2-a7fb-38f59297432b	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
d1564e33-79a5-42e2-a7fb-38f59297432b	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
d1564e33-79a5-42e2-a7fb-38f59297432b	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
d1564e33-79a5-42e2-a7fb-38f59297432b	677ac23b-3140-4ef4-a71b-6821191f067b
d1564e33-79a5-42e2-a7fb-38f59297432b	0f5bd1ea-3bdd-4199-8a83-2c42e066d7ed
d1564e33-79a5-42e2-a7fb-38f59297432b	263138da-c55c-4347-925c-fb9e191d9aa8
d1564e33-79a5-42e2-a7fb-38f59297432b	ddd9acce-0eb6-4141-bafd-6191c5fb0bc6
d1564e33-79a5-42e2-a7fb-38f59297432b	f0b62557-ee52-4bed-912d-8592f4020873
d1564e33-79a5-42e2-a7fb-38f59297432b	15130df5-6095-4a8a-8fb6-bc4dd33dc2b5
d1564e33-79a5-42e2-a7fb-38f59297432b	699e1215-8ec3-42aa-96fa-317b3ba0064c
d1564e33-79a5-42e2-a7fb-38f59297432b	6373b006-878f-4a40-8729-349c2a27fa20
d1564e33-79a5-42e2-a7fb-38f59297432b	662af6fd-27e6-4fd1-b37d-5e0cd51854fd
d1564e33-79a5-42e2-a7fb-38f59297432b	44d70996-1301-4db8-9b4a-ab4139a70488
3b138675-1889-4e1e-b772-1a5189ff6301	3769c2dd-cf78-4848-9231-e780aa4fee69
3b138675-1889-4e1e-b772-1a5189ff6301	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
3b138675-1889-4e1e-b772-1a5189ff6301	71228913-c490-4f69-b53f-e610b64da380
3b138675-1889-4e1e-b772-1a5189ff6301	41ed930e-fdde-455c-b75f-305ff5c59d7c
3b138675-1889-4e1e-b772-1a5189ff6301	2054bb43-179d-42d6-b601-31eb342745a9
3b138675-1889-4e1e-b772-1a5189ff6301	659b157a-8cc9-4442-ae93-3f8f635a81a6
3b138675-1889-4e1e-b772-1a5189ff6301	0ac890a8-3e5f-4267-8261-830d39b0b62d
3b138675-1889-4e1e-b772-1a5189ff6301	6f500bde-c229-48d8-9a48-6d38f2ce7191
3b138675-1889-4e1e-b772-1a5189ff6301	c5aabd21-29cd-4d77-b7b0-f071f971ed47
3b138675-1889-4e1e-b772-1a5189ff6301	dab55b53-7354-46fd-8914-ef48b8c695f0
3b138675-1889-4e1e-b772-1a5189ff6301	3a5352b6-d7a0-4b51-a013-7f2b005174c3
3b138675-1889-4e1e-b772-1a5189ff6301	a1c91aa2-a103-41bc-a545-1590f1cb0547
3b138675-1889-4e1e-b772-1a5189ff6301	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
3b138675-1889-4e1e-b772-1a5189ff6301	747633f6-9821-4db8-81b5-cf2374cf773e
3b138675-1889-4e1e-b772-1a5189ff6301	4d076373-8444-4909-b28d-b7665c8b76f7
3b138675-1889-4e1e-b772-1a5189ff6301	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
3b138675-1889-4e1e-b772-1a5189ff6301	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
3b138675-1889-4e1e-b772-1a5189ff6301	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
3b138675-1889-4e1e-b772-1a5189ff6301	677ac23b-3140-4ef4-a71b-6821191f067b
3b138675-1889-4e1e-b772-1a5189ff6301	0f5bd1ea-3bdd-4199-8a83-2c42e066d7ed
3b138675-1889-4e1e-b772-1a5189ff6301	15130df5-6095-4a8a-8fb6-bc4dd33dc2b5
3b138675-1889-4e1e-b772-1a5189ff6301	6373b006-878f-4a40-8729-349c2a27fa20
3b138675-1889-4e1e-b772-1a5189ff6301	662af6fd-27e6-4fd1-b37d-5e0cd51854fd
3b138675-1889-4e1e-b772-1a5189ff6301	c1626027-8553-4e4e-bb32-7a03cbfae72d
3b138675-1889-4e1e-b772-1a5189ff6301	a18a2659-32f1-4ecb-a85f-69db0ba4afb0
3b138675-1889-4e1e-b772-1a5189ff6301	c9bf9b95-78b0-4ac8-93ac-4624c051bed5
3b138675-1889-4e1e-b772-1a5189ff6301	3dcd6e8d-549f-41a4-8d5c-ef9fd754273c
3b138675-1889-4e1e-b772-1a5189ff6301	409aaf25-65be-47c6-88ac-6d483242c466
3b138675-1889-4e1e-b772-1a5189ff6301	209dd52f-b881-45aa-9b3d-e7eef9a76bed
3b138675-1889-4e1e-b772-1a5189ff6301	56d64848-6fe4-40b6-9d72-18a206da6562
3b138675-1889-4e1e-b772-1a5189ff6301	9e83bd19-bb8b-4247-bc5f-98e5390932a6
3b138675-1889-4e1e-b772-1a5189ff6301	ffee3101-5934-40c3-bb95-87392970ab9e
3b138675-1889-4e1e-b772-1a5189ff6301	dc525f85-31d6-49f9-bb41-1d7be3e5fd8a
3b138675-1889-4e1e-b772-1a5189ff6301	ecbdf902-a03b-41d1-a25a-a267fcfa2a68
a85b89de-2acd-4e95-a83a-31bf1edd6244	3769c2dd-cf78-4848-9231-e780aa4fee69
a85b89de-2acd-4e95-a83a-31bf1edd6244	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
a85b89de-2acd-4e95-a83a-31bf1edd6244	71228913-c490-4f69-b53f-e610b64da380
a85b89de-2acd-4e95-a83a-31bf1edd6244	41ed930e-fdde-455c-b75f-305ff5c59d7c
a85b89de-2acd-4e95-a83a-31bf1edd6244	2054bb43-179d-42d6-b601-31eb342745a9
a85b89de-2acd-4e95-a83a-31bf1edd6244	659b157a-8cc9-4442-ae93-3f8f635a81a6
a85b89de-2acd-4e95-a83a-31bf1edd6244	0ac890a8-3e5f-4267-8261-830d39b0b62d
a85b89de-2acd-4e95-a83a-31bf1edd6244	6f500bde-c229-48d8-9a48-6d38f2ce7191
a85b89de-2acd-4e95-a83a-31bf1edd6244	c5aabd21-29cd-4d77-b7b0-f071f971ed47
a85b89de-2acd-4e95-a83a-31bf1edd6244	dab55b53-7354-46fd-8914-ef48b8c695f0
a85b89de-2acd-4e95-a83a-31bf1edd6244	3a5352b6-d7a0-4b51-a013-7f2b005174c3
a85b89de-2acd-4e95-a83a-31bf1edd6244	a1c91aa2-a103-41bc-a545-1590f1cb0547
a85b89de-2acd-4e95-a83a-31bf1edd6244	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
a85b89de-2acd-4e95-a83a-31bf1edd6244	747633f6-9821-4db8-81b5-cf2374cf773e
a85b89de-2acd-4e95-a83a-31bf1edd6244	4d076373-8444-4909-b28d-b7665c8b76f7
a85b89de-2acd-4e95-a83a-31bf1edd6244	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
a85b89de-2acd-4e95-a83a-31bf1edd6244	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
a85b89de-2acd-4e95-a83a-31bf1edd6244	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
a85b89de-2acd-4e95-a83a-31bf1edd6244	677ac23b-3140-4ef4-a71b-6821191f067b
a85b89de-2acd-4e95-a83a-31bf1edd6244	c050c6c1-1d2a-4dda-9365-dec2acfa96b0
a85b89de-2acd-4e95-a83a-31bf1edd6244	2fb8ba8f-9b3e-401d-90e6-e5f95442f7ba
a85b89de-2acd-4e95-a83a-31bf1edd6244	1fcf9196-0db5-4f3c-a465-563b2f2eca76
a85b89de-2acd-4e95-a83a-31bf1edd6244	4489ff9f-6ffd-4331-a70b-f70fb744d824
a85b89de-2acd-4e95-a83a-31bf1edd6244	f9401078-3c51-4a72-a43f-bd81a83bc724
a85b89de-2acd-4e95-a83a-31bf1edd6244	699e1215-8ec3-42aa-96fa-317b3ba0064c
a85b89de-2acd-4e95-a83a-31bf1edd6244	15130df5-6095-4a8a-8fb6-bc4dd33dc2b5
a85b89de-2acd-4e95-a83a-31bf1edd6244	662af6fd-27e6-4fd1-b37d-5e0cd51854fd
a85b89de-2acd-4e95-a83a-31bf1edd6244	ecbdf902-a03b-41d1-a25a-a267fcfa2a68
10c29f7a-f084-4eb4-87ab-419707c80fb4	3769c2dd-cf78-4848-9231-e780aa4fee69
10c29f7a-f084-4eb4-87ab-419707c80fb4	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
10c29f7a-f084-4eb4-87ab-419707c80fb4	71228913-c490-4f69-b53f-e610b64da380
10c29f7a-f084-4eb4-87ab-419707c80fb4	41ed930e-fdde-455c-b75f-305ff5c59d7c
10c29f7a-f084-4eb4-87ab-419707c80fb4	2054bb43-179d-42d6-b601-31eb342745a9
10c29f7a-f084-4eb4-87ab-419707c80fb4	659b157a-8cc9-4442-ae93-3f8f635a81a6
10c29f7a-f084-4eb4-87ab-419707c80fb4	0ac890a8-3e5f-4267-8261-830d39b0b62d
10c29f7a-f084-4eb4-87ab-419707c80fb4	6f500bde-c229-48d8-9a48-6d38f2ce7191
10c29f7a-f084-4eb4-87ab-419707c80fb4	c5aabd21-29cd-4d77-b7b0-f071f971ed47
10c29f7a-f084-4eb4-87ab-419707c80fb4	dab55b53-7354-46fd-8914-ef48b8c695f0
10c29f7a-f084-4eb4-87ab-419707c80fb4	3a5352b6-d7a0-4b51-a013-7f2b005174c3
10c29f7a-f084-4eb4-87ab-419707c80fb4	a1c91aa2-a103-41bc-a545-1590f1cb0547
10c29f7a-f084-4eb4-87ab-419707c80fb4	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
10c29f7a-f084-4eb4-87ab-419707c80fb4	747633f6-9821-4db8-81b5-cf2374cf773e
10c29f7a-f084-4eb4-87ab-419707c80fb4	4d076373-8444-4909-b28d-b7665c8b76f7
10c29f7a-f084-4eb4-87ab-419707c80fb4	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
10c29f7a-f084-4eb4-87ab-419707c80fb4	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
10c29f7a-f084-4eb4-87ab-419707c80fb4	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
10c29f7a-f084-4eb4-87ab-419707c80fb4	677ac23b-3140-4ef4-a71b-6821191f067b
10c29f7a-f084-4eb4-87ab-419707c80fb4	15130df5-6095-4a8a-8fb6-bc4dd33dc2b5
10c29f7a-f084-4eb4-87ab-419707c80fb4	662af6fd-27e6-4fd1-b37d-5e0cd51854fd
10c29f7a-f084-4eb4-87ab-419707c80fb4	ecbdf902-a03b-41d1-a25a-a267fcfa2a68
10c29f7a-f084-4eb4-87ab-419707c80fb4	c9bf9b95-78b0-4ac8-93ac-4624c051bed5
10c29f7a-f084-4eb4-87ab-419707c80fb4	a18a2659-32f1-4ecb-a85f-69db0ba4afb0
10c29f7a-f084-4eb4-87ab-419707c80fb4	c1626027-8553-4e4e-bb32-7a03cbfae72d
10c29f7a-f084-4eb4-87ab-419707c80fb4	6373b006-878f-4a40-8729-349c2a27fa20
10c29f7a-f084-4eb4-87ab-419707c80fb4	0f5bd1ea-3bdd-4199-8a83-2c42e066d7ed
10c29f7a-f084-4eb4-87ab-419707c80fb4	409aaf25-65be-47c6-88ac-6d483242c466
10c29f7a-f084-4eb4-87ab-419707c80fb4	209dd52f-b881-45aa-9b3d-e7eef9a76bed
10c29f7a-f084-4eb4-87ab-419707c80fb4	56d64848-6fe4-40b6-9d72-18a206da6562
10c29f7a-f084-4eb4-87ab-419707c80fb4	9e83bd19-bb8b-4247-bc5f-98e5390932a6
10c29f7a-f084-4eb4-87ab-419707c80fb4	ffee3101-5934-40c3-bb95-87392970ab9e
10c29f7a-f084-4eb4-87ab-419707c80fb4	dc525f85-31d6-49f9-bb41-1d7be3e5fd8a
10c29f7a-f084-4eb4-87ab-419707c80fb4	3dcd6e8d-549f-41a4-8d5c-ef9fd754273c
10c29f7a-f084-4eb4-87ab-419707c80fb4	f6799d62-0e60-4dcd-b3be-a8e9ecb60ea5
f453fce2-0cb7-4e97-952e-a72d4347a756	3769c2dd-cf78-4848-9231-e780aa4fee69
f453fce2-0cb7-4e97-952e-a72d4347a756	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
f453fce2-0cb7-4e97-952e-a72d4347a756	71228913-c490-4f69-b53f-e610b64da380
f453fce2-0cb7-4e97-952e-a72d4347a756	41ed930e-fdde-455c-b75f-305ff5c59d7c
f453fce2-0cb7-4e97-952e-a72d4347a756	2054bb43-179d-42d6-b601-31eb342745a9
f453fce2-0cb7-4e97-952e-a72d4347a756	659b157a-8cc9-4442-ae93-3f8f635a81a6
f453fce2-0cb7-4e97-952e-a72d4347a756	0ac890a8-3e5f-4267-8261-830d39b0b62d
f453fce2-0cb7-4e97-952e-a72d4347a756	6f500bde-c229-48d8-9a48-6d38f2ce7191
f453fce2-0cb7-4e97-952e-a72d4347a756	c5aabd21-29cd-4d77-b7b0-f071f971ed47
f453fce2-0cb7-4e97-952e-a72d4347a756	dab55b53-7354-46fd-8914-ef48b8c695f0
f453fce2-0cb7-4e97-952e-a72d4347a756	3a5352b6-d7a0-4b51-a013-7f2b005174c3
f453fce2-0cb7-4e97-952e-a72d4347a756	a1c91aa2-a103-41bc-a545-1590f1cb0547
f453fce2-0cb7-4e97-952e-a72d4347a756	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
f453fce2-0cb7-4e97-952e-a72d4347a756	747633f6-9821-4db8-81b5-cf2374cf773e
f453fce2-0cb7-4e97-952e-a72d4347a756	4d076373-8444-4909-b28d-b7665c8b76f7
f453fce2-0cb7-4e97-952e-a72d4347a756	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
f453fce2-0cb7-4e97-952e-a72d4347a756	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
f453fce2-0cb7-4e97-952e-a72d4347a756	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
f453fce2-0cb7-4e97-952e-a72d4347a756	677ac23b-3140-4ef4-a71b-6821191f067b
f453fce2-0cb7-4e97-952e-a72d4347a756	15130df5-6095-4a8a-8fb6-bc4dd33dc2b5
f453fce2-0cb7-4e97-952e-a72d4347a756	662af6fd-27e6-4fd1-b37d-5e0cd51854fd
f453fce2-0cb7-4e97-952e-a72d4347a756	ecbdf902-a03b-41d1-a25a-a267fcfa2a68
f453fce2-0cb7-4e97-952e-a72d4347a756	c9bf9b95-78b0-4ac8-93ac-4624c051bed5
f453fce2-0cb7-4e97-952e-a72d4347a756	a18a2659-32f1-4ecb-a85f-69db0ba4afb0
f453fce2-0cb7-4e97-952e-a72d4347a756	c1626027-8553-4e4e-bb32-7a03cbfae72d
f453fce2-0cb7-4e97-952e-a72d4347a756	0f5bd1ea-3bdd-4199-8a83-2c42e066d7ed
f453fce2-0cb7-4e97-952e-a72d4347a756	409aaf25-65be-47c6-88ac-6d483242c466
f453fce2-0cb7-4e97-952e-a72d4347a756	209dd52f-b881-45aa-9b3d-e7eef9a76bed
f453fce2-0cb7-4e97-952e-a72d4347a756	56d64848-6fe4-40b6-9d72-18a206da6562
f453fce2-0cb7-4e97-952e-a72d4347a756	9e83bd19-bb8b-4247-bc5f-98e5390932a6
f453fce2-0cb7-4e97-952e-a72d4347a756	ffee3101-5934-40c3-bb95-87392970ab9e
f453fce2-0cb7-4e97-952e-a72d4347a756	dc525f85-31d6-49f9-bb41-1d7be3e5fd8a
f453fce2-0cb7-4e97-952e-a72d4347a756	3dcd6e8d-549f-41a4-8d5c-ef9fd754273c
f453fce2-0cb7-4e97-952e-a72d4347a756	f6799d62-0e60-4dcd-b3be-a8e9ecb60ea5
f453fce2-0cb7-4e97-952e-a72d4347a756	ddd9acce-0eb6-4141-bafd-6191c5fb0bc6
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	3769c2dd-cf78-4848-9231-e780aa4fee69
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	71228913-c490-4f69-b53f-e610b64da380
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	41ed930e-fdde-455c-b75f-305ff5c59d7c
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	2054bb43-179d-42d6-b601-31eb342745a9
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	659b157a-8cc9-4442-ae93-3f8f635a81a6
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	0ac890a8-3e5f-4267-8261-830d39b0b62d
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	6f500bde-c229-48d8-9a48-6d38f2ce7191
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	c5aabd21-29cd-4d77-b7b0-f071f971ed47
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	dab55b53-7354-46fd-8914-ef48b8c695f0
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	3a5352b6-d7a0-4b51-a013-7f2b005174c3
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	a1c91aa2-a103-41bc-a545-1590f1cb0547
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	747633f6-9821-4db8-81b5-cf2374cf773e
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	4d076373-8444-4909-b28d-b7665c8b76f7
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	677ac23b-3140-4ef4-a71b-6821191f067b
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	662af6fd-27e6-4fd1-b37d-5e0cd51854fd
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	ec0fef4f-c11a-4416-8045-df7c5dc6502f
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	d8b22379-de22-4c03-9b94-f2c42a79c999
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	8c67bf32-c9ac-4242-8b63-8cd26da1cbaa
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	d2c1cd73-8d20-498e-a327-f60331d9c5f4
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	e6394c8b-d42e-4628-9136-c28800985398
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	e7a82a05-8f00-49c9-bc0d-7926e370785d
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	7bf518d9-4a38-49f7-868e-c84c3a011cf8
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	ae03f6d0-7cf4-48a3-996c-b2335b8bc962
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	9de61a24-d464-4f89-b9a1-8014c8059c60
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	0678def0-54cf-40c4-a685-b27577d0bec5
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	54d7c302-4bbc-4e80-9340-d4661690a651
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	f9401078-3c51-4a72-a43f-bd81a83bc724
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	699e1215-8ec3-42aa-96fa-317b3ba0064c
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	b6a5161f-7a10-4a31-b06c-65803682bcfc
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	e536088e-f3c2-4bcb-a862-da890a7e1a39
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	54413027-9466-4433-af3f-48c047f1207d
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	1fcf9196-0db5-4f3c-a465-563b2f2eca76
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	4489ff9f-6ffd-4331-a70b-f70fb744d824
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	c050c6c1-1d2a-4dda-9365-dec2acfa96b0
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	2fb8ba8f-9b3e-401d-90e6-e5f95442f7ba
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	cc364f58-137d-4afe-b16b-edd8a8dc7b8b
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	6904940f-0e87-4aff-85d0-de3cd3d6f812
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	fc05315c-0464-42a8-8ff4-5f665b8710e6
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	1ef2d03b-ccb5-41d9-ace6-da14dbe547f0
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	7801b578-b4f6-4924-9f21-594ca160c93b
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	3c834710-b415-4ab7-8d82-ae89fd74379a
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	72da734e-1b59-426f-8fca-e57d16e39b97
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	a584ebca-8068-446a-ad36-6cf0473269f8
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	1ae1cf8c-542a-41b1-870d-53837794e07a
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	9930cf42-b59c-4741-9194-f416feff668d
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	d4df167d-042a-4152-813c-f0f783195c3d
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	e028a571-97cb-4926-b7cf-0a7deb2ba5ea
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	cec9c8ae-b54b-4698-a647-1cf2b645431a
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	ad246772-bdd1-4423-9dd6-8435ac38b82d
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	2b957305-0b01-4a68-90e6-a3393b771611
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	98af9d29-90fb-40e6-88e9-11203916e16a
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	f0b62557-ee52-4bed-912d-8592f4020873
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	ef13a8be-9aff-484c-881d-5dd0e8631f66
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	1afc4b7d-7005-4451-b7bc-8814b46e7243
\.


--
-- Data for Name: episode_supertactiques_supertactique; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.episode_supertactiques_supertactique ("episodeId", "supertactiqueId") FROM stdin;
be80eb60-f867-454f-97e7-86a675c09f53	b0ceb2f2-1884-49c0-aaed-b27970241987
aeb63f75-d22d-492b-bfb3-700d2343c915	08909c52-1069-4d9a-b18c-5da4dd3a8fa3
aeb63f75-d22d-492b-bfb3-700d2343c915	0e8f6287-4e30-422e-88a6-f0188051e561
\.


--
-- Data for Name: episode_supertechniques_supertechnique; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.episode_supertechniques_supertechnique ("episodeId", "supertechniqueId") FROM stdin;
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	7ed876fa-6b35-4435-9ac2-bc71b35a70aa
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	978d2fc4-b8aa-4b88-8995-d3086c8a7a7b
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	ddd2538b-718a-4069-9994-d4c8a4ed650a
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	24008724-7f61-4c38-8ee5-fbb80f110a61
b2dd9288-e9c2-4906-baec-3379aa3c3a9b	ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827
ff30ed09-db6a-4b2b-8c21-e74a54f61e25	5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7
be80eb60-f867-454f-97e7-86a675c09f53	5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7
be80eb60-f867-454f-97e7-86a675c09f53	68e47d86-544b-4b58-ae47-d3c2a379ffcb
be80eb60-f867-454f-97e7-86a675c09f53	16569a09-6cef-461c-869b-62533f389999
be80eb60-f867-454f-97e7-86a675c09f53	81541c14-f7ae-4dd4-98a3-ce92428d76e3
be80eb60-f867-454f-97e7-86a675c09f53	47366cd9-e9cb-4dda-9e43-089dd57163fc
66abafd9-5110-4c47-a81c-9a2a4f74cb08	24008724-7f61-4c38-8ee5-fbb80f110a61
66abafd9-5110-4c47-a81c-9a2a4f74cb08	5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7
66abafd9-5110-4c47-a81c-9a2a4f74cb08	81541c14-f7ae-4dd4-98a3-ce92428d76e3
66abafd9-5110-4c47-a81c-9a2a4f74cb08	610e6efa-e893-4e3d-a78c-5bee27eeee0f
66abafd9-5110-4c47-a81c-9a2a4f74cb08	307222cc-4ea9-423a-9305-d9fbafe692ff
66abafd9-5110-4c47-a81c-9a2a4f74cb08	de717d77-13a0-498c-af82-ab4751bfbf6f
66abafd9-5110-4c47-a81c-9a2a4f74cb08	648c4240-7cc3-4e39-9aa8-f038b1b3ec59
66abafd9-5110-4c47-a81c-9a2a4f74cb08	fee38ff1-00f9-40f5-a809-9556d6ff7655
b1806a16-509d-49e5-a2e2-3a484cd16455	81541c14-f7ae-4dd4-98a3-ce92428d76e3
b1806a16-509d-49e5-a2e2-3a484cd16455	ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827
b1806a16-509d-49e5-a2e2-3a484cd16455	ce7d62f3-b679-47a9-8afe-e8635d081f92
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	81541c14-f7ae-4dd4-98a3-ce92428d76e3
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	ce7d62f3-b679-47a9-8afe-e8635d081f92
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	47366cd9-e9cb-4dda-9e43-089dd57163fc
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	fee38ff1-00f9-40f5-a809-9556d6ff7655
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	ad527b4c-643e-4321-bc49-0d34e28917d8
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	24008724-7f61-4c38-8ee5-fbb80f110a61
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	8dbee186-f703-4374-ae66-6098242c5660
3ac8a7cb-c773-45d7-a114-d9654d4d68c4	0d58e2e8-5b7d-471c-92ea-3503952361b4
22a06b40-2b8c-46a1-bc90-df535a96e07e	a6c4ecbd-345d-4d83-a3fb-381fd155ba90
22a06b40-2b8c-46a1-bc90-df535a96e07e	8dbbb644-a161-4105-ad39-eca821f70f48
22a06b40-2b8c-46a1-bc90-df535a96e07e	1bae1658-f971-4b0e-9acc-fc5b2999d335
22a06b40-2b8c-46a1-bc90-df535a96e07e	5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7
22a06b40-2b8c-46a1-bc90-df535a96e07e	635b7ae5-e564-4ee5-8be0-11ee0be2944e
e3d98622-d761-402e-a105-cff6c35f7a58	afa4c495-1884-4e0b-bf12-9ce6916f8ab6
e3d98622-d761-402e-a105-cff6c35f7a58	8fc435b4-d4fc-4952-be2c-39d41119f6bd
d102057f-4e62-4e78-b37d-a764e8256a1b	7ed876fa-6b35-4435-9ac2-bc71b35a70aa
d102057f-4e62-4e78-b37d-a764e8256a1b	81541c14-f7ae-4dd4-98a3-ce92428d76e3
d102057f-4e62-4e78-b37d-a764e8256a1b	24008724-7f61-4c38-8ee5-fbb80f110a61
99519aee-5871-4ab9-a5b5-2309e4e11117	47366cd9-e9cb-4dda-9e43-089dd57163fc
99519aee-5871-4ab9-a5b5-2309e4e11117	399f5c78-382b-4795-8204-38e17a947877
99519aee-5871-4ab9-a5b5-2309e4e11117	09c253c5-5b70-4933-bba8-d9d330963b38
99519aee-5871-4ab9-a5b5-2309e4e11117	ddd2538b-718a-4069-9994-d4c8a4ed650a
99519aee-5871-4ab9-a5b5-2309e4e11117	81541c14-f7ae-4dd4-98a3-ce92428d76e3
99519aee-5871-4ab9-a5b5-2309e4e11117	5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7
99519aee-5871-4ab9-a5b5-2309e4e11117	ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827
99519aee-5871-4ab9-a5b5-2309e4e11117	83d3c062-8ab6-4538-9d87-3088ab618a31
99519aee-5871-4ab9-a5b5-2309e4e11117	6b2fe94d-a136-433d-802b-14c41078c39a
99519aee-5871-4ab9-a5b5-2309e4e11117	0aefa877-7d31-4721-9d5c-e27a56b20ebb
99519aee-5871-4ab9-a5b5-2309e4e11117	04855b47-7f52-442b-933e-75f60e576f7b
99519aee-5871-4ab9-a5b5-2309e4e11117	6d283ab7-0e4e-4f3e-92de-25b5500cf018
99519aee-5871-4ab9-a5b5-2309e4e11117	16af5557-b14c-4168-9acb-5dae4cb664fc
2228af33-de0e-4227-916f-e958fea744cf	24008724-7f61-4c38-8ee5-fbb80f110a61
2228af33-de0e-4227-916f-e958fea744cf	5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7
2228af33-de0e-4227-916f-e958fea744cf	81541c14-f7ae-4dd4-98a3-ce92428d76e3
2228af33-de0e-4227-916f-e958fea744cf	ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827
2228af33-de0e-4227-916f-e958fea744cf	4126a5c0-5a0b-4f0a-aae2-292012a64b55
2228af33-de0e-4227-916f-e958fea744cf	dbcf9e99-bb6b-43d6-8bd3-5d7bf284492b
c1e37c77-dfe0-41af-b8c3-77c5d1cb6673	dbcf9e99-bb6b-43d6-8bd3-5d7bf284492b
aeb63f75-d22d-492b-bfb3-700d2343c915	24008724-7f61-4c38-8ee5-fbb80f110a61
aeb63f75-d22d-492b-bfb3-700d2343c915	81541c14-f7ae-4dd4-98a3-ce92428d76e3
aeb63f75-d22d-492b-bfb3-700d2343c915	ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827
aeb63f75-d22d-492b-bfb3-700d2343c915	dbcf9e99-bb6b-43d6-8bd3-5d7bf284492b
aeb63f75-d22d-492b-bfb3-700d2343c915	5dbf3891-8435-4877-8081-e45815e0865a
aeb63f75-d22d-492b-bfb3-700d2343c915	f1c7c566-2fdb-479f-9b3e-a1148760d21c
aeb63f75-d22d-492b-bfb3-700d2343c915	47366cd9-e9cb-4dda-9e43-089dd57163fc
aeb63f75-d22d-492b-bfb3-700d2343c915	14211596-bbfb-44b1-afdc-3539e34beb60
aeb63f75-d22d-492b-bfb3-700d2343c915	04a67f8f-d41f-41eb-be32-c962ebfa41c3
aeb63f75-d22d-492b-bfb3-700d2343c915	92acb0d8-19b4-4d23-87ba-8d6761d4536b
aeb63f75-d22d-492b-bfb3-700d2343c915	300e7b11-4a45-4298-823b-d3cb6b096a46
aeb63f75-d22d-492b-bfb3-700d2343c915	7577e5ca-a9e4-4973-80f5-0d42d596f125
aeb63f75-d22d-492b-bfb3-700d2343c915	22d2aa53-910a-4310-8f5c-66141348e409
aeb63f75-d22d-492b-bfb3-700d2343c915	4560c1d7-23c9-4cc1-861e-17063e24e460
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	3b7fe383-5d9d-43fd-8081-4985fb59f1a1
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827
9e680f6b-a12f-4fb1-9dcd-b27ff3970af9	47366cd9-e9cb-4dda-9e43-089dd57163fc
4016b5fa-c380-496f-a3a5-251e48a9db66	dbcf9e99-bb6b-43d6-8bd3-5d7bf284492b
4016b5fa-c380-496f-a3a5-251e48a9db66	47366cd9-e9cb-4dda-9e43-089dd57163fc
4016b5fa-c380-496f-a3a5-251e48a9db66	4560c1d7-23c9-4cc1-861e-17063e24e460
4016b5fa-c380-496f-a3a5-251e48a9db66	150f3b7f-c5b1-4723-a101-fcdd6d93d00f
4016b5fa-c380-496f-a3a5-251e48a9db66	f3bde92b-de79-414d-9707-93baf6e9e44d
4016b5fa-c380-496f-a3a5-251e48a9db66	648c4240-7cc3-4e39-9aa8-f038b1b3ec59
4016b5fa-c380-496f-a3a5-251e48a9db66	7e6d27bd-cf47-49a6-9bc2-3cdaeafa78c1
4016b5fa-c380-496f-a3a5-251e48a9db66	5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7
4016b5fa-c380-496f-a3a5-251e48a9db66	cedd92ea-7710-460c-8667-76617f1005cb
4016b5fa-c380-496f-a3a5-251e48a9db66	ed55069b-0022-4b67-be51-b5a76afd569f
4016b5fa-c380-496f-a3a5-251e48a9db66	1a807ccd-64dc-4902-9cb2-f79bc96ef41d
4016b5fa-c380-496f-a3a5-251e48a9db66	fee38ff1-00f9-40f5-a809-9556d6ff7655
4016b5fa-c380-496f-a3a5-251e48a9db66	ad527b4c-643e-4321-bc49-0d34e28917d8
4016b5fa-c380-496f-a3a5-251e48a9db66	2362167f-7dd1-40c2-a439-1e6cc5de2359
be80eb60-f867-454f-97e7-86a675c09f53	24008724-7f61-4c38-8ee5-fbb80f110a61
926f5ca0-3486-4b57-97db-5d0e8f417d43	5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7
926f5ca0-3486-4b57-97db-5d0e8f417d43	81541c14-f7ae-4dd4-98a3-ce92428d76e3
926f5ca0-3486-4b57-97db-5d0e8f417d43	24008724-7f61-4c38-8ee5-fbb80f110a61
926f5ca0-3486-4b57-97db-5d0e8f417d43	964f1077-700a-4cdb-a974-40a82ad54696
926f5ca0-3486-4b57-97db-5d0e8f417d43	1a52ebab-766e-4ea3-b243-7007d1c08929
69125a81-1480-486f-a2f1-2a6c6624187e	63eb99ce-fe82-460f-b879-ffd2b0854dba
69125a81-1480-486f-a2f1-2a6c6624187e	093bbc31-ceb1-441b-95ee-68b70bc02e96
69125a81-1480-486f-a2f1-2a6c6624187e	0aefa877-7d31-4721-9d5c-e27a56b20ebb
1ea85325-d23b-4700-8a5b-40884b779c52	63eb99ce-fe82-460f-b879-ffd2b0854dba
1ea85325-d23b-4700-8a5b-40884b779c52	24008724-7f61-4c38-8ee5-fbb80f110a61
1ea85325-d23b-4700-8a5b-40884b779c52	0aefa877-7d31-4721-9d5c-e27a56b20ebb
1ea85325-d23b-4700-8a5b-40884b779c52	4560c1d7-23c9-4cc1-861e-17063e24e460
1ea85325-d23b-4700-8a5b-40884b779c52	1a52ebab-766e-4ea3-b243-7007d1c08929
1ea85325-d23b-4700-8a5b-40884b779c52	093bbc31-ceb1-441b-95ee-68b70bc02e96
1ea85325-d23b-4700-8a5b-40884b779c52	c0298e15-3d0a-487d-9120-b9c6e2fe5cf3
1ea85325-d23b-4700-8a5b-40884b779c52	47366cd9-e9cb-4dda-9e43-089dd57163fc
1ea85325-d23b-4700-8a5b-40884b779c52	fb8cc7fa-06d4-4c58-b35f-0ab72c58cb36
1ea85325-d23b-4700-8a5b-40884b779c52	ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827
1ea85325-d23b-4700-8a5b-40884b779c52	4126a5c0-5a0b-4f0a-aae2-292012a64b55
1ea85325-d23b-4700-8a5b-40884b779c52	bcb6866c-069c-4d35-b0dd-256756dfc5ed
1ea85325-d23b-4700-8a5b-40884b779c52	ece9a390-8381-4ea9-ad78-769e1c89e2a4
1ea85325-d23b-4700-8a5b-40884b779c52	52e228c2-d127-4069-a430-7024367042f3
d1564e33-79a5-42e2-a7fb-38f59297432b	ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827
d1564e33-79a5-42e2-a7fb-38f59297432b	24008724-7f61-4c38-8ee5-fbb80f110a61
d1564e33-79a5-42e2-a7fb-38f59297432b	6fbc8ad4-b945-425b-ae70-dafe253cb7c9
3b138675-1889-4e1e-b772-1a5189ff6301	47366cd9-e9cb-4dda-9e43-089dd57163fc
3b138675-1889-4e1e-b772-1a5189ff6301	6b2fe94d-a136-433d-802b-14c41078c39a
a85b89de-2acd-4e95-a83a-31bf1edd6244	2362167f-7dd1-40c2-a439-1e6cc5de2359
10c29f7a-f084-4eb4-87ab-419707c80fb4	af536aa1-e23f-47eb-8384-16f45cf699ab
10c29f7a-f084-4eb4-87ab-419707c80fb4	0da08037-311f-4c32-a63d-a683888abbc3
10c29f7a-f084-4eb4-87ab-419707c80fb4	0aefa877-7d31-4721-9d5c-e27a56b20ebb
10c29f7a-f084-4eb4-87ab-419707c80fb4	24008724-7f61-4c38-8ee5-fbb80f110a61
10c29f7a-f084-4eb4-87ab-419707c80fb4	4155f230-b355-4267-a81e-0e0b5be7df02
10c29f7a-f084-4eb4-87ab-419707c80fb4	48a5b83c-69d9-49a3-bbec-e37f91d12455
10c29f7a-f084-4eb4-87ab-419707c80fb4	8d074acc-1d1e-4be7-8082-6f7a3b2a37ba
10c29f7a-f084-4eb4-87ab-419707c80fb4	6fbc8ad4-b945-425b-ae70-dafe253cb7c9
10c29f7a-f084-4eb4-87ab-419707c80fb4	47366cd9-e9cb-4dda-9e43-089dd57163fc
10c29f7a-f084-4eb4-87ab-419707c80fb4	83d3c062-8ab6-4538-9d87-3088ab618a31
10c29f7a-f084-4eb4-87ab-419707c80fb4	52e228c2-d127-4069-a430-7024367042f3
10c29f7a-f084-4eb4-87ab-419707c80fb4	3a041235-6c8c-45fa-9370-74de42faa31e
10c29f7a-f084-4eb4-87ab-419707c80fb4	30d1a342-c192-41ac-aea2-b2f234b31aae
f453fce2-0cb7-4e97-952e-a72d4347a756	af536aa1-e23f-47eb-8384-16f45cf699ab
f453fce2-0cb7-4e97-952e-a72d4347a756	0da08037-311f-4c32-a63d-a683888abbc3
f453fce2-0cb7-4e97-952e-a72d4347a756	4155f230-b355-4267-a81e-0e0b5be7df02
f453fce2-0cb7-4e97-952e-a72d4347a756	48a5b83c-69d9-49a3-bbec-e37f91d12455
f453fce2-0cb7-4e97-952e-a72d4347a756	8d074acc-1d1e-4be7-8082-6f7a3b2a37ba
f453fce2-0cb7-4e97-952e-a72d4347a756	6fbc8ad4-b945-425b-ae70-dafe253cb7c9
f453fce2-0cb7-4e97-952e-a72d4347a756	52e228c2-d127-4069-a430-7024367042f3
f453fce2-0cb7-4e97-952e-a72d4347a756	30d1a342-c192-41ac-aea2-b2f234b31aae
f453fce2-0cb7-4e97-952e-a72d4347a756	648c4240-7cc3-4e39-9aa8-f038b1b3ec59
f453fce2-0cb7-4e97-952e-a72d4347a756	c88cfb8e-f11d-4bef-abb0-8fba9ab51474
f453fce2-0cb7-4e97-952e-a72d4347a756	5e045d21-9f73-4088-abd6-4130e31d87fe
f453fce2-0cb7-4e97-952e-a72d4347a756	ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827
f453fce2-0cb7-4e97-952e-a72d4347a756	6b2fe94d-a136-433d-802b-14c41078c39a
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	04855b47-7f52-442b-933e-75f60e576f7b
48f68bdb-12f4-47f7-b87a-c13b8af99cc6	2362167f-7dd1-40c2-a439-1e6cc5de2359
\.


--
-- Data for Name: equipe; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.equipe (id, nom_francais_equipe, nom_original_equipe, note, "serieId") FROM stdin;
1065b087-500b-4129-b4aa-ff5247c15bfc	Raimon	Raimon	- De tous les membres qui ont rejoint Raimon, seul Jack Wallside a joué à tous les matchs.\n- À chaque saison d'Inazuma Eleven, il y a un nouveau stade.\n- Les nombreuses Supertechniques apprises par les joueurs furent inscrites dans le cahier de David Evans (le grand-père du capitaine de Raimon, Mark Evans), comme le Trampoline du Tonnerre, l'Oiseau de Feu et la Main Magique.\n- Les joueurs des Little Gigantes sont inspirés des joueurs de Raimon.\n- Les joueurs de Raimon (GO) sont comme une copie de l'équipe de Raimon lorsque son capitaine était Mark Evans.\n- L'équipe de la saison 2 est considérée comme la meilleure équipe du Japon.	2451ef9f-9bd1-499b-83fc-5505be405ed5
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	Royal Academy	Teikoku Gakuen	- À chaque fois que cette équipe gagne contre une autre, ils détruisent le collège de l'équipe battue.\n- C'est la première équipe montrée après Raimon dans la série Inazuma Eleven.\n- Lors de l'épisode 1, ils ont gagné contre un collège inconnu sur le score de 13-0.\n- Dans Inazuma Eleven 2, c'est Joseph King qui remplace Jude Sharp en tant que capitaine.\n- Ils ont gagné le tournoi Football Frontier pendant 40 ans, jusqu'à ce qu'ils perdent contre l'équipe Zeus et qu'ils soient éliminés du tournoi.	2451ef9f-9bd1-499b-83fc-5505be405ed5
cf9a2353-f632-428d-b12e-a81c86a023cb	Inazuma KFT	Inazuma Kids FC	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
57e1080f-926b-4f05-a4fa-3d56704221c2	Occulte	Okaruto	- Dans le Manga, cette équipe a défié Raimon, afin de les affronter dans un match non officiel.\n- Dans le Manga, Raimon l'emporte sur le score de 2-1, alors que dans l'Anime, elle remporte le match sur le score de 4-3.\n- Tous les joueurs sont basés sur des fantômes et des monstres de l'épouvante.\n- Elle fut la première équipe à avoir utilisé une Supertactique	2451ef9f-9bd1-499b-83fc-5505be405ed5
0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00	Wild	Nose	- Chaque membre possède un nom d'animal comme surnom, sauf leur entraineur.\n- Leurs noms correspondent à leurs caractéristiques vestimentaires et aux traits de leur visage.	2451ef9f-9bd1-499b-83fc-5505be405ed5
1c35f137-9ba2-4536-ba1a-87de80e704a4	Cybertech	Mikage Sennō	- Il est dit que cette équipe est au même niveau que la Royal Academy.\n- Le prénom du capitaine de l'équipe (Thomas Feldt) est le même que le nom de famille de l'entraineur.	2451ef9f-9bd1-499b-83fc-5505be405ed5
18189270-3ac7-4e97-a47f-178f1a0421b0	Otaku	Shūyō Meito	- Cette équipe est considérée comme "le canard boiteux" du tournoi Football Frontier.\n- Cette équipe triche pour gagner, avec quelques Supertechniques telles que la Batte Toute-Puissante, la Cible Mouvante, la Confusion ou la Balle Factice.\n- Cette équipe utilise un ordinateur pour truquer les résultats du tournoi Football Frontier.\n- Leur quartier général se trouve dans un café nommé "Le Cœur des Anges".\n- Tous les joueurs sont des passionnés de cultures de l'imaginaire ou des technophiles, possédant chacun leur spécialité dans leur nom.\n- William Glass a inscrit son premier et seul but face à cette équipe.	2451ef9f-9bd1-499b-83fc-5505be405ed5
79de6a43-1c49-449e-bed9-a67965d23a37	Onze d'Inazuma	Inazuma Eleven	- Dans la version latinoaméricaine de l'Anime, cette équipe est appelée "Súper Once", une simple traduction du terme "Irebun" en japonais. Ce nom est aussi le titre de l'Anime.	2451ef9f-9bd1-499b-83fc-5505be405ed5
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	Shuriken	Sengoku Igajima	- Les Supertechniques utilisées passent souvent les techniques de Raimon.\n- Leurs apparences et leurs Supertechniques sont similaires à celles des ninjas.\n- C'est la seule équipe en dehors de Raimon à avoir des manageuses.	2451ef9f-9bd1-499b-83fc-5505be405ed5
2d695421-8627-4982-a86a-6e810e07f354	Terria	Senbayama	- C'est la seule équipe avec le Collège Zeus à ne pas avoir encaissé de but avant leur défaite face à Raimon grâce à leur infranchissable Muraille Infinie.\n- C'est l'équipe qui possède la meilleure défense du tournoi Football Frontier. En effet, elle n'a encaissé que deux buts durant tout le tournoi, contre Raimon.\n- Leur équipe vient de la campagne et de la montagne.	2451ef9f-9bd1-499b-83fc-5505be405ed5
5222805c-7848-4c9c-865d-0e6d6b71f885	Kirkwood	Kidowaka Seishū	- Les triplés Murdock ont toujours admiré Axel Blaze. En revanche, ils n'ont pas apprécié son départ de l'équipe de manière précipitée.\n- Lors de l'épisode 1, Mark Evans a dit que le collège Kirkwood était célèbre pour son football.\n- Lorsqu’Axel Blaze était encore à Kirkwood, les triplés Murdock étaient toujours remplaçants.\n- Malcolm Night est un ami d'enfance de Silvia Woods, Erik Eagle et Bobby Shearer.	2451ef9f-9bd1-499b-83fc-5505be405ed5
82290c3e-1d64-407e-becb-7fcfe8fab4b6	Zeus	Zeusu	- Le nom de cette équipe provient de Zeus, le dieu suprême dans la religion grecque antique. Les noms et surnoms de ses titulaires viennent des autres divinités grecques provenant des "Douze Olympiens". Ceux des remplaçants sont inspirés quant à eux de Dieux, Titans, monstres et Demi-Dieux de la mythologie grecque.	2451ef9f-9bd1-499b-83fc-5505be405ed5
890e4960-ab2b-4186-b351-568ff9092b27	Umbrella	Kasamino	- Dans le match de Raimon vs Tempête des Gémeaux à Umbrella, Edmonds faisait l'arbitre.	2451ef9f-9bd1-499b-83fc-5505be405ed5
4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb	Tempête des Gémeaux	Jemini Sutōmu	- Leur équipe fut exilée par Dvalin, le capitaine d'Epsilon, équipe de 1ère division de l'Académie Alius, après leur défaite contre l'équipe de Raimon au collège Alpin./n- Lors de l'épisode 35, on apprend que la Tempête des Gémeaux utilisent leur vitesse pour prendre le ballon et ainsi marquer très facilement./n- Les noms des joueurs sont tous en rapport avec des anneaux de planètes./n- C'est la plus mauvaise équipe de l'Académie Alius, sachant qu'ils font partie de la deuxième division, bien que ce soit la seule équipe à avoir battu Raimon à deux reprises./n- Beaucoup de personnes pensaient que Janus était une fille dans la saison 2, alors qu'en réalité, il s'agit d'un garçon.	2451ef9f-9bd1-499b-83fc-5505be405ed5
\.


--
-- Data for Name: equipe_capitaines_personnage; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.equipe_capitaines_personnage ("equipeId", "personnageId") FROM stdin;
1065b087-500b-4129-b4aa-ff5247c15bfc	2054bb43-179d-42d6-b601-31eb342745a9
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	71228913-c490-4f69-b53f-e610b64da380
cf9a2353-f632-428d-b12e-a81c86a023cb	b4a5c408-a348-4cf0-852a-03c33447a3c5
57e1080f-926b-4f05-a4fa-3d56704221c2	de217141-cfb6-4a2a-bb74-689764d901b8
0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00	e5d26f46-92f6-466f-ad34-2a96c4db2feb
1c35f137-9ba2-4536-ba1a-87de80e704a4	1b288bd9-dd9d-4c04-9871-438c5bd55011
18189270-3ac7-4e97-a47f-178f1a0421b0	ad37155a-e705-40fd-88ad-e55ffc322494
79de6a43-1c49-449e-bed9-a67965d23a37	677ac23b-3140-4ef4-a71b-6821191f067b
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	457cea5b-6cd2-4dc7-9e38-8d0f23f88ef8
2d695421-8627-4982-a86a-6e810e07f354	3fb4a546-96fa-4bd2-a312-cd3629c3e391
5222805c-7848-4c9c-865d-0e6d6b71f885	cec9c8ae-b54b-4698-a647-1cf2b645431a
82290c3e-1d64-407e-becb-7fcfe8fab4b6	0f5bd1ea-3bdd-4199-8a83-2c42e066d7ed
890e4960-ab2b-4186-b351-568ff9092b27	d4df167d-042a-4152-813c-f0f783195c3d
4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb	0678def0-54cf-40c4-a685-b27577d0bec5
\.


--
-- Data for Name: equipe_entraineur_personnage; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.equipe_entraineur_personnage ("equipeId", "personnageId") FROM stdin;
1065b087-500b-4129-b4aa-ff5247c15bfc	263138da-c55c-4347-925c-fb9e191d9aa8
1065b087-500b-4129-b4aa-ff5247c15bfc	677ac23b-3140-4ef4-a71b-6821191f067b
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	15130df5-6095-4a8a-8fb6-bc4dd33dc2b5
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	d7dc7c66-c665-45e1-9352-0f246b765a37
cf9a2353-f632-428d-b12e-a81c86a023cb	f9401078-3c51-4a72-a43f-bd81a83bc724
57e1080f-926b-4f05-a4fa-3d56704221c2	0312c39a-a06e-4259-9d3f-7619ba5603a4
0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00	17c637de-a2b5-430d-bb67-b36a3315039c
1c35f137-9ba2-4536-ba1a-87de80e704a4	56b727e0-dd56-4dbb-a3b3-8e9bbaafdea5
18189270-3ac7-4e97-a47f-178f1a0421b0	58ef1277-fec8-4518-ab58-ab16373ec581
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	6428bcc4-0d35-4e1a-be7b-1e71ccd5cde4
2d695421-8627-4982-a86a-6e810e07f354	4fe3495f-7aef-428f-8563-c2c8209b2583
5222805c-7848-4c9c-865d-0e6d6b71f885	06ee5357-6494-4ce5-b0ed-912d5f16b346
79de6a43-1c49-449e-bed9-a67965d23a37	6373b006-878f-4a40-8729-349c2a27fa20
82290c3e-1d64-407e-becb-7fcfe8fab4b6	15130df5-6095-4a8a-8fb6-bc4dd33dc2b5
\.


--
-- Data for Name: equipe_episodes_episode; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.equipe_episodes_episode ("equipeId", "episodeId") FROM stdin;
0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00	66abafd9-5110-4c47-a81c-9a2a4f74cb08
1065b087-500b-4129-b4aa-ff5247c15bfc	2228af33-de0e-4227-916f-e958fea744cf
1065b087-500b-4129-b4aa-ff5247c15bfc	22a06b40-2b8c-46a1-bc90-df535a96e07e
1065b087-500b-4129-b4aa-ff5247c15bfc	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
1065b087-500b-4129-b4aa-ff5247c15bfc	4016b5fa-c380-496f-a3a5-251e48a9db66
1065b087-500b-4129-b4aa-ff5247c15bfc	66abafd9-5110-4c47-a81c-9a2a4f74cb08
1065b087-500b-4129-b4aa-ff5247c15bfc	84593a3b-1264-49e0-8ffb-7383132558c0
1065b087-500b-4129-b4aa-ff5247c15bfc	99519aee-5871-4ab9-a5b5-2309e4e11117
1065b087-500b-4129-b4aa-ff5247c15bfc	9c282416-79fc-4340-bd9c-b0f42652c9a5
1065b087-500b-4129-b4aa-ff5247c15bfc	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
1065b087-500b-4129-b4aa-ff5247c15bfc	aeb63f75-d22d-492b-bfb3-700d2343c915
1065b087-500b-4129-b4aa-ff5247c15bfc	b1806a16-509d-49e5-a2e2-3a484cd16455
1065b087-500b-4129-b4aa-ff5247c15bfc	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
1065b087-500b-4129-b4aa-ff5247c15bfc	be80eb60-f867-454f-97e7-86a675c09f53
1065b087-500b-4129-b4aa-ff5247c15bfc	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
1065b087-500b-4129-b4aa-ff5247c15bfc	d102057f-4e62-4e78-b37d-a764e8256a1b
1065b087-500b-4129-b4aa-ff5247c15bfc	e3d98622-d761-402e-a105-cff6c35f7a58
1065b087-500b-4129-b4aa-ff5247c15bfc	fea90bfd-2d11-424f-ad2f-507e1562c1af
1065b087-500b-4129-b4aa-ff5247c15bfc	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
18189270-3ac7-4e97-a47f-178f1a0421b0	22a06b40-2b8c-46a1-bc90-df535a96e07e
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	aeb63f75-d22d-492b-bfb3-700d2343c915
1c35f137-9ba2-4536-ba1a-87de80e704a4	b1806a16-509d-49e5-a2e2-3a484cd16455
1c35f137-9ba2-4536-ba1a-87de80e704a4	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
2d695421-8627-4982-a86a-6e810e07f354	4016b5fa-c380-496f-a3a5-251e48a9db66
2d695421-8627-4982-a86a-6e810e07f354	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
57e1080f-926b-4f05-a4fa-3d56704221c2	be80eb60-f867-454f-97e7-86a675c09f53
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	99519aee-5871-4ab9-a5b5-2309e4e11117
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	9c282416-79fc-4340-bd9c-b0f42652c9a5
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	d102057f-4e62-4e78-b37d-a764e8256a1b
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	fea90bfd-2d11-424f-ad2f-507e1562c1af
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
79de6a43-1c49-449e-bed9-a67965d23a37	2228af33-de0e-4227-916f-e958fea744cf
cf9a2353-f632-428d-b12e-a81c86a023cb	e3d98622-d761-402e-a105-cff6c35f7a58
cf9a2353-f632-428d-b12e-a81c86a023cb	fea90bfd-2d11-424f-ad2f-507e1562c1af
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
5222805c-7848-4c9c-865d-0e6d6b71f885	69125a81-1480-486f-a2f1-2a6c6624187e
1065b087-500b-4129-b4aa-ff5247c15bfc	69125a81-1480-486f-a2f1-2a6c6624187e
1065b087-500b-4129-b4aa-ff5247c15bfc	1ea85325-d23b-4700-8a5b-40884b779c52
5222805c-7848-4c9c-865d-0e6d6b71f885	1ea85325-d23b-4700-8a5b-40884b779c52
1065b087-500b-4129-b4aa-ff5247c15bfc	d1564e33-79a5-42e2-a7fb-38f59297432b
82290c3e-1d64-407e-becb-7fcfe8fab4b6	3b138675-1889-4e1e-b772-1a5189ff6301
1065b087-500b-4129-b4aa-ff5247c15bfc	3b138675-1889-4e1e-b772-1a5189ff6301
1065b087-500b-4129-b4aa-ff5247c15bfc	a85b89de-2acd-4e95-a83a-31bf1edd6244
1065b087-500b-4129-b4aa-ff5247c15bfc	10c29f7a-f084-4eb4-87ab-419707c80fb4
82290c3e-1d64-407e-becb-7fcfe8fab4b6	10c29f7a-f084-4eb4-87ab-419707c80fb4
82290c3e-1d64-407e-becb-7fcfe8fab4b6	f453fce2-0cb7-4e97-952e-a72d4347a756
1065b087-500b-4129-b4aa-ff5247c15bfc	f453fce2-0cb7-4e97-952e-a72d4347a756
1065b087-500b-4129-b4aa-ff5247c15bfc	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
890e4960-ab2b-4186-b351-568ff9092b27	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
79de6a43-1c49-449e-bed9-a67965d23a37	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
\.


--
-- Data for Name: equipe_images_image; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.equipe_images_image ("equipeId", "imageId") FROM stdin;
\.


--
-- Data for Name: equipe_joueurs_personnage; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.equipe_joueurs_personnage ("equipeId", "personnageId") FROM stdin;
1065b087-500b-4129-b4aa-ff5247c15bfc	2054bb43-179d-42d6-b601-31eb342745a9
1065b087-500b-4129-b4aa-ff5247c15bfc	659b157a-8cc9-4442-ae93-3f8f635a81a6
1065b087-500b-4129-b4aa-ff5247c15bfc	0ac890a8-3e5f-4267-8261-830d39b0b62d
1065b087-500b-4129-b4aa-ff5247c15bfc	6f500bde-c229-48d8-9a48-6d38f2ce7191
1065b087-500b-4129-b4aa-ff5247c15bfc	c5aabd21-29cd-4d77-b7b0-f071f971ed47
1065b087-500b-4129-b4aa-ff5247c15bfc	dab55b53-7354-46fd-8914-ef48b8c695f0
1065b087-500b-4129-b4aa-ff5247c15bfc	3a5352b6-d7a0-4b51-a013-7f2b005174c3
1065b087-500b-4129-b4aa-ff5247c15bfc	a1c91aa2-a103-41bc-a545-1590f1cb0547
1065b087-500b-4129-b4aa-ff5247c15bfc	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
1065b087-500b-4129-b4aa-ff5247c15bfc	747633f6-9821-4db8-81b5-cf2374cf773e
1065b087-500b-4129-b4aa-ff5247c15bfc	4d076373-8444-4909-b28d-b7665c8b76f7
1065b087-500b-4129-b4aa-ff5247c15bfc	3769c2dd-cf78-4848-9231-e780aa4fee69
1065b087-500b-4129-b4aa-ff5247c15bfc	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
1065b087-500b-4129-b4aa-ff5247c15bfc	71228913-c490-4f69-b53f-e610b64da380
1065b087-500b-4129-b4aa-ff5247c15bfc	41ed930e-fdde-455c-b75f-305ff5c59d7c
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	71228913-c490-4f69-b53f-e610b64da380
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	03f04e6f-690c-43f0-a037-0bb816a768bc
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	8cec069d-4385-4399-8949-dd221bcc2225
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	dee66d99-2fe1-4ff8-a327-cee3a0a284e9
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	abc7ef7c-3342-41c8-94e8-0d1168acbbd4
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	ab24eb32-8578-461c-8e2c-5638b29a3123
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	6161a098-a4c3-44ab-bd85-27de181c04ab
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	32506b0a-9ce3-43af-a8ea-c45fbffec805
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	2262a0fd-6a23-4b63-840d-270ba57265f1
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	d39825c3-b0fe-4a00-a481-f262a33d0843
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba
cf9a2353-f632-428d-b12e-a81c86a023cb	92533be6-64c4-4f6c-9efd-aee2097b2db2
cf9a2353-f632-428d-b12e-a81c86a023cb	f2fd840a-cde9-4152-84d0-849c05ac1c62
cf9a2353-f632-428d-b12e-a81c86a023cb	31550e7f-09a0-42f6-8fb2-b53579ba3f95
cf9a2353-f632-428d-b12e-a81c86a023cb	d49dd7a8-3943-4f1a-9264-4d2760b83753
cf9a2353-f632-428d-b12e-a81c86a023cb	abf2d23a-1707-44f1-8112-84ec5a76cbdf
cf9a2353-f632-428d-b12e-a81c86a023cb	d89ca943-cde6-4aac-b755-7501f5373a23
cf9a2353-f632-428d-b12e-a81c86a023cb	340ccd0c-f985-4ad7-a6ed-c61ee38774fa
cf9a2353-f632-428d-b12e-a81c86a023cb	953bd7d8-4f95-491c-8b57-8476d0eb3687
cf9a2353-f632-428d-b12e-a81c86a023cb	b4a5c408-a348-4cf0-852a-03c33447a3c5
57e1080f-926b-4f05-a4fa-3d56704221c2	b6bd3c06-c2cb-4778-bbfe-beaa53a0c08c
57e1080f-926b-4f05-a4fa-3d56704221c2	67ae090d-cbdf-4abe-87e9-25175d91b2ce
57e1080f-926b-4f05-a4fa-3d56704221c2	f5c97f0c-cc65-4988-93ba-3aba38d62b7d
57e1080f-926b-4f05-a4fa-3d56704221c2	e36c919a-ae19-49d1-87b3-e9e8fa7cbfe7
57e1080f-926b-4f05-a4fa-3d56704221c2	9c54352d-5f66-4807-8848-4ae47a876066
57e1080f-926b-4f05-a4fa-3d56704221c2	3ba1c774-d82c-4875-b9f0-3bbcd9a145d5
57e1080f-926b-4f05-a4fa-3d56704221c2	03cb1061-77a8-4795-b8c8-2f1f056253e1
57e1080f-926b-4f05-a4fa-3d56704221c2	6b5b1c34-e2cc-44c4-806d-a2927a62368b
57e1080f-926b-4f05-a4fa-3d56704221c2	de217141-cfb6-4a2a-bb74-689764d901b8
57e1080f-926b-4f05-a4fa-3d56704221c2	68419050-a862-4810-b4a4-1a35cfa72991
57e1080f-926b-4f05-a4fa-3d56704221c2	174f1e51-e6fe-4277-af06-d71e9ee4066a
0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00	1d16af31-8260-4617-a678-9b4a69af14c7
0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00	75842ba4-b8b1-46f3-a69b-d79627616252
0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00	68649379-8432-432d-8c2a-9e9da6f85b4f
0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00	7b05699b-226e-4242-b58f-f651cfe9dce0
0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00	e5d26f46-92f6-466f-ad34-2a96c4db2feb
0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00	208caad5-f36d-4897-bc92-ea51f2c170d8
0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00	da361f3b-8118-4ca1-a85b-3a24dad64f39
0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00	e7e060a0-88ee-4fd4-8c7e-0ea64fcb49b8
0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00	c7424678-8012-408c-9619-67d859a6ec68
0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00	9531a2cd-8613-4103-948c-846a9ba434d1
0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00	874b6396-3f54-4c0d-b3c5-34603de4587a
1c35f137-9ba2-4536-ba1a-87de80e704a4	1b288bd9-dd9d-4c04-9871-438c5bd55011
1c35f137-9ba2-4536-ba1a-87de80e704a4	620231b8-ee3a-4fce-a3ae-619dec3fc8b9
1c35f137-9ba2-4536-ba1a-87de80e704a4	7fa3bcd9-3c9c-495a-9a83-484413865cab
1c35f137-9ba2-4536-ba1a-87de80e704a4	e30fff21-0043-4c3a-9374-1b909054355c
1c35f137-9ba2-4536-ba1a-87de80e704a4	d82544c2-17f7-4220-8eee-14a1bb9db0bf
1c35f137-9ba2-4536-ba1a-87de80e704a4	b21cb196-f946-4dff-a692-99a51cd10f60
1c35f137-9ba2-4536-ba1a-87de80e704a4	3b78b8c1-6f1a-4e7e-96f3-b78f53cc4223
1c35f137-9ba2-4536-ba1a-87de80e704a4	d5da612b-ce45-4031-a1bc-b1b69dd41402
1c35f137-9ba2-4536-ba1a-87de80e704a4	4aba2444-d816-4b4d-b1a7-8d41a39843ac
1c35f137-9ba2-4536-ba1a-87de80e704a4	5e6d1787-b640-4298-9eb6-1b0bb16cfe0e
1c35f137-9ba2-4536-ba1a-87de80e704a4	b7df9bbc-f07e-49ce-9656-b3a9aa28599c
18189270-3ac7-4e97-a47f-178f1a0421b0	e9119b2e-1b37-493b-a4d0-7279d2e8daf1
18189270-3ac7-4e97-a47f-178f1a0421b0	80f3cc8a-5da9-47c3-94c2-6f424d395155
18189270-3ac7-4e97-a47f-178f1a0421b0	ad37155a-e705-40fd-88ad-e55ffc322494
18189270-3ac7-4e97-a47f-178f1a0421b0	fe856efa-7e36-480f-a7cf-9988b6cef346
18189270-3ac7-4e97-a47f-178f1a0421b0	a2306519-360f-4c44-a0d3-bd6633f73d8b
18189270-3ac7-4e97-a47f-178f1a0421b0	16ef9970-c3d7-4a88-b9ef-d40071a17d43
18189270-3ac7-4e97-a47f-178f1a0421b0	15190503-fc61-43ad-8a91-4e8b0009dbf8
18189270-3ac7-4e97-a47f-178f1a0421b0	2f7ed9f8-e502-4cb3-b095-da1099fc6b84
18189270-3ac7-4e97-a47f-178f1a0421b0	cbad2a62-82da-4c7f-bdd1-6c3b3666aa0c
18189270-3ac7-4e97-a47f-178f1a0421b0	7cda746f-c186-4f88-bc9f-9e402a84c0e8
18189270-3ac7-4e97-a47f-178f1a0421b0	5294f95e-ca64-4d59-8130-fe405ea6e50a
79de6a43-1c49-449e-bed9-a67965d23a37	677ac23b-3140-4ef4-a71b-6821191f067b
79de6a43-1c49-449e-bed9-a67965d23a37	cc364f58-137d-4afe-b16b-edd8a8dc7b8b
79de6a43-1c49-449e-bed9-a67965d23a37	2fb8ba8f-9b3e-401d-90e6-e5f95442f7ba
79de6a43-1c49-449e-bed9-a67965d23a37	f9401078-3c51-4a72-a43f-bd81a83bc724
79de6a43-1c49-449e-bed9-a67965d23a37	699e1215-8ec3-42aa-96fa-317b3ba0064c
79de6a43-1c49-449e-bed9-a67965d23a37	b6a5161f-7a10-4a31-b06c-65803682bcfc
79de6a43-1c49-449e-bed9-a67965d23a37	e536088e-f3c2-4bcb-a862-da890a7e1a39
79de6a43-1c49-449e-bed9-a67965d23a37	54413027-9466-4433-af3f-48c047f1207d
79de6a43-1c49-449e-bed9-a67965d23a37	1fcf9196-0db5-4f3c-a465-563b2f2eca76
79de6a43-1c49-449e-bed9-a67965d23a37	4489ff9f-6ffd-4331-a70b-f70fb744d824
79de6a43-1c49-449e-bed9-a67965d23a37	c050c6c1-1d2a-4dda-9365-dec2acfa96b0
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	7f296a30-104f-4803-b711-ea7fff34de1c
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	caf4be28-0825-49d3-81c8-f2b88b6aeeec
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	06876434-2c1d-4c96-b18c-ca13f5b93f3e
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	b4ce3897-6134-439b-b071-2c68f4cd65e9
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	18ce93b1-e30d-48db-9dc9-57c555dde8a1
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	75401584-d7cc-4ef2-b3aa-bb293ba8ff2c
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	6be300b6-aff9-4c3c-91ce-ddab2217b2a3
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	172cb42c-94e9-4b8b-9d45-aad21d0c2552
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	3359d42e-77e7-4a33-b08c-abad892c829e
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	0c8c9915-327c-414d-80db-4e16a0e8e9dc
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	457cea5b-6cd2-4dc7-9e38-8d0f23f88ef8
2d695421-8627-4982-a86a-6e810e07f354	007caf86-1bf9-42a9-a163-a95ed8663eb0
2d695421-8627-4982-a86a-6e810e07f354	31e32402-8790-4d6d-bc25-05b327645ac2
2d695421-8627-4982-a86a-6e810e07f354	4a3b664b-bb2d-4f8a-8eed-16e67d2d533e
2d695421-8627-4982-a86a-6e810e07f354	f0435863-c6f2-471f-bb14-84623acae1af
2d695421-8627-4982-a86a-6e810e07f354	1bcbe7f3-bc0d-4f8e-a8f9-63de56b6e23e
2d695421-8627-4982-a86a-6e810e07f354	5a5edb3c-0f9d-49e5-a05d-431224792e30
2d695421-8627-4982-a86a-6e810e07f354	6203bb89-4dab-4f4f-a147-70f1e20f3a23
2d695421-8627-4982-a86a-6e810e07f354	94cddb77-77e6-4cd4-a3cf-1ca582d7bafa
2d695421-8627-4982-a86a-6e810e07f354	3fb4a546-96fa-4bd2-a312-cd3629c3e391
2d695421-8627-4982-a86a-6e810e07f354	60a80520-1f58-4701-8d3c-3d82d530e956
2d695421-8627-4982-a86a-6e810e07f354	33fa83e0-37c4-4f3e-b3c5-ce344ca305d8
5222805c-7848-4c9c-865d-0e6d6b71f885	cec9c8ae-b54b-4698-a647-1cf2b645431a
5222805c-7848-4c9c-865d-0e6d6b71f885	34d4b5ff-39da-4a9f-ba98-4fab806a64ec
5222805c-7848-4c9c-865d-0e6d6b71f885	ad246772-bdd1-4423-9dd6-8435ac38b82d
5222805c-7848-4c9c-865d-0e6d6b71f885	9275d22c-5b74-4419-a28e-c97f8de72204
5222805c-7848-4c9c-865d-0e6d6b71f885	92e565b0-9b87-4979-99a9-1a6867af1d0b
5222805c-7848-4c9c-865d-0e6d6b71f885	0cd35f43-95e6-4cc8-a61c-24219e8c7b28
5222805c-7848-4c9c-865d-0e6d6b71f885	70d67fb6-ab9c-411b-833c-044844bd014b
5222805c-7848-4c9c-865d-0e6d6b71f885	d19e52a3-0b47-4532-aebc-230cbd2afb39
5222805c-7848-4c9c-865d-0e6d6b71f885	76660524-10cb-42bd-a244-abdbf741be47
5222805c-7848-4c9c-865d-0e6d6b71f885	2b957305-0b01-4a68-90e6-a3393b771611
5222805c-7848-4c9c-865d-0e6d6b71f885	98af9d29-90fb-40e6-88e9-11203916e16a
82290c3e-1d64-407e-becb-7fcfe8fab4b6	0f5bd1ea-3bdd-4199-8a83-2c42e066d7ed
82290c3e-1d64-407e-becb-7fcfe8fab4b6	ffee3101-5934-40c3-bb95-87392970ab9e
82290c3e-1d64-407e-becb-7fcfe8fab4b6	dc525f85-31d6-49f9-bb41-1d7be3e5fd8a
82290c3e-1d64-407e-becb-7fcfe8fab4b6	c1626027-8553-4e4e-bb32-7a03cbfae72d
82290c3e-1d64-407e-becb-7fcfe8fab4b6	a18a2659-32f1-4ecb-a85f-69db0ba4afb0
82290c3e-1d64-407e-becb-7fcfe8fab4b6	c9bf9b95-78b0-4ac8-93ac-4624c051bed5
82290c3e-1d64-407e-becb-7fcfe8fab4b6	3dcd6e8d-549f-41a4-8d5c-ef9fd754273c
82290c3e-1d64-407e-becb-7fcfe8fab4b6	409aaf25-65be-47c6-88ac-6d483242c466
82290c3e-1d64-407e-becb-7fcfe8fab4b6	209dd52f-b881-45aa-9b3d-e7eef9a76bed
82290c3e-1d64-407e-becb-7fcfe8fab4b6	56d64848-6fe4-40b6-9d72-18a206da6562
82290c3e-1d64-407e-becb-7fcfe8fab4b6	9e83bd19-bb8b-4247-bc5f-98e5390932a6
890e4960-ab2b-4186-b351-568ff9092b27	d4df167d-042a-4152-813c-f0f783195c3d
890e4960-ab2b-4186-b351-568ff9092b27	e028a571-97cb-4926-b7cf-0a7deb2ba5ea
890e4960-ab2b-4186-b351-568ff9092b27	6904940f-0e87-4aff-85d0-de3cd3d6f812
890e4960-ab2b-4186-b351-568ff9092b27	fc05315c-0464-42a8-8ff4-5f665b8710e6
890e4960-ab2b-4186-b351-568ff9092b27	1ef2d03b-ccb5-41d9-ace6-da14dbe547f0
890e4960-ab2b-4186-b351-568ff9092b27	7801b578-b4f6-4924-9f21-594ca160c93b
890e4960-ab2b-4186-b351-568ff9092b27	3c834710-b415-4ab7-8d82-ae89fd74379a
890e4960-ab2b-4186-b351-568ff9092b27	72da734e-1b59-426f-8fca-e57d16e39b97
890e4960-ab2b-4186-b351-568ff9092b27	a584ebca-8068-446a-ad36-6cf0473269f8
890e4960-ab2b-4186-b351-568ff9092b27	1ae1cf8c-542a-41b1-870d-53837794e07a
890e4960-ab2b-4186-b351-568ff9092b27	9930cf42-b59c-4741-9194-f416feff668d
4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb	0678def0-54cf-40c4-a685-b27577d0bec5
4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb	54d7c302-4bbc-4e80-9340-d4661690a651
4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb	ec0fef4f-c11a-4416-8045-df7c5dc6502f
4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb	d8b22379-de22-4c03-9b94-f2c42a79c999
4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb	8c67bf32-c9ac-4242-8b63-8cd26da1cbaa
4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb	d2c1cd73-8d20-498e-a327-f60331d9c5f4
4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb	e6394c8b-d42e-4628-9136-c28800985398
4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb	e7a82a05-8f00-49c9-bc0d-7926e370785d
4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb	7bf518d9-4a38-49f7-868e-c84c3a011cf8
4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb	ae03f6d0-7cf4-48a3-996c-b2335b8bc962
4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb	9de61a24-d464-4f89-b9a1-8014c8059c60
79de6a43-1c49-449e-bed9-a67965d23a37	ef13a8be-9aff-484c-881d-5dd0e8631f66
\.


--
-- Data for Name: equipe_manageurs_personnage; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.equipe_manageurs_personnage ("equipeId", "personnageId") FROM stdin;
1065b087-500b-4129-b4aa-ff5247c15bfc	59b7b9eb-da77-48ab-9bc3-340beb29fe0e
1065b087-500b-4129-b4aa-ff5247c15bfc	10389a7a-4bbd-46df-ad34-c8c2eefbcd9e
1065b087-500b-4129-b4aa-ff5247c15bfc	ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9
\.


--
-- Data for Name: equipe_matchs_match; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.equipe_matchs_match ("equipeId", "matchId") FROM stdin;
1065b087-500b-4129-b4aa-ff5247c15bfc	309dbe3a-6c37-4842-acd8-521a6e19c9a1
1065b087-500b-4129-b4aa-ff5247c15bfc	b019f860-ba93-42b1-a67d-9de9755a595e
1065b087-500b-4129-b4aa-ff5247c15bfc	00282566-2519-4aef-9c52-805b2fc50f5d
1065b087-500b-4129-b4aa-ff5247c15bfc	847cb605-72f3-4c60-b254-55e9bfcbf7cf
1065b087-500b-4129-b4aa-ff5247c15bfc	90b08eb9-3508-4129-8560-60db3686a580
1065b087-500b-4129-b4aa-ff5247c15bfc	30e325d2-6051-42ca-a89d-f4296dc3c0b5
1065b087-500b-4129-b4aa-ff5247c15bfc	38cd4e40-8bde-4cda-a758-106487cd52ba
1065b087-500b-4129-b4aa-ff5247c15bfc	68a00b4a-ba72-4c2a-ba08-d1c2bc44b348
1065b087-500b-4129-b4aa-ff5247c15bfc	c3847f17-5aac-4521-b7f8-4e11e39f96a9
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	38cd4e40-8bde-4cda-a758-106487cd52ba
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	b019f860-ba93-42b1-a67d-9de9755a595e
57e1080f-926b-4f05-a4fa-3d56704221c2	68a00b4a-ba72-4c2a-ba08-d1c2bc44b348
0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00	00282566-2519-4aef-9c52-805b2fc50f5d
1c35f137-9ba2-4536-ba1a-87de80e704a4	c3847f17-5aac-4521-b7f8-4e11e39f96a9
18189270-3ac7-4e97-a47f-178f1a0421b0	30e325d2-6051-42ca-a89d-f4296dc3c0b5
79de6a43-1c49-449e-bed9-a67965d23a37	309dbe3a-6c37-4842-acd8-521a6e19c9a1
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	90b08eb9-3508-4129-8560-60db3686a580
2d695421-8627-4982-a86a-6e810e07f354	847cb605-72f3-4c60-b254-55e9bfcbf7cf
1065b087-500b-4129-b4aa-ff5247c15bfc	d3b1787f-9750-4e08-8437-6ebd521bec94
5222805c-7848-4c9c-865d-0e6d6b71f885	d3b1787f-9750-4e08-8437-6ebd521bec94
82290c3e-1d64-407e-becb-7fcfe8fab4b6	345c2d60-a9d0-40e9-9055-00eb22bb6ad2
1065b087-500b-4129-b4aa-ff5247c15bfc	345c2d60-a9d0-40e9-9055-00eb22bb6ad2
1065b087-500b-4129-b4aa-ff5247c15bfc	0a8c5e7d-a06b-453e-a1ed-74140f3e27d1
4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb	0a8c5e7d-a06b-453e-a1ed-74140f3e27d1
\.


--
-- Data for Name: equipe_supertactiques_supertactique; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.equipe_supertactiques_supertactique ("equipeId", "supertactiqueId") FROM stdin;
57e1080f-926b-4f05-a4fa-3d56704221c2	b0ceb2f2-1884-49c0-aaed-b27970241987
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	08909c52-1069-4d9a-b18c-5da4dd3a8fa3
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	0e8f6287-4e30-422e-88a6-f0188051e561
\.


--
-- Data for Name: equipe_supertechniques_supertechnique; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.equipe_supertechniques_supertechnique ("equipeId", "supertechniqueId") FROM stdin;
57e1080f-926b-4f05-a4fa-3d56704221c2	68e47d86-544b-4b58-ae47-d3c2a379ffcb
57e1080f-926b-4f05-a4fa-3d56704221c2	16569a09-6cef-461c-869b-62533f389999
0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00	307222cc-4ea9-423a-9305-d9fbafe692ff
0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00	de717d77-13a0-498c-af82-ab4751bfbf6f
0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00	610e6efa-e893-4e3d-a78c-5bee27eeee0f
1c35f137-9ba2-4536-ba1a-87de80e704a4	ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827
1c35f137-9ba2-4536-ba1a-87de80e704a4	0d58e2e8-5b7d-471c-92ea-3503952361b4
1c35f137-9ba2-4536-ba1a-87de80e704a4	ce7d62f3-b679-47a9-8afe-e8635d081f92
1c35f137-9ba2-4536-ba1a-87de80e704a4	8dbee186-f703-4374-ae66-6098242c5660
18189270-3ac7-4e97-a47f-178f1a0421b0	8dbbb644-a161-4105-ad39-eca821f70f48
18189270-3ac7-4e97-a47f-178f1a0421b0	1bae1658-f971-4b0e-9acc-fc5b2999d335
18189270-3ac7-4e97-a47f-178f1a0421b0	a6c4ecbd-345d-4d83-a3fb-381fd155ba90
18189270-3ac7-4e97-a47f-178f1a0421b0	635b7ae5-e564-4ee5-8be0-11ee0be2944e
79de6a43-1c49-449e-bed9-a67965d23a37	4126a5c0-5a0b-4f0a-aae2-292012a64b55
79de6a43-1c49-449e-bed9-a67965d23a37	dbcf9e99-bb6b-43d6-8bd3-5d7bf284492b
79de6a43-1c49-449e-bed9-a67965d23a37	24008724-7f61-4c38-8ee5-fbb80f110a61
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	7577e5ca-a9e4-4973-80f5-0d42d596f125
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	22d2aa53-910a-4310-8f5c-66141348e409
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	5dbf3891-8435-4877-8081-e45815e0865a
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	04a67f8f-d41f-41eb-be32-c962ebfa41c3
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	f1c7c566-2fdb-479f-9b3e-a1148760d21c
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	92acb0d8-19b4-4d23-87ba-8d6761d4536b
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	300e7b11-4a45-4298-823b-d3cb6b096a46
1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	14211596-bbfb-44b1-afdc-3539e34beb60
2d695421-8627-4982-a86a-6e810e07f354	7e6d27bd-cf47-49a6-9bc2-3cdaeafa78c1
2d695421-8627-4982-a86a-6e810e07f354	150f3b7f-c5b1-4723-a101-fcdd6d93d00f
2d695421-8627-4982-a86a-6e810e07f354	f3bde92b-de79-414d-9707-93baf6e9e44d
2d695421-8627-4982-a86a-6e810e07f354	1a807ccd-64dc-4902-9cb2-f79bc96ef41d
2d695421-8627-4982-a86a-6e810e07f354	cedd92ea-7710-460c-8667-76617f1005cb
2d695421-8627-4982-a86a-6e810e07f354	ed55069b-0022-4b67-be51-b5a76afd569f
1065b087-500b-4129-b4aa-ff5247c15bfc	47366cd9-e9cb-4dda-9e43-089dd57163fc
1065b087-500b-4129-b4aa-ff5247c15bfc	648c4240-7cc3-4e39-9aa8-f038b1b3ec59
1065b087-500b-4129-b4aa-ff5247c15bfc	2362167f-7dd1-40c2-a439-1e6cc5de2359
1065b087-500b-4129-b4aa-ff5247c15bfc	dbcf9e99-bb6b-43d6-8bd3-5d7bf284492b
1065b087-500b-4129-b4aa-ff5247c15bfc	afa4c495-1884-4e0b-bf12-9ce6916f8ab6
1065b087-500b-4129-b4aa-ff5247c15bfc	5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7
1065b087-500b-4129-b4aa-ff5247c15bfc	04855b47-7f52-442b-933e-75f60e576f7b
1065b087-500b-4129-b4aa-ff5247c15bfc	0aefa877-7d31-4721-9d5c-e27a56b20ebb
1065b087-500b-4129-b4aa-ff5247c15bfc	3b7fe383-5d9d-43fd-8081-4985fb59f1a1
1065b087-500b-4129-b4aa-ff5247c15bfc	fee38ff1-00f9-40f5-a809-9556d6ff7655
1065b087-500b-4129-b4aa-ff5247c15bfc	964f1077-700a-4cdb-a974-40a82ad54696
1065b087-500b-4129-b4aa-ff5247c15bfc	4560c1d7-23c9-4cc1-861e-17063e24e460
1065b087-500b-4129-b4aa-ff5247c15bfc	16af5557-b14c-4168-9acb-5dae4cb664fc
1065b087-500b-4129-b4aa-ff5247c15bfc	ad527b4c-643e-4321-bc49-0d34e28917d8
1065b087-500b-4129-b4aa-ff5247c15bfc	81541c14-f7ae-4dd4-98a3-ce92428d76e3
1065b087-500b-4129-b4aa-ff5247c15bfc	ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827
1065b087-500b-4129-b4aa-ff5247c15bfc	6d283ab7-0e4e-4f3e-92de-25b5500cf018
1065b087-500b-4129-b4aa-ff5247c15bfc	24008724-7f61-4c38-8ee5-fbb80f110a61
1065b087-500b-4129-b4aa-ff5247c15bfc	1a52ebab-766e-4ea3-b243-7007d1c08929
1065b087-500b-4129-b4aa-ff5247c15bfc	8fc435b4-d4fc-4952-be2c-39d41119f6bd
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	399f5c78-382b-4795-8204-38e17a947877
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	09c253c5-5b70-4933-bba8-d9d330963b38
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	7ed876fa-6b35-4435-9ac2-bc71b35a70aa
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	ddd2538b-718a-4069-9994-d4c8a4ed650a
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	83d3c062-8ab6-4538-9d87-3088ab618a31
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	6b2fe94d-a136-433d-802b-14c41078c39a
7867fcf3-647e-4b7b-bf1e-f6ecb5027232	978d2fc4-b8aa-4b88-8995-d3086c8a7a7b
5222805c-7848-4c9c-865d-0e6d6b71f885	093bbc31-ceb1-441b-95ee-68b70bc02e96
5222805c-7848-4c9c-865d-0e6d6b71f885	63eb99ce-fe82-460f-b879-ffd2b0854dba
1065b087-500b-4129-b4aa-ff5247c15bfc	ece9a390-8381-4ea9-ad78-769e1c89e2a4
1065b087-500b-4129-b4aa-ff5247c15bfc	52e228c2-d127-4069-a430-7024367042f3
1065b087-500b-4129-b4aa-ff5247c15bfc	4126a5c0-5a0b-4f0a-aae2-292012a64b55
5222805c-7848-4c9c-865d-0e6d6b71f885	c0298e15-3d0a-487d-9120-b9c6e2fe5cf3
5222805c-7848-4c9c-865d-0e6d6b71f885	fb8cc7fa-06d4-4c58-b35f-0ab72c58cb36
82290c3e-1d64-407e-becb-7fcfe8fab4b6	6fbc8ad4-b945-425b-ae70-dafe253cb7c9
1065b087-500b-4129-b4aa-ff5247c15bfc	83d3c062-8ab6-4538-9d87-3088ab618a31
82290c3e-1d64-407e-becb-7fcfe8fab4b6	af536aa1-e23f-47eb-8384-16f45cf699ab
82290c3e-1d64-407e-becb-7fcfe8fab4b6	0da08037-311f-4c32-a63d-a683888abbc3
82290c3e-1d64-407e-becb-7fcfe8fab4b6	4155f230-b355-4267-a81e-0e0b5be7df02
82290c3e-1d64-407e-becb-7fcfe8fab4b6	48a5b83c-69d9-49a3-bbec-e37f91d12455
82290c3e-1d64-407e-becb-7fcfe8fab4b6	3a041235-6c8c-45fa-9370-74de42faa31e
82290c3e-1d64-407e-becb-7fcfe8fab4b6	30d1a342-c192-41ac-aea2-b2f234b31aae
82290c3e-1d64-407e-becb-7fcfe8fab4b6	8d074acc-1d1e-4be7-8082-6f7a3b2a37ba
1065b087-500b-4129-b4aa-ff5247c15bfc	5e045d21-9f73-4088-abd6-4130e31d87fe
1065b087-500b-4129-b4aa-ff5247c15bfc	c88cfb8e-f11d-4bef-abb0-8fba9ab51474
\.


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.image (id, note, images, "serieId", "episodeId") FROM stdin;
d1092838-803d-44da-b9a0-3b6ea0f2f173	Mark Evans étant jeune	https://static.wikia.nocookie.net/inazuma-eleven/images/e/ec/Mark_jeune.jpg/revision/latest?cb=20190830183735&path-prefix=fr	2451ef9f-9bd1-499b-83fc-5505be405ed5	\N
f1057190-4301-4f7d-9c25-7542e1068d38	Mark Evans lorsqu'il découvre son premier ballon de foot	https://static.wikia.nocookie.net/inazuma-eleven/images/b/b3/Mark_enfant.jpg/revision/latest?cb=20190829194655&path-prefix=fr	2451ef9f-9bd1-499b-83fc-5505be405ed5	\N
092b340b-b573-4785-a92a-d7208c10c2b6	Mark dans le local de football (saison 1)	https://static.wikia.nocookie.net/inazuma-eleven/images/c/c7/IE_102.png/revision/latest?cb=20200524162332&path-prefix=fr	2451ef9f-9bd1-499b-83fc-5505be405ed5	\N
2e4d1962-b87a-424d-8fb7-ffe4aede1af4	Mark lors de l'un de ses entraînements avec le pneu (saison 1)	https://static.wikia.nocookie.net/inazuma-eleven/images/0/03/Mark_s1_4.png/revision/latest/scale-to-width-down/1000?cb=20220911212543&path-prefix=fr	2451ef9f-9bd1-499b-83fc-5505be405ed5	\N
e41ac516-85d8-4510-9ae5-39ceb50ee969	Mark essayant d'arrêter un tir de Jude Sharp (saison 1)	https://static.wikia.nocookie.net/inazuma-eleven/images/a/a5/Mark%2C_essayant_d%27arr%C3%AAter_le_tir_de_Jude.png/revision/latest/scale-to-width-down/1000?cb=20220911223957&path-prefix=fr	2451ef9f-9bd1-499b-83fc-5505be405ed5	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
dab82347-f524-47cb-a78a-3cee1564bea9	Mark avec le survêtement de l'équipe de foot	https://static.wikia.nocookie.net/inazuma-eleven/images/5/53/Mark_s1_9.png/revision/latest?cb=20220911212550&path-prefix=fr	2451ef9f-9bd1-499b-83fc-5505be405ed5	\N
ee1e86ee-c2dc-48f9-a46b-936a44f2b1ce	Mark s'entraînant à maîtriser la Main Magique	https://static.wikia.nocookie.net/inazuma-eleven/images/b/b8/Mark_9.png/revision/latest/scale-to-width-down/1000?cb=20220911211231&path-prefix=fr	2451ef9f-9bd1-499b-83fc-5505be405ed5	\N
ce358577-68b3-4650-aef6-de81f7f29761	Mark utilisant la Main Magique plus rapidement (saison 2)	https://static.wikia.nocookie.net/inazuma-eleven/images/1/17/Marck_s1_17.png/revision/latest?cb=20220911211107&path-prefix=fr	2451ef9f-9bd1-499b-83fc-5505be405ed5	\N
7eaaed93-bf9a-4446-9813-ea456696cd64	Mark s'entraînant à maîtriser le Poing de la Justice (saison 2)	https://static.wikia.nocookie.net/inazuma-eleven/images/2/21/Mark%2C_s%27entrainant_%C3%A0_maitriser_le_Poing_de_la_Justice.png/revision/latest/scale-to-width-down/1000?cb=20220911220113&path-prefix=fr	2451ef9f-9bd1-499b-83fc-5505be405ed5	\N
acf0ff8c-5e11-4dab-af98-d35a41eb4ffe	Mark en pleine déprime après le départ de Nathan et de Tod (saison 2)	https://static.wikia.nocookie.net/inazuma-eleven/images/d/d8/Mark%2C_en_pleine_d%C3%A9prime.png/revision/latest?cb=20220911220126&path-prefix=fr	2451ef9f-9bd1-499b-83fc-5505be405ed5	\N
f7714967-f698-4ed5-8824-8b5b613c16a4	Mark arrêtant le tir de Seymour Hillman (saison 1)	https://static.wikia.nocookie.net/inazuma-eleven/images/7/7a/Mark%2C_arr%C3%AAtant_un_tir_d%27Hillman.png/revision/latest/scale-to-width-down/1000?cb=20220911215827&path-prefix=fr	2451ef9f-9bd1-499b-83fc-5505be405ed5	d102057f-4e62-4e78-b37d-a764e8256a1b
d86d1d0d-f5fc-4807-89af-5d2e40846675	Mark s'entraînant au surf (saison 2)	https://static.wikia.nocookie.net/inazuma-eleven/images/9/97/Mark_s2_2.png/revision/latest?cb=20190830184020&path-prefix=fr	2451ef9f-9bd1-499b-83fc-5505be405ed5	\N
\.


--
-- Data for Name: image_equipe_equipe; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.image_equipe_equipe ("imageId", "equipeId") FROM stdin;
d1092838-803d-44da-b9a0-3b6ea0f2f173	1065b087-500b-4129-b4aa-ff5247c15bfc
f1057190-4301-4f7d-9c25-7542e1068d38	1065b087-500b-4129-b4aa-ff5247c15bfc
092b340b-b573-4785-a92a-d7208c10c2b6	1065b087-500b-4129-b4aa-ff5247c15bfc
2e4d1962-b87a-424d-8fb7-ffe4aede1af4	1065b087-500b-4129-b4aa-ff5247c15bfc
e41ac516-85d8-4510-9ae5-39ceb50ee969	1065b087-500b-4129-b4aa-ff5247c15bfc
dab82347-f524-47cb-a78a-3cee1564bea9	1065b087-500b-4129-b4aa-ff5247c15bfc
f7714967-f698-4ed5-8824-8b5b613c16a4	1065b087-500b-4129-b4aa-ff5247c15bfc
ee1e86ee-c2dc-48f9-a46b-936a44f2b1ce	1065b087-500b-4129-b4aa-ff5247c15bfc
ce358577-68b3-4650-aef6-de81f7f29761	1065b087-500b-4129-b4aa-ff5247c15bfc
7eaaed93-bf9a-4446-9813-ea456696cd64	1065b087-500b-4129-b4aa-ff5247c15bfc
acf0ff8c-5e11-4dab-af98-d35a41eb4ffe	1065b087-500b-4129-b4aa-ff5247c15bfc
d86d1d0d-f5fc-4807-89af-5d2e40846675	1065b087-500b-4129-b4aa-ff5247c15bfc
\.


--
-- Data for Name: image_personnages_personnage; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.image_personnages_personnage ("imageId", "personnageId") FROM stdin;
d1092838-803d-44da-b9a0-3b6ea0f2f173	2054bb43-179d-42d6-b601-31eb342745a9
f1057190-4301-4f7d-9c25-7542e1068d38	2054bb43-179d-42d6-b601-31eb342745a9
092b340b-b573-4785-a92a-d7208c10c2b6	2054bb43-179d-42d6-b601-31eb342745a9
2e4d1962-b87a-424d-8fb7-ffe4aede1af4	2054bb43-179d-42d6-b601-31eb342745a9
e41ac516-85d8-4510-9ae5-39ceb50ee969	2054bb43-179d-42d6-b601-31eb342745a9
dab82347-f524-47cb-a78a-3cee1564bea9	2054bb43-179d-42d6-b601-31eb342745a9
f7714967-f698-4ed5-8824-8b5b613c16a4	2054bb43-179d-42d6-b601-31eb342745a9
ee1e86ee-c2dc-48f9-a46b-936a44f2b1ce	2054bb43-179d-42d6-b601-31eb342745a9
ce358577-68b3-4650-aef6-de81f7f29761	2054bb43-179d-42d6-b601-31eb342745a9
7eaaed93-bf9a-4446-9813-ea456696cd64	2054bb43-179d-42d6-b601-31eb342745a9
acf0ff8c-5e11-4dab-af98-d35a41eb4ffe	2054bb43-179d-42d6-b601-31eb342745a9
d86d1d0d-f5fc-4807-89af-5d2e40846675	2054bb43-179d-42d6-b601-31eb342745a9
\.


--
-- Data for Name: match; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.match (id, notes, compo_equipe_1, compo_equipe_2, "idEquipe1Id", "idEquipe2Id", "serieId") FROM stdin;
b019f860-ba93-42b1-a67d-9de9755a595e	Score : 20-1\nRaimon gagne après que la Royal Academy décide de déclarer forfait	https://www.notion.so/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F4602a310-41dc-4881-9b46-6ff093f74dbf%2Fba246d3e-9329-4628-9d2b-fb753bae7af3%2Fraimon_match1.png?id=fb194f96-561f-42a2-ad24-42bf023d9b55&table=block&spaceId=4602a310-41dc-4881-9b46-6ff093f74dbf&width=1530&userId=1ceb0888-7cf7-41ff-bffc-4d02ebcf838d&cache=v2	https://www.notion.so/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F4602a310-41dc-4881-9b46-6ff093f74dbf%2Fbb5f4390-dfa9-4c7a-b5bf-2498d679af38%2Froaylmatch1.png?id=fb194f96-561f-42a2-ad24-42bf023d9b55&table=block&spaceId=4602a310-41dc-4881-9b46-6ff093f74dbf&width=1530&userId=1ceb0888-7cf7-41ff-bffc-4d02ebcf838d&cache=v2	1065b087-500b-4129-b4aa-ff5247c15bfc	7867fcf3-647e-4b7b-bf1e-f6ecb5027232	2451ef9f-9bd1-499b-83fc-5505be405ed5
68a00b4a-ba72-4c2a-ba08-d1c2bc44b348	Score: 4 - 3\nRaimon gagne le match	https://www.notion.so/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F4602a310-41dc-4881-9b46-6ff093f74dbf%2Fc636571c-b55c-4c24-927a-1c79e7c6d99b%2Fraimonmatch2.png?table=block&id=88f129ad-e82e-49a2-b646-f3923e9fcdf3&spaceId=4602a310-41dc-4881-9b46-6ff093f74dbf&width=1530&userId=1ceb0888-7cf7-41ff-bffc-4d02ebcf838d&cache=v2		1065b087-500b-4129-b4aa-ff5247c15bfc	57e1080f-926b-4f05-a4fa-3d56704221c2	2451ef9f-9bd1-499b-83fc-5505be405ed5
00282566-2519-4aef-9c52-805b2fc50f5d	Score: 1 - 0\nRaimon gagne le match	https://www.notion.so/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F4602a310-41dc-4881-9b46-6ff093f74dbf%2F09b58c1b-f035-428d-a8f9-4dd472f2fb33%2Fraimon_match3.png?table=block&id=de22c3d6-3b07-433d-a1c2-47f98ebc5f51&spaceId=4602a310-41dc-4881-9b46-6ff093f74dbf&width=1530&userId=1ceb0888-7cf7-41ff-bffc-4d02ebcf838d&cache=v2	https://www.notion.so/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F4602a310-41dc-4881-9b46-6ff093f74dbf%2F7dcb0300-64ed-401d-9e91-977178c5b4ec%2Fwildmatch3.png?id=de22c3d6-3b07-433d-a1c2-47f98ebc5f51&table=block&spaceId=4602a310-41dc-4881-9b46-6ff093f74dbf&width=1530&userId=1ceb0888-7cf7-41ff-bffc-4d02ebcf838d&cache=v2	1065b087-500b-4129-b4aa-ff5247c15bfc	0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00	2451ef9f-9bd1-499b-83fc-5505be405ed5
c3847f17-5aac-4521-b7f8-4e11e39f96a9	Score: 2 - 1\nRaimon gagne le match	https://www.notion.so/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F4602a310-41dc-4881-9b46-6ff093f74dbf%2Fadffcd3c-a892-42a5-b652-ff8fed20820b%2Fraimon_match_4.png?id=1999a54d-9c19-41f6-bf7a-194d26b02f30&table=block&spaceId=4602a310-41dc-4881-9b46-6ff093f74dbf&width=600&userId=1ceb0888-7cf7-41ff-bffc-4d02ebcf838d&cache=v2		1065b087-500b-4129-b4aa-ff5247c15bfc	1c35f137-9ba2-4536-ba1a-87de80e704a4	2451ef9f-9bd1-499b-83fc-5505be405ed5
30e325d2-6051-42ca-a89d-f4296dc3c0b5	Score: 2 - 1\nRaimon gagne le match	https://www.notion.so/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F4602a310-41dc-4881-9b46-6ff093f74dbf%2F4064cc4a-1372-4940-b112-710d048c84b8%2Fraimon_match_5.png?id=2e04bcb2-ac46-4767-85ab-2d4b899f5488&table=block&spaceId=4602a310-41dc-4881-9b46-6ff093f74dbf&width=1530&userId=1ceb0888-7cf7-41ff-bffc-4d02ebcf838d&cache=v2	https://www.notion.so/image/https%3A%2F%2Fprod-files-secure.s3.us-west-2.amazonaws.com%2F4602a310-41dc-4881-9b46-6ff093f74dbf%2Ffe609651-c45f-410c-add5-3ea004debfd1%2Fotakumatch5.png?id=2e04bcb2-ac46-4767-85ab-2d4b899f5488&table=block&spaceId=4602a310-41dc-4881-9b46-6ff093f74dbf&width=1530&userId=1ceb0888-7cf7-41ff-bffc-4d02ebcf838d&cache=v2	1065b087-500b-4129-b4aa-ff5247c15bfc	18189270-3ac7-4e97-a47f-178f1a0421b0	2451ef9f-9bd1-499b-83fc-5505be405ed5
38cd4e40-8bde-4cda-a758-106487cd52ba	Score: 2 - 1\nRaimon gagne le match	\N	\N	1065b087-500b-4129-b4aa-ff5247c15bfc	7867fcf3-647e-4b7b-bf1e-f6ecb5027232	2451ef9f-9bd1-499b-83fc-5505be405ed5
309dbe3a-6c37-4842-acd8-521a6e19c9a1	Score: 3 - 3\nMatch nul	\N	\N	1065b087-500b-4129-b4aa-ff5247c15bfc	79de6a43-1c49-449e-bed9-a67965d23a37	2451ef9f-9bd1-499b-83fc-5505be405ed5
90b08eb9-3508-4129-8560-60db3686a580	Score: 2 - 1\nRaimon gagne le match	\N	\N	1065b087-500b-4129-b4aa-ff5247c15bfc	1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5	2451ef9f-9bd1-499b-83fc-5505be405ed5
847cb605-72f3-4c60-b254-55e9bfcbf7cf	Score: 2 - 1\nRaimon gagne le match	\N	\N	1065b087-500b-4129-b4aa-ff5247c15bfc	2d695421-8627-4982-a86a-6e810e07f354	2451ef9f-9bd1-499b-83fc-5505be405ed5
d3b1787f-9750-4e08-8437-6ebd521bec94	Score: 3 - 2\nRaimon gagne le match	\N	\N	1065b087-500b-4129-b4aa-ff5247c15bfc	5222805c-7848-4c9c-865d-0e6d6b71f885	2451ef9f-9bd1-499b-83fc-5505be405ed5
345c2d60-a9d0-40e9-9055-00eb22bb6ad2	Score: 4 - 3\nRaimon gagne le match	\N	\N	1065b087-500b-4129-b4aa-ff5247c15bfc	82290c3e-1d64-407e-becb-7fcfe8fab4b6	2451ef9f-9bd1-499b-83fc-5505be405ed5
0a8c5e7d-a06b-453e-a1ed-74140f3e27d1	Score: 0 - 12\nLa Tempête des Gémeaux gagne le match	\N	\N	1065b087-500b-4129-b4aa-ff5247c15bfc	4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb	2451ef9f-9bd1-499b-83fc-5505be405ed5
\.


--
-- Data for Name: match_episodes_episode; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.match_episodes_episode ("matchId", "episodeId") FROM stdin;
847cb605-72f3-4c60-b254-55e9bfcbf7cf	4016b5fa-c380-496f-a3a5-251e48a9db66
90b08eb9-3508-4129-8560-60db3686a580	aeb63f75-d22d-492b-bfb3-700d2343c915
38cd4e40-8bde-4cda-a758-106487cd52ba	9c282416-79fc-4340-bd9c-b0f42652c9a5
38cd4e40-8bde-4cda-a758-106487cd52ba	99519aee-5871-4ab9-a5b5-2309e4e11117
30e325d2-6051-42ca-a89d-f4296dc3c0b5	22a06b40-2b8c-46a1-bc90-df535a96e07e
b019f860-ba93-42b1-a67d-9de9755a595e	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
309dbe3a-6c37-4842-acd8-521a6e19c9a1	2228af33-de0e-4227-916f-e958fea744cf
68a00b4a-ba72-4c2a-ba08-d1c2bc44b348	be80eb60-f867-454f-97e7-86a675c09f53
00282566-2519-4aef-9c52-805b2fc50f5d	66abafd9-5110-4c47-a81c-9a2a4f74cb08
c3847f17-5aac-4521-b7f8-4e11e39f96a9	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
d3b1787f-9750-4e08-8437-6ebd521bec94	69125a81-1480-486f-a2f1-2a6c6624187e
d3b1787f-9750-4e08-8437-6ebd521bec94	1ea85325-d23b-4700-8a5b-40884b779c52
345c2d60-a9d0-40e9-9055-00eb22bb6ad2	10c29f7a-f084-4eb4-87ab-419707c80fb4
345c2d60-a9d0-40e9-9055-00eb22bb6ad2	f453fce2-0cb7-4e97-952e-a72d4347a756
0a8c5e7d-a06b-453e-a1ed-74140f3e27d1	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
\.


--
-- Data for Name: match_supertactiques_supertactique; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.match_supertactiques_supertactique ("matchId", "supertactiqueId") FROM stdin;
68a00b4a-ba72-4c2a-ba08-d1c2bc44b348	b0ceb2f2-1884-49c0-aaed-b27970241987
90b08eb9-3508-4129-8560-60db3686a580	08909c52-1069-4d9a-b18c-5da4dd3a8fa3
90b08eb9-3508-4129-8560-60db3686a580	0e8f6287-4e30-422e-88a6-f0188051e561
\.


--
-- Data for Name: match_supertechniques_supertechnique; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.match_supertechniques_supertechnique ("matchId", "supertechniqueId") FROM stdin;
b019f860-ba93-42b1-a67d-9de9755a595e	24008724-7f61-4c38-8ee5-fbb80f110a61
b019f860-ba93-42b1-a67d-9de9755a595e	7ed876fa-6b35-4435-9ac2-bc71b35a70aa
b019f860-ba93-42b1-a67d-9de9755a595e	978d2fc4-b8aa-4b88-8995-d3086c8a7a7b
b019f860-ba93-42b1-a67d-9de9755a595e	ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827
b019f860-ba93-42b1-a67d-9de9755a595e	ddd2538b-718a-4069-9994-d4c8a4ed650a
68a00b4a-ba72-4c2a-ba08-d1c2bc44b348	5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7
68a00b4a-ba72-4c2a-ba08-d1c2bc44b348	68e47d86-544b-4b58-ae47-d3c2a379ffcb
68a00b4a-ba72-4c2a-ba08-d1c2bc44b348	16569a09-6cef-461c-869b-62533f389999
68a00b4a-ba72-4c2a-ba08-d1c2bc44b348	81541c14-f7ae-4dd4-98a3-ce92428d76e3
68a00b4a-ba72-4c2a-ba08-d1c2bc44b348	47366cd9-e9cb-4dda-9e43-089dd57163fc
00282566-2519-4aef-9c52-805b2fc50f5d	24008724-7f61-4c38-8ee5-fbb80f110a61
00282566-2519-4aef-9c52-805b2fc50f5d	5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7
00282566-2519-4aef-9c52-805b2fc50f5d	81541c14-f7ae-4dd4-98a3-ce92428d76e3
00282566-2519-4aef-9c52-805b2fc50f5d	610e6efa-e893-4e3d-a78c-5bee27eeee0f
00282566-2519-4aef-9c52-805b2fc50f5d	307222cc-4ea9-423a-9305-d9fbafe692ff
00282566-2519-4aef-9c52-805b2fc50f5d	de717d77-13a0-498c-af82-ab4751bfbf6f
00282566-2519-4aef-9c52-805b2fc50f5d	648c4240-7cc3-4e39-9aa8-f038b1b3ec59
00282566-2519-4aef-9c52-805b2fc50f5d	fee38ff1-00f9-40f5-a809-9556d6ff7655
c3847f17-5aac-4521-b7f8-4e11e39f96a9	24008724-7f61-4c38-8ee5-fbb80f110a61
c3847f17-5aac-4521-b7f8-4e11e39f96a9	5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7
c3847f17-5aac-4521-b7f8-4e11e39f96a9	81541c14-f7ae-4dd4-98a3-ce92428d76e3
c3847f17-5aac-4521-b7f8-4e11e39f96a9	fee38ff1-00f9-40f5-a809-9556d6ff7655
c3847f17-5aac-4521-b7f8-4e11e39f96a9	ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827
c3847f17-5aac-4521-b7f8-4e11e39f96a9	47366cd9-e9cb-4dda-9e43-089dd57163fc
c3847f17-5aac-4521-b7f8-4e11e39f96a9	ad527b4c-643e-4321-bc49-0d34e28917d8
c3847f17-5aac-4521-b7f8-4e11e39f96a9	ce7d62f3-b679-47a9-8afe-e8635d081f92
c3847f17-5aac-4521-b7f8-4e11e39f96a9	8dbee186-f703-4374-ae66-6098242c5660
c3847f17-5aac-4521-b7f8-4e11e39f96a9	0d58e2e8-5b7d-471c-92ea-3503952361b4
30e325d2-6051-42ca-a89d-f4296dc3c0b5	a6c4ecbd-345d-4d83-a3fb-381fd155ba90
30e325d2-6051-42ca-a89d-f4296dc3c0b5	8dbbb644-a161-4105-ad39-eca821f70f48
30e325d2-6051-42ca-a89d-f4296dc3c0b5	1bae1658-f971-4b0e-9acc-fc5b2999d335
30e325d2-6051-42ca-a89d-f4296dc3c0b5	5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7
30e325d2-6051-42ca-a89d-f4296dc3c0b5	635b7ae5-e564-4ee5-8be0-11ee0be2944e
309dbe3a-6c37-4842-acd8-521a6e19c9a1	24008724-7f61-4c38-8ee5-fbb80f110a61
309dbe3a-6c37-4842-acd8-521a6e19c9a1	5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7
309dbe3a-6c37-4842-acd8-521a6e19c9a1	81541c14-f7ae-4dd4-98a3-ce92428d76e3
309dbe3a-6c37-4842-acd8-521a6e19c9a1	ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827
309dbe3a-6c37-4842-acd8-521a6e19c9a1	4126a5c0-5a0b-4f0a-aae2-292012a64b55
309dbe3a-6c37-4842-acd8-521a6e19c9a1	dbcf9e99-bb6b-43d6-8bd3-5d7bf284492b
90b08eb9-3508-4129-8560-60db3686a580	24008724-7f61-4c38-8ee5-fbb80f110a61
90b08eb9-3508-4129-8560-60db3686a580	81541c14-f7ae-4dd4-98a3-ce92428d76e3
90b08eb9-3508-4129-8560-60db3686a580	ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827
90b08eb9-3508-4129-8560-60db3686a580	dbcf9e99-bb6b-43d6-8bd3-5d7bf284492b
90b08eb9-3508-4129-8560-60db3686a580	5dbf3891-8435-4877-8081-e45815e0865a
90b08eb9-3508-4129-8560-60db3686a580	f1c7c566-2fdb-479f-9b3e-a1148760d21c
90b08eb9-3508-4129-8560-60db3686a580	47366cd9-e9cb-4dda-9e43-089dd57163fc
90b08eb9-3508-4129-8560-60db3686a580	14211596-bbfb-44b1-afdc-3539e34beb60
90b08eb9-3508-4129-8560-60db3686a580	04a67f8f-d41f-41eb-be32-c962ebfa41c3
90b08eb9-3508-4129-8560-60db3686a580	92acb0d8-19b4-4d23-87ba-8d6761d4536b
90b08eb9-3508-4129-8560-60db3686a580	300e7b11-4a45-4298-823b-d3cb6b096a46
90b08eb9-3508-4129-8560-60db3686a580	7577e5ca-a9e4-4973-80f5-0d42d596f125
90b08eb9-3508-4129-8560-60db3686a580	22d2aa53-910a-4310-8f5c-66141348e409
90b08eb9-3508-4129-8560-60db3686a580	4560c1d7-23c9-4cc1-861e-17063e24e460
847cb605-72f3-4c60-b254-55e9bfcbf7cf	dbcf9e99-bb6b-43d6-8bd3-5d7bf284492b
847cb605-72f3-4c60-b254-55e9bfcbf7cf	47366cd9-e9cb-4dda-9e43-089dd57163fc
847cb605-72f3-4c60-b254-55e9bfcbf7cf	4560c1d7-23c9-4cc1-861e-17063e24e460
847cb605-72f3-4c60-b254-55e9bfcbf7cf	150f3b7f-c5b1-4723-a101-fcdd6d93d00f
847cb605-72f3-4c60-b254-55e9bfcbf7cf	f3bde92b-de79-414d-9707-93baf6e9e44d
847cb605-72f3-4c60-b254-55e9bfcbf7cf	648c4240-7cc3-4e39-9aa8-f038b1b3ec59
847cb605-72f3-4c60-b254-55e9bfcbf7cf	7e6d27bd-cf47-49a6-9bc2-3cdaeafa78c1
847cb605-72f3-4c60-b254-55e9bfcbf7cf	5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7
847cb605-72f3-4c60-b254-55e9bfcbf7cf	cedd92ea-7710-460c-8667-76617f1005cb
847cb605-72f3-4c60-b254-55e9bfcbf7cf	ed55069b-0022-4b67-be51-b5a76afd569f
847cb605-72f3-4c60-b254-55e9bfcbf7cf	1a807ccd-64dc-4902-9cb2-f79bc96ef41d
847cb605-72f3-4c60-b254-55e9bfcbf7cf	fee38ff1-00f9-40f5-a809-9556d6ff7655
847cb605-72f3-4c60-b254-55e9bfcbf7cf	ad527b4c-643e-4321-bc49-0d34e28917d8
847cb605-72f3-4c60-b254-55e9bfcbf7cf	2362167f-7dd1-40c2-a439-1e6cc5de2359
38cd4e40-8bde-4cda-a758-106487cd52ba	399f5c78-382b-4795-8204-38e17a947877
38cd4e40-8bde-4cda-a758-106487cd52ba	09c253c5-5b70-4933-bba8-d9d330963b38
38cd4e40-8bde-4cda-a758-106487cd52ba	47366cd9-e9cb-4dda-9e43-089dd57163fc
38cd4e40-8bde-4cda-a758-106487cd52ba	ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827
38cd4e40-8bde-4cda-a758-106487cd52ba	16af5557-b14c-4168-9acb-5dae4cb664fc
38cd4e40-8bde-4cda-a758-106487cd52ba	7ed876fa-6b35-4435-9ac2-bc71b35a70aa
38cd4e40-8bde-4cda-a758-106487cd52ba	ddd2538b-718a-4069-9994-d4c8a4ed650a
38cd4e40-8bde-4cda-a758-106487cd52ba	83d3c062-8ab6-4538-9d87-3088ab618a31
38cd4e40-8bde-4cda-a758-106487cd52ba	24008724-7f61-4c38-8ee5-fbb80f110a61
38cd4e40-8bde-4cda-a758-106487cd52ba	81541c14-f7ae-4dd4-98a3-ce92428d76e3
38cd4e40-8bde-4cda-a758-106487cd52ba	0aefa877-7d31-4721-9d5c-e27a56b20ebb
38cd4e40-8bde-4cda-a758-106487cd52ba	5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7
38cd4e40-8bde-4cda-a758-106487cd52ba	6b2fe94d-a136-433d-802b-14c41078c39a
38cd4e40-8bde-4cda-a758-106487cd52ba	04855b47-7f52-442b-933e-75f60e576f7b
38cd4e40-8bde-4cda-a758-106487cd52ba	6d283ab7-0e4e-4f3e-92de-25b5500cf018
d3b1787f-9750-4e08-8437-6ebd521bec94	63eb99ce-fe82-460f-b879-ffd2b0854dba
d3b1787f-9750-4e08-8437-6ebd521bec94	24008724-7f61-4c38-8ee5-fbb80f110a61
d3b1787f-9750-4e08-8437-6ebd521bec94	0aefa877-7d31-4721-9d5c-e27a56b20ebb
d3b1787f-9750-4e08-8437-6ebd521bec94	4560c1d7-23c9-4cc1-861e-17063e24e460
d3b1787f-9750-4e08-8437-6ebd521bec94	1a52ebab-766e-4ea3-b243-7007d1c08929
d3b1787f-9750-4e08-8437-6ebd521bec94	093bbc31-ceb1-441b-95ee-68b70bc02e96
d3b1787f-9750-4e08-8437-6ebd521bec94	c0298e15-3d0a-487d-9120-b9c6e2fe5cf3
d3b1787f-9750-4e08-8437-6ebd521bec94	47366cd9-e9cb-4dda-9e43-089dd57163fc
d3b1787f-9750-4e08-8437-6ebd521bec94	fb8cc7fa-06d4-4c58-b35f-0ab72c58cb36
d3b1787f-9750-4e08-8437-6ebd521bec94	ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827
d3b1787f-9750-4e08-8437-6ebd521bec94	4126a5c0-5a0b-4f0a-aae2-292012a64b55
d3b1787f-9750-4e08-8437-6ebd521bec94	bcb6866c-069c-4d35-b0dd-256756dfc5ed
d3b1787f-9750-4e08-8437-6ebd521bec94	ece9a390-8381-4ea9-ad78-769e1c89e2a4
d3b1787f-9750-4e08-8437-6ebd521bec94	52e228c2-d127-4069-a430-7024367042f3
345c2d60-a9d0-40e9-9055-00eb22bb6ad2	30d1a342-c192-41ac-aea2-b2f234b31aae
345c2d60-a9d0-40e9-9055-00eb22bb6ad2	5e045d21-9f73-4088-abd6-4130e31d87fe
345c2d60-a9d0-40e9-9055-00eb22bb6ad2	6fbc8ad4-b945-425b-ae70-dafe253cb7c9
345c2d60-a9d0-40e9-9055-00eb22bb6ad2	8d074acc-1d1e-4be7-8082-6f7a3b2a37ba
345c2d60-a9d0-40e9-9055-00eb22bb6ad2	48a5b83c-69d9-49a3-bbec-e37f91d12455
345c2d60-a9d0-40e9-9055-00eb22bb6ad2	4155f230-b355-4267-a81e-0e0b5be7df02
345c2d60-a9d0-40e9-9055-00eb22bb6ad2	0da08037-311f-4c32-a63d-a683888abbc3
345c2d60-a9d0-40e9-9055-00eb22bb6ad2	af536aa1-e23f-47eb-8384-16f45cf699ab
345c2d60-a9d0-40e9-9055-00eb22bb6ad2	52e228c2-d127-4069-a430-7024367042f3
345c2d60-a9d0-40e9-9055-00eb22bb6ad2	ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827
345c2d60-a9d0-40e9-9055-00eb22bb6ad2	6b2fe94d-a136-433d-802b-14c41078c39a
345c2d60-a9d0-40e9-9055-00eb22bb6ad2	c88cfb8e-f11d-4bef-abb0-8fba9ab51474
345c2d60-a9d0-40e9-9055-00eb22bb6ad2	648c4240-7cc3-4e39-9aa8-f038b1b3ec59
345c2d60-a9d0-40e9-9055-00eb22bb6ad2	3a041235-6c8c-45fa-9370-74de42faa31e
345c2d60-a9d0-40e9-9055-00eb22bb6ad2	83d3c062-8ab6-4538-9d87-3088ab618a31
345c2d60-a9d0-40e9-9055-00eb22bb6ad2	47366cd9-e9cb-4dda-9e43-089dd57163fc
345c2d60-a9d0-40e9-9055-00eb22bb6ad2	24008724-7f61-4c38-8ee5-fbb80f110a61
345c2d60-a9d0-40e9-9055-00eb22bb6ad2	0aefa877-7d31-4721-9d5c-e27a56b20ebb
0a8c5e7d-a06b-453e-a1ed-74140f3e27d1	5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7
0a8c5e7d-a06b-453e-a1ed-74140f3e27d1	04855b47-7f52-442b-933e-75f60e576f7b
0a8c5e7d-a06b-453e-a1ed-74140f3e27d1	2362167f-7dd1-40c2-a439-1e6cc5de2359
\.


--
-- Data for Name: personnage; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.personnage (id, "nom_français_personnage", nom_original_personnage, position_personnage, note, "serieId") FROM stdin;
e536088e-f3c2-4bcb-a862-da890a7e1a39	Edward Gladstone	Ikari Gengorō	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
03f04e6f-690c-43f0-a037-0bb816a768bc	Joseph King	Genda Kōjirō	Gardien	- Son nom de famille fait référence à son titre, qui est le "Roi des gardiens" (キング・オブ・ゴールキーパー, Kingu Obu Gōrukīpā).\n- En tant que joueur de la Nouvelle Royal Academy, son titre devient l'"Empereur des gardiens".\n- Son nom original "Genda Kōjirō" a exactement les mêmes initiales que le poste auquel il évolue : "GoalKeeper" ("Gardien de but" en anglais).\n- Il est né un 14 Avril, qui est aussi la date d'anniversaire de Jude Sharp.\n- En tant que joueur de la Nouvelle Royal Academy, Joseph King est quelque peu similaire au personnage de Scar dans le Roi Lion. Ils ont une crinière (ou une coiffure y ressemblant). Ils ont une cicatrice à un de leurs yeux.\n- Joseph maitrise des Supertechniques appelées "Morsure Sauvage", ou encore "Morsure Bestiale".	2451ef9f-9bd1-499b-83fc-5505be405ed5
8cec069d-4385-4399-8949-dd221bcc2225	Peter Drent	Oono Densuke	Défenseur	- Dans le Manga seulement, il fait parti des postulants pour l'équipe nationale mais n'est pas retenu.	2451ef9f-9bd1-499b-83fc-5505be405ed5
dee66d99-2fe1-4ff8-a327-cee3a0a284e9	Ben Simmons	Banjou Kazumichi	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
abc7ef7c-3342-41c8-94e8-0d1168acbbd4	Alan Master	Narukami Kenya	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
ab24eb32-8578-461c-8e2c-5638b29a3123	Gus Martin	Gojou Masaru	Défenseur	- Bien qu'il apparaît souvent de manière brève dans l'anime, il a remporté le sondage de popularité du site officiel d'Inazuma Eleven dû au truquage de votes.\n- Il est le seul avec David Samford de la Royal Academy à rester après la saison 3 à apparaître de nouveau dans la série GO, dû à la popularité.	2451ef9f-9bd1-499b-83fc-5505be405ed5
6161a098-a4c3-44ab-bd85-27de181c04ab	Herman Waldon	Henmi Wataru	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
2262a0fd-6a23-4b63-840d-270ba57265f1	Derek Swing	Dōmen Shūichirō	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
d39825c3-b0fe-4a00-a481-f262a33d0843	Daniel Hatch	Jimon Daiki	Attaquant	- Après le départ de Jude Sharp, Daniel Hatch prend la place de capitaine dans le jeu Inazuma Eleven. Néanmoins, dans les jeux Inazuma Eleven 2, Joseph King devient capitaine.	2451ef9f-9bd1-499b-83fc-5505be405ed5
b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba	David Samford	Sakuma Jirō	Attaquant	- On ignore comment David a obtenu son cache-œil. Cependant, on peut supposer que c'est Ray Dark qui le lui aurait donné, à l'instar de Jude Sharp et ses lunettes ou qu'il le porte pour cacher son œil droit qui a une couleur anormale ou même ne serait plus fonctionnel.\n- Lors de l'épisode 89, on peut le voir acheter un porte-clé avec un manchot rouge, ce qui fait référence à la Supertechnique du Manchot Empereur N°1.\n- Il fait partie de ces quelques joueurs qui occupent plus de deux postes dans la chronologie principale, à l'instar de Nathan Swift, de Victoria Vanguard, de Dave Quagmire, de Mark Evans, de Riccardo Di Rigo et de Beta.\n- Contrairement a ce que l'on peut penser, ce n'est pas lui le capitaine de la Royal Academy après que Jude soit parti, il s'agit de Joseph King.\n- Dans le manga Inazuma Eleven, David porte le maillot de l'équipe Inazuma Japon de Shawn Froste, qui le lui a confié.	2451ef9f-9bd1-499b-83fc-5505be405ed5
71228913-c490-4f69-b53f-e610b64da380	Jude Sharp	Kidō Yūto	Milieu	- Un autre joueur lui ressemble : Julio Acuto.\n- C'est un bon meneur de jeu, comme il en existe très peu dans la série.\n- Il est capable d'analyse très vite le jeu de l'adversaire et de ses coéquipiers.\n- Durant le premier Opening d'Inazuma Eleven (Anime), Jude changea de maillot. Au début de l'anime il est dans son maillot de la Royal Academy puis quand il décida de rejoindre Raimon dans l'Épisode 017 il changea de maillot optant pour celui de Raimon. On le voyait au début de l'anime courir devant Ray Dark mais à partir de l'épisode 017 il fut remplacé par Byron Love.\n- Dans le manga, il rejoint Raimon pendant le match contre Zeus, alors que dans l'Anime, il rejoint avant le match contre Terria. Dans la formation de l'équipe, il y remplace Nathan Swift, tandis que dans l'Anime, il y remplace Sam Kincaid.\n- Dans l'Anime, il est dit que c'est Ray Dark qui lui offre ses premières lunettes.\n- Il est le vice-capitaine de l'équipe Inazuma Japon. C'est pourquoi, il porte le brassard de capitaine durant toute la première mi-temps du match contre les Dragons de Feu, à la place de Mark Evans, resté sur le banc.	2451ef9f-9bd1-499b-83fc-5505be405ed5
15130df5-6095-4a8a-8fb6-bc4dd33dc2b5	Ray Dark	Kageyama Reiji	\N	- Il est rare de voir ses yeux mais nous pouvons les apercevoir dans la première saison de l'épisode 23 d'Inazuma Eleven.\n- Il fait partie des rares personnages à apparaître dans toutes les saisons.\n- Il considère Jude comme "sa plus belle création".	2451ef9f-9bd1-499b-83fc-5505be405ed5
1fcf9196-0db5-4f3c-a465-563b2f2eca76	Joseph Yosemite	Tamiyama Yō	Attaquant	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
4489ff9f-6ffd-4331-a70b-f70fb744d824	Ian Suffolk	Sugata Iwao	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
c050c6c1-1d2a-4dda-9365-dec2acfa96b0	Constant Builder	Biruda Kouichi	Attaquant	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
263138da-c55c-4347-925c-fb9e191d9aa8	Frank Wintersea	Fuyukai Suguru	\N	- Il est révélé qu'il est un espion sous les ordres de Ray Dark pour espionner Axel Blaze et le reste de l'équipe. Raimon se retrouvera en finale du district du tournoi Football Frontier. Ray Dark lui demande de saboter les freins du bus Raimon, mais Bobby a tout vu et met en garde ses coéquipiers. Frank Wintersea est renvoyé du collège Raimon, puis de la Royal Academy, après que cette dernière a perdu lors du match de la finale régionale sur le score de 2-1. Peu de temps avant la finale du tournoi Football Frontier, il est interrogé par l'Inspecteur Smith. À ce moment-là, Frank lui dit tout ce qu'il sait sur Ray Dark. Il lui parle également du Projet Z.	2451ef9f-9bd1-499b-83fc-5505be405ed5
2054bb43-179d-42d6-b601-31eb342745a9	Mark Evans	Endō Mamoru	Gardien / Défenseur	- Mark Evans est né un 22 Aout. Il s'agit d'une référence au fait que le premier opus des jeux est sorti le 22 Aout 2008 au Japon.\n- Son prénom japonais, Mamoru (守), signifie «protéger», ce qui fait référence à sa position de gardien de but.\n- Durant le match contre le Onze d'Inazuma lors de l'épisode 14, Mark ne portait pas son brassard de capitaine.\n- Bien qu'il soit gardien de but à la base, il a marqué plusieurs buts en tant que libéro.\n- Durant le match opposant l'équipe de Raimon aux Empereurs Noirs, Mark est positionné au milieu de terrain, alors qu'il doit jouer au poste de libéro.\n- Il n'a pas connu beaucoup de défaites dans sa carrière de joueur et d’entraineur. On le surnomme le "capitaine légendaire".\n- Il est également le personnage possédant le plus de Supertechniques de Gardien, au nombre de 10 (en comptant la Main Magique 3 comme une Supertechnique séparée de la Main Magique).	2451ef9f-9bd1-499b-83fc-5505be405ed5
659b157a-8cc9-4442-ae93-3f8f635a81a6	Nathan Swift	Kazemaru Ichirōta	Défenseur / Milieu	- Nathan remporta le sondage du personnage le plus populaire (Sans compté le trucage des votes pour Gus Martin).\n- Nathan est un des joueurs les plus rapides de l'Anime.\n- Il est l'un des rares joueurs qui occupe plus de deux postes. Les autres joueurs qui jouent plus de deux postes sont David Samford, Victoria Vanguard, Dave Quagmire et Mark Evans.\n- Dans les saisons 2 et 3, il joue en tant que milieu de terrain, tandis qu'il est défenseur dans les jeux vidéos.\n- Il est nommé capitaine durant le match contre Les Empereurs, en raison de l'absence de Jude Sharp et de Mark Evans.\n- Il aime beaucoup Mark Evans, en effet il se soucie beaucoup de lui allant régulièrement le voir quand il se blesse et lui conseille de ne pas se blesser encore plus quand il considère que c'est trop. Leur amitié fut encore plus montré quand Nathan rejoint l'Académie Alius avec d'autres membres de Raimon étant blessé (Empereurs Noirs), il fut celui étant le plus touché quand Mark Evans essaie de les faires revenir à la raison. Le faite qu'il sois le Numéro 2 de Raimon et d'Inazuma Japon/Inazuma Japon Évolution et Mark Evans le Numéro 1 n'est surement pas un hasard.	2451ef9f-9bd1-499b-83fc-5505be405ed5
0ac890a8-3e5f-4267-8261-830d39b0b62d	Jack Wallside	Kabeyama Heigorō	Défenseur	- Il est le seul personnage de la série à n'avoir jamais quitté le club de Raimon (que ce soit à cause d'une blessure ou autre), sauf lors de l'épisode 29, où il a été blessé et est donc obligé de rester sur le banc pendant la 2ème mi-temps contre les Services Secrets.\n- Il est souvent victime des mauvaises blagues de Scotty.\n- Il a le vertige, ce qui explique pourquoi il eut du mal à exécuter le Trampoline du Tonnerre avec Axel dans l'épisode 5, mais également lors du match contre le collège Wild. Il a aussi une peur des escargots, comme nous le montre l'épisode 5.\n- Quand il stresse ou lorsqu'il a peur, il fonce aux toilettes.\n- D'après le manga, Jack pèse 150 kilos.\n- Dans toutes les équipes où il a joué, il a toujours été titulaire.	2451ef9f-9bd1-499b-83fc-5505be405ed5
6f500bde-c229-48d8-9a48-6d38f2ce7191	Jim Wraith	Kageno Jin	Défenseur	- Son nom de famille "Wraith" fait référence à son apparence fantomatique même si Ghost signifie fantôme.\n- Il est souvent vu avec Steve Grim et Maxwell Carson.\n- Steve est constamment et involontairement effrayé par lui. Max est le seul de l'équipe à n'avoir jamais eu peur de lui.\n- Grace aux conseils de Charles Island, il aidera Nathan et Axel à développer l'Oiseau de Feu. Il aime qu'on le remarque.\n- Charles Island un ancien du Onze d'Inazuma, se préoccupe de lui, il est probable que Jim lui rappelle ce qu'il était dans sa jeunesse et veut l'aider à devenir un grand joueur. Lors de la cérémonie de remise des diplômes, Charles a été vu content pour Jim.\n- Au début, il rejoignit Raimon seulement pour sortir de l'ombre.\n- Le personnage des Little Gigantes qui lui correspond est Jimi Gaines.	2451ef9f-9bd1-499b-83fc-5505be405ed5
c5aabd21-29cd-4d77-b7b0-f071f971ed47	Tod Ironside	Kurimatsu Teppei	Défenseur	- Il possède une Nintendo DS comme vu dans l'épisode 001. D'ailleurs, le jeu vidéo auquel il joue est la version DS d'Inazuma Eleven.\n- Lui et Jack Wallside sont les seul à appeler Mark Evans capitaine.	2451ef9f-9bd1-499b-83fc-5505be405ed5
dab55b53-7354-46fd-8914-ef48b8c695f0	Steve Grim	Handa Shinichi	Milieu	- Lui et Paolo Bianchi partagent quelques similitudes.\n- Ils ont tous deux joués dans une équipe menée par Mark Evans, à savoir celle de l'équipe du collège Raimon pour Steve et l'Équipe Rouge ou l'équipe Néo Raimon pour Paolo.	2451ef9f-9bd1-499b-83fc-5505be405ed5
a1c91aa2-a103-41bc-a545-1590f1cb0547	Sam Kincaid	Shishido Sakichi	Milieu / Défenseur	- Dans le Manga Inazuma Eleven, Sam Kincaid ne fait pas partie de l'équipe, il est remplacé par Paul Peabody. De plus, il n'apparait pas du tout et n'est même pas mentionné. Cependant, Keith Ryan, son équivalent des Little Gigantes apparait.\n- Il remplace Paul lors de l'adaptation en manga d'Inazuma Eleven Le Retour.	2451ef9f-9bd1-499b-83fc-5505be405ed5
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	Maxwell Carson	Matsuno Kūsuke	Attaquant / Milieu	- Il est souvent vu avec Steve Grim, on peut y penser dans le cas où ils utilisent la Révolution V.\nCertaines filles l'appelle Maxou.\n- Bien qu'il soit attaquant dans les jeux, il est milieu de terrain dans l'Anime.	2451ef9f-9bd1-499b-83fc-5505be405ed5
747633f6-9821-4db8-81b5-cf2374cf773e	Axel Blaze	Gōenji Shūya	Attaquant	- Il était le seul de la série à effectuer trois fois de suite différents tirs. (voir l'épisode 8)\n- Il était le seul joueur avec Jack Wallside d'Inazuma Japon à jouer tous les matchs du tournoi FFI.\n- Axel est gaucher.\n- Dans l'Anime, il n'a que 3 Supertechniques de Tir où il tire individuellement.\n- Quand Axel est revenu dans la saison 2, il s'est amélioré dans l'anticipation et la défense. Il a aussi amélioré sa technique et sa frappe.\n- Il est le meilleur buteur de l'équipe Inazuma Japon (tout match confondu) avec 15 buts.\n- Quand Axel a quitté temporairement Raimon lors des attaques de l'Académie Alius, il a utilisé son ballon pour sauver Arion Sherwind et Spotter, qui était un chiot, des planches de bois qui leur tombaient dessus à Okinawa. Il lui a laissé son ballon avec le symbole de Raimon dessiné dessus.\n- Le col de maillot relevé est un des symboles du joueur Eric Cantona, international français des années 90.	2451ef9f-9bd1-499b-83fc-5505be405ed5
4d076373-8444-4909-b28d-b7665c8b76f7	Kevin Dragonfly	Someoka Ryūgo	Attaquant	- Kevin réussit à maitriser le Mégadragon durant le match contre la sélection anglaise, Knights of Queen. \n- Dans l'anime, il est l'un des seuls Empereurs Noirs à ne pas avoir subi de changement d'apparence.	2451ef9f-9bd1-499b-83fc-5505be405ed5
3769c2dd-cf78-4848-9231-e780aa4fee69	William Glass	Megane Kakeru	Attaquant	- Il est l'un des joueurs à rester très souvent sur le banc des remplaçants.\n- Il trouve des noms de Supertechniques très vite car il lit souvent des BD et joue à beaucoup de jeux, pour avoir des idées sur leur prochains noms. C'est son "entrainement spécial", d'après lui.\nC'est souvent lui qui trouvent le nom des nouvelles Supertechniques du collège Raimon, ou encore d'Inazuma Japon. Il dit qu'il a un don pour ça.\n- Il essaie toujours de faire son intéressant en trouvant des noms de Supertechniques et pleure, est déçu ou s'énerve quand les autres les trouvent avant lui (par exemple quand Scotty appelle sa technique Tourbillon Vivant, ou Camellia nomme le Tir Banane de Nathan).\n- Il s'entend mal avec Suzette Hartland car elle le traite souvent d'idiot ou de petit raton.	2451ef9f-9bd1-499b-83fc-5505be405ed5
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	Silvia Woods	Kino Aki	\N	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
ef13a8be-9aff-484c-881d-5dd0e8631f66	M. Veteran	Furubaku	Gardien	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
54413027-9466-4433-af3f-48c047f1207d	Tyler Thomas	Teira Tamotsu	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	Celia Hills	Otonashi Haruna	\N	- Elle est toujours là quand Scotty Banyan fait une bêtise.\n- Celia ne met jamais ses lunettes, sauf quand elle lit ou quand elle est sur son ordinateur portable.\n- Même s'ils ont été adoptés par deux familles différentes, Celia et Jude restent très proches.\n- Lorsqu'elle s'adresse à Jude, elle l'appelle souvent "grand frère", ou tout simplement "frérot".\n- Elle a peur des grenouilles.\n- Elle est la plus jeune des quatre manageuses de Raimon. Elle n'a donc pas son diplôme en même temps que le reste de l'équipe.\n- Elle et son frère portent tous les deux des lunettes. La seule différence est que Celia ne met presque jamais les siennes.\n- Lors de l'épisode 3, elle dit que son surnom est "Celia Bouche Cousue".\n- Célia et Camellia sont les seuls personnages à n'avoir jamais été mentionnés ou être apparus dans le manga.	2451ef9f-9bd1-499b-83fc-5505be405ed5
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	Nelly Raimon	Raimon Natsumi	\N	- Elle déteste prendre le train.\n- L'identité de sa mère n'a jamais été révélée.\n- C'est elle qui a stimulé Mark en menaçant de fermer le club de football de Raimon.	2451ef9f-9bd1-499b-83fc-5505be405ed5
ecbdf902-a03b-41d1-a25a-a267fcfa2a68	Sharon Evans	Endō Atsuko	\N	- Sa comédienne de doublage Delphine Chauvier double également Tim Saunders, Julia Blaze, Aquilina Schiller, Dracon Yale, Lunete Taliesin et Rosie Redd.	2451ef9f-9bd1-499b-83fc-5505be405ed5
f2fd840a-cde9-4152-84d0-849c05ac1c62	Robert Silver	Kitagaki Ryouta	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
31550e7f-09a0-42f6-8fb2-b53579ba3f95	Izzy Island	Sejima Itsuki	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
d49dd7a8-3943-4f1a-9264-4d2760b83753	Sothern Newman	Shintake Souta	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
abf2d23a-1707-44f1-8112-84ec5a76cbdf	Taylor Higgins	Terasaka Hibiki	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
d89ca943-cde6-4aac-b755-7501f5373a23	Jamie Cool	Kouzu Sora	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
953bd7d8-4f95-491c-8b57-8476d0eb3687	Michael Riverside	\N	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
b4a5c408-a348-4cf0-852a-03c33447a3c5	Maddie Moonlight	Kisaragi Mako	Attaquant	- Dans l'épisode 01, Axel la sauve car Maddie lui faisait penser à sa sœur.	2451ef9f-9bd1-499b-83fc-5505be405ed5
92533be6-64c4-4f6c-9efd-aee2097b2db2	Keth Claus	Hideyama Kaito	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
340ccd0c-f985-4ad7-a6ed-c61ee38774fa	Hans Randall	\N	Attaquant	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
3a5352b6-d7a0-4b51-a013-7f2b005174c3	Timmy Saunders	Shōrinji Ayumu	Milieu / Défenseur	- Il semble que Tim soit doué pour le Kung Fu, comme vu avec sa première Supertechnique de la Tête Kung Fu.\n- Avant le début du match opposant l'équipe de Raimon à l'équipe de la Royal Academy, Jack s'enfuit et resta coincé dans un casier. Timmy a donc dû utiliser une technique de Kung-Fu, afin qu'il sorte.\n- Lors de l'épisode 5, il inventa une Supertechnique intitulée "Éclair Volant" avec Tod, qui ressemble à l'Etoile de Brun.	2451ef9f-9bd1-499b-83fc-5505be405ed5
b19604ab-673d-4030-99eb-b4b37ac73477	Chester Horse Junior	Kakuma Keita	\N	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
ddd9acce-0eb6-4141-bafd-6191c5fb0bc6	Gregory Smith	\N	\N	- Son Nom Français, "Gregory", a la même connotation que celui en Japonais : "Gengorou".	2451ef9f-9bd1-499b-83fc-5505be405ed5
32506b0a-9ce3-43af-a8ea-c45fbffec805	John Bloom	\N	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
662af6fd-27e6-4fd1-b37d-5e0cd51854fd	Julia Blaze	Gouenji Yuuka	\N	- Sa comédienne de doublage Delphine Chauvier double également Tim Saunders, Sharon Evans, Aquilina Schiller, Dracon Yale, Lunete Taliesin et Rosie Redd.	2451ef9f-9bd1-499b-83fc-5505be405ed5
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	Bobby Shearer	Domon Asuka	Défenseur	- Selon Silvia Woods, à chaque fois que Bobby ment, il détourne le regard.	2451ef9f-9bd1-499b-83fc-5505be405ed5
b6bd3c06-c2cb-4778-bbfe-beaa53a0c08c	Nathan Jones	Nata Jūzō	Gardien	- Comme pour Giulio Acuto, sa coupe de cheveux ressemble beaucoup à celle de Jude Sharp.\n- Sa voix dans l'Anime est semblable à celle d'un serpent.	2451ef9f-9bd1-499b-83fc-5505be405ed5
67ae090d-cbdf-4abe-87e9-25175d91b2ce	Russell Walk	Sanzu Wataru	Défenseur	- Son surnom "Styx" désigne le fleuve qui s'écoule dans les Enfers d'après la mythologie grecque et ou  un personnage l'aurait descendu et c'est donc pour ça qu'il s’appelle Russel, qui signifie "rivière" en anglais.\n- Le bandeau qu'il porte est celui porté par les fantômes du folklore japonais.	2451ef9f-9bd1-499b-83fc-5505be405ed5
f5c97f0c-cc65-4988-93ba-3aba38d62b7d	Jason Jones	Yanagida Shigeru	Défenseur	- Il a peut-être un lien de parenté avec Nathan Jones d'Occulte car les deux ont le même nom de famille. Ce n'est pas le cas en VO cependant.	2451ef9f-9bd1-499b-83fc-5505be405ed5
e36c919a-ae19-49d1-87b3-e9e8fa7cbfe7	Ken Furan	Furan Ken	Défenseur	- Malgré le fait qu'il est défenseur, il ne possède que des Supertechniques de Gardien.\n- Il semble être basé sur Frankenstein.	2451ef9f-9bd1-499b-83fc-5505be405ed5
9c54352d-5f66-4807-8848-4ae47a876066	Jerry Fulton	Shikabane Fujimi	Défenseur	- Son nom en kanji signifie "cadavre" et "invulnérabilité", un jeu de mots sur lui étant basé sur un zombie.	2451ef9f-9bd1-499b-83fc-5505be405ed5
3ba1c774-d82c-4875-b9f0-3bbcd9a145d5	Ray Mannings	Reigen Michihisa	Milieu	- Il a le même prénom que Ray Dark.\n- Son surnom, Macchabée, est basé sur une créature mythique du folklore chinois. C'est un jeu de mots sur son profil et son apparence.	2451ef9f-9bd1-499b-83fc-5505be405ed5
03cb1061-77a8-4795-b8c8-2f1f056253e1	Robert Mayer	Kinoi Mami	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
6b5b1c34-e2cc-44c4-806d-a2927a62368b	Alexander Brave	Yatsuhaka Tataru	Milieu	- Son apparence fait référence à un procédé de malédiction traditionnel japonais baptisé Ushi no toki mairi.	2451ef9f-9bd1-499b-83fc-5505be405ed5
de217141-cfb6-4a2a-bb74-689764d901b8	Johan Tassman	Yuukoku Hiroyuki	Attaquant	- Dans le Manga, Johan défie Mark en duel à 1 contre 1 aux penaltys. Mark arrête son tir grâce au Poing Ardent, mais Johan marque lors de son second tir en figeant Mark avec le Blocage Spectral. - Les deux joueurs se font la belle durant le match, dont Mark et son équipe sortent vainqueurs.\n- Vous ne pouvez jamais le voir sans la bande qui couvre ses yeux. Toutefois, dans la version japonaise du premier jeu, grâce à des programmes qui extraient des informations du jeu et vous permettent de voir le modèle 3D des personnages que vous pouvez voir sans le ruban adhésif, il a des yeux et des sourcils écarlates de la même couleur que vos cheveux.	2451ef9f-9bd1-499b-83fc-5505be405ed5
68419050-a862-4810-b4a4-1a35cfa72991	Troy Moon	\N	Attaquant	- Le kanji «月» dans son nom signifie lune, une référence à son apparence et à sa personnalité de loup-garou.	2451ef9f-9bd1-499b-83fc-5505be405ed5
174f1e51-e6fe-4277-af06-d71e9ee4066a	Burt Wolf	Burado Kiba	Attaquant	- Son nom "Wolf" signifie "Loup" en anglais.	2451ef9f-9bd1-499b-83fc-5505be405ed5
0312c39a-a06e-4259-9d3f-7619ba5603a4	Hide Jekyll			- Le nom de Hide Jekyll vient du livre "Le cas du Docteur Jekyll et de Mr Hyde"; un homme qui change de forme grâce a une sorte de potion. En rapport avec son changement de forme, son nom VF est Jide Hekyll.	2451ef9f-9bd1-499b-83fc-5505be405ed5
677ac23b-3140-4ef4-a71b-6821191f067b	Seymour Hillman	Hibiki Seigō	Gardien	- Dans Inazuma Eleven le Film : Tous unis contre l'équipe Ultime Ogre !, 80 ans après, un homme portant le même nom que lui et lui ressemblant étrangement est le dirigeant de l'équipe Ogre. Mais, les deux ont une personnalité opposée à l'autre car celui du présent adore le football, tandis que celui du futur déteste ce sport.\n- Il est le premier apprenti de David Evans avant Hector Helio.	2451ef9f-9bd1-499b-83fc-5505be405ed5
9ca1f59f-d79b-4297-bc5b-c37760ddd7c0	Harry Evans	Hiroshi Endō	\N	- Grâce à lui, Mark peut jouer au football.\n- Il porte le nom de sa femme "Evans", mais il n'y a aucune information sur son nom de famille originel.	2451ef9f-9bd1-499b-83fc-5505be405ed5
e0aad6ef-b183-45c5-a2a5-69f7ac7577c5	Zack Wallside	Kabeyama Saku	\N	- Il a presque le même prénom que celui de son frère, Jack.	2451ef9f-9bd1-499b-83fc-5505be405ed5
1d16af31-8260-4617-a678-9b4a69af14c7	Steve Eagle	Ōwashi Seiji	Milieu	- Il a le même nom de famille qu'Erik Eagle.\n- Que ce soit en termes de nom, d'apparence ou de personnalité, il est basé sur l'aigle.	2451ef9f-9bd1-499b-83fc-5505be405ed5
75842ba4-b8b1-46f3-a69b-d79627616252	Garry Lancaster	\N	Attaquant	- Que ce soit en termes de nom, d'apparence ou de personnalité, il est basé sur le gorille.	2451ef9f-9bd1-499b-83fc-5505be405ed5
68649379-8432-432d-8c2a-9e9da6f85b4f	Harry Snake	Hebimaru Shouma	Attaquant	- Son nom de famille, Snake, veut dire Serpent en anglais\n- Que ce soient en termes de nom, d'apparence ou de personnalité, il est basé sur le serpent.	2451ef9f-9bd1-499b-83fc-5505be405ed5
7b05699b-226e-4242-b58f-f651cfe9dce0	Charlie Boardfield	Inokuchi Hyōgo	Gardien	- Que ce soit en termes de nom, d'apparence ou de personnalité, il est basé sur le sanglier.	2451ef9f-9bd1-499b-83fc-5505be405ed5
e5d26f46-92f6-466f-ad34-2a96c4db2feb	Hugo "Coq" Tallgeese	Torii Ryouta	Défenseur	- Que ce soit en termes de nom, d'apparence ou de personnalité, il est basé sur le coq.\n- Bien qu'il soit le capitaine dans l'anime, Adrian Speed est le capitaine dans le manga.	2451ef9f-9bd1-499b-83fc-5505be405ed5
208caad5-f36d-4897-bc92-ea51f2c170d8	Wilson "Poisson" Fishman	Uosumi Takuto	Défenseur	- Que ce soit en termes de nom, d'apparence ou de personnalité, il est basé sur le poisson.	2451ef9f-9bd1-499b-83fc-5505be405ed5
da361f3b-8118-4ca1-a85b-3a24dad64f39	Peter Johnson	Kaeruda Tatsuhito	Défenseur	- La coiffure de Peter ressemble à celle de Janus.\n- Que ce soit en termes de nom, d'apparence ou de personnalité, il est basé sur le crapaud.	2451ef9f-9bd1-499b-83fc-5505be405ed5
e7e060a0-88ee-4fd4-8c7e-0ea64fcb49b8	Leonard O'Shea	\N	Défenseur	- Que ce soit en termes de nom, d'apparence ou de personnalité, il est basé sur le lion.	2451ef9f-9bd1-499b-83fc-5505be405ed5
c7424678-8012-408c-9619-67d859a6ec68	Cham Lion	\N	Milieu	- Que ce soit en termes de nom, d'apparence ou de personnalité, il est basé sur le caméléon.	2451ef9f-9bd1-499b-83fc-5505be405ed5
9531a2cd-8613-4103-948c-846a9ba434d1	Bruce Monkey	Saruta Noboru	Milieu	- Que ce soit en termes de nom, d'apparence ou de personnalité, il est basé sur le singe.	2451ef9f-9bd1-499b-83fc-5505be405ed5
874b6396-3f54-4c0d-b3c5-34603de4587a	Adrian Speed	Suizenji Chīta	Attaquant	- À l'instar de ses coéquipiers de l'équipe du collège Wild, son nom et son apparence sont basés sur un animal. Le concernant, il s'inspire du guépard.\n- Il est le capitaine de l'équipe du collège Wild dans le manga Inazuma Eleven.	2451ef9f-9bd1-499b-83fc-5505be405ed5
699e1215-8ec3-42aa-96fa-317b3ba0064c	Peter Mildred	Batora Manabu	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
17c637de-a2b5-430d-bb67-b36a3315039c	Mr Savage	Tazan Kousuke	\N	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
f0b62557-ee52-4bed-912d-8592f4020873	Sonny Raimon	Raimon Souichirou	\N	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
1b288bd9-dd9d-4c04-9871-438c5bd55011	Thomas Feldt	Sugimori Takeshi	Gardien	- Il a 15 ans et est en troisième année, comme Hurley Kane, ce qui fait que c'était son dernier tournoi Football Frontier dans la saison 1. Cela explique son absence dans chronologie alternative de la série Ares, qui se déroule un an après la victoire de Raimon au tournoi national collégien.\n- Mark l'appelle par son nom de famille, jamais par son prénom.	2451ef9f-9bd1-499b-83fc-5505be405ed5
620231b8-ee3a-4fce-a3ae-619dec3fc8b9	Harry Leading	Hiroyama Yuu	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
7fa3bcd9-3c9c-495a-9a83-484413865cab	Terry Stronger	Hanaoka Tsuyoshi	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
e30fff21-0043-4c3a-9374-1b909054355c	Philip Marvel	Murobushi Kyou	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
d82544c2-17f7-4220-8eee-14a1bb9db0bf	Noel Good	Inada Mori	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
b21cb196-f946-4dff-a692-99a51cd10f60	Tyron Rock	Mashimo Toboshi	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
3b78b8c1-6f1a-4e7e-96f3-b78f53cc4223	Francis Tell	Fujimaru Kei	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
d5da612b-ce45-4031-a1bc-b1b69dd41402	Samuel Buster	Sangou Baku	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
4aba2444-d816-4b4d-b1a7-8d41a39843ac	Jonathan Seller	Yamagishi Seri	Attaquant	- Orthographié avec différents caractères (競せり), son prénom dans les versions originales, Seri, signifie compétition.	2451ef9f-9bd1-499b-83fc-5505be405ed5
5e6d1787-b640-4298-9eb6-1b0bb16cfe0e	Victor Kind	Oobe Shin	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
b7df9bbc-f07e-49ce-9656-b3a9aa28599c	Neil Turner	Shimozuru Arata	Attaquant	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
56b727e0-dd56-4dbb-a3b3-8e9bbaafdea5	Newton Thomas	Toyama Shinichirou	\N	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
80f3cc8a-5da9-47c3-94c2-6f424d395155	Marcus Train	Sujimichi Tetsuo	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
ad37155a-e705-40fd-88ad-e55ffc322494	Light Nobel	\N	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
fe856efa-7e36-480f-a7cf-9988b6cef346	Walter Valiant	Muteki Hideo	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
a2306519-360f-4c44-a0d3-bd6633f73d8b	Spencer Gates	Karisawa Sou	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
16ef9970-c3d7-4a88-b9ef-d40071a17d43	Josh Spear	Onra Itsuki	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
15190503-fc61-43ad-8a91-4e8b0009dbf8	Gaby Farmer	Onotomo Haru	Attaquant	- Son prénom "Otonomo" signifie «Fait Maison». C'est une référence à son talent dans l'assemblage de machines ainsi qu'a son surnom.	2451ef9f-9bd1-499b-83fc-5505be405ed5
2f7ed9f8-e502-4cb3-b095-da1099fc6b84	Anthony Woodbridge	Robo Gouki	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
cbad2a62-82da-4c7f-bdd1-6c3b3666aa0c	Gus Gamer	Geimu Konomu	Attaquant	- Son nom de famille dans la version originale, Geimu (芸夢げいむ), est la prononciation japonaise du mot "Game", signifiant jeu en anglais.\nCela fait référence à son hobby que sont les jeux vidéos et à son nom dans la version internationale.\nSon surnom dans la version originale des jeux, Gēmuki (ゲームき) signifie "console de jeux" en japonais.	2451ef9f-9bd1-499b-83fc-5505be405ed5
7cda746f-c186-4f88-bc9f-9e402a84c0e8	Mark Gambling	Manga Moe	Milieu	- Il est le capitaine dans le manga.\n- Dans l'Anime, il dessine les histoires de Light Nobel.	2451ef9f-9bd1-499b-83fc-5505be405ed5
5294f95e-ca64-4d59-8130-fe405ea6e50a	Theodore Master	Akeido Tatsuhito	Attaquant	- Il a le même nom de famille que Alan Master.	2451ef9f-9bd1-499b-83fc-5505be405ed5
58ef1277-fec8-4518-ab58-ab16373ec581	Manny Artic	Maniya Saito	\N	- Il est tout le temps vu avec une pastèque.	2451ef9f-9bd1-499b-83fc-5505be405ed5
d7dc7c66-c665-45e1-9352-0f246b765a37	Monsieur Black	Anzai Masaru	\N	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
cc364f58-137d-4afe-b16b-edd8a8dc7b8b	Charles Island	Ukishima Kazuto	Défenseur	- Charles Island ressemble beaucoup à Jim Wraith, tant par son apparence que par sa personnalité.	2451ef9f-9bd1-499b-83fc-5505be405ed5
2fb8ba8f-9b3e-401d-90e6-e5f95442f7ba	Garret Hairtown	Kirito Kamimura	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
f9401078-3c51-4a72-a43f-bd81a83bc724	Arthur Sweet	Aida Chikara	Défenseur	- Son prénom dans les versions originales, Chikara (力ちから), signifie force en japonais.	2451ef9f-9bd1-499b-83fc-5505be405ed5
b6a5161f-7a10-4a31-b06c-65803682bcfc	Josh Nathaniel	Yo Nakama	Milieu	- Son nom, Nakama (仲間), signifie "compagnon" en japonais.\n- Son prénom, Yo (庸), signifie "ordinaire" en japonais, en référence à son profil assez banal.	2451ef9f-9bd1-499b-83fc-5505be405ed5
96d83900-d6fc-48c1-bd7c-50275e74e8ad	Miles Ryan	Miyasaka Ryō	\N	- Ses initiales japonais (Ryou Miyasaka) sont inversés par rapport à son nom VF, Miles Ryan.\n- Nathan le surnomme Milly, par rapport à son prénom qui est Miles.	2451ef9f-9bd1-499b-83fc-5505be405ed5
f6799d62-0e60-4dcd-b3be-a8e9ecb60ea5	Chester Horse Senior	Kakuma Ōshō	\N	- À l'instar de Stewart Vanguard, Chester Horse Senior fait une brève apparition dans la série et les jeux Little Battlers eXperience. Il commente divers tournois de LBX, dont celui d'Akihabara.	2451ef9f-9bd1-499b-83fc-5505be405ed5
7f296a30-104f-4803-b711-ea7fff34de1c	Morgan Sanders	Santa Momochi	Gardien	- Dans le Manga, son nom original est Joseph King. Or, Joseph King est le gardien de l'équipe de la Royal Academy. C'est pourquoi, pour éviter toute confusion, son nom a été changé en Morgan Sanders pour l'Anime.	2451ef9f-9bd1-499b-83fc-5505be405ed5
caf4be28-0825-49d3-81c8-f2b88b6aeeec	Newton Flust	Fujibayashi Nagato	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
06876434-2c1d-4c96-b18c-ca13f5b93f3e	Jim Hillfort	Kōsaka Jin	Défenseur	- De par son masque, ses yeux rouges et son bandeau frontal, il ressemble à Kakashi Hatake du manga Naruto.	2451ef9f-9bd1-499b-83fc-5505be405ed5
b4ce3897-6134-439b-b071-2c68f4cd65e9	Galen Thunderbird	Jiraiya Gamasuke	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
18ce93b1-e30d-48db-9dc9-57c555dde8a1	Finn Stoned	Ishikawa Goeta	Défenseur	- Dans son nom en version originale, Ishikawa est une préfecture du Japon, située au nord-ouest de la région de Chūbu	2451ef9f-9bd1-499b-83fc-5505be405ed5
75401584-d7cc-4ef2-b3aa-bb293ba8ff2c	Phil Wingate	Fuuma Koheita	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
6be300b6-aff9-4c3c-91ce-ddab2217b2a3	Jez Shell	Kouga Gen	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
172cb42c-94e9-4b8b-9d45-aad21d0c2552	Jupiter Jumper	Sarutobi Sanosuke	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
3359d42e-77e7-4a33-b08c-abad892c829e	Sam Samurai	Yagyuu Juurou	Attaquant	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
0c8c9915-327c-414d-80db-4e16a0e8e9dc	Hank Sullivan	Hatsutori Hanzou	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
457cea5b-6cd2-4dc7-9e38-8d0f23f88ef8	Sail Bluesea	Kirigakure Saiji	Attaquant	- Il a la même voix que Caleb Stonewall.\n- Son nom de famille japonais (霧隠, Kirigakure) signifie "Caché dans le Brouillard", il s'agit là d'une référence aux ninjas.\n- Dans la saison 1 de l'anime, il s'appelle Saiji Quicksilver, mais lors de la saison 3, Nathan Swift l’appelle Bluesea.	2451ef9f-9bd1-499b-83fc-5505be405ed5
6428bcc4-0d35-4e1a-be7b-1e71ccd5cde4	Sammy Igajima	Igajima Sen'ichi	\N	- On dit qu'il est un descendant de ninjas.\n- Quand ses joueurs utilisent des techniques ils prononcent son nom\n- Il a déjà affronté Raimon il y a 40 ans en demi-finale du Football Frontier.	2451ef9f-9bd1-499b-83fc-5505be405ed5
007caf86-1bf9-42a9-a163-a95ed8663eb0	Albert Green	Ayano Yūichi	Gardien	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
31e32402-8790-4d6d-bc25-05b327645ac2	Seward Hayseed	Sumino Eisuke	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
4a3b664b-bb2d-4f8a-8eed-16e67d2d533e	Kent Work	Serizawa Kazunori	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
f0435863-c6f2-471f-bb14-84623acae1af	Mark Hillvalley	Makiya Hiroshi	Défenseur	- Dans l'Anime, chaque équipe avec laquelle il a joué perdit 2 buts à 1 (Raimon/Terria et Inazuma Japon/Néo Japon).\n- C'est grâce à lui que Néo Japon a pu maîtriser les techniques de La Faucheuse et de la Muraille Infinie.	2451ef9f-9bd1-499b-83fc-5505be405ed5
1bcbe7f3-bc0d-4f8e-a8f9-63de56b6e23e	Herb Sherman	Shiotani Hiro	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
5a5edb3c-0f9d-49e5-a05d-431224792e30	Joe Small	Yamane You	Milieu	- Dans son nom japonais, "Yama", en son extension "Yamane", signifie montagne.\n- "You", signifie chèvre, se référant au fait qu'il boit du lait de chèvre.	2451ef9f-9bd1-499b-83fc-5505be405ed5
6203bb89-4dab-4f4f-a147-70f1e20f3a23	Ike Steiner	Ikui Shouji	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
94cddb77-77e6-4cd4-a3cf-1ca582d7bafa	Orville Newman	Oogoi Noboru	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
3fb4a546-96fa-4bd2-a312-cd3629c3e391	Tom Walters	Harano Tooru	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
60a80520-1f58-4701-8d3c-3d82d530e956	Daniel Dawson	Negami Daichi	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
33fa83e0-37c4-4f3e-b3c5-ce344ca305d8	Stuart Racoonfur	Tanushimaru Shigeki	Attaquant	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
4fe3495f-7aef-428f-8563-c2c8209b2583	Mister Newfield	Shinno Kamekichi	\N	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
41ed930e-fdde-455c-b75f-305ff5c59d7c	Erik Eagle	Ichinose Kazuya	Milieu	- Il est surnommé "le magicien du ballon rond".	2451ef9f-9bd1-499b-83fc-5505be405ed5
e9119b2e-1b37-493b-a4d0-7279d2e8daf1	Sam Idol	Aidoru Sou	Gardien	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
97c4b6c5-8604-4d6d-a76b-6816816d1e87	Monsieur Sharp	Kidō no Chichi	\N	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
6373b006-878f-4a40-8729-349c2a27fa20	David Evans / Arrows	Endou Daisuke / Araya	Gardien	- Il parle à maintes reprises à Mark sans que ce dernier ne connaisse sa véritable identité. Il lui donne des conseils, qui lui permette de développer et maîtriser sa première Supertechnique rien qu'à lui, nommée la Main Dimensionnelle. \n- 200 ans plus tard, il est considéré comme le dieu du football. \n- Il a écrit un cahier appelé les " Enseignements du Maître" pour constituer selon lui l'équipe ultime. \n- Il est la source de la passion pour le football pour Mark et Canon dans sa famille.	2451ef9f-9bd1-499b-83fc-5505be405ed5
ad246772-bdd1-4423-9dd6-8435ac38b82d	Malcolm Night	Nishigaki Mamoru	Défenseur	- Malcolm est un ami d'enfance d'Eirk, Bobby et Silvia.	2451ef9f-9bd1-499b-83fc-5505be405ed5
34d4b5ff-39da-4a9f-ba98-4fab806a64ec	John Neville	Nanzan Yowami	Gardien	- Il est très peureux.	2451ef9f-9bd1-499b-83fc-5505be405ed5
9275d22c-5b74-4419-a28e-c97f8de72204	Alfred Meenan	Megawa Akihi	Défenseur	- Son prénom dans les versions internationales, Alfred, est d'origine germanique. En effet, il est composé des mots "All" et "Fried", qui signifient respectivement "Tout" et "Paix" en allemand.	2451ef9f-9bd1-499b-83fc-5505be405ed5
92e565b0-9b87-4979-99a9-1a6867af1d0b	Dan Mirthful	Mitsumune Dan	Défenseur	- Dans les versions japonaise et française, son prénom reste le même : Dan.	2451ef9f-9bd1-499b-83fc-5505be405ed5
0cd35f43-95e6-4cc8-a61c-24219e8c7b28	Ricky Clover	Kurobe Ritsuki	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
70d67fb6-ab9c-411b-833c-044844bd014b	Toby Damian	Tobiyama Dan	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
d19e52a3-0b47-4532-aebc-230cbd2afb39	York Nashmith	\N	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
76660524-10cb-42bd-a244-abdbf741be47	Zachary Moore	Mogi Sakito	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
cec9c8ae-b54b-4698-a647-1cf2b645431a	Marvin Murdock	Mukata Masaru	Attaquant	- Il est le seul joueur à avoir été hors-jeu dans l'Anime, pendant le match de sélection pour Inazuma Japon.\n -Il emploie toujours le mot "classe" dans ses phrases.	2451ef9f-9bd1-499b-83fc-5505be405ed5
98af9d29-90fb-40e6-88e9-11203916e16a	Thomas Murdock	Mukata Tomo	Attaquant	- Il est le seul du trio a ne pas apparaître dans la saison 3, Marvin Murdock et Tyler Murdock ont tout deux fait partie d'une équipe, l'un dans l'équipe d'Inazuma Japon A et l'autre dans l'équipe des Néo Japon.	2451ef9f-9bd1-499b-83fc-5505be405ed5
2b957305-0b01-4a68-90e6-a3393b771611	Tyler Murdock	Mukata Tsutomu	Attaquant	- Il est le seul du trio à apparaitre dans le jeu Inazuma Eleven Strikers.	2451ef9f-9bd1-499b-83fc-5505be405ed5
06ee5357-6494-4ce5-b0ed-912d5f16b346	Seth Nichols	Nikaidou Shuugo	\N	- Avant de devenir entraîneur, Seth était joueur professionnel, il a d'ailleurs joué dans la sélection nationale.	2451ef9f-9bd1-499b-83fc-5505be405ed5
d49e4a1c-2b6e-4161-a035-e4de5431dfcf	Herman Muller	Munakata Hiroto	Gardien	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
0f5bd1ea-3bdd-4199-8a83-2c42e066d7ed	Byron Love	Afuro Terumi	Milieu, Attaquant	- Son surnom "Aphrodite" est le nom de la déesse grecque de l'amour, bien que Byron soit un garçon. C'est en rapport avec son nom japonais Afuro.Son nom de famille "Love" signifie Amour est anglais, et fait donc aussi allusion à cette déesse. \n- A partir de l'épisode 017 Byron apparait dans le générique de la saison 1 d'Inazuma Eleven (Anime). Il remplaça Jude Sharp en courant devant Ray Dark \n- C'est l'un des joueurs les plus puissants de tout Inazuma Eleven et l'un des rares adversaires de Raimon qui sera dans les 3 saisons, ainsi que dans les séries Inazuma Eleven GO, Arès et Orion. \n- Comme on l'apprend lors de l'épisode du match contre les Dragons de Feu, Byron est de nationalité coréenne. \n- Sa Supertechnique Instant Céleste a été brisée par un seul joueur connu : Nigel August.	2451ef9f-9bd1-499b-83fc-5505be405ed5
44d70996-1301-4db8-9b4a-ab4139a70488	Tom Dark	Kageyama Tougo	Attaquant	- Il apparait dans les flashbacks de Ray Dark quand Paolo Bianchi fait des dribbles pendant le match contre Inazuma Japon. \n- Il est donc le grand-père de Lucien Dark, puisque Ray Dark est son oncle, cependant son deuxième enfant n'a jamais été vue dans la série même quand Ray Dark était tout seul chez lui.	2451ef9f-9bd1-499b-83fc-5505be405ed5
ffee3101-5934-40c3-bb95-87392970ab9e	Paul Siddon	Posei Donichi	Gardien	- À l'instar de son surnom, son nom provient de Poséidon, dieu des mers, de l'eau et des séismes dans la mythologie grecque. La Muraille Tsunami et la Muraille Géante, ses Supertechniques de Gardien fétiches, sont également basées sur la maitrise de l'eau et des séismes de Poséidon.	2451ef9f-9bd1-499b-83fc-5505be405ed5
dc525f85-31d6-49f9-bb41-1d7be3e5fd8a	Apollo Light	Aporo Hikaru	Défenseur	- Son nom est dérivé d'Apollon, divinité grecque des arts, du chant, de la musique, de la poésie et de la lumière. Son nom de famille "Light" veut dire Lumière en anglais, et fait donc aussi allusion à ce dieu.	2451ef9f-9bd1-499b-83fc-5505be405ed5
c1626027-8553-4e4e-bb32-7a03cbfae72d	Jeff Iron	Hepai En	Défenseur	- Comme tous les autres membres de son équipe , son nom est basé sur celui d'une divinité : Héphaistos, le Dieu des Forges et des Volcans dans la mythologie grecque. Son nom de famille "Iron" signifie Fer en anglais, et fait donc aussi allusion à ce dieu.	2451ef9f-9bd1-499b-83fc-5505be405ed5
a18a2659-32f1-4ecb-a85f-69db0ba4afb0	Lane War	Aresu Ran	Défenseur	- Son nom vient du dieu grecque Arès. Son nom de famille War signifie "Guerre" en anglais, et fait donc aussi allusion à ce même dieu.	2451ef9f-9bd1-499b-83fc-5505be405ed5
c9bf9b95-78b0-4ac8-93ac-4624c051bed5	Danny Wood	Deio Geki	Défenseur	- Son surnom est Dionysos, le Dieu du Vin dans la mythologie grecque.	2451ef9f-9bd1-499b-83fc-5505be405ed5
3dcd6e8d-549f-41a4-8d5c-ef9fd754273c	Artie Mishman	Arute Saneki	Milieu	- Son nom est basé sur Artemis, la Déesse grecque de la chasse et de la nature.	2451ef9f-9bd1-499b-83fc-5505be405ed5
409aaf25-65be-47c6-88ac-6d483242c466	Arion Matlock	Herume Matsuaki	Milieu	- Son nom est basé sur Hermes, un Dieu grec.	2451ef9f-9bd1-499b-83fc-5505be405ed5
209dd52f-b881-45aa-9b3d-e7eef9a76bed	Wesley Knox	Atena Tomo	Milieu, Attaquant	- Son nom est basé sur celui d'Athéna, déesse de la Guerre et de la Sagesse dans la mythologie grecque.	2451ef9f-9bd1-499b-83fc-5505be405ed5
56d64848-6fe4-40b6-9d72-18a206da6562	Jonas Démétrius	Demete Yutaka	Attaquant	- À l'instar de son surnom, son nom de famille provient de Déméter, déesse de l'agriculture et des moissons dans la mythologie grecque.	2451ef9f-9bd1-499b-83fc-5505be405ed5
9e83bd19-bb8b-4247-bc5f-98e5390932a6	Henry House	Hera Tadashi	Attaquant, Milieu, Défenseur	- Il joue à tous les postes, sauf celui de gardien.\n- Il fait partie des joueurs qui joue à plusieurs postes.\n- Son nom est basé sur celui d'Héra, déesse du Mariage dans la mythologie grecque qui est très vaniteuse, d'où son caractère.	2451ef9f-9bd1-499b-83fc-5505be405ed5
1afc4b7d-7005-4451-b7bc-8814b46e7243	George Firewill	Hirai Shinzō	\N	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
54d7c302-4bbc-4e80-9340-d4661690a651	Gordon Star (Galileo)	Goryū Reo (Gorleo)	Gardien	- C'est l'un des premiers joueurs de l'Académie Alius qu'on voit avec Janus et Rhim.	2451ef9f-9bd1-499b-83fc-5505be405ed5
ec0fef4f-c11a-4416-8045-df7c5dc6502f	Connor Shuttle (Coral)	Sango Yoshirou (Coral)	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
d8b22379-de22-4c03-9b94-f2c42a79c999	Jim Landing (Gigs)	Kikuma Shousuke (Gigu)	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
8c67bf32-c9ac-4242-8b63-8cd26da1cbaa	Grant Icewater (Ganymede)	Kanime Iderō (Ganimede)	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
d2c1cd73-8d20-498e-a327-f60331d9c5f4	Charlie Riverboat (Charon)	Karoku Satori (Karon)	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
e6394c8b-d42e-4628-9136-c28800985398	Pat Box (Pandora)	Kinki Nozomi (Pandora)	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
e7a82a05-8f00-49c9-bc0d-7926e370785d	Gregory Saturn (Grengo)	Omotsuki Sora (Gringo)	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
7bf518d9-4a38-49f7-868e-c84c3a011cf8	Izzy Jupiter (Io)	Io Shuntaro (Io)	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
ae03f6d0-7cf4-48a3-996c-b2335b8bc962	Rhona Countdown (Rihm)	Nanakaze Rimu (Rimu)	Attaquant	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
0678def0-54cf-40c4-a685-b27577d0bec5	Jordan Greenway (Janus)	Midorikawa Ryūji (Reize)	Milieu	- Sa comédienne-doubleuse japonaise, Kodaira Yûki, double aussi Maxwell Carson./n- Ses Supertechniques sont basées sur l'astronomie./n- Jordan et Xavier sont de bons amis./n- Il adore les dictons.	2451ef9f-9bd1-499b-83fc-5505be405ed5
9de61a24-d464-4f89-b9a1-8014c8059c60	Dylan Bluemoon (Diam)	Miura Hiromu (Diam)	Attaquant	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
e028a571-97cb-4926-b7cf-0a7deb2ba5ea	Joe Ingram	Ikegaki Jou	Gardien	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
6904940f-0e87-4aff-85d0-de3cd3d6f812	Kendall Sefton	Himejima Kiwamu	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
fc05315c-0464-42a8-8ff4-5f665b8710e6	Jason Strike	Kikuchi Yasuchi	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
1ef2d03b-ccb5-41d9-ace6-da14dbe547f0	Norman Porter	Noma Hakobu	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
7801b578-b4f6-4924-9f21-594ca160c93b	Maxwell Claus	Mukaiyama Kyōgo	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
3c834710-b415-4ab7-8d82-ae89fd74379a	Bruce Chaney	Chaki Shīto	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
72da734e-1b59-426f-8fca-e57d16e39b97	Leroy Rhymes	Kanō Rinsuke	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
a584ebca-8068-446a-ad36-6cf0473269f8	Mildford Scott	Tachino Seīchi	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
d4df167d-042a-4152-813c-f0f783195c3d	Lou Edmonds	Idemae You	Attaquant	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
1ae1cf8c-542a-41b1-870d-53837794e07a	Cameron Morefield	Yasunaga Hidetsugu	Milieu	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
9930cf42-b59c-4741-9194-f416feff668d	Greg Bernard	Mizuguchi Seiji	Attaquant	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
792ee26f-eed7-4e82-b10f-3c8dd10dcc5d	Aquilina Schiller	Kira Hitomiko	\N	- Dans les saisons 2 et 3, Mark Evans la vouvoie. Dans GO, il la tutoie.\n- Elle dit lors de l'épisode 28 que son jeu n'a rien à voir avec ce que Raimon a pratiqué lors de la saison 1. On peut donc en conclure qu'elle fait pratiquer à ses joueurs un style de jeu très différent de celui de David Evans.\n- Sa comédienne de doublage Delphine Chauvier double également Tim Saunders, Julia Blaze, Sharon Evans, Dracon Yale, Lunete Taliesin et Rosie Redd.	2451ef9f-9bd1-499b-83fc-5505be405ed5
282eb45b-05cc-4617-80d9-f45a77ca5a64	Ken Ironwall	Tetsukabe Ken	Gardien	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
18a8df1b-ab51-46f8-900f-577533936423	Timothy Western	Goyou Takeshi	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
e989f82a-2804-40a8-a40c-3155106ac2a6	Shirley Stevens	Sakura Tamon	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
d1734165-4896-44d8-ab21-38195bb5f2c3	Wallace Hammond	Hayate Hayato	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
f83c7478-987f-4666-841e-632adfabcc83	Ian Smith	Sumisu Eiji	Défenseur	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
\.


--
-- Data for Name: personnage_episode_episode; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.personnage_episode_episode ("personnageId", "episodeId") FROM stdin;
208caad5-f36d-4897-bc92-ea51f2c170d8	66abafd9-5110-4c47-a81c-9a2a4f74cb08
3359d42e-77e7-4a33-b08c-abad892c829e	aeb63f75-d22d-492b-bfb3-700d2343c915
457cea5b-6cd2-4dc7-9e38-8d0f23f88ef8	aeb63f75-d22d-492b-bfb3-700d2343c915
172cb42c-94e9-4b8b-9d45-aad21d0c2552	aeb63f75-d22d-492b-bfb3-700d2343c915
0c8c9915-327c-414d-80db-4e16a0e8e9dc	aeb63f75-d22d-492b-bfb3-700d2343c915
6be300b6-aff9-4c3c-91ce-ddab2217b2a3	aeb63f75-d22d-492b-bfb3-700d2343c915
b4ce3897-6134-439b-b071-2c68f4cd65e9	aeb63f75-d22d-492b-bfb3-700d2343c915
7f296a30-104f-4803-b711-ea7fff34de1c	aeb63f75-d22d-492b-bfb3-700d2343c915
caf4be28-0825-49d3-81c8-f2b88b6aeeec	aeb63f75-d22d-492b-bfb3-700d2343c915
75401584-d7cc-4ef2-b3aa-bb293ba8ff2c	aeb63f75-d22d-492b-bfb3-700d2343c915
06876434-2c1d-4c96-b18c-ca13f5b93f3e	aeb63f75-d22d-492b-bfb3-700d2343c915
6428bcc4-0d35-4e1a-be7b-1e71ccd5cde4	aeb63f75-d22d-492b-bfb3-700d2343c915
18ce93b1-e30d-48db-9dc9-57c555dde8a1	aeb63f75-d22d-492b-bfb3-700d2343c915
e7e060a0-88ee-4fd4-8c7e-0ea64fcb49b8	66abafd9-5110-4c47-a81c-9a2a4f74cb08
874b6396-3f54-4c0d-b3c5-34603de4587a	66abafd9-5110-4c47-a81c-9a2a4f74cb08
75842ba4-b8b1-46f3-a69b-d79627616252	66abafd9-5110-4c47-a81c-9a2a4f74cb08
c7424678-8012-408c-9619-67d859a6ec68	66abafd9-5110-4c47-a81c-9a2a4f74cb08
17c637de-a2b5-430d-bb67-b36a3315039c	66abafd9-5110-4c47-a81c-9a2a4f74cb08
9531a2cd-8613-4103-948c-846a9ba434d1	66abafd9-5110-4c47-a81c-9a2a4f74cb08
da361f3b-8118-4ca1-a85b-3a24dad64f39	66abafd9-5110-4c47-a81c-9a2a4f74cb08
7b05699b-226e-4242-b58f-f651cfe9dce0	66abafd9-5110-4c47-a81c-9a2a4f74cb08
68649379-8432-432d-8c2a-9e9da6f85b4f	66abafd9-5110-4c47-a81c-9a2a4f74cb08
e5d26f46-92f6-466f-ad34-2a96c4db2feb	66abafd9-5110-4c47-a81c-9a2a4f74cb08
3ba1c774-d82c-4875-b9f0-3bbcd9a145d5	be80eb60-f867-454f-97e7-86a675c09f53
0312c39a-a06e-4259-9d3f-7619ba5603a4	be80eb60-f867-454f-97e7-86a675c09f53
de217141-cfb6-4a2a-bb74-689764d901b8	be80eb60-f867-454f-97e7-86a675c09f53
174f1e51-e6fe-4277-af06-d71e9ee4066a	be80eb60-f867-454f-97e7-86a675c09f53
9c54352d-5f66-4807-8848-4ae47a876066	be80eb60-f867-454f-97e7-86a675c09f53
b6bd3c06-c2cb-4778-bbfe-beaa53a0c08c	be80eb60-f867-454f-97e7-86a675c09f53
67ae090d-cbdf-4abe-87e9-25175d91b2ce	be80eb60-f867-454f-97e7-86a675c09f53
03cb1061-77a8-4795-b8c8-2f1f056253e1	be80eb60-f867-454f-97e7-86a675c09f53
68419050-a862-4810-b4a4-1a35cfa72991	be80eb60-f867-454f-97e7-86a675c09f53
e36c919a-ae19-49d1-87b3-e9e8fa7cbfe7	be80eb60-f867-454f-97e7-86a675c09f53
6b5b1c34-e2cc-44c4-806d-a2927a62368b	be80eb60-f867-454f-97e7-86a675c09f53
f5c97f0c-cc65-4988-93ba-3aba38d62b7d	be80eb60-f867-454f-97e7-86a675c09f53
5a5edb3c-0f9d-49e5-a05d-431224792e30	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
5a5edb3c-0f9d-49e5-a05d-431224792e30	4016b5fa-c380-496f-a3a5-251e48a9db66
4fe3495f-7aef-428f-8563-c2c8209b2583	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
4fe3495f-7aef-428f-8563-c2c8209b2583	4016b5fa-c380-496f-a3a5-251e48a9db66
31e32402-8790-4d6d-bc25-05b327645ac2	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
31e32402-8790-4d6d-bc25-05b327645ac2	4016b5fa-c380-496f-a3a5-251e48a9db66
f0435863-c6f2-471f-bb14-84623acae1af	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
f0435863-c6f2-471f-bb14-84623acae1af	4016b5fa-c380-496f-a3a5-251e48a9db66
6203bb89-4dab-4f4f-a147-70f1e20f3a23	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
6203bb89-4dab-4f4f-a147-70f1e20f3a23	4016b5fa-c380-496f-a3a5-251e48a9db66
4a3b664b-bb2d-4f8a-8eed-16e67d2d533e	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
4a3b664b-bb2d-4f8a-8eed-16e67d2d533e	4016b5fa-c380-496f-a3a5-251e48a9db66
007caf86-1bf9-42a9-a163-a95ed8663eb0	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
007caf86-1bf9-42a9-a163-a95ed8663eb0	4016b5fa-c380-496f-a3a5-251e48a9db66
1bcbe7f3-bc0d-4f8e-a8f9-63de56b6e23e	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
1bcbe7f3-bc0d-4f8e-a8f9-63de56b6e23e	4016b5fa-c380-496f-a3a5-251e48a9db66
3fb4a546-96fa-4bd2-a312-cd3629c3e391	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
3fb4a546-96fa-4bd2-a312-cd3629c3e391	4016b5fa-c380-496f-a3a5-251e48a9db66
33fa83e0-37c4-4f3e-b3c5-ce344ca305d8	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
33fa83e0-37c4-4f3e-b3c5-ce344ca305d8	4016b5fa-c380-496f-a3a5-251e48a9db66
2f7ed9f8-e502-4cb3-b095-da1099fc6b84	22a06b40-2b8c-46a1-bc90-df535a96e07e
16ef9970-c3d7-4a88-b9ef-d40071a17d43	22a06b40-2b8c-46a1-bc90-df535a96e07e
a2306519-360f-4c44-a0d3-bd6633f73d8b	22a06b40-2b8c-46a1-bc90-df535a96e07e
e9119b2e-1b37-493b-a4d0-7279d2e8daf1	22a06b40-2b8c-46a1-bc90-df535a96e07e
7cda746f-c186-4f88-bc9f-9e402a84c0e8	22a06b40-2b8c-46a1-bc90-df535a96e07e
ad37155a-e705-40fd-88ad-e55ffc322494	22a06b40-2b8c-46a1-bc90-df535a96e07e
80f3cc8a-5da9-47c3-94c2-6f424d395155	22a06b40-2b8c-46a1-bc90-df535a96e07e
15190503-fc61-43ad-8a91-4e8b0009dbf8	22a06b40-2b8c-46a1-bc90-df535a96e07e
cbad2a62-82da-4c7f-bdd1-6c3b3666aa0c	22a06b40-2b8c-46a1-bc90-df535a96e07e
fe856efa-7e36-480f-a7cf-9988b6cef346	22a06b40-2b8c-46a1-bc90-df535a96e07e
5294f95e-ca64-4d59-8130-fe405ea6e50a	22a06b40-2b8c-46a1-bc90-df535a96e07e
58ef1277-fec8-4518-ab58-ab16373ec581	22a06b40-2b8c-46a1-bc90-df535a96e07e
e30fff21-0043-4c3a-9374-1b909054355c	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
e30fff21-0043-4c3a-9374-1b909054355c	b1806a16-509d-49e5-a2e2-3a484cd16455
1b288bd9-dd9d-4c04-9871-438c5bd55011	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
1b288bd9-dd9d-4c04-9871-438c5bd55011	b1806a16-509d-49e5-a2e2-3a484cd16455
620231b8-ee3a-4fce-a3ae-619dec3fc8b9	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
620231b8-ee3a-4fce-a3ae-619dec3fc8b9	b1806a16-509d-49e5-a2e2-3a484cd16455
56b727e0-dd56-4dbb-a3b3-8e9bbaafdea5	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
56b727e0-dd56-4dbb-a3b3-8e9bbaafdea5	b1806a16-509d-49e5-a2e2-3a484cd16455
7fa3bcd9-3c9c-495a-9a83-484413865cab	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
7fa3bcd9-3c9c-495a-9a83-484413865cab	b1806a16-509d-49e5-a2e2-3a484cd16455
b7df9bbc-f07e-49ce-9656-b3a9aa28599c	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
b7df9bbc-f07e-49ce-9656-b3a9aa28599c	b1806a16-509d-49e5-a2e2-3a484cd16455
5e6d1787-b640-4298-9eb6-1b0bb16cfe0e	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
5e6d1787-b640-4298-9eb6-1b0bb16cfe0e	b1806a16-509d-49e5-a2e2-3a484cd16455
d82544c2-17f7-4220-8eee-14a1bb9db0bf	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
d82544c2-17f7-4220-8eee-14a1bb9db0bf	b1806a16-509d-49e5-a2e2-3a484cd16455
b21cb196-f946-4dff-a692-99a51cd10f60	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
b21cb196-f946-4dff-a692-99a51cd10f60	b1806a16-509d-49e5-a2e2-3a484cd16455
d5da612b-ce45-4031-a1bc-b1b69dd41402	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
d5da612b-ce45-4031-a1bc-b1b69dd41402	b1806a16-509d-49e5-a2e2-3a484cd16455
4aba2444-d816-4b4d-b1a7-8d41a39843ac	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
4aba2444-d816-4b4d-b1a7-8d41a39843ac	b1806a16-509d-49e5-a2e2-3a484cd16455
cc364f58-137d-4afe-b16b-edd8a8dc7b8b	2228af33-de0e-4227-916f-e958fea744cf
c050c6c1-1d2a-4dda-9365-dec2acfa96b0	2228af33-de0e-4227-916f-e958fea744cf
4489ff9f-6ffd-4331-a70b-f70fb744d824	2228af33-de0e-4227-916f-e958fea744cf
54413027-9466-4433-af3f-48c047f1207d	2228af33-de0e-4227-916f-e958fea744cf
1fcf9196-0db5-4f3c-a465-563b2f2eca76	2228af33-de0e-4227-916f-e958fea744cf
e536088e-f3c2-4bcb-a862-da890a7e1a39	2228af33-de0e-4227-916f-e958fea744cf
f9401078-3c51-4a72-a43f-bd81a83bc724	2228af33-de0e-4227-916f-e958fea744cf
2fb8ba8f-9b3e-401d-90e6-e5f95442f7ba	2228af33-de0e-4227-916f-e958fea744cf
662af6fd-27e6-4fd1-b37d-5e0cd51854fd	66abafd9-5110-4c47-a81c-9a2a4f74cb08
662af6fd-27e6-4fd1-b37d-5e0cd51854fd	99519aee-5871-4ab9-a5b5-2309e4e11117
662af6fd-27e6-4fd1-b37d-5e0cd51854fd	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
15130df5-6095-4a8a-8fb6-bc4dd33dc2b5	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
15130df5-6095-4a8a-8fb6-bc4dd33dc2b5	66abafd9-5110-4c47-a81c-9a2a4f74cb08
15130df5-6095-4a8a-8fb6-bc4dd33dc2b5	84593a3b-1264-49e0-8ffb-7383132558c0
15130df5-6095-4a8a-8fb6-bc4dd33dc2b5	99519aee-5871-4ab9-a5b5-2309e4e11117
15130df5-6095-4a8a-8fb6-bc4dd33dc2b5	9c282416-79fc-4340-bd9c-b0f42652c9a5
15130df5-6095-4a8a-8fb6-bc4dd33dc2b5	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
15130df5-6095-4a8a-8fb6-bc4dd33dc2b5	b1806a16-509d-49e5-a2e2-3a484cd16455
15130df5-6095-4a8a-8fb6-bc4dd33dc2b5	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
15130df5-6095-4a8a-8fb6-bc4dd33dc2b5	be80eb60-f867-454f-97e7-86a675c09f53
15130df5-6095-4a8a-8fb6-bc4dd33dc2b5	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
15130df5-6095-4a8a-8fb6-bc4dd33dc2b5	d102057f-4e62-4e78-b37d-a764e8256a1b
15130df5-6095-4a8a-8fb6-bc4dd33dc2b5	e3d98622-d761-402e-a105-cff6c35f7a58
15130df5-6095-4a8a-8fb6-bc4dd33dc2b5	fea90bfd-2d11-424f-ad2f-507e1562c1af
ecbdf902-a03b-41d1-a25a-a267fcfa2a68	84593a3b-1264-49e0-8ffb-7383132558c0
ecbdf902-a03b-41d1-a25a-a267fcfa2a68	fea90bfd-2d11-424f-ad2f-507e1562c1af
d39825c3-b0fe-4a00-a481-f262a33d0843	fea90bfd-2d11-424f-ad2f-507e1562c1af
d39825c3-b0fe-4a00-a481-f262a33d0843	99519aee-5871-4ab9-a5b5-2309e4e11117
d39825c3-b0fe-4a00-a481-f262a33d0843	9c282416-79fc-4340-bd9c-b0f42652c9a5
d39825c3-b0fe-4a00-a481-f262a33d0843	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
d39825c3-b0fe-4a00-a481-f262a33d0843	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
d39825c3-b0fe-4a00-a481-f262a33d0843	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
d39825c3-b0fe-4a00-a481-f262a33d0843	d102057f-4e62-4e78-b37d-a764e8256a1b
d39825c3-b0fe-4a00-a481-f262a33d0843	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
03f04e6f-690c-43f0-a037-0bb816a768bc	fea90bfd-2d11-424f-ad2f-507e1562c1af
03f04e6f-690c-43f0-a037-0bb816a768bc	99519aee-5871-4ab9-a5b5-2309e4e11117
03f04e6f-690c-43f0-a037-0bb816a768bc	9c282416-79fc-4340-bd9c-b0f42652c9a5
03f04e6f-690c-43f0-a037-0bb816a768bc	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
03f04e6f-690c-43f0-a037-0bb816a768bc	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
03f04e6f-690c-43f0-a037-0bb816a768bc	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
03f04e6f-690c-43f0-a037-0bb816a768bc	d102057f-4e62-4e78-b37d-a764e8256a1b
03f04e6f-690c-43f0-a037-0bb816a768bc	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
32506b0a-9ce3-43af-a8ea-c45fbffec805	99519aee-5871-4ab9-a5b5-2309e4e11117
32506b0a-9ce3-43af-a8ea-c45fbffec805	9c282416-79fc-4340-bd9c-b0f42652c9a5
32506b0a-9ce3-43af-a8ea-c45fbffec805	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
32506b0a-9ce3-43af-a8ea-c45fbffec805	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
32506b0a-9ce3-43af-a8ea-c45fbffec805	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
32506b0a-9ce3-43af-a8ea-c45fbffec805	d102057f-4e62-4e78-b37d-a764e8256a1b
32506b0a-9ce3-43af-a8ea-c45fbffec805	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
dee66d99-2fe1-4ff8-a327-cee3a0a284e9	fea90bfd-2d11-424f-ad2f-507e1562c1af
dee66d99-2fe1-4ff8-a327-cee3a0a284e9	99519aee-5871-4ab9-a5b5-2309e4e11117
dee66d99-2fe1-4ff8-a327-cee3a0a284e9	9c282416-79fc-4340-bd9c-b0f42652c9a5
dee66d99-2fe1-4ff8-a327-cee3a0a284e9	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
dee66d99-2fe1-4ff8-a327-cee3a0a284e9	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
dee66d99-2fe1-4ff8-a327-cee3a0a284e9	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
dee66d99-2fe1-4ff8-a327-cee3a0a284e9	d102057f-4e62-4e78-b37d-a764e8256a1b
dee66d99-2fe1-4ff8-a327-cee3a0a284e9	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
abc7ef7c-3342-41c8-94e8-0d1168acbbd4	fea90bfd-2d11-424f-ad2f-507e1562c1af
abc7ef7c-3342-41c8-94e8-0d1168acbbd4	99519aee-5871-4ab9-a5b5-2309e4e11117
abc7ef7c-3342-41c8-94e8-0d1168acbbd4	9c282416-79fc-4340-bd9c-b0f42652c9a5
abc7ef7c-3342-41c8-94e8-0d1168acbbd4	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
abc7ef7c-3342-41c8-94e8-0d1168acbbd4	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
abc7ef7c-3342-41c8-94e8-0d1168acbbd4	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
abc7ef7c-3342-41c8-94e8-0d1168acbbd4	d102057f-4e62-4e78-b37d-a764e8256a1b
abc7ef7c-3342-41c8-94e8-0d1168acbbd4	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
6161a098-a4c3-44ab-bd85-27de181c04ab	99519aee-5871-4ab9-a5b5-2309e4e11117
6161a098-a4c3-44ab-bd85-27de181c04ab	9c282416-79fc-4340-bd9c-b0f42652c9a5
6161a098-a4c3-44ab-bd85-27de181c04ab	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
6161a098-a4c3-44ab-bd85-27de181c04ab	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
6161a098-a4c3-44ab-bd85-27de181c04ab	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
6161a098-a4c3-44ab-bd85-27de181c04ab	d102057f-4e62-4e78-b37d-a764e8256a1b
6161a098-a4c3-44ab-bd85-27de181c04ab	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
ab24eb32-8578-461c-8e2c-5638b29a3123	fea90bfd-2d11-424f-ad2f-507e1562c1af
ab24eb32-8578-461c-8e2c-5638b29a3123	99519aee-5871-4ab9-a5b5-2309e4e11117
ab24eb32-8578-461c-8e2c-5638b29a3123	9c282416-79fc-4340-bd9c-b0f42652c9a5
ab24eb32-8578-461c-8e2c-5638b29a3123	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
ab24eb32-8578-461c-8e2c-5638b29a3123	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
ab24eb32-8578-461c-8e2c-5638b29a3123	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
ab24eb32-8578-461c-8e2c-5638b29a3123	d102057f-4e62-4e78-b37d-a764e8256a1b
ab24eb32-8578-461c-8e2c-5638b29a3123	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
8cec069d-4385-4399-8949-dd221bcc2225	fea90bfd-2d11-424f-ad2f-507e1562c1af
8cec069d-4385-4399-8949-dd221bcc2225	99519aee-5871-4ab9-a5b5-2309e4e11117
8cec069d-4385-4399-8949-dd221bcc2225	9c282416-79fc-4340-bd9c-b0f42652c9a5
8cec069d-4385-4399-8949-dd221bcc2225	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
8cec069d-4385-4399-8949-dd221bcc2225	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
8cec069d-4385-4399-8949-dd221bcc2225	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
8cec069d-4385-4399-8949-dd221bcc2225	d102057f-4e62-4e78-b37d-a764e8256a1b
8cec069d-4385-4399-8949-dd221bcc2225	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
b4a5c408-a348-4cf0-852a-03c33447a3c5	fea90bfd-2d11-424f-ad2f-507e1562c1af
b4a5c408-a348-4cf0-852a-03c33447a3c5	e3d98622-d761-402e-a105-cff6c35f7a58
92533be6-64c4-4f6c-9efd-aee2097b2db2	fea90bfd-2d11-424f-ad2f-507e1562c1af
92533be6-64c4-4f6c-9efd-aee2097b2db2	e3d98622-d761-402e-a105-cff6c35f7a58
953bd7d8-4f95-491c-8b57-8476d0eb3687	fea90bfd-2d11-424f-ad2f-507e1562c1af
953bd7d8-4f95-491c-8b57-8476d0eb3687	e3d98622-d761-402e-a105-cff6c35f7a58
340ccd0c-f985-4ad7-a6ed-c61ee38774fa	fea90bfd-2d11-424f-ad2f-507e1562c1af
340ccd0c-f985-4ad7-a6ed-c61ee38774fa	e3d98622-d761-402e-a105-cff6c35f7a58
f2fd840a-cde9-4152-84d0-849c05ac1c62	fea90bfd-2d11-424f-ad2f-507e1562c1af
f2fd840a-cde9-4152-84d0-849c05ac1c62	e3d98622-d761-402e-a105-cff6c35f7a58
d49dd7a8-3943-4f1a-9264-4d2760b83753	e3d98622-d761-402e-a105-cff6c35f7a58
abf2d23a-1707-44f1-8112-84ec5a76cbdf	fea90bfd-2d11-424f-ad2f-507e1562c1af
abf2d23a-1707-44f1-8112-84ec5a76cbdf	e3d98622-d761-402e-a105-cff6c35f7a58
31550e7f-09a0-42f6-8fb2-b53579ba3f95	e3d98622-d761-402e-a105-cff6c35f7a58
d89ca943-cde6-4aac-b755-7501f5373a23	fea90bfd-2d11-424f-ad2f-507e1562c1af
d89ca943-cde6-4aac-b755-7501f5373a23	e3d98622-d761-402e-a105-cff6c35f7a58
2262a0fd-6a23-4b63-840d-270ba57265f1	fea90bfd-2d11-424f-ad2f-507e1562c1af
2262a0fd-6a23-4b63-840d-270ba57265f1	99519aee-5871-4ab9-a5b5-2309e4e11117
2262a0fd-6a23-4b63-840d-270ba57265f1	9c282416-79fc-4340-bd9c-b0f42652c9a5
2262a0fd-6a23-4b63-840d-270ba57265f1	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
2262a0fd-6a23-4b63-840d-270ba57265f1	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
2262a0fd-6a23-4b63-840d-270ba57265f1	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
2262a0fd-6a23-4b63-840d-270ba57265f1	d102057f-4e62-4e78-b37d-a764e8256a1b
2262a0fd-6a23-4b63-840d-270ba57265f1	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
f0b62557-ee52-4bed-912d-8592f4020873	2228af33-de0e-4227-916f-e958fea744cf
f0b62557-ee52-4bed-912d-8592f4020873	aeb63f75-d22d-492b-bfb3-700d2343c915
f0b62557-ee52-4bed-912d-8592f4020873	b1806a16-509d-49e5-a2e2-3a484cd16455
f0b62557-ee52-4bed-912d-8592f4020873	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	2228af33-de0e-4227-916f-e958fea744cf
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	22a06b40-2b8c-46a1-bc90-df535a96e07e
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	4016b5fa-c380-496f-a3a5-251e48a9db66
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	66abafd9-5110-4c47-a81c-9a2a4f74cb08
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	99519aee-5871-4ab9-a5b5-2309e4e11117
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	9c282416-79fc-4340-bd9c-b0f42652c9a5
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	aeb63f75-d22d-492b-bfb3-700d2343c915
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	b1806a16-509d-49e5-a2e2-3a484cd16455
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	be80eb60-f867-454f-97e7-86a675c09f53
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	d102057f-4e62-4e78-b37d-a764e8256a1b
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	e3d98622-d761-402e-a105-cff6c35f7a58
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	fea90bfd-2d11-424f-ad2f-507e1562c1af
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
0ac890a8-3e5f-4267-8261-830d39b0b62d	2228af33-de0e-4227-916f-e958fea744cf
0ac890a8-3e5f-4267-8261-830d39b0b62d	22a06b40-2b8c-46a1-bc90-df535a96e07e
0ac890a8-3e5f-4267-8261-830d39b0b62d	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
0ac890a8-3e5f-4267-8261-830d39b0b62d	4016b5fa-c380-496f-a3a5-251e48a9db66
0ac890a8-3e5f-4267-8261-830d39b0b62d	66abafd9-5110-4c47-a81c-9a2a4f74cb08
0ac890a8-3e5f-4267-8261-830d39b0b62d	84593a3b-1264-49e0-8ffb-7383132558c0
0ac890a8-3e5f-4267-8261-830d39b0b62d	99519aee-5871-4ab9-a5b5-2309e4e11117
0ac890a8-3e5f-4267-8261-830d39b0b62d	9c282416-79fc-4340-bd9c-b0f42652c9a5
0ac890a8-3e5f-4267-8261-830d39b0b62d	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
0ac890a8-3e5f-4267-8261-830d39b0b62d	aeb63f75-d22d-492b-bfb3-700d2343c915
0ac890a8-3e5f-4267-8261-830d39b0b62d	b1806a16-509d-49e5-a2e2-3a484cd16455
0ac890a8-3e5f-4267-8261-830d39b0b62d	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
0ac890a8-3e5f-4267-8261-830d39b0b62d	be80eb60-f867-454f-97e7-86a675c09f53
0ac890a8-3e5f-4267-8261-830d39b0b62d	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
0ac890a8-3e5f-4267-8261-830d39b0b62d	d102057f-4e62-4e78-b37d-a764e8256a1b
0ac890a8-3e5f-4267-8261-830d39b0b62d	e3d98622-d761-402e-a105-cff6c35f7a58
0ac890a8-3e5f-4267-8261-830d39b0b62d	fea90bfd-2d11-424f-ad2f-507e1562c1af
0ac890a8-3e5f-4267-8261-830d39b0b62d	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
3769c2dd-cf78-4848-9231-e780aa4fee69	2228af33-de0e-4227-916f-e958fea744cf
3769c2dd-cf78-4848-9231-e780aa4fee69	22a06b40-2b8c-46a1-bc90-df535a96e07e
3769c2dd-cf78-4848-9231-e780aa4fee69	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
3769c2dd-cf78-4848-9231-e780aa4fee69	4016b5fa-c380-496f-a3a5-251e48a9db66
3769c2dd-cf78-4848-9231-e780aa4fee69	66abafd9-5110-4c47-a81c-9a2a4f74cb08
3769c2dd-cf78-4848-9231-e780aa4fee69	84593a3b-1264-49e0-8ffb-7383132558c0
3769c2dd-cf78-4848-9231-e780aa4fee69	99519aee-5871-4ab9-a5b5-2309e4e11117
3769c2dd-cf78-4848-9231-e780aa4fee69	9c282416-79fc-4340-bd9c-b0f42652c9a5
3769c2dd-cf78-4848-9231-e780aa4fee69	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
3769c2dd-cf78-4848-9231-e780aa4fee69	aeb63f75-d22d-492b-bfb3-700d2343c915
3769c2dd-cf78-4848-9231-e780aa4fee69	b1806a16-509d-49e5-a2e2-3a484cd16455
3769c2dd-cf78-4848-9231-e780aa4fee69	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
3769c2dd-cf78-4848-9231-e780aa4fee69	be80eb60-f867-454f-97e7-86a675c09f53
3769c2dd-cf78-4848-9231-e780aa4fee69	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
3769c2dd-cf78-4848-9231-e780aa4fee69	d102057f-4e62-4e78-b37d-a764e8256a1b
3769c2dd-cf78-4848-9231-e780aa4fee69	e3d98622-d761-402e-a105-cff6c35f7a58
3769c2dd-cf78-4848-9231-e780aa4fee69	fea90bfd-2d11-424f-ad2f-507e1562c1af
3769c2dd-cf78-4848-9231-e780aa4fee69	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	2228af33-de0e-4227-916f-e958fea744cf
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	22a06b40-2b8c-46a1-bc90-df535a96e07e
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	4016b5fa-c380-496f-a3a5-251e48a9db66
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	66abafd9-5110-4c47-a81c-9a2a4f74cb08
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	84593a3b-1264-49e0-8ffb-7383132558c0
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	99519aee-5871-4ab9-a5b5-2309e4e11117
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	9c282416-79fc-4340-bd9c-b0f42652c9a5
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	aeb63f75-d22d-492b-bfb3-700d2343c915
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	b1806a16-509d-49e5-a2e2-3a484cd16455
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	be80eb60-f867-454f-97e7-86a675c09f53
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	d102057f-4e62-4e78-b37d-a764e8256a1b
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	e3d98622-d761-402e-a105-cff6c35f7a58
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	fea90bfd-2d11-424f-ad2f-507e1562c1af
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
747633f6-9821-4db8-81b5-cf2374cf773e	2228af33-de0e-4227-916f-e958fea744cf
747633f6-9821-4db8-81b5-cf2374cf773e	22a06b40-2b8c-46a1-bc90-df535a96e07e
747633f6-9821-4db8-81b5-cf2374cf773e	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
747633f6-9821-4db8-81b5-cf2374cf773e	4016b5fa-c380-496f-a3a5-251e48a9db66
747633f6-9821-4db8-81b5-cf2374cf773e	66abafd9-5110-4c47-a81c-9a2a4f74cb08
747633f6-9821-4db8-81b5-cf2374cf773e	84593a3b-1264-49e0-8ffb-7383132558c0
747633f6-9821-4db8-81b5-cf2374cf773e	99519aee-5871-4ab9-a5b5-2309e4e11117
747633f6-9821-4db8-81b5-cf2374cf773e	9c282416-79fc-4340-bd9c-b0f42652c9a5
747633f6-9821-4db8-81b5-cf2374cf773e	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
747633f6-9821-4db8-81b5-cf2374cf773e	aeb63f75-d22d-492b-bfb3-700d2343c915
747633f6-9821-4db8-81b5-cf2374cf773e	b1806a16-509d-49e5-a2e2-3a484cd16455
747633f6-9821-4db8-81b5-cf2374cf773e	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
747633f6-9821-4db8-81b5-cf2374cf773e	be80eb60-f867-454f-97e7-86a675c09f53
747633f6-9821-4db8-81b5-cf2374cf773e	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
747633f6-9821-4db8-81b5-cf2374cf773e	d102057f-4e62-4e78-b37d-a764e8256a1b
747633f6-9821-4db8-81b5-cf2374cf773e	e3d98622-d761-402e-a105-cff6c35f7a58
747633f6-9821-4db8-81b5-cf2374cf773e	fea90bfd-2d11-424f-ad2f-507e1562c1af
747633f6-9821-4db8-81b5-cf2374cf773e	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
a1c91aa2-a103-41bc-a545-1590f1cb0547	2228af33-de0e-4227-916f-e958fea744cf
a1c91aa2-a103-41bc-a545-1590f1cb0547	22a06b40-2b8c-46a1-bc90-df535a96e07e
a1c91aa2-a103-41bc-a545-1590f1cb0547	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
a1c91aa2-a103-41bc-a545-1590f1cb0547	4016b5fa-c380-496f-a3a5-251e48a9db66
a1c91aa2-a103-41bc-a545-1590f1cb0547	66abafd9-5110-4c47-a81c-9a2a4f74cb08
a1c91aa2-a103-41bc-a545-1590f1cb0547	84593a3b-1264-49e0-8ffb-7383132558c0
a1c91aa2-a103-41bc-a545-1590f1cb0547	99519aee-5871-4ab9-a5b5-2309e4e11117
a1c91aa2-a103-41bc-a545-1590f1cb0547	9c282416-79fc-4340-bd9c-b0f42652c9a5
a1c91aa2-a103-41bc-a545-1590f1cb0547	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
a1c91aa2-a103-41bc-a545-1590f1cb0547	aeb63f75-d22d-492b-bfb3-700d2343c915
a1c91aa2-a103-41bc-a545-1590f1cb0547	b1806a16-509d-49e5-a2e2-3a484cd16455
a1c91aa2-a103-41bc-a545-1590f1cb0547	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
a1c91aa2-a103-41bc-a545-1590f1cb0547	be80eb60-f867-454f-97e7-86a675c09f53
a1c91aa2-a103-41bc-a545-1590f1cb0547	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
a1c91aa2-a103-41bc-a545-1590f1cb0547	d102057f-4e62-4e78-b37d-a764e8256a1b
a1c91aa2-a103-41bc-a545-1590f1cb0547	e3d98622-d761-402e-a105-cff6c35f7a58
a1c91aa2-a103-41bc-a545-1590f1cb0547	fea90bfd-2d11-424f-ad2f-507e1562c1af
a1c91aa2-a103-41bc-a545-1590f1cb0547	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
c5aabd21-29cd-4d77-b7b0-f071f971ed47	2228af33-de0e-4227-916f-e958fea744cf
c5aabd21-29cd-4d77-b7b0-f071f971ed47	22a06b40-2b8c-46a1-bc90-df535a96e07e
c5aabd21-29cd-4d77-b7b0-f071f971ed47	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
c5aabd21-29cd-4d77-b7b0-f071f971ed47	4016b5fa-c380-496f-a3a5-251e48a9db66
c5aabd21-29cd-4d77-b7b0-f071f971ed47	66abafd9-5110-4c47-a81c-9a2a4f74cb08
c5aabd21-29cd-4d77-b7b0-f071f971ed47	84593a3b-1264-49e0-8ffb-7383132558c0
c5aabd21-29cd-4d77-b7b0-f071f971ed47	99519aee-5871-4ab9-a5b5-2309e4e11117
c5aabd21-29cd-4d77-b7b0-f071f971ed47	9c282416-79fc-4340-bd9c-b0f42652c9a5
c5aabd21-29cd-4d77-b7b0-f071f971ed47	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
c5aabd21-29cd-4d77-b7b0-f071f971ed47	aeb63f75-d22d-492b-bfb3-700d2343c915
c5aabd21-29cd-4d77-b7b0-f071f971ed47	b1806a16-509d-49e5-a2e2-3a484cd16455
c5aabd21-29cd-4d77-b7b0-f071f971ed47	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
c5aabd21-29cd-4d77-b7b0-f071f971ed47	be80eb60-f867-454f-97e7-86a675c09f53
c5aabd21-29cd-4d77-b7b0-f071f971ed47	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
c5aabd21-29cd-4d77-b7b0-f071f971ed47	d102057f-4e62-4e78-b37d-a764e8256a1b
c5aabd21-29cd-4d77-b7b0-f071f971ed47	e3d98622-d761-402e-a105-cff6c35f7a58
c5aabd21-29cd-4d77-b7b0-f071f971ed47	fea90bfd-2d11-424f-ad2f-507e1562c1af
c5aabd21-29cd-4d77-b7b0-f071f971ed47	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
3a5352b6-d7a0-4b51-a013-7f2b005174c3	2228af33-de0e-4227-916f-e958fea744cf
3a5352b6-d7a0-4b51-a013-7f2b005174c3	22a06b40-2b8c-46a1-bc90-df535a96e07e
3a5352b6-d7a0-4b51-a013-7f2b005174c3	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
3a5352b6-d7a0-4b51-a013-7f2b005174c3	4016b5fa-c380-496f-a3a5-251e48a9db66
3a5352b6-d7a0-4b51-a013-7f2b005174c3	66abafd9-5110-4c47-a81c-9a2a4f74cb08
3a5352b6-d7a0-4b51-a013-7f2b005174c3	84593a3b-1264-49e0-8ffb-7383132558c0
3a5352b6-d7a0-4b51-a013-7f2b005174c3	99519aee-5871-4ab9-a5b5-2309e4e11117
3a5352b6-d7a0-4b51-a013-7f2b005174c3	9c282416-79fc-4340-bd9c-b0f42652c9a5
3a5352b6-d7a0-4b51-a013-7f2b005174c3	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
3a5352b6-d7a0-4b51-a013-7f2b005174c3	aeb63f75-d22d-492b-bfb3-700d2343c915
3a5352b6-d7a0-4b51-a013-7f2b005174c3	b1806a16-509d-49e5-a2e2-3a484cd16455
3a5352b6-d7a0-4b51-a013-7f2b005174c3	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
3a5352b6-d7a0-4b51-a013-7f2b005174c3	be80eb60-f867-454f-97e7-86a675c09f53
3a5352b6-d7a0-4b51-a013-7f2b005174c3	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
3a5352b6-d7a0-4b51-a013-7f2b005174c3	d102057f-4e62-4e78-b37d-a764e8256a1b
3a5352b6-d7a0-4b51-a013-7f2b005174c3	e3d98622-d761-402e-a105-cff6c35f7a58
3a5352b6-d7a0-4b51-a013-7f2b005174c3	fea90bfd-2d11-424f-ad2f-507e1562c1af
3a5352b6-d7a0-4b51-a013-7f2b005174c3	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
4d076373-8444-4909-b28d-b7665c8b76f7	2228af33-de0e-4227-916f-e958fea744cf
4d076373-8444-4909-b28d-b7665c8b76f7	22a06b40-2b8c-46a1-bc90-df535a96e07e
4d076373-8444-4909-b28d-b7665c8b76f7	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
4d076373-8444-4909-b28d-b7665c8b76f7	4016b5fa-c380-496f-a3a5-251e48a9db66
4d076373-8444-4909-b28d-b7665c8b76f7	66abafd9-5110-4c47-a81c-9a2a4f74cb08
4d076373-8444-4909-b28d-b7665c8b76f7	84593a3b-1264-49e0-8ffb-7383132558c0
4d076373-8444-4909-b28d-b7665c8b76f7	99519aee-5871-4ab9-a5b5-2309e4e11117
4d076373-8444-4909-b28d-b7665c8b76f7	9c282416-79fc-4340-bd9c-b0f42652c9a5
4d076373-8444-4909-b28d-b7665c8b76f7	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
4d076373-8444-4909-b28d-b7665c8b76f7	aeb63f75-d22d-492b-bfb3-700d2343c915
4d076373-8444-4909-b28d-b7665c8b76f7	b1806a16-509d-49e5-a2e2-3a484cd16455
4d076373-8444-4909-b28d-b7665c8b76f7	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
4d076373-8444-4909-b28d-b7665c8b76f7	be80eb60-f867-454f-97e7-86a675c09f53
4d076373-8444-4909-b28d-b7665c8b76f7	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
4d076373-8444-4909-b28d-b7665c8b76f7	d102057f-4e62-4e78-b37d-a764e8256a1b
4d076373-8444-4909-b28d-b7665c8b76f7	e3d98622-d761-402e-a105-cff6c35f7a58
4d076373-8444-4909-b28d-b7665c8b76f7	fea90bfd-2d11-424f-ad2f-507e1562c1af
4d076373-8444-4909-b28d-b7665c8b76f7	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
6f500bde-c229-48d8-9a48-6d38f2ce7191	2228af33-de0e-4227-916f-e958fea744cf
6f500bde-c229-48d8-9a48-6d38f2ce7191	22a06b40-2b8c-46a1-bc90-df535a96e07e
6f500bde-c229-48d8-9a48-6d38f2ce7191	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
6f500bde-c229-48d8-9a48-6d38f2ce7191	4016b5fa-c380-496f-a3a5-251e48a9db66
6f500bde-c229-48d8-9a48-6d38f2ce7191	66abafd9-5110-4c47-a81c-9a2a4f74cb08
6f500bde-c229-48d8-9a48-6d38f2ce7191	84593a3b-1264-49e0-8ffb-7383132558c0
6f500bde-c229-48d8-9a48-6d38f2ce7191	99519aee-5871-4ab9-a5b5-2309e4e11117
6f500bde-c229-48d8-9a48-6d38f2ce7191	9c282416-79fc-4340-bd9c-b0f42652c9a5
6f500bde-c229-48d8-9a48-6d38f2ce7191	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
6f500bde-c229-48d8-9a48-6d38f2ce7191	aeb63f75-d22d-492b-bfb3-700d2343c915
6f500bde-c229-48d8-9a48-6d38f2ce7191	b1806a16-509d-49e5-a2e2-3a484cd16455
6f500bde-c229-48d8-9a48-6d38f2ce7191	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
6f500bde-c229-48d8-9a48-6d38f2ce7191	be80eb60-f867-454f-97e7-86a675c09f53
6f500bde-c229-48d8-9a48-6d38f2ce7191	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
6f500bde-c229-48d8-9a48-6d38f2ce7191	d102057f-4e62-4e78-b37d-a764e8256a1b
6f500bde-c229-48d8-9a48-6d38f2ce7191	e3d98622-d761-402e-a105-cff6c35f7a58
6f500bde-c229-48d8-9a48-6d38f2ce7191	fea90bfd-2d11-424f-ad2f-507e1562c1af
6f500bde-c229-48d8-9a48-6d38f2ce7191	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
dab55b53-7354-46fd-8914-ef48b8c695f0	2228af33-de0e-4227-916f-e958fea744cf
dab55b53-7354-46fd-8914-ef48b8c695f0	22a06b40-2b8c-46a1-bc90-df535a96e07e
dab55b53-7354-46fd-8914-ef48b8c695f0	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
dab55b53-7354-46fd-8914-ef48b8c695f0	4016b5fa-c380-496f-a3a5-251e48a9db66
dab55b53-7354-46fd-8914-ef48b8c695f0	66abafd9-5110-4c47-a81c-9a2a4f74cb08
dab55b53-7354-46fd-8914-ef48b8c695f0	84593a3b-1264-49e0-8ffb-7383132558c0
dab55b53-7354-46fd-8914-ef48b8c695f0	99519aee-5871-4ab9-a5b5-2309e4e11117
dab55b53-7354-46fd-8914-ef48b8c695f0	9c282416-79fc-4340-bd9c-b0f42652c9a5
dab55b53-7354-46fd-8914-ef48b8c695f0	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
dab55b53-7354-46fd-8914-ef48b8c695f0	aeb63f75-d22d-492b-bfb3-700d2343c915
dab55b53-7354-46fd-8914-ef48b8c695f0	b1806a16-509d-49e5-a2e2-3a484cd16455
dab55b53-7354-46fd-8914-ef48b8c695f0	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
dab55b53-7354-46fd-8914-ef48b8c695f0	be80eb60-f867-454f-97e7-86a675c09f53
dab55b53-7354-46fd-8914-ef48b8c695f0	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
dab55b53-7354-46fd-8914-ef48b8c695f0	d102057f-4e62-4e78-b37d-a764e8256a1b
dab55b53-7354-46fd-8914-ef48b8c695f0	e3d98622-d761-402e-a105-cff6c35f7a58
dab55b53-7354-46fd-8914-ef48b8c695f0	fea90bfd-2d11-424f-ad2f-507e1562c1af
dab55b53-7354-46fd-8914-ef48b8c695f0	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
2054bb43-179d-42d6-b601-31eb342745a9	2228af33-de0e-4227-916f-e958fea744cf
2054bb43-179d-42d6-b601-31eb342745a9	22a06b40-2b8c-46a1-bc90-df535a96e07e
2054bb43-179d-42d6-b601-31eb342745a9	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
2054bb43-179d-42d6-b601-31eb342745a9	4016b5fa-c380-496f-a3a5-251e48a9db66
2054bb43-179d-42d6-b601-31eb342745a9	66abafd9-5110-4c47-a81c-9a2a4f74cb08
2054bb43-179d-42d6-b601-31eb342745a9	84593a3b-1264-49e0-8ffb-7383132558c0
2054bb43-179d-42d6-b601-31eb342745a9	99519aee-5871-4ab9-a5b5-2309e4e11117
2054bb43-179d-42d6-b601-31eb342745a9	9c282416-79fc-4340-bd9c-b0f42652c9a5
2054bb43-179d-42d6-b601-31eb342745a9	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
2054bb43-179d-42d6-b601-31eb342745a9	aeb63f75-d22d-492b-bfb3-700d2343c915
2054bb43-179d-42d6-b601-31eb342745a9	b1806a16-509d-49e5-a2e2-3a484cd16455
2054bb43-179d-42d6-b601-31eb342745a9	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
2054bb43-179d-42d6-b601-31eb342745a9	be80eb60-f867-454f-97e7-86a675c09f53
2054bb43-179d-42d6-b601-31eb342745a9	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
2054bb43-179d-42d6-b601-31eb342745a9	d102057f-4e62-4e78-b37d-a764e8256a1b
2054bb43-179d-42d6-b601-31eb342745a9	e3d98622-d761-402e-a105-cff6c35f7a58
2054bb43-179d-42d6-b601-31eb342745a9	fea90bfd-2d11-424f-ad2f-507e1562c1af
2054bb43-179d-42d6-b601-31eb342745a9	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	2228af33-de0e-4227-916f-e958fea744cf
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	22a06b40-2b8c-46a1-bc90-df535a96e07e
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	4016b5fa-c380-496f-a3a5-251e48a9db66
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	66abafd9-5110-4c47-a81c-9a2a4f74cb08
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	84593a3b-1264-49e0-8ffb-7383132558c0
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	99519aee-5871-4ab9-a5b5-2309e4e11117
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	9c282416-79fc-4340-bd9c-b0f42652c9a5
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	aeb63f75-d22d-492b-bfb3-700d2343c915
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	b1806a16-509d-49e5-a2e2-3a484cd16455
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	be80eb60-f867-454f-97e7-86a675c09f53
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	d102057f-4e62-4e78-b37d-a764e8256a1b
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	e3d98622-d761-402e-a105-cff6c35f7a58
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	fea90bfd-2d11-424f-ad2f-507e1562c1af
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
659b157a-8cc9-4442-ae93-3f8f635a81a6	2228af33-de0e-4227-916f-e958fea744cf
659b157a-8cc9-4442-ae93-3f8f635a81a6	22a06b40-2b8c-46a1-bc90-df535a96e07e
659b157a-8cc9-4442-ae93-3f8f635a81a6	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
659b157a-8cc9-4442-ae93-3f8f635a81a6	4016b5fa-c380-496f-a3a5-251e48a9db66
659b157a-8cc9-4442-ae93-3f8f635a81a6	66abafd9-5110-4c47-a81c-9a2a4f74cb08
659b157a-8cc9-4442-ae93-3f8f635a81a6	84593a3b-1264-49e0-8ffb-7383132558c0
659b157a-8cc9-4442-ae93-3f8f635a81a6	99519aee-5871-4ab9-a5b5-2309e4e11117
659b157a-8cc9-4442-ae93-3f8f635a81a6	9c282416-79fc-4340-bd9c-b0f42652c9a5
659b157a-8cc9-4442-ae93-3f8f635a81a6	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
659b157a-8cc9-4442-ae93-3f8f635a81a6	aeb63f75-d22d-492b-bfb3-700d2343c915
659b157a-8cc9-4442-ae93-3f8f635a81a6	b1806a16-509d-49e5-a2e2-3a484cd16455
659b157a-8cc9-4442-ae93-3f8f635a81a6	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
659b157a-8cc9-4442-ae93-3f8f635a81a6	be80eb60-f867-454f-97e7-86a675c09f53
659b157a-8cc9-4442-ae93-3f8f635a81a6	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
659b157a-8cc9-4442-ae93-3f8f635a81a6	d102057f-4e62-4e78-b37d-a764e8256a1b
659b157a-8cc9-4442-ae93-3f8f635a81a6	e3d98622-d761-402e-a105-cff6c35f7a58
659b157a-8cc9-4442-ae93-3f8f635a81a6	fea90bfd-2d11-424f-ad2f-507e1562c1af
659b157a-8cc9-4442-ae93-3f8f635a81a6	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	2228af33-de0e-4227-916f-e958fea744cf
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	22a06b40-2b8c-46a1-bc90-df535a96e07e
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	4016b5fa-c380-496f-a3a5-251e48a9db66
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	66abafd9-5110-4c47-a81c-9a2a4f74cb08
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	84593a3b-1264-49e0-8ffb-7383132558c0
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	99519aee-5871-4ab9-a5b5-2309e4e11117
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	9c282416-79fc-4340-bd9c-b0f42652c9a5
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	aeb63f75-d22d-492b-bfb3-700d2343c915
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	b1806a16-509d-49e5-a2e2-3a484cd16455
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	be80eb60-f867-454f-97e7-86a675c09f53
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	d102057f-4e62-4e78-b37d-a764e8256a1b
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	e3d98622-d761-402e-a105-cff6c35f7a58
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	fea90bfd-2d11-424f-ad2f-507e1562c1af
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
71228913-c490-4f69-b53f-e610b64da380	2228af33-de0e-4227-916f-e958fea744cf
71228913-c490-4f69-b53f-e610b64da380	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
71228913-c490-4f69-b53f-e610b64da380	4016b5fa-c380-496f-a3a5-251e48a9db66
71228913-c490-4f69-b53f-e610b64da380	84593a3b-1264-49e0-8ffb-7383132558c0
71228913-c490-4f69-b53f-e610b64da380	99519aee-5871-4ab9-a5b5-2309e4e11117
71228913-c490-4f69-b53f-e610b64da380	9c282416-79fc-4340-bd9c-b0f42652c9a5
71228913-c490-4f69-b53f-e610b64da380	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
71228913-c490-4f69-b53f-e610b64da380	aeb63f75-d22d-492b-bfb3-700d2343c915
71228913-c490-4f69-b53f-e610b64da380	b1806a16-509d-49e5-a2e2-3a484cd16455
71228913-c490-4f69-b53f-e610b64da380	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
71228913-c490-4f69-b53f-e610b64da380	be80eb60-f867-454f-97e7-86a675c09f53
71228913-c490-4f69-b53f-e610b64da380	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
71228913-c490-4f69-b53f-e610b64da380	d102057f-4e62-4e78-b37d-a764e8256a1b
71228913-c490-4f69-b53f-e610b64da380	e3d98622-d761-402e-a105-cff6c35f7a58
71228913-c490-4f69-b53f-e610b64da380	fea90bfd-2d11-424f-ad2f-507e1562c1af
71228913-c490-4f69-b53f-e610b64da380	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba	99519aee-5871-4ab9-a5b5-2309e4e11117
b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba	9c282416-79fc-4340-bd9c-b0f42652c9a5
b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba	be80eb60-f867-454f-97e7-86a675c09f53
b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba	d102057f-4e62-4e78-b37d-a764e8256a1b
b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba	fea90bfd-2d11-424f-ad2f-507e1562c1af
b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
e0aad6ef-b183-45c5-a2a5-69f7ac7577c5	66abafd9-5110-4c47-a81c-9a2a4f74cb08
9ca1f59f-d79b-4297-bc5b-c37760ddd7c0	84593a3b-1264-49e0-8ffb-7383132558c0
ddd9acce-0eb6-4141-bafd-6191c5fb0bc6	2228af33-de0e-4227-916f-e958fea744cf
ddd9acce-0eb6-4141-bafd-6191c5fb0bc6	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
ddd9acce-0eb6-4141-bafd-6191c5fb0bc6	66abafd9-5110-4c47-a81c-9a2a4f74cb08
ddd9acce-0eb6-4141-bafd-6191c5fb0bc6	84593a3b-1264-49e0-8ffb-7383132558c0
ddd9acce-0eb6-4141-bafd-6191c5fb0bc6	99519aee-5871-4ab9-a5b5-2309e4e11117
ddd9acce-0eb6-4141-bafd-6191c5fb0bc6	9c282416-79fc-4340-bd9c-b0f42652c9a5
ddd9acce-0eb6-4141-bafd-6191c5fb0bc6	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
ddd9acce-0eb6-4141-bafd-6191c5fb0bc6	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
ddd9acce-0eb6-4141-bafd-6191c5fb0bc6	d102057f-4e62-4e78-b37d-a764e8256a1b
ef13a8be-9aff-484c-881d-5dd0e8631f66	84593a3b-1264-49e0-8ffb-7383132558c0
677ac23b-3140-4ef4-a71b-6821191f067b	2228af33-de0e-4227-916f-e958fea744cf
677ac23b-3140-4ef4-a71b-6821191f067b	4016b5fa-c380-496f-a3a5-251e48a9db66
677ac23b-3140-4ef4-a71b-6821191f067b	66abafd9-5110-4c47-a81c-9a2a4f74cb08
677ac23b-3140-4ef4-a71b-6821191f067b	84593a3b-1264-49e0-8ffb-7383132558c0
677ac23b-3140-4ef4-a71b-6821191f067b	99519aee-5871-4ab9-a5b5-2309e4e11117
677ac23b-3140-4ef4-a71b-6821191f067b	9c282416-79fc-4340-bd9c-b0f42652c9a5
677ac23b-3140-4ef4-a71b-6821191f067b	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
677ac23b-3140-4ef4-a71b-6821191f067b	aeb63f75-d22d-492b-bfb3-700d2343c915
677ac23b-3140-4ef4-a71b-6821191f067b	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
677ac23b-3140-4ef4-a71b-6821191f067b	d102057f-4e62-4e78-b37d-a764e8256a1b
1d16af31-8260-4617-a678-9b4a69af14c7	66abafd9-5110-4c47-a81c-9a2a4f74cb08
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	2228af33-de0e-4227-916f-e958fea744cf
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	22a06b40-2b8c-46a1-bc90-df535a96e07e
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	4016b5fa-c380-496f-a3a5-251e48a9db66
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	66abafd9-5110-4c47-a81c-9a2a4f74cb08
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	84593a3b-1264-49e0-8ffb-7383132558c0
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	99519aee-5871-4ab9-a5b5-2309e4e11117
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	9c282416-79fc-4340-bd9c-b0f42652c9a5
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	aeb63f75-d22d-492b-bfb3-700d2343c915
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	b1806a16-509d-49e5-a2e2-3a484cd16455
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	be80eb60-f867-454f-97e7-86a675c09f53
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	d102057f-4e62-4e78-b37d-a764e8256a1b
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	e3d98622-d761-402e-a105-cff6c35f7a58
b6a5161f-7a10-4a31-b06c-65803682bcfc	2228af33-de0e-4227-916f-e958fea744cf
d7dc7c66-c665-45e1-9352-0f246b765a37	d102057f-4e62-4e78-b37d-a764e8256a1b
b19604ab-673d-4030-99eb-b4b37ac73477	22a06b40-2b8c-46a1-bc90-df535a96e07e
b19604ab-673d-4030-99eb-b4b37ac73477	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
b19604ab-673d-4030-99eb-b4b37ac73477	66abafd9-5110-4c47-a81c-9a2a4f74cb08
b19604ab-673d-4030-99eb-b4b37ac73477	99519aee-5871-4ab9-a5b5-2309e4e11117
b19604ab-673d-4030-99eb-b4b37ac73477	9c282416-79fc-4340-bd9c-b0f42652c9a5
b19604ab-673d-4030-99eb-b4b37ac73477	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
b19604ab-673d-4030-99eb-b4b37ac73477	be80eb60-f867-454f-97e7-86a675c09f53
b19604ab-673d-4030-99eb-b4b37ac73477	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
699e1215-8ec3-42aa-96fa-317b3ba0064c	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
699e1215-8ec3-42aa-96fa-317b3ba0064c	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
699e1215-8ec3-42aa-96fa-317b3ba0064c	66abafd9-5110-4c47-a81c-9a2a4f74cb08
699e1215-8ec3-42aa-96fa-317b3ba0064c	2228af33-de0e-4227-916f-e958fea744cf
f6799d62-0e60-4dcd-b3be-a8e9ecb60ea5	4016b5fa-c380-496f-a3a5-251e48a9db66
f6799d62-0e60-4dcd-b3be-a8e9ecb60ea5	aeb63f75-d22d-492b-bfb3-700d2343c915
f6799d62-0e60-4dcd-b3be-a8e9ecb60ea5	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
263138da-c55c-4347-925c-fb9e191d9aa8	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
263138da-c55c-4347-925c-fb9e191d9aa8	66abafd9-5110-4c47-a81c-9a2a4f74cb08
263138da-c55c-4347-925c-fb9e191d9aa8	84593a3b-1264-49e0-8ffb-7383132558c0
263138da-c55c-4347-925c-fb9e191d9aa8	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
263138da-c55c-4347-925c-fb9e191d9aa8	be80eb60-f867-454f-97e7-86a675c09f53
263138da-c55c-4347-925c-fb9e191d9aa8	e3d98622-d761-402e-a105-cff6c35f7a58
263138da-c55c-4347-925c-fb9e191d9aa8	fea90bfd-2d11-424f-ad2f-507e1562c1af
263138da-c55c-4347-925c-fb9e191d9aa8	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
96d83900-d6fc-48c1-bd7c-50275e74e8ad	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
96d83900-d6fc-48c1-bd7c-50275e74e8ad	aeb63f75-d22d-492b-bfb3-700d2343c915
3b78b8c1-6f1a-4e7e-96f3-b78f53cc4223	b1806a16-509d-49e5-a2e2-3a484cd16455
3b78b8c1-6f1a-4e7e-96f3-b78f53cc4223	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
94cddb77-77e6-4cd4-a3cf-1ca582d7bafa	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
94cddb77-77e6-4cd4-a3cf-1ca582d7bafa	4016b5fa-c380-496f-a3a5-251e48a9db66
60a80520-1f58-4701-8d3c-3d82d530e956	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
60a80520-1f58-4701-8d3c-3d82d530e956	4016b5fa-c380-496f-a3a5-251e48a9db66
97c4b6c5-8604-4d6d-a76b-6816816d1e87	2228af33-de0e-4227-916f-e958fea744cf
97c4b6c5-8604-4d6d-a76b-6816816d1e87	d102057f-4e62-4e78-b37d-a764e8256a1b
97c4b6c5-8604-4d6d-a76b-6816816d1e87	e3d98622-d761-402e-a105-cff6c35f7a58
97c4b6c5-8604-4d6d-a76b-6816816d1e87	99519aee-5871-4ab9-a5b5-2309e4e11117
ad246772-bdd1-4423-9dd6-8435ac38b82d	926f5ca0-3486-4b57-97db-5d0e8f417d43
ecbdf902-a03b-41d1-a25a-a267fcfa2a68	926f5ca0-3486-4b57-97db-5d0e8f417d43
f0b62557-ee52-4bed-912d-8592f4020873	926f5ca0-3486-4b57-97db-5d0e8f417d43
03f04e6f-690c-43f0-a037-0bb816a768bc	926f5ca0-3486-4b57-97db-5d0e8f417d43
41ed930e-fdde-455c-b75f-305ff5c59d7c	926f5ca0-3486-4b57-97db-5d0e8f417d43
71228913-c490-4f69-b53f-e610b64da380	926f5ca0-3486-4b57-97db-5d0e8f417d43
2054bb43-179d-42d6-b601-31eb342745a9	926f5ca0-3486-4b57-97db-5d0e8f417d43
659b157a-8cc9-4442-ae93-3f8f635a81a6	926f5ca0-3486-4b57-97db-5d0e8f417d43
0ac890a8-3e5f-4267-8261-830d39b0b62d	926f5ca0-3486-4b57-97db-5d0e8f417d43
6f500bde-c229-48d8-9a48-6d38f2ce7191	926f5ca0-3486-4b57-97db-5d0e8f417d43
c5aabd21-29cd-4d77-b7b0-f071f971ed47	926f5ca0-3486-4b57-97db-5d0e8f417d43
dab55b53-7354-46fd-8914-ef48b8c695f0	926f5ca0-3486-4b57-97db-5d0e8f417d43
a1c91aa2-a103-41bc-a545-1590f1cb0547	926f5ca0-3486-4b57-97db-5d0e8f417d43
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	926f5ca0-3486-4b57-97db-5d0e8f417d43
747633f6-9821-4db8-81b5-cf2374cf773e	926f5ca0-3486-4b57-97db-5d0e8f417d43
4d076373-8444-4909-b28d-b7665c8b76f7	926f5ca0-3486-4b57-97db-5d0e8f417d43
3769c2dd-cf78-4848-9231-e780aa4fee69	926f5ca0-3486-4b57-97db-5d0e8f417d43
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	926f5ca0-3486-4b57-97db-5d0e8f417d43
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	926f5ca0-3486-4b57-97db-5d0e8f417d43
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	926f5ca0-3486-4b57-97db-5d0e8f417d43
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	926f5ca0-3486-4b57-97db-5d0e8f417d43
3a5352b6-d7a0-4b51-a013-7f2b005174c3	926f5ca0-3486-4b57-97db-5d0e8f417d43
6373b006-878f-4a40-8729-349c2a27fa20	d102057f-4e62-4e78-b37d-a764e8256a1b
32506b0a-9ce3-43af-a8ea-c45fbffec805	fea90bfd-2d11-424f-ad2f-507e1562c1af
6161a098-a4c3-44ab-bd85-27de181c04ab	fea90bfd-2d11-424f-ad2f-507e1562c1af
17c637de-a2b5-430d-bb67-b36a3315039c	84593a3b-1264-49e0-8ffb-7383132558c0
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	84593a3b-1264-49e0-8ffb-7383132558c0
677ac23b-3140-4ef4-a71b-6821191f067b	b1806a16-509d-49e5-a2e2-3a484cd16455
41ed930e-fdde-455c-b75f-305ff5c59d7c	e3d98622-d761-402e-a105-cff6c35f7a58
f0b62557-ee52-4bed-912d-8592f4020873	d102057f-4e62-4e78-b37d-a764e8256a1b
d7dc7c66-c665-45e1-9352-0f246b765a37	9c282416-79fc-4340-bd9c-b0f42652c9a5
d7dc7c66-c665-45e1-9352-0f246b765a37	99519aee-5871-4ab9-a5b5-2309e4e11117
7f296a30-104f-4803-b711-ea7fff34de1c	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
caf4be28-0825-49d3-81c8-f2b88b6aeeec	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
06876434-2c1d-4c96-b18c-ca13f5b93f3e	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
b4ce3897-6134-439b-b071-2c68f4cd65e9	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
18ce93b1-e30d-48db-9dc9-57c555dde8a1	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
75401584-d7cc-4ef2-b3aa-bb293ba8ff2c	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
6be300b6-aff9-4c3c-91ce-ddab2217b2a3	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
172cb42c-94e9-4b8b-9d45-aad21d0c2552	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
3359d42e-77e7-4a33-b08c-abad892c829e	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
0c8c9915-327c-414d-80db-4e16a0e8e9dc	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
457cea5b-6cd2-4dc7-9e38-8d0f23f88ef8	c1e37c77-dfe0-41af-b8c3-77c5d1cb6673
2054bb43-179d-42d6-b601-31eb342745a9	69125a81-1480-486f-a2f1-2a6c6624187e
6f500bde-c229-48d8-9a48-6d38f2ce7191	69125a81-1480-486f-a2f1-2a6c6624187e
747633f6-9821-4db8-81b5-cf2374cf773e	69125a81-1480-486f-a2f1-2a6c6624187e
4d076373-8444-4909-b28d-b7665c8b76f7	69125a81-1480-486f-a2f1-2a6c6624187e
659b157a-8cc9-4442-ae93-3f8f635a81a6	69125a81-1480-486f-a2f1-2a6c6624187e
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	69125a81-1480-486f-a2f1-2a6c6624187e
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	69125a81-1480-486f-a2f1-2a6c6624187e
dab55b53-7354-46fd-8914-ef48b8c695f0	69125a81-1480-486f-a2f1-2a6c6624187e
a1c91aa2-a103-41bc-a545-1590f1cb0547	69125a81-1480-486f-a2f1-2a6c6624187e
3769c2dd-cf78-4848-9231-e780aa4fee69	69125a81-1480-486f-a2f1-2a6c6624187e
c5aabd21-29cd-4d77-b7b0-f071f971ed47	69125a81-1480-486f-a2f1-2a6c6624187e
0ac890a8-3e5f-4267-8261-830d39b0b62d	69125a81-1480-486f-a2f1-2a6c6624187e
3a5352b6-d7a0-4b51-a013-7f2b005174c3	69125a81-1480-486f-a2f1-2a6c6624187e
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	69125a81-1480-486f-a2f1-2a6c6624187e
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	69125a81-1480-486f-a2f1-2a6c6624187e
677ac23b-3140-4ef4-a71b-6821191f067b	69125a81-1480-486f-a2f1-2a6c6624187e
71228913-c490-4f69-b53f-e610b64da380	69125a81-1480-486f-a2f1-2a6c6624187e
41ed930e-fdde-455c-b75f-305ff5c59d7c	69125a81-1480-486f-a2f1-2a6c6624187e
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	69125a81-1480-486f-a2f1-2a6c6624187e
f6799d62-0e60-4dcd-b3be-a8e9ecb60ea5	69125a81-1480-486f-a2f1-2a6c6624187e
b4a5c408-a348-4cf0-852a-03c33447a3c5	69125a81-1480-486f-a2f1-2a6c6624187e
abf2d23a-1707-44f1-8112-84ec5a76cbdf	69125a81-1480-486f-a2f1-2a6c6624187e
d49e4a1c-2b6e-4161-a035-e4de5431dfcf	69125a81-1480-486f-a2f1-2a6c6624187e
0f5bd1ea-3bdd-4199-8a83-2c42e066d7ed	69125a81-1480-486f-a2f1-2a6c6624187e
cec9c8ae-b54b-4698-a647-1cf2b645431a	69125a81-1480-486f-a2f1-2a6c6624187e
98af9d29-90fb-40e6-88e9-11203916e16a	69125a81-1480-486f-a2f1-2a6c6624187e
2b957305-0b01-4a68-90e6-a3393b771611	69125a81-1480-486f-a2f1-2a6c6624187e
ad246772-bdd1-4423-9dd6-8435ac38b82d	69125a81-1480-486f-a2f1-2a6c6624187e
06ee5357-6494-4ce5-b0ed-912d5f16b346	69125a81-1480-486f-a2f1-2a6c6624187e
34d4b5ff-39da-4a9f-ba98-4fab806a64ec	69125a81-1480-486f-a2f1-2a6c6624187e
9275d22c-5b74-4419-a28e-c97f8de72204	69125a81-1480-486f-a2f1-2a6c6624187e
92e565b0-9b87-4979-99a9-1a6867af1d0b	69125a81-1480-486f-a2f1-2a6c6624187e
0cd35f43-95e6-4cc8-a61c-24219e8c7b28	69125a81-1480-486f-a2f1-2a6c6624187e
70d67fb6-ab9c-411b-833c-044844bd014b	69125a81-1480-486f-a2f1-2a6c6624187e
d19e52a3-0b47-4532-aebc-230cbd2afb39	69125a81-1480-486f-a2f1-2a6c6624187e
76660524-10cb-42bd-a244-abdbf741be47	69125a81-1480-486f-a2f1-2a6c6624187e
2054bb43-179d-42d6-b601-31eb342745a9	1ea85325-d23b-4700-8a5b-40884b779c52
6f500bde-c229-48d8-9a48-6d38f2ce7191	1ea85325-d23b-4700-8a5b-40884b779c52
747633f6-9821-4db8-81b5-cf2374cf773e	1ea85325-d23b-4700-8a5b-40884b779c52
4d076373-8444-4909-b28d-b7665c8b76f7	1ea85325-d23b-4700-8a5b-40884b779c52
659b157a-8cc9-4442-ae93-3f8f635a81a6	1ea85325-d23b-4700-8a5b-40884b779c52
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	1ea85325-d23b-4700-8a5b-40884b779c52
41ed930e-fdde-455c-b75f-305ff5c59d7c	1ea85325-d23b-4700-8a5b-40884b779c52
0ac890a8-3e5f-4267-8261-830d39b0b62d	1ea85325-d23b-4700-8a5b-40884b779c52
c5aabd21-29cd-4d77-b7b0-f071f971ed47	1ea85325-d23b-4700-8a5b-40884b779c52
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	1ea85325-d23b-4700-8a5b-40884b779c52
dab55b53-7354-46fd-8914-ef48b8c695f0	1ea85325-d23b-4700-8a5b-40884b779c52
a1c91aa2-a103-41bc-a545-1590f1cb0547	1ea85325-d23b-4700-8a5b-40884b779c52
3769c2dd-cf78-4848-9231-e780aa4fee69	1ea85325-d23b-4700-8a5b-40884b779c52
3a5352b6-d7a0-4b51-a013-7f2b005174c3	1ea85325-d23b-4700-8a5b-40884b779c52
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	1ea85325-d23b-4700-8a5b-40884b779c52
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	1ea85325-d23b-4700-8a5b-40884b779c52
677ac23b-3140-4ef4-a71b-6821191f067b	1ea85325-d23b-4700-8a5b-40884b779c52
71228913-c490-4f69-b53f-e610b64da380	1ea85325-d23b-4700-8a5b-40884b779c52
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	1ea85325-d23b-4700-8a5b-40884b779c52
f6799d62-0e60-4dcd-b3be-a8e9ecb60ea5	1ea85325-d23b-4700-8a5b-40884b779c52
cec9c8ae-b54b-4698-a647-1cf2b645431a	1ea85325-d23b-4700-8a5b-40884b779c52
98af9d29-90fb-40e6-88e9-11203916e16a	1ea85325-d23b-4700-8a5b-40884b779c52
2b957305-0b01-4a68-90e6-a3393b771611	1ea85325-d23b-4700-8a5b-40884b779c52
ad246772-bdd1-4423-9dd6-8435ac38b82d	1ea85325-d23b-4700-8a5b-40884b779c52
06ee5357-6494-4ce5-b0ed-912d5f16b346	1ea85325-d23b-4700-8a5b-40884b779c52
34d4b5ff-39da-4a9f-ba98-4fab806a64ec	1ea85325-d23b-4700-8a5b-40884b779c52
9275d22c-5b74-4419-a28e-c97f8de72204	1ea85325-d23b-4700-8a5b-40884b779c52
92e565b0-9b87-4979-99a9-1a6867af1d0b	1ea85325-d23b-4700-8a5b-40884b779c52
0cd35f43-95e6-4cc8-a61c-24219e8c7b28	1ea85325-d23b-4700-8a5b-40884b779c52
70d67fb6-ab9c-411b-833c-044844bd014b	1ea85325-d23b-4700-8a5b-40884b779c52
d19e52a3-0b47-4532-aebc-230cbd2afb39	1ea85325-d23b-4700-8a5b-40884b779c52
76660524-10cb-42bd-a244-abdbf741be47	1ea85325-d23b-4700-8a5b-40884b779c52
f0b62557-ee52-4bed-912d-8592f4020873	1ea85325-d23b-4700-8a5b-40884b779c52
ddd9acce-0eb6-4141-bafd-6191c5fb0bc6	1ea85325-d23b-4700-8a5b-40884b779c52
3769c2dd-cf78-4848-9231-e780aa4fee69	d1564e33-79a5-42e2-a7fb-38f59297432b
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	d1564e33-79a5-42e2-a7fb-38f59297432b
71228913-c490-4f69-b53f-e610b64da380	d1564e33-79a5-42e2-a7fb-38f59297432b
41ed930e-fdde-455c-b75f-305ff5c59d7c	d1564e33-79a5-42e2-a7fb-38f59297432b
2054bb43-179d-42d6-b601-31eb342745a9	d1564e33-79a5-42e2-a7fb-38f59297432b
659b157a-8cc9-4442-ae93-3f8f635a81a6	d1564e33-79a5-42e2-a7fb-38f59297432b
0ac890a8-3e5f-4267-8261-830d39b0b62d	d1564e33-79a5-42e2-a7fb-38f59297432b
6f500bde-c229-48d8-9a48-6d38f2ce7191	d1564e33-79a5-42e2-a7fb-38f59297432b
c5aabd21-29cd-4d77-b7b0-f071f971ed47	d1564e33-79a5-42e2-a7fb-38f59297432b
dab55b53-7354-46fd-8914-ef48b8c695f0	d1564e33-79a5-42e2-a7fb-38f59297432b
3a5352b6-d7a0-4b51-a013-7f2b005174c3	d1564e33-79a5-42e2-a7fb-38f59297432b
a1c91aa2-a103-41bc-a545-1590f1cb0547	d1564e33-79a5-42e2-a7fb-38f59297432b
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	d1564e33-79a5-42e2-a7fb-38f59297432b
747633f6-9821-4db8-81b5-cf2374cf773e	d1564e33-79a5-42e2-a7fb-38f59297432b
4d076373-8444-4909-b28d-b7665c8b76f7	d1564e33-79a5-42e2-a7fb-38f59297432b
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	d1564e33-79a5-42e2-a7fb-38f59297432b
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	d1564e33-79a5-42e2-a7fb-38f59297432b
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	d1564e33-79a5-42e2-a7fb-38f59297432b
677ac23b-3140-4ef4-a71b-6821191f067b	d1564e33-79a5-42e2-a7fb-38f59297432b
263138da-c55c-4347-925c-fb9e191d9aa8	d1564e33-79a5-42e2-a7fb-38f59297432b
15130df5-6095-4a8a-8fb6-bc4dd33dc2b5	d1564e33-79a5-42e2-a7fb-38f59297432b
699e1215-8ec3-42aa-96fa-317b3ba0064c	d1564e33-79a5-42e2-a7fb-38f59297432b
0f5bd1ea-3bdd-4199-8a83-2c42e066d7ed	d1564e33-79a5-42e2-a7fb-38f59297432b
ddd9acce-0eb6-4141-bafd-6191c5fb0bc6	d1564e33-79a5-42e2-a7fb-38f59297432b
f0b62557-ee52-4bed-912d-8592f4020873	d1564e33-79a5-42e2-a7fb-38f59297432b
6373b006-878f-4a40-8729-349c2a27fa20	d1564e33-79a5-42e2-a7fb-38f59297432b
662af6fd-27e6-4fd1-b37d-5e0cd51854fd	d1564e33-79a5-42e2-a7fb-38f59297432b
44d70996-1301-4db8-9b4a-ab4139a70488	d1564e33-79a5-42e2-a7fb-38f59297432b
3769c2dd-cf78-4848-9231-e780aa4fee69	3b138675-1889-4e1e-b772-1a5189ff6301
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	3b138675-1889-4e1e-b772-1a5189ff6301
71228913-c490-4f69-b53f-e610b64da380	3b138675-1889-4e1e-b772-1a5189ff6301
41ed930e-fdde-455c-b75f-305ff5c59d7c	3b138675-1889-4e1e-b772-1a5189ff6301
2054bb43-179d-42d6-b601-31eb342745a9	3b138675-1889-4e1e-b772-1a5189ff6301
659b157a-8cc9-4442-ae93-3f8f635a81a6	3b138675-1889-4e1e-b772-1a5189ff6301
0ac890a8-3e5f-4267-8261-830d39b0b62d	3b138675-1889-4e1e-b772-1a5189ff6301
6f500bde-c229-48d8-9a48-6d38f2ce7191	3b138675-1889-4e1e-b772-1a5189ff6301
c5aabd21-29cd-4d77-b7b0-f071f971ed47	3b138675-1889-4e1e-b772-1a5189ff6301
dab55b53-7354-46fd-8914-ef48b8c695f0	3b138675-1889-4e1e-b772-1a5189ff6301
3a5352b6-d7a0-4b51-a013-7f2b005174c3	3b138675-1889-4e1e-b772-1a5189ff6301
a1c91aa2-a103-41bc-a545-1590f1cb0547	3b138675-1889-4e1e-b772-1a5189ff6301
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	3b138675-1889-4e1e-b772-1a5189ff6301
747633f6-9821-4db8-81b5-cf2374cf773e	3b138675-1889-4e1e-b772-1a5189ff6301
4d076373-8444-4909-b28d-b7665c8b76f7	3b138675-1889-4e1e-b772-1a5189ff6301
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	3b138675-1889-4e1e-b772-1a5189ff6301
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	3b138675-1889-4e1e-b772-1a5189ff6301
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	3b138675-1889-4e1e-b772-1a5189ff6301
677ac23b-3140-4ef4-a71b-6821191f067b	3b138675-1889-4e1e-b772-1a5189ff6301
662af6fd-27e6-4fd1-b37d-5e0cd51854fd	3b138675-1889-4e1e-b772-1a5189ff6301
ecbdf902-a03b-41d1-a25a-a267fcfa2a68	3b138675-1889-4e1e-b772-1a5189ff6301
0f5bd1ea-3bdd-4199-8a83-2c42e066d7ed	3b138675-1889-4e1e-b772-1a5189ff6301
ffee3101-5934-40c3-bb95-87392970ab9e	3b138675-1889-4e1e-b772-1a5189ff6301
dc525f85-31d6-49f9-bb41-1d7be3e5fd8a	3b138675-1889-4e1e-b772-1a5189ff6301
c1626027-8553-4e4e-bb32-7a03cbfae72d	3b138675-1889-4e1e-b772-1a5189ff6301
a18a2659-32f1-4ecb-a85f-69db0ba4afb0	3b138675-1889-4e1e-b772-1a5189ff6301
c9bf9b95-78b0-4ac8-93ac-4624c051bed5	3b138675-1889-4e1e-b772-1a5189ff6301
3dcd6e8d-549f-41a4-8d5c-ef9fd754273c	3b138675-1889-4e1e-b772-1a5189ff6301
409aaf25-65be-47c6-88ac-6d483242c466	3b138675-1889-4e1e-b772-1a5189ff6301
209dd52f-b881-45aa-9b3d-e7eef9a76bed	3b138675-1889-4e1e-b772-1a5189ff6301
56d64848-6fe4-40b6-9d72-18a206da6562	3b138675-1889-4e1e-b772-1a5189ff6301
9e83bd19-bb8b-4247-bc5f-98e5390932a6	3b138675-1889-4e1e-b772-1a5189ff6301
15130df5-6095-4a8a-8fb6-bc4dd33dc2b5	3b138675-1889-4e1e-b772-1a5189ff6301
6373b006-878f-4a40-8729-349c2a27fa20	3b138675-1889-4e1e-b772-1a5189ff6301
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	a85b89de-2acd-4e95-a83a-31bf1edd6244
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	a85b89de-2acd-4e95-a83a-31bf1edd6244
677ac23b-3140-4ef4-a71b-6821191f067b	a85b89de-2acd-4e95-a83a-31bf1edd6244
c050c6c1-1d2a-4dda-9365-dec2acfa96b0	a85b89de-2acd-4e95-a83a-31bf1edd6244
2fb8ba8f-9b3e-401d-90e6-e5f95442f7ba	a85b89de-2acd-4e95-a83a-31bf1edd6244
1fcf9196-0db5-4f3c-a465-563b2f2eca76	a85b89de-2acd-4e95-a83a-31bf1edd6244
4489ff9f-6ffd-4331-a70b-f70fb744d824	a85b89de-2acd-4e95-a83a-31bf1edd6244
f9401078-3c51-4a72-a43f-bd81a83bc724	a85b89de-2acd-4e95-a83a-31bf1edd6244
699e1215-8ec3-42aa-96fa-317b3ba0064c	a85b89de-2acd-4e95-a83a-31bf1edd6244
15130df5-6095-4a8a-8fb6-bc4dd33dc2b5	a85b89de-2acd-4e95-a83a-31bf1edd6244
662af6fd-27e6-4fd1-b37d-5e0cd51854fd	a85b89de-2acd-4e95-a83a-31bf1edd6244
ecbdf902-a03b-41d1-a25a-a267fcfa2a68	a85b89de-2acd-4e95-a83a-31bf1edd6244
3769c2dd-cf78-4848-9231-e780aa4fee69	a85b89de-2acd-4e95-a83a-31bf1edd6244
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	a85b89de-2acd-4e95-a83a-31bf1edd6244
71228913-c490-4f69-b53f-e610b64da380	a85b89de-2acd-4e95-a83a-31bf1edd6244
41ed930e-fdde-455c-b75f-305ff5c59d7c	a85b89de-2acd-4e95-a83a-31bf1edd6244
2054bb43-179d-42d6-b601-31eb342745a9	a85b89de-2acd-4e95-a83a-31bf1edd6244
659b157a-8cc9-4442-ae93-3f8f635a81a6	a85b89de-2acd-4e95-a83a-31bf1edd6244
0ac890a8-3e5f-4267-8261-830d39b0b62d	a85b89de-2acd-4e95-a83a-31bf1edd6244
6f500bde-c229-48d8-9a48-6d38f2ce7191	a85b89de-2acd-4e95-a83a-31bf1edd6244
c5aabd21-29cd-4d77-b7b0-f071f971ed47	a85b89de-2acd-4e95-a83a-31bf1edd6244
dab55b53-7354-46fd-8914-ef48b8c695f0	a85b89de-2acd-4e95-a83a-31bf1edd6244
3a5352b6-d7a0-4b51-a013-7f2b005174c3	a85b89de-2acd-4e95-a83a-31bf1edd6244
a1c91aa2-a103-41bc-a545-1590f1cb0547	a85b89de-2acd-4e95-a83a-31bf1edd6244
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	a85b89de-2acd-4e95-a83a-31bf1edd6244
747633f6-9821-4db8-81b5-cf2374cf773e	a85b89de-2acd-4e95-a83a-31bf1edd6244
4d076373-8444-4909-b28d-b7665c8b76f7	a85b89de-2acd-4e95-a83a-31bf1edd6244
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	a85b89de-2acd-4e95-a83a-31bf1edd6244
2054bb43-179d-42d6-b601-31eb342745a9	10c29f7a-f084-4eb4-87ab-419707c80fb4
6f500bde-c229-48d8-9a48-6d38f2ce7191	10c29f7a-f084-4eb4-87ab-419707c80fb4
747633f6-9821-4db8-81b5-cf2374cf773e	10c29f7a-f084-4eb4-87ab-419707c80fb4
4d076373-8444-4909-b28d-b7665c8b76f7	10c29f7a-f084-4eb4-87ab-419707c80fb4
659b157a-8cc9-4442-ae93-3f8f635a81a6	10c29f7a-f084-4eb4-87ab-419707c80fb4
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	10c29f7a-f084-4eb4-87ab-419707c80fb4
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	10c29f7a-f084-4eb4-87ab-419707c80fb4
dab55b53-7354-46fd-8914-ef48b8c695f0	10c29f7a-f084-4eb4-87ab-419707c80fb4
a1c91aa2-a103-41bc-a545-1590f1cb0547	10c29f7a-f084-4eb4-87ab-419707c80fb4
3769c2dd-cf78-4848-9231-e780aa4fee69	10c29f7a-f084-4eb4-87ab-419707c80fb4
c5aabd21-29cd-4d77-b7b0-f071f971ed47	10c29f7a-f084-4eb4-87ab-419707c80fb4
0ac890a8-3e5f-4267-8261-830d39b0b62d	10c29f7a-f084-4eb4-87ab-419707c80fb4
3a5352b6-d7a0-4b51-a013-7f2b005174c3	10c29f7a-f084-4eb4-87ab-419707c80fb4
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	10c29f7a-f084-4eb4-87ab-419707c80fb4
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	10c29f7a-f084-4eb4-87ab-419707c80fb4
677ac23b-3140-4ef4-a71b-6821191f067b	10c29f7a-f084-4eb4-87ab-419707c80fb4
71228913-c490-4f69-b53f-e610b64da380	10c29f7a-f084-4eb4-87ab-419707c80fb4
41ed930e-fdde-455c-b75f-305ff5c59d7c	10c29f7a-f084-4eb4-87ab-419707c80fb4
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	10c29f7a-f084-4eb4-87ab-419707c80fb4
ffee3101-5934-40c3-bb95-87392970ab9e	10c29f7a-f084-4eb4-87ab-419707c80fb4
dc525f85-31d6-49f9-bb41-1d7be3e5fd8a	10c29f7a-f084-4eb4-87ab-419707c80fb4
c1626027-8553-4e4e-bb32-7a03cbfae72d	10c29f7a-f084-4eb4-87ab-419707c80fb4
a18a2659-32f1-4ecb-a85f-69db0ba4afb0	10c29f7a-f084-4eb4-87ab-419707c80fb4
c9bf9b95-78b0-4ac8-93ac-4624c051bed5	10c29f7a-f084-4eb4-87ab-419707c80fb4
3dcd6e8d-549f-41a4-8d5c-ef9fd754273c	10c29f7a-f084-4eb4-87ab-419707c80fb4
409aaf25-65be-47c6-88ac-6d483242c466	10c29f7a-f084-4eb4-87ab-419707c80fb4
209dd52f-b881-45aa-9b3d-e7eef9a76bed	10c29f7a-f084-4eb4-87ab-419707c80fb4
56d64848-6fe4-40b6-9d72-18a206da6562	10c29f7a-f084-4eb4-87ab-419707c80fb4
0f5bd1ea-3bdd-4199-8a83-2c42e066d7ed	10c29f7a-f084-4eb4-87ab-419707c80fb4
9e83bd19-bb8b-4247-bc5f-98e5390932a6	10c29f7a-f084-4eb4-87ab-419707c80fb4
15130df5-6095-4a8a-8fb6-bc4dd33dc2b5	10c29f7a-f084-4eb4-87ab-419707c80fb4
ecbdf902-a03b-41d1-a25a-a267fcfa2a68	10c29f7a-f084-4eb4-87ab-419707c80fb4
f6799d62-0e60-4dcd-b3be-a8e9ecb60ea5	10c29f7a-f084-4eb4-87ab-419707c80fb4
6373b006-878f-4a40-8729-349c2a27fa20	10c29f7a-f084-4eb4-87ab-419707c80fb4
662af6fd-27e6-4fd1-b37d-5e0cd51854fd	10c29f7a-f084-4eb4-87ab-419707c80fb4
2054bb43-179d-42d6-b601-31eb342745a9	f453fce2-0cb7-4e97-952e-a72d4347a756
6f500bde-c229-48d8-9a48-6d38f2ce7191	f453fce2-0cb7-4e97-952e-a72d4347a756
747633f6-9821-4db8-81b5-cf2374cf773e	f453fce2-0cb7-4e97-952e-a72d4347a756
4d076373-8444-4909-b28d-b7665c8b76f7	f453fce2-0cb7-4e97-952e-a72d4347a756
659b157a-8cc9-4442-ae93-3f8f635a81a6	f453fce2-0cb7-4e97-952e-a72d4347a756
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	f453fce2-0cb7-4e97-952e-a72d4347a756
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	f453fce2-0cb7-4e97-952e-a72d4347a756
dab55b53-7354-46fd-8914-ef48b8c695f0	f453fce2-0cb7-4e97-952e-a72d4347a756
a1c91aa2-a103-41bc-a545-1590f1cb0547	f453fce2-0cb7-4e97-952e-a72d4347a756
3769c2dd-cf78-4848-9231-e780aa4fee69	f453fce2-0cb7-4e97-952e-a72d4347a756
c5aabd21-29cd-4d77-b7b0-f071f971ed47	f453fce2-0cb7-4e97-952e-a72d4347a756
0ac890a8-3e5f-4267-8261-830d39b0b62d	f453fce2-0cb7-4e97-952e-a72d4347a756
3a5352b6-d7a0-4b51-a013-7f2b005174c3	f453fce2-0cb7-4e97-952e-a72d4347a756
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	f453fce2-0cb7-4e97-952e-a72d4347a756
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	f453fce2-0cb7-4e97-952e-a72d4347a756
677ac23b-3140-4ef4-a71b-6821191f067b	f453fce2-0cb7-4e97-952e-a72d4347a756
71228913-c490-4f69-b53f-e610b64da380	f453fce2-0cb7-4e97-952e-a72d4347a756
41ed930e-fdde-455c-b75f-305ff5c59d7c	f453fce2-0cb7-4e97-952e-a72d4347a756
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	f453fce2-0cb7-4e97-952e-a72d4347a756
ffee3101-5934-40c3-bb95-87392970ab9e	f453fce2-0cb7-4e97-952e-a72d4347a756
dc525f85-31d6-49f9-bb41-1d7be3e5fd8a	f453fce2-0cb7-4e97-952e-a72d4347a756
c1626027-8553-4e4e-bb32-7a03cbfae72d	f453fce2-0cb7-4e97-952e-a72d4347a756
a18a2659-32f1-4ecb-a85f-69db0ba4afb0	f453fce2-0cb7-4e97-952e-a72d4347a756
c9bf9b95-78b0-4ac8-93ac-4624c051bed5	f453fce2-0cb7-4e97-952e-a72d4347a756
3dcd6e8d-549f-41a4-8d5c-ef9fd754273c	f453fce2-0cb7-4e97-952e-a72d4347a756
409aaf25-65be-47c6-88ac-6d483242c466	f453fce2-0cb7-4e97-952e-a72d4347a756
209dd52f-b881-45aa-9b3d-e7eef9a76bed	f453fce2-0cb7-4e97-952e-a72d4347a756
56d64848-6fe4-40b6-9d72-18a206da6562	f453fce2-0cb7-4e97-952e-a72d4347a756
0f5bd1ea-3bdd-4199-8a83-2c42e066d7ed	f453fce2-0cb7-4e97-952e-a72d4347a756
9e83bd19-bb8b-4247-bc5f-98e5390932a6	f453fce2-0cb7-4e97-952e-a72d4347a756
15130df5-6095-4a8a-8fb6-bc4dd33dc2b5	f453fce2-0cb7-4e97-952e-a72d4347a756
ecbdf902-a03b-41d1-a25a-a267fcfa2a68	f453fce2-0cb7-4e97-952e-a72d4347a756
f6799d62-0e60-4dcd-b3be-a8e9ecb60ea5	f453fce2-0cb7-4e97-952e-a72d4347a756
ddd9acce-0eb6-4141-bafd-6191c5fb0bc6	f453fce2-0cb7-4e97-952e-a72d4347a756
662af6fd-27e6-4fd1-b37d-5e0cd51854fd	f453fce2-0cb7-4e97-952e-a72d4347a756
2054bb43-179d-42d6-b601-31eb342745a9	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
71228913-c490-4f69-b53f-e610b64da380	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
41ed930e-fdde-455c-b75f-305ff5c59d7c	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
6f500bde-c229-48d8-9a48-6d38f2ce7191	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
c5aabd21-29cd-4d77-b7b0-f071f971ed47	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
dab55b53-7354-46fd-8914-ef48b8c695f0	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
3a5352b6-d7a0-4b51-a013-7f2b005174c3	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
a1c91aa2-a103-41bc-a545-1590f1cb0547	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
747633f6-9821-4db8-81b5-cf2374cf773e	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
4d076373-8444-4909-b28d-b7665c8b76f7	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
3769c2dd-cf78-4848-9231-e780aa4fee69	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
659b157a-8cc9-4442-ae93-3f8f635a81a6	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
0ac890a8-3e5f-4267-8261-830d39b0b62d	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
677ac23b-3140-4ef4-a71b-6821191f067b	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
0678def0-54cf-40c4-a685-b27577d0bec5	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
ae03f6d0-7cf4-48a3-996c-b2335b8bc962	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
54d7c302-4bbc-4e80-9340-d4661690a651	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
ec0fef4f-c11a-4416-8045-df7c5dc6502f	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
d8b22379-de22-4c03-9b94-f2c42a79c999	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
8c67bf32-c9ac-4242-8b63-8cd26da1cbaa	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
d2c1cd73-8d20-498e-a327-f60331d9c5f4	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
e6394c8b-d42e-4628-9136-c28800985398	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
e7a82a05-8f00-49c9-bc0d-7926e370785d	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
7bf518d9-4a38-49f7-868e-c84c3a011cf8	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
9de61a24-d464-4f89-b9a1-8014c8059c60	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
c050c6c1-1d2a-4dda-9365-dec2acfa96b0	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
4489ff9f-6ffd-4331-a70b-f70fb744d824	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
1fcf9196-0db5-4f3c-a465-563b2f2eca76	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
54413027-9466-4433-af3f-48c047f1207d	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
e536088e-f3c2-4bcb-a862-da890a7e1a39	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
b6a5161f-7a10-4a31-b06c-65803682bcfc	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
699e1215-8ec3-42aa-96fa-317b3ba0064c	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
f9401078-3c51-4a72-a43f-bd81a83bc724	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
2fb8ba8f-9b3e-401d-90e6-e5f95442f7ba	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
cc364f58-137d-4afe-b16b-edd8a8dc7b8b	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
ef13a8be-9aff-484c-881d-5dd0e8631f66	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
cec9c8ae-b54b-4698-a647-1cf2b645431a	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
98af9d29-90fb-40e6-88e9-11203916e16a	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
2b957305-0b01-4a68-90e6-a3393b771611	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
ad246772-bdd1-4423-9dd6-8435ac38b82d	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
fc05315c-0464-42a8-8ff4-5f665b8710e6	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
1ef2d03b-ccb5-41d9-ace6-da14dbe547f0	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
7801b578-b4f6-4924-9f21-594ca160c93b	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
3c834710-b415-4ab7-8d82-ae89fd74379a	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
72da734e-1b59-426f-8fca-e57d16e39b97	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
a584ebca-8068-446a-ad36-6cf0473269f8	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
1ae1cf8c-542a-41b1-870d-53837794e07a	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
9930cf42-b59c-4741-9194-f416feff668d	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
d4df167d-042a-4152-813c-f0f783195c3d	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
e028a571-97cb-4926-b7cf-0a7deb2ba5ea	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
6904940f-0e87-4aff-85d0-de3cd3d6f812	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
662af6fd-27e6-4fd1-b37d-5e0cd51854fd	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
1afc4b7d-7005-4451-b7bc-8814b46e7243	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
f0b62557-ee52-4bed-912d-8592f4020873	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
\.


--
-- Data for Name: personnage_equipes_equipe; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.personnage_equipes_equipe ("personnageId", "equipeId") FROM stdin;
c050c6c1-1d2a-4dda-9365-dec2acfa96b0	79de6a43-1c49-449e-bed9-a67965d23a37
b6bd3c06-c2cb-4778-bbfe-beaa53a0c08c	57e1080f-926b-4f05-a4fa-3d56704221c2
67ae090d-cbdf-4abe-87e9-25175d91b2ce	57e1080f-926b-4f05-a4fa-3d56704221c2
f5c97f0c-cc65-4988-93ba-3aba38d62b7d	57e1080f-926b-4f05-a4fa-3d56704221c2
e36c919a-ae19-49d1-87b3-e9e8fa7cbfe7	57e1080f-926b-4f05-a4fa-3d56704221c2
9c54352d-5f66-4807-8848-4ae47a876066	57e1080f-926b-4f05-a4fa-3d56704221c2
3ba1c774-d82c-4875-b9f0-3bbcd9a145d5	57e1080f-926b-4f05-a4fa-3d56704221c2
8cec069d-4385-4399-8949-dd221bcc2225	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
03cb1061-77a8-4795-b8c8-2f1f056253e1	57e1080f-926b-4f05-a4fa-3d56704221c2
6b5b1c34-e2cc-44c4-806d-a2927a62368b	57e1080f-926b-4f05-a4fa-3d56704221c2
de217141-cfb6-4a2a-bb74-689764d901b8	57e1080f-926b-4f05-a4fa-3d56704221c2
68419050-a862-4810-b4a4-1a35cfa72991	57e1080f-926b-4f05-a4fa-3d56704221c2
174f1e51-e6fe-4277-af06-d71e9ee4066a	57e1080f-926b-4f05-a4fa-3d56704221c2
0312c39a-a06e-4259-9d3f-7619ba5603a4	57e1080f-926b-4f05-a4fa-3d56704221c2
03f04e6f-690c-43f0-a037-0bb816a768bc	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
abc7ef7c-3342-41c8-94e8-0d1168acbbd4	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
ab24eb32-8578-461c-8e2c-5638b29a3123	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
747633f6-9821-4db8-81b5-cf2374cf773e	1065b087-500b-4129-b4aa-ff5247c15bfc
41ed930e-fdde-455c-b75f-305ff5c59d7c	1065b087-500b-4129-b4aa-ff5247c15bfc
c5aabd21-29cd-4d77-b7b0-f071f971ed47	1065b087-500b-4129-b4aa-ff5247c15bfc
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	1065b087-500b-4129-b4aa-ff5247c15bfc
d7dc7c66-c665-45e1-9352-0f246b765a37	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
80f3cc8a-5da9-47c3-94c2-6f424d395155	18189270-3ac7-4e97-a47f-178f1a0421b0
e9119b2e-1b37-493b-a4d0-7279d2e8daf1	18189270-3ac7-4e97-a47f-178f1a0421b0
fe856efa-7e36-480f-a7cf-9988b6cef346	18189270-3ac7-4e97-a47f-178f1a0421b0
a2306519-360f-4c44-a0d3-bd6633f73d8b	18189270-3ac7-4e97-a47f-178f1a0421b0
16ef9970-c3d7-4a88-b9ef-d40071a17d43	18189270-3ac7-4e97-a47f-178f1a0421b0
15190503-fc61-43ad-8a91-4e8b0009dbf8	18189270-3ac7-4e97-a47f-178f1a0421b0
ad37155a-e705-40fd-88ad-e55ffc322494	18189270-3ac7-4e97-a47f-178f1a0421b0
2f7ed9f8-e502-4cb3-b095-da1099fc6b84	18189270-3ac7-4e97-a47f-178f1a0421b0
cbad2a62-82da-4c7f-bdd1-6c3b3666aa0c	18189270-3ac7-4e97-a47f-178f1a0421b0
7cda746f-c186-4f88-bc9f-9e402a84c0e8	18189270-3ac7-4e97-a47f-178f1a0421b0
5294f95e-ca64-4d59-8130-fe405ea6e50a	18189270-3ac7-4e97-a47f-178f1a0421b0
58ef1277-fec8-4518-ab58-ab16373ec581	18189270-3ac7-4e97-a47f-178f1a0421b0
dee66d99-2fe1-4ff8-a327-cee3a0a284e9	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
6161a098-a4c3-44ab-bd85-27de181c04ab	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
2262a0fd-6a23-4b63-840d-270ba57265f1	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
d39825c3-b0fe-4a00-a481-f262a33d0843	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
15130df5-6095-4a8a-8fb6-bc4dd33dc2b5	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
32506b0a-9ce3-43af-a8ea-c45fbffec805	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
71228913-c490-4f69-b53f-e610b64da380	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
677ac23b-3140-4ef4-a71b-6821191f067b	79de6a43-1c49-449e-bed9-a67965d23a37
677ac23b-3140-4ef4-a71b-6821191f067b	1065b087-500b-4129-b4aa-ff5247c15bfc
ef13a8be-9aff-484c-881d-5dd0e8631f66	79de6a43-1c49-449e-bed9-a67965d23a37
699e1215-8ec3-42aa-96fa-317b3ba0064c	79de6a43-1c49-449e-bed9-a67965d23a37
cc364f58-137d-4afe-b16b-edd8a8dc7b8b	79de6a43-1c49-449e-bed9-a67965d23a37
2fb8ba8f-9b3e-401d-90e6-e5f95442f7ba	79de6a43-1c49-449e-bed9-a67965d23a37
f9401078-3c51-4a72-a43f-bd81a83bc724	79de6a43-1c49-449e-bed9-a67965d23a37
e536088e-f3c2-4bcb-a862-da890a7e1a39	79de6a43-1c49-449e-bed9-a67965d23a37
54413027-9466-4433-af3f-48c047f1207d	79de6a43-1c49-449e-bed9-a67965d23a37
4489ff9f-6ffd-4331-a70b-f70fb744d824	79de6a43-1c49-449e-bed9-a67965d23a37
1fcf9196-0db5-4f3c-a465-563b2f2eca76	79de6a43-1c49-449e-bed9-a67965d23a37
f2fd840a-cde9-4152-84d0-849c05ac1c62	cf9a2353-f632-428d-b12e-a81c86a023cb
31550e7f-09a0-42f6-8fb2-b53579ba3f95	cf9a2353-f632-428d-b12e-a81c86a023cb
d49dd7a8-3943-4f1a-9264-4d2760b83753	cf9a2353-f632-428d-b12e-a81c86a023cb
abf2d23a-1707-44f1-8112-84ec5a76cbdf	cf9a2353-f632-428d-b12e-a81c86a023cb
d89ca943-cde6-4aac-b755-7501f5373a23	cf9a2353-f632-428d-b12e-a81c86a023cb
953bd7d8-4f95-491c-8b57-8476d0eb3687	cf9a2353-f632-428d-b12e-a81c86a023cb
b4a5c408-a348-4cf0-852a-03c33447a3c5	cf9a2353-f632-428d-b12e-a81c86a023cb
92533be6-64c4-4f6c-9efd-aee2097b2db2	cf9a2353-f632-428d-b12e-a81c86a023cb
340ccd0c-f985-4ad7-a6ed-c61ee38774fa	cf9a2353-f632-428d-b12e-a81c86a023cb
75842ba4-b8b1-46f3-a69b-d79627616252	0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00
68649379-8432-432d-8c2a-9e9da6f85b4f	0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00
7b05699b-226e-4242-b58f-f651cfe9dce0	0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00
e5d26f46-92f6-466f-ad34-2a96c4db2feb	0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00
208caad5-f36d-4897-bc92-ea51f2c170d8	0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00
da361f3b-8118-4ca1-a85b-3a24dad64f39	0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00
e7e060a0-88ee-4fd4-8c7e-0ea64fcb49b8	0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00
c7424678-8012-408c-9619-67d859a6ec68	0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00
9531a2cd-8613-4103-948c-846a9ba434d1	0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00
874b6396-3f54-4c0d-b3c5-34603de4587a	0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00
17c637de-a2b5-430d-bb67-b36a3315039c	0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00
1b288bd9-dd9d-4c04-9871-438c5bd55011	1c35f137-9ba2-4536-ba1a-87de80e704a4
620231b8-ee3a-4fce-a3ae-619dec3fc8b9	1c35f137-9ba2-4536-ba1a-87de80e704a4
7fa3bcd9-3c9c-495a-9a83-484413865cab	1c35f137-9ba2-4536-ba1a-87de80e704a4
e30fff21-0043-4c3a-9374-1b909054355c	1c35f137-9ba2-4536-ba1a-87de80e704a4
d82544c2-17f7-4220-8eee-14a1bb9db0bf	1c35f137-9ba2-4536-ba1a-87de80e704a4
b21cb196-f946-4dff-a692-99a51cd10f60	1c35f137-9ba2-4536-ba1a-87de80e704a4
3b78b8c1-6f1a-4e7e-96f3-b78f53cc4223	1c35f137-9ba2-4536-ba1a-87de80e704a4
d5da612b-ce45-4031-a1bc-b1b69dd41402	1c35f137-9ba2-4536-ba1a-87de80e704a4
4aba2444-d816-4b4d-b1a7-8d41a39843ac	1c35f137-9ba2-4536-ba1a-87de80e704a4
5e6d1787-b640-4298-9eb6-1b0bb16cfe0e	1c35f137-9ba2-4536-ba1a-87de80e704a4
56b727e0-dd56-4dbb-a3b3-8e9bbaafdea5	1c35f137-9ba2-4536-ba1a-87de80e704a4
b7df9bbc-f07e-49ce-9656-b3a9aa28599c	1c35f137-9ba2-4536-ba1a-87de80e704a4
7f296a30-104f-4803-b711-ea7fff34de1c	1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5
caf4be28-0825-49d3-81c8-f2b88b6aeeec	1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5
06876434-2c1d-4c96-b18c-ca13f5b93f3e	1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5
b4ce3897-6134-439b-b071-2c68f4cd65e9	1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5
18ce93b1-e30d-48db-9dc9-57c555dde8a1	1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5
75401584-d7cc-4ef2-b3aa-bb293ba8ff2c	1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5
6be300b6-aff9-4c3c-91ce-ddab2217b2a3	1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5
172cb42c-94e9-4b8b-9d45-aad21d0c2552	1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5
3359d42e-77e7-4a33-b08c-abad892c829e	1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5
0c8c9915-327c-414d-80db-4e16a0e8e9dc	1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5
457cea5b-6cd2-4dc7-9e38-8d0f23f88ef8	1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5
6428bcc4-0d35-4e1a-be7b-1e71ccd5cde4	1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5
6203bb89-4dab-4f4f-a147-70f1e20f3a23	2d695421-8627-4982-a86a-6e810e07f354
007caf86-1bf9-42a9-a163-a95ed8663eb0	2d695421-8627-4982-a86a-6e810e07f354
f0435863-c6f2-471f-bb14-84623acae1af	2d695421-8627-4982-a86a-6e810e07f354
1bcbe7f3-bc0d-4f8e-a8f9-63de56b6e23e	2d695421-8627-4982-a86a-6e810e07f354
31e32402-8790-4d6d-bc25-05b327645ac2	2d695421-8627-4982-a86a-6e810e07f354
4a3b664b-bb2d-4f8a-8eed-16e67d2d533e	2d695421-8627-4982-a86a-6e810e07f354
5a5edb3c-0f9d-49e5-a05d-431224792e30	2d695421-8627-4982-a86a-6e810e07f354
3fb4a546-96fa-4bd2-a312-cd3629c3e391	2d695421-8627-4982-a86a-6e810e07f354
33fa83e0-37c4-4f3e-b3c5-ce344ca305d8	2d695421-8627-4982-a86a-6e810e07f354
94cddb77-77e6-4cd4-a3cf-1ca582d7bafa	2d695421-8627-4982-a86a-6e810e07f354
60a80520-1f58-4701-8d3c-3d82d530e956	2d695421-8627-4982-a86a-6e810e07f354
4fe3495f-7aef-428f-8563-c2c8209b2583	2d695421-8627-4982-a86a-6e810e07f354
dab55b53-7354-46fd-8914-ef48b8c695f0	1065b087-500b-4129-b4aa-ff5247c15bfc
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	1065b087-500b-4129-b4aa-ff5247c15bfc
4d076373-8444-4909-b28d-b7665c8b76f7	1065b087-500b-4129-b4aa-ff5247c15bfc
3a5352b6-d7a0-4b51-a013-7f2b005174c3	1065b087-500b-4129-b4aa-ff5247c15bfc
659b157a-8cc9-4442-ae93-3f8f635a81a6	1065b087-500b-4129-b4aa-ff5247c15bfc
0ac890a8-3e5f-4267-8261-830d39b0b62d	1065b087-500b-4129-b4aa-ff5247c15bfc
2054bb43-179d-42d6-b601-31eb342745a9	1065b087-500b-4129-b4aa-ff5247c15bfc
a1c91aa2-a103-41bc-a545-1590f1cb0547	1065b087-500b-4129-b4aa-ff5247c15bfc
59b7b9eb-da77-48ab-9bc3-340beb29fe0e	1065b087-500b-4129-b4aa-ff5247c15bfc
10389a7a-4bbd-46df-ad34-c8c2eefbcd9e	1065b087-500b-4129-b4aa-ff5247c15bfc
ebbcbbd4-854a-45bc-8e1c-663d01dfcaa9	1065b087-500b-4129-b4aa-ff5247c15bfc
3769c2dd-cf78-4848-9231-e780aa4fee69	1065b087-500b-4129-b4aa-ff5247c15bfc
6f500bde-c229-48d8-9a48-6d38f2ce7191	1065b087-500b-4129-b4aa-ff5247c15bfc
263138da-c55c-4347-925c-fb9e191d9aa8	1065b087-500b-4129-b4aa-ff5247c15bfc
b6a5161f-7a10-4a31-b06c-65803682bcfc	79de6a43-1c49-449e-bed9-a67965d23a37
1d16af31-8260-4617-a678-9b4a69af14c7	0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00
71228913-c490-4f69-b53f-e610b64da380	1065b087-500b-4129-b4aa-ff5247c15bfc
6373b006-878f-4a40-8729-349c2a27fa20	79de6a43-1c49-449e-bed9-a67965d23a37
d49e4a1c-2b6e-4161-a035-e4de5431dfcf	cf9a2353-f632-428d-b12e-a81c86a023cb
cec9c8ae-b54b-4698-a647-1cf2b645431a	5222805c-7848-4c9c-865d-0e6d6b71f885
98af9d29-90fb-40e6-88e9-11203916e16a	5222805c-7848-4c9c-865d-0e6d6b71f885
2b957305-0b01-4a68-90e6-a3393b771611	5222805c-7848-4c9c-865d-0e6d6b71f885
ad246772-bdd1-4423-9dd6-8435ac38b82d	5222805c-7848-4c9c-865d-0e6d6b71f885
06ee5357-6494-4ce5-b0ed-912d5f16b346	5222805c-7848-4c9c-865d-0e6d6b71f885
34d4b5ff-39da-4a9f-ba98-4fab806a64ec	5222805c-7848-4c9c-865d-0e6d6b71f885
9275d22c-5b74-4419-a28e-c97f8de72204	5222805c-7848-4c9c-865d-0e6d6b71f885
92e565b0-9b87-4979-99a9-1a6867af1d0b	5222805c-7848-4c9c-865d-0e6d6b71f885
0cd35f43-95e6-4cc8-a61c-24219e8c7b28	5222805c-7848-4c9c-865d-0e6d6b71f885
70d67fb6-ab9c-411b-833c-044844bd014b	5222805c-7848-4c9c-865d-0e6d6b71f885
d19e52a3-0b47-4532-aebc-230cbd2afb39	5222805c-7848-4c9c-865d-0e6d6b71f885
76660524-10cb-42bd-a244-abdbf741be47	5222805c-7848-4c9c-865d-0e6d6b71f885
0f5bd1ea-3bdd-4199-8a83-2c42e066d7ed	82290c3e-1d64-407e-becb-7fcfe8fab4b6
ffee3101-5934-40c3-bb95-87392970ab9e	82290c3e-1d64-407e-becb-7fcfe8fab4b6
dc525f85-31d6-49f9-bb41-1d7be3e5fd8a	82290c3e-1d64-407e-becb-7fcfe8fab4b6
c1626027-8553-4e4e-bb32-7a03cbfae72d	82290c3e-1d64-407e-becb-7fcfe8fab4b6
a18a2659-32f1-4ecb-a85f-69db0ba4afb0	82290c3e-1d64-407e-becb-7fcfe8fab4b6
c9bf9b95-78b0-4ac8-93ac-4624c051bed5	82290c3e-1d64-407e-becb-7fcfe8fab4b6
3dcd6e8d-549f-41a4-8d5c-ef9fd754273c	82290c3e-1d64-407e-becb-7fcfe8fab4b6
409aaf25-65be-47c6-88ac-6d483242c466	82290c3e-1d64-407e-becb-7fcfe8fab4b6
209dd52f-b881-45aa-9b3d-e7eef9a76bed	82290c3e-1d64-407e-becb-7fcfe8fab4b6
56d64848-6fe4-40b6-9d72-18a206da6562	82290c3e-1d64-407e-becb-7fcfe8fab4b6
9e83bd19-bb8b-4247-bc5f-98e5390932a6	82290c3e-1d64-407e-becb-7fcfe8fab4b6
15130df5-6095-4a8a-8fb6-bc4dd33dc2b5	82290c3e-1d64-407e-becb-7fcfe8fab4b6
0678def0-54cf-40c4-a685-b27577d0bec5	4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb
ae03f6d0-7cf4-48a3-996c-b2335b8bc962	4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb
54d7c302-4bbc-4e80-9340-d4661690a651	4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb
ec0fef4f-c11a-4416-8045-df7c5dc6502f	4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb
d8b22379-de22-4c03-9b94-f2c42a79c999	4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb
8c67bf32-c9ac-4242-8b63-8cd26da1cbaa	4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb
d2c1cd73-8d20-498e-a327-f60331d9c5f4	4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb
e6394c8b-d42e-4628-9136-c28800985398	4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb
e7a82a05-8f00-49c9-bc0d-7926e370785d	4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb
7bf518d9-4a38-49f7-868e-c84c3a011cf8	4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb
9de61a24-d464-4f89-b9a1-8014c8059c60	4031e0b6-0e78-4f29-8b53-2faaf1d5cbcb
fc05315c-0464-42a8-8ff4-5f665b8710e6	890e4960-ab2b-4186-b351-568ff9092b27
1ef2d03b-ccb5-41d9-ace6-da14dbe547f0	890e4960-ab2b-4186-b351-568ff9092b27
7801b578-b4f6-4924-9f21-594ca160c93b	890e4960-ab2b-4186-b351-568ff9092b27
3c834710-b415-4ab7-8d82-ae89fd74379a	890e4960-ab2b-4186-b351-568ff9092b27
72da734e-1b59-426f-8fca-e57d16e39b97	890e4960-ab2b-4186-b351-568ff9092b27
a584ebca-8068-446a-ad36-6cf0473269f8	890e4960-ab2b-4186-b351-568ff9092b27
1ae1cf8c-542a-41b1-870d-53837794e07a	890e4960-ab2b-4186-b351-568ff9092b27
9930cf42-b59c-4741-9194-f416feff668d	890e4960-ab2b-4186-b351-568ff9092b27
d4df167d-042a-4152-813c-f0f783195c3d	890e4960-ab2b-4186-b351-568ff9092b27
e028a571-97cb-4926-b7cf-0a7deb2ba5ea	890e4960-ab2b-4186-b351-568ff9092b27
6904940f-0e87-4aff-85d0-de3cd3d6f812	890e4960-ab2b-4186-b351-568ff9092b27
792ee26f-eed7-4e82-b10f-3c8dd10dcc5d	1065b087-500b-4129-b4aa-ff5247c15bfc
\.


--
-- Data for Name: personnage_images_image; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.personnage_images_image ("personnageId", "imageId") FROM stdin;
\.


--
-- Data for Name: personnage_supertechniques_supertechnique; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.personnage_supertechniques_supertechnique ("personnageId", "supertechniqueId") FROM stdin;
c050c6c1-1d2a-4dda-9365-dec2acfa96b0	dbcf9e99-bb6b-43d6-8bd3-5d7bf284492b
b6bd3c06-c2cb-4778-bbfe-beaa53a0c08c	16569a09-6cef-461c-869b-62533f389999
68419050-a862-4810-b4a4-1a35cfa72991	68e47d86-544b-4b58-ae47-d3c2a379ffcb
174f1e51-e6fe-4277-af06-d71e9ee4066a	68e47d86-544b-4b58-ae47-d3c2a379ffcb
03f04e6f-690c-43f0-a037-0bb816a768bc	399f5c78-382b-4795-8204-38e17a947877
03f04e6f-690c-43f0-a037-0bb816a768bc	09c253c5-5b70-4933-bba8-d9d330963b38
747633f6-9821-4db8-81b5-cf2374cf773e	47366cd9-e9cb-4dda-9e43-089dd57163fc
747633f6-9821-4db8-81b5-cf2374cf773e	ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827
747633f6-9821-4db8-81b5-cf2374cf773e	fee38ff1-00f9-40f5-a809-9556d6ff7655
747633f6-9821-4db8-81b5-cf2374cf773e	16af5557-b14c-4168-9acb-5dae4cb664fc
747633f6-9821-4db8-81b5-cf2374cf773e	ad527b4c-643e-4321-bc49-0d34e28917d8
747633f6-9821-4db8-81b5-cf2374cf773e	dbcf9e99-bb6b-43d6-8bd3-5d7bf284492b
747633f6-9821-4db8-81b5-cf2374cf773e	2362167f-7dd1-40c2-a439-1e6cc5de2359
41ed930e-fdde-455c-b75f-305ff5c59d7c	964f1077-700a-4cdb-a974-40a82ad54696
41ed930e-fdde-455c-b75f-305ff5c59d7c	1a52ebab-766e-4ea3-b243-7007d1c08929
80f3cc8a-5da9-47c3-94c2-6f424d395155	1bae1658-f971-4b0e-9acc-fc5b2999d335
e9119b2e-1b37-493b-a4d0-7279d2e8daf1	635b7ae5-e564-4ee5-8be0-11ee0be2944e
fe856efa-7e36-480f-a7cf-9988b6cef346	1bae1658-f971-4b0e-9acc-fc5b2999d335
fe856efa-7e36-480f-a7cf-9988b6cef346	a6c4ecbd-345d-4d83-a3fb-381fd155ba90
a2306519-360f-4c44-a0d3-bd6633f73d8b	1bae1658-f971-4b0e-9acc-fc5b2999d335
2f7ed9f8-e502-4cb3-b095-da1099fc6b84	1bae1658-f971-4b0e-9acc-fc5b2999d335
cbad2a62-82da-4c7f-bdd1-6c3b3666aa0c	8dbbb644-a161-4105-ad39-eca821f70f48
7cda746f-c186-4f88-bc9f-9e402a84c0e8	1bae1658-f971-4b0e-9acc-fc5b2999d335
7cda746f-c186-4f88-bc9f-9e402a84c0e8	8dbbb644-a161-4105-ad39-eca821f70f48
dee66d99-2fe1-4ff8-a327-cee3a0a284e9	978d2fc4-b8aa-4b88-8995-d3086c8a7a7b
2262a0fd-6a23-4b63-840d-270ba57265f1	7ed876fa-6b35-4435-9ac2-bc71b35a70aa
d39825c3-b0fe-4a00-a481-f262a33d0843	7ed876fa-6b35-4435-9ac2-bc71b35a70aa
d39825c3-b0fe-4a00-a481-f262a33d0843	ddd2538b-718a-4069-9994-d4c8a4ed650a
d39825c3-b0fe-4a00-a481-f262a33d0843	83d3c062-8ab6-4538-9d87-3088ab618a31
b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba	7ed876fa-6b35-4435-9ac2-bc71b35a70aa
b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba	83d3c062-8ab6-4538-9d87-3088ab618a31
b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba	6b2fe94d-a136-433d-802b-14c41078c39a
71228913-c490-4f69-b53f-e610b64da380	83d3c062-8ab6-4538-9d87-3088ab618a31
71228913-c490-4f69-b53f-e610b64da380	6b2fe94d-a136-433d-802b-14c41078c39a
71228913-c490-4f69-b53f-e610b64da380	2362167f-7dd1-40c2-a439-1e6cc5de2359
677ac23b-3140-4ef4-a71b-6821191f067b	24008724-7f61-4c38-8ee5-fbb80f110a61
677ac23b-3140-4ef4-a71b-6821191f067b	2362167f-7dd1-40c2-a439-1e6cc5de2359
cc364f58-137d-4afe-b16b-edd8a8dc7b8b	dbcf9e99-bb6b-43d6-8bd3-5d7bf284492b
1fcf9196-0db5-4f3c-a465-563b2f2eca76	4126a5c0-5a0b-4f0a-aae2-292012a64b55
75842ba4-b8b1-46f3-a69b-d79627616252	307222cc-4ea9-423a-9305-d9fbafe692ff
68649379-8432-432d-8c2a-9e9da6f85b4f	de717d77-13a0-498c-af82-ab4751bfbf6f
1b288bd9-dd9d-4c04-9871-438c5bd55011	ce7d62f3-b679-47a9-8afe-e8635d081f92
1b288bd9-dd9d-4c04-9871-438c5bd55011	8dbee186-f703-4374-ae66-6098242c5660
b7df9bbc-f07e-49ce-9656-b3a9aa28599c	ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827
b7df9bbc-f07e-49ce-9656-b3a9aa28599c	0d58e2e8-5b7d-471c-92ea-3503952361b4
7f296a30-104f-4803-b711-ea7fff34de1c	14211596-bbfb-44b1-afdc-3539e34beb60
caf4be28-0825-49d3-81c8-f2b88b6aeeec	04a67f8f-d41f-41eb-be32-c962ebfa41c3
06876434-2c1d-4c96-b18c-ca13f5b93f3e	300e7b11-4a45-4298-823b-d3cb6b096a46
b4ce3897-6134-439b-b071-2c68f4cd65e9	f1c7c566-2fdb-479f-9b3e-a1148760d21c
18ce93b1-e30d-48db-9dc9-57c555dde8a1	f1c7c566-2fdb-479f-9b3e-a1148760d21c
75401584-d7cc-4ef2-b3aa-bb293ba8ff2c	92acb0d8-19b4-4d23-87ba-8d6761d4536b
6be300b6-aff9-4c3c-91ce-ddab2217b2a3	04a67f8f-d41f-41eb-be32-c962ebfa41c3
3359d42e-77e7-4a33-b08c-abad892c829e	22d2aa53-910a-4310-8f5c-66141348e409
0c8c9915-327c-414d-80db-4e16a0e8e9dc	5dbf3891-8435-4877-8081-e45815e0865a
457cea5b-6cd2-4dc7-9e38-8d0f23f88ef8	5dbf3891-8435-4877-8081-e45815e0865a
457cea5b-6cd2-4dc7-9e38-8d0f23f88ef8	7577e5ca-a9e4-4973-80f5-0d42d596f125
6203bb89-4dab-4f4f-a147-70f1e20f3a23	150f3b7f-c5b1-4723-a101-fcdd6d93d00f
007caf86-1bf9-42a9-a163-a95ed8663eb0	cedd92ea-7710-460c-8667-76617f1005cb
007caf86-1bf9-42a9-a163-a95ed8663eb0	ed55069b-0022-4b67-be51-b5a76afd569f
f0435863-c6f2-471f-bb14-84623acae1af	ed55069b-0022-4b67-be51-b5a76afd569f
1bcbe7f3-bc0d-4f8e-a8f9-63de56b6e23e	ed55069b-0022-4b67-be51-b5a76afd569f
31e32402-8790-4d6d-bc25-05b327645ac2	1a807ccd-64dc-4902-9cb2-f79bc96ef41d
4a3b664b-bb2d-4f8a-8eed-16e67d2d533e	1a807ccd-64dc-4902-9cb2-f79bc96ef41d
5a5edb3c-0f9d-49e5-a05d-431224792e30	1a807ccd-64dc-4902-9cb2-f79bc96ef41d
3fb4a546-96fa-4bd2-a312-cd3629c3e391	f3bde92b-de79-414d-9707-93baf6e9e44d
33fa83e0-37c4-4f3e-b3c5-ce344ca305d8	7e6d27bd-cf47-49a6-9bc2-3cdaeafa78c1
dab55b53-7354-46fd-8914-ef48b8c695f0	8fc435b4-d4fc-4952-be2c-39d41119f6bd
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	648c4240-7cc3-4e39-9aa8-f038b1b3ec59
4d076373-8444-4909-b28d-b7665c8b76f7	5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7
4d076373-8444-4909-b28d-b7665c8b76f7	47366cd9-e9cb-4dda-9e43-089dd57163fc
3a5352b6-d7a0-4b51-a013-7f2b005174c3	6d283ab7-0e4e-4f3e-92de-25b5500cf018
659b157a-8cc9-4442-ae93-3f8f635a81a6	04855b47-7f52-442b-933e-75f60e576f7b
659b157a-8cc9-4442-ae93-3f8f635a81a6	dbcf9e99-bb6b-43d6-8bd3-5d7bf284492b
0ac890a8-3e5f-4267-8261-830d39b0b62d	fee38ff1-00f9-40f5-a809-9556d6ff7655
0ac890a8-3e5f-4267-8261-830d39b0b62d	16af5557-b14c-4168-9acb-5dae4cb664fc
0ac890a8-3e5f-4267-8261-830d39b0b62d	4560c1d7-23c9-4cc1-861e-17063e24e460
2054bb43-179d-42d6-b601-31eb342745a9	16af5557-b14c-4168-9acb-5dae4cb664fc
2054bb43-179d-42d6-b601-31eb342745a9	24008724-7f61-4c38-8ee5-fbb80f110a61
2054bb43-179d-42d6-b601-31eb342745a9	81541c14-f7ae-4dd4-98a3-ce92428d76e3
2054bb43-179d-42d6-b601-31eb342745a9	ad527b4c-643e-4321-bc49-0d34e28917d8
2054bb43-179d-42d6-b601-31eb342745a9	0aefa877-7d31-4721-9d5c-e27a56b20ebb
2054bb43-179d-42d6-b601-31eb342745a9	2362167f-7dd1-40c2-a439-1e6cc5de2359
a1c91aa2-a103-41bc-a545-1590f1cb0547	afa4c495-1884-4e0b-bf12-9ce6916f8ab6
1d16af31-8260-4617-a678-9b4a69af14c7	610e6efa-e893-4e3d-a78c-5bee27eeee0f
ad246772-bdd1-4423-9dd6-8435ac38b82d	1a52ebab-766e-4ea3-b243-7007d1c08929
cec9c8ae-b54b-4698-a647-1cf2b645431a	63eb99ce-fe82-460f-b879-ffd2b0854dba
cec9c8ae-b54b-4698-a647-1cf2b645431a	093bbc31-ceb1-441b-95ee-68b70bc02e96
2b957305-0b01-4a68-90e6-a3393b771611	63eb99ce-fe82-460f-b879-ffd2b0854dba
2b957305-0b01-4a68-90e6-a3393b771611	093bbc31-ceb1-441b-95ee-68b70bc02e96
98af9d29-90fb-40e6-88e9-11203916e16a	63eb99ce-fe82-460f-b879-ffd2b0854dba
98af9d29-90fb-40e6-88e9-11203916e16a	093bbc31-ceb1-441b-95ee-68b70bc02e96
2054bb43-179d-42d6-b601-31eb342745a9	ece9a390-8381-4ea9-ad78-769e1c89e2a4
2054bb43-179d-42d6-b601-31eb342745a9	52e228c2-d127-4069-a430-7024367042f3
4e288bc2-6e23-4cdf-a894-7b6379be6bd4	52e228c2-d127-4069-a430-7024367042f3
41ed930e-fdde-455c-b75f-305ff5c59d7c	52e228c2-d127-4069-a430-7024367042f3
0ac890a8-3e5f-4267-8261-830d39b0b62d	ece9a390-8381-4ea9-ad78-769e1c89e2a4
c5aabd21-29cd-4d77-b7b0-f071f971ed47	ece9a390-8381-4ea9-ad78-769e1c89e2a4
6a5193ae-b7e1-4804-98fe-7d0c6bedbf91	4126a5c0-5a0b-4f0a-aae2-292012a64b55
ad246772-bdd1-4423-9dd6-8435ac38b82d	c0298e15-3d0a-487d-9120-b9c6e2fe5cf3
34d4b5ff-39da-4a9f-ba98-4fab806a64ec	fb8cc7fa-06d4-4c58-b35f-0ab72c58cb36
0f5bd1ea-3bdd-4199-8a83-2c42e066d7ed	6fbc8ad4-b945-425b-ae70-dafe253cb7c9
9e83bd19-bb8b-4247-bc5f-98e5390932a6	30d1a342-c192-41ac-aea2-b2f234b31aae
747633f6-9821-4db8-81b5-cf2374cf773e	83d3c062-8ab6-4538-9d87-3088ab618a31
41ed930e-fdde-455c-b75f-305ff5c59d7c	83d3c062-8ab6-4538-9d87-3088ab618a31
56d64848-6fe4-40b6-9d72-18a206da6562	8d074acc-1d1e-4be7-8082-6f7a3b2a37ba
56d64848-6fe4-40b6-9d72-18a206da6562	3a041235-6c8c-45fa-9370-74de42faa31e
0f5bd1ea-3bdd-4199-8a83-2c42e066d7ed	48a5b83c-69d9-49a3-bbec-e37f91d12455
c9bf9b95-78b0-4ac8-93ac-4624c051bed5	4155f230-b355-4267-a81e-0e0b5be7df02
ffee3101-5934-40c3-bb95-87392970ab9e	af536aa1-e23f-47eb-8384-16f45cf699ab
ffee3101-5934-40c3-bb95-87392970ab9e	0da08037-311f-4c32-a63d-a683888abbc3
2054bb43-179d-42d6-b601-31eb342745a9	5e045d21-9f73-4088-abd6-4130e31d87fe
6f500bde-c229-48d8-9a48-6d38f2ce7191	c88cfb8e-f11d-4bef-abb0-8fba9ab51474
\.


--
-- Data for Name: serie; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.serie (id, nom) FROM stdin;
2451ef9f-9bd1-499b-83fc-5505be405ed5	Inazuma Eleven
\.


--
-- Data for Name: supertactique; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.supertactique (id, nom, video, "serieId") FROM stdin;
0e8f6287-4e30-422e-88a6-f0188051e561	Aile de Grue	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
b0ceb2f2-1884-49c0-aaed-b27970241987	Blocage Spectral	{https://youtu.be/fvWlfxL5WoA}	2451ef9f-9bd1-499b-83fc-5505be405ed5
08909c52-1069-4d9a-b18c-5da4dd3a8fa3	Cône de Sable	{https://youtu.be/6BuJClnq-VE}	2451ef9f-9bd1-499b-83fc-5505be405ed5
\.


--
-- Data for Name: supertactique_episodes_episode; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.supertactique_episodes_episode ("supertactiqueId", "episodeId") FROM stdin;
b0ceb2f2-1884-49c0-aaed-b27970241987	be80eb60-f867-454f-97e7-86a675c09f53
08909c52-1069-4d9a-b18c-5da4dd3a8fa3	aeb63f75-d22d-492b-bfb3-700d2343c915
0e8f6287-4e30-422e-88a6-f0188051e561	aeb63f75-d22d-492b-bfb3-700d2343c915
\.


--
-- Data for Name: supertactique_equipes_equipe; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.supertactique_equipes_equipe ("supertactiqueId", "equipeId") FROM stdin;
b0ceb2f2-1884-49c0-aaed-b27970241987	57e1080f-926b-4f05-a4fa-3d56704221c2
08909c52-1069-4d9a-b18c-5da4dd3a8fa3	1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5
0e8f6287-4e30-422e-88a6-f0188051e561	1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5
\.


--
-- Data for Name: supertactique_matchs_match; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.supertactique_matchs_match ("supertactiqueId", "matchId") FROM stdin;
b0ceb2f2-1884-49c0-aaed-b27970241987	68a00b4a-ba72-4c2a-ba08-d1c2bc44b348
08909c52-1069-4d9a-b18c-5da4dd3a8fa3	90b08eb9-3508-4129-8560-60db3686a580
0e8f6287-4e30-422e-88a6-f0188051e561	90b08eb9-3508-4129-8560-60db3686a580
\.


--
-- Data for Name: supertechnique; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.supertechnique (id, "nom_français_supertechniques", nom_original_supertechniques, type_supertechniques, notes_supertechniques, obtention_supertechniques, video, "serieId") FROM stdin;
ce7d62f3-b679-47a9-8afe-e8635d081f92	Protecto-Bulle	Shoot Pocket	Gardien	- Cette Supertechnique arrêta la Tornade de Feu, le Choc du Dragon et la Tornade du Dragon. En revanche, elle n'arrêta pas la Foudre.	\N	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
ad527b4c-643e-4321-bc49-0d34e28917d8	La Foudre	Inazuma ichigō	Tir	- C'est une Supertechnique du Onze d'Inazuma.\n- Ses évolutions sont le Super Trampoline du Tonnerre et l'Éclair Pulvérisant.\n- Le Super Trampoline du Tonnerre est la fusion entre la Foudre et le Trampoline du Tonnerre.\n- Sans cette technique, Raimon aurait fait match nul contre Cybertech.	\N	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
16569a09-6cef-461c-869b-62533f389999	Distorsion	Yugamu Kuukan	Gardien	- Il est dit qu'il ne faut jamais regarder l'utilisateur de cette Supertechnique car l'attaquant peut être hypnotisé comme Kevin lors du match amical contre Occulte.	\N	{https://www.youtube.com/watch?v=wnjt5Exr8wk}	2451ef9f-9bd1-499b-83fc-5505be405ed5
68e47d86-544b-4b58-ae47-d3c2a379ffcb	Tir Fantôme	Phantom Shot	Tir	\N	\N	{https://youtu.be/3T6ltg74D_M,https://youtu.be/n8g7dnRXcLc}	2451ef9f-9bd1-499b-83fc-5505be405ed5
978d2fc4-b8aa-4b88-8995-d3086c8a7a7b	Cyclone	\N	Défense	\N	\N	{https://youtu.be/3CAEUDBgtS8}	2451ef9f-9bd1-499b-83fc-5505be405ed5
610e6efa-e893-4e3d-a78c-5bee27eeee0f	Attaque du Condor	Condor Dive	Tir	- Cette Supertechnique ressemble un peu à l'Attaque Ressort, en termes d'utilisation.	\N	{https://youtu.be/uVfNcZIqiag}	2451ef9f-9bd1-499b-83fc-5505be405ed5
ddd2538b-718a-4069-9994-d4c8a4ed650a	Tir Rafale	Hyakuretsu Shotto	Tir	- Cette Supertechnique s'appelle "Tir Fatal" dans le Jeu, mais elle s'appelle "Tir Rafale" dans l'Anime.\n- Elle peux évoluer en Double Tir Fatal mais apparaît que dans les jeux.		{https://youtu.be/zEt0AAtPL7s}	2451ef9f-9bd1-499b-83fc-5505be405ed5
7ed876fa-6b35-4435-9ac2-bc71b35a70aa	Triangle de la Mort	Desu Zōn	Tir	- C'est la première Supertechnique que l'on voit dans l'Anime.	\N	{https://youtu.be/oQeUraBqO74}	2451ef9f-9bd1-499b-83fc-5505be405ed5
307222cc-4ea9-423a-9305-d9fbafe692ff	Saut de Tarzan	Tarzan Kick	Tir	- Dans l'Anime, le ballon devient vert quand le joueur tire	\N	{https://youtu.be/QPVceNmi6zA}	2451ef9f-9bd1-499b-83fc-5505be405ed5
de717d77-13a0-498c-af82-ab4751bfbf6f	Souffle du Serpent	Snake Shot	Tir	\N	\N	{https://youtu.be/0haH2bAbZpo}	2451ef9f-9bd1-499b-83fc-5505be405ed5
fee38ff1-00f9-40f5-a809-9556d6ff7655	Trampoline du Tonnerre	\N	Tir	- Son évolution est le Super Trampoline du Tonnerre.	\N	{https://youtu.be/AwpXmV9xDAg}	2451ef9f-9bd1-499b-83fc-5505be405ed5
81541c14-f7ae-4dd4-98a3-ce92428d76e3	Poing Ardent	Nekketsu Panchi	Gardien	- Dans l'Anime, Mark Evans est le seul à utiliser cette Supertechnique. Par contre, il ne l'apprend pas dans les jeux.\n- Il s'agit de la Supertechnique la plus faible de Mark.\n- Lors de l'épisode 4, durant le match contre l'Institut Occulte, Mark s'est trompé sur le nom de la Supertechnique. En effet, au lieu de prononcer le nom exact de la Supertechnique, il a prononcé Poing Explosif.\n- Le Poing Explosif est l'évolution du Poing Ardent.	\N	{https://youtu.be/E_III9a-uIM}	2451ef9f-9bd1-499b-83fc-5505be405ed5
648c4240-7cc3-4e39-9aa8-f038b1b3ec59	Tacle de la mort	Killer Slide	Défense	\N	\N	{https://youtu.be/EIeWaW2cz6Y}	2451ef9f-9bd1-499b-83fc-5505be405ed5
a6c4ecbd-345d-4d83-a3fb-381fd155ba90	Balle Factice	\N	Défense	- Dans l'Anime, cette Supertechnique permet aux joueur d'Otaku de tricher.	\N	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
635b7ae5-e564-4ee5-8be0-11ee0be2944e	Cible Mouvante	Goal Zurashi	Gardien	- Cette Supertechnique est considérée comme triche dans l'Anime.\n- Au début du match, les défenseurs utilisèrent la Supertechnique Confusion, pour que Raimon ne voit pas le but se décaler.	\N	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
afa4c495-1884-4e0b-bf12-9ce6916f8ab6	Tir Grenade	Grenade Shot	Tir	- Cette Supertechnique évolue en Double Grenade. C'est Kito Ryand qui l'utilise dans l'Anime.\n- Elle n'a jamais été utilisée en match.	\N	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
f1c7c566-2fdb-479f-9b3e-a1148760d21c	Sumo-Secousse		Défense	\N	\N	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
8dbee186-f703-4374-ae66-6098242c5660	Blocage Fusée	Roketto Kobushi	Gardien	- Cette Supertechnique ressemble au Poing de la Justice de Mark Evans.\n- Elle évolue en Double Fusée durant le match opposant l'équipe de Raimon à l'équipe des Empereurs Noirs.	\N	{https://youtu.be/OLJXY1lMlZY}	2451ef9f-9bd1-499b-83fc-5505be405ed5
14211596-bbfb-44b1-afdc-3539e34beb60	Tornades	Tsumuji	Gardien	- Il s'agit de l'une des seules Supertechniques qui n'est composée que d'un seul mot.\n- Quand le gardien de Shuriken utilise cette Supertechnique, il dit " Technique ninja d'Igajima, Tornades !", tout comme les joueurs de son équipe.	\N	{https://youtu.be/x8u78VqGKQQ}	2451ef9f-9bd1-499b-83fc-5505be405ed5
4126a5c0-5a0b-4f0a-aae2-292012a64b55	Shoot en Croix	Cross Drive	Tir	\N	\N	{https://youtu.be/ernERY_itnI}	2451ef9f-9bd1-499b-83fc-5505be405ed5
6b2fe94d-a136-433d-802b-14c41078c39a	Tir Puissance 2	Tsuin Būsto	Tir	\N	\N	{https://youtu.be/x7SoNTB1GkA}	2451ef9f-9bd1-499b-83fc-5505be405ed5
0aefa877-7d31-4721-9d5c-e27a56b20ebb	Poing Explosif	Bakuretsu Panchi	Gardien	- Cette Supertechnique semble être la version évoluée du Poing Ardent.	\N	{https://youtu.be/jHyvb70SXJc}	2451ef9f-9bd1-499b-83fc-5505be405ed5
04a67f8f-d41f-41eb-be32-c962ebfa41c3	Détriplement	Bunshin Feint	Attaque	- C'est la version offensive du Tacle Puissance 3, du Tir Puissance 3 et de l'Arrêt Puissance 3.	\N	{https://youtu.be/n9_hofmU1_Y}	2451ef9f-9bd1-499b-83fc-5505be405ed5
92acb0d8-19b4-4d23-87ba-8d6761d4536b	Toile d'Araignée	Kumo no Ito	Défense	\N	\N	{https://youtu.be/9LRDGQ_duZM}	2451ef9f-9bd1-499b-83fc-5505be405ed5
5dbf3891-8435-4877-8081-e45815e0865a	Holo-Dribble	Zanzō	Attaque	- Cette technique n'use pas réellement d'un hologramme mais plutôt d'une image rémanente.\n- Lorsque Hank Sullivan a utilisé cette Supertechnique, il ne l'a pas nommée.	\N	{https://youtu.be/gvUuUBlnwNE}	2451ef9f-9bd1-499b-83fc-5505be405ed5
22d2aa53-910a-4310-8f5c-66141348e409	Tir Puissance 3	Bunshin Shoot	Tir	- Dans l'Anime, Balle de Terre est plus puissante parce qu'elle a pu surpasser le Poing Ardent et la Main Céleste de Mark Evans, alors que le Tir Puissance 3, Mark l'a arrêté avec deux mains.	\N	{https://youtu.be/lqzZ03Av784}	2451ef9f-9bd1-499b-83fc-5505be405ed5
7577e5ca-a9e4-4973-80f5-0d42d596f125	Balle de Terre	Tsuchidaruma	Tir	- Quand le joueur de Shuriken utilise cette Supertechnique, il dit " Technique ninja d'Igajima, Balle de Terre !", tout comme les joueurs de son équipe.\n- Cette Supertechnique a une ressemblance avec la Frappe de Gaïa.	\N	{https://youtu.be/TBKpyyyu7Mg}	2451ef9f-9bd1-499b-83fc-5505be405ed5
8dbbb644-a161-4105-ad39-eca821f70f48	Batte Toute-Puissante	Dokonjō Batto	Tir	- Elle ressemble à Club Tout-Puissant. Dans cette version, l'utilisateur frappe le ballon avec une direction inférieure, en utilisant son partenaire comme un putter au golf.	\N	{https://youtu.be/sb_GK90_v9I}	2451ef9f-9bd1-499b-83fc-5505be405ed5
1bae1658-f971-4b0e-9acc-fc5b2999d335	Confusion	\N	Défense	- Dans l'Anime, cette technique permet aux Otaku de tricher.	\N	{https://youtu.be/7hol4wuPYp4}	2451ef9f-9bd1-499b-83fc-5505be405ed5
399f5c78-382b-4795-8204-38e17a947877	Bouclier d'Energie	Pawāshīrudo	Gardien	- Elle est transpercée par la Tornade du Dragon, utilisée de près.\n- Cette Supertechnique peut arrêter tous les tirs de loin, mais pas de près. Cette Supertechnique crée une onde de choc. Pour la briser, il faut tirer à bout portant. Lors du match de finale des qualifications du district de Kantō du tournoi Football Frontier, Axel Blaze est parvenu à trouver son point faible.		{https://youtu.be/2-e0OMtc5ZI}	2451ef9f-9bd1-499b-83fc-5505be405ed5
83d3c062-8ab6-4538-9d87-3088ab618a31	Manchot Empereur Numéro 2	Kōtei Penguin Nigō	Tir	- Ce fut la première Supertechnique à passer la Main Céleste, elle fut d'ailleurs créée spécifiquement pour pouvoir briser cette dernière.\n- Contrairement au Manchot Empereur N°1, cette Supertechnique n'est pas interdite car sa puissance a été affaiblie par rapport à la première version, ne causant ainsi pas de dommage physique à l'utilisateur.\n- Lors du dernier épisode de la série Inazuma Eleven GO, le Manchot Empereur N°2 apparait dans les souvenirs de Mark Evans.	\N	{https://youtu.be/lDMlKgyrY7k}	2451ef9f-9bd1-499b-83fc-5505be405ed5
09c253c5-5b70-4933-bba8-d9d330963b38	Bouclier d'Energie Totale	Full Power Shield	Gardien	- C'est une évolution du Bouclier d'Énergie.\n- Elle fut passée par le Super Trampoline du Tonnerre.\n- Contrairement au Bouclier d'Énergie, cette technique utilise la force des mains, c'est pour ça qu'elle fut passé de loin par le Super Trampoline du Tonnerre.		{https://youtu.be/TdRKb0i5r08}	2451ef9f-9bd1-499b-83fc-5505be405ed5
0d58e2e8-5b7d-471c-92ea-3503952361b4	Tir de Barrage	Patriot Shoot	Tir	- Cette technique semble rapide mais pas très puissante car Mark l'arrêta d'un simple coup de poing.\nEn revanche, dans Inazuma Eleven Arès, la technique semble être plus puissante, car il a fallu que Sandra Fischer l'arrête grâce à la Trombe d'Arrêt.	\N	{https://youtu.be/M-N_Jm2TEaQ}	2451ef9f-9bd1-499b-83fc-5505be405ed5
04855b47-7f52-442b-933e-75f60e576f7b	Dribble Rafale	Shippuu Dash	Attaque	- C'est la première des Supertechniques que Nathan Swift a apprise et créée.\n- Dans l'Anime Inazuma Eleven Arès, la Supertechnique ressemble fortement à la Percée d'Éole.	\N	{https://youtu.be/U0BotUSbW7Q}	2451ef9f-9bd1-499b-83fc-5505be405ed5
6d283ab7-0e4e-4f3e-92de-25b5500cf018	Tourbillon	Tatsumaki Senpuu	Attaque	\N	\N	{https://youtu.be/q5_STBfF1C0}	2451ef9f-9bd1-499b-83fc-5505be405ed5
8fc435b4-d4fc-4952-be2c-39d41119f6bd	Frappe Rotative	Rolling Kick	Tir	- Elle n'a jamais été utilisée en match.	\N	{https://youtu.be/FbHCGNLJE4w}	2451ef9f-9bd1-499b-83fc-5505be405ed5
16af5557-b14c-4168-9acb-5dae4cb664fc	Super Trampoline du Tonnerre	Inazuma 1gou Otoshi	Tir	- Cette Supertechnique n'apparaît qu'une seule fois, lors du Match contre la Royal Academy en finale du District pour la qualification au FF.\n- C'est l'évolution du Trampoline du Tonnerre, fusionnée avec la Foudre.	\N	{https://youtu.be/TdRKb0i5r08}	2451ef9f-9bd1-499b-83fc-5505be405ed5
4560c1d7-23c9-4cc1-861e-17063e24e460	Le Mur	Za Uōru	Défense	- Dans la saison 2, cette technique est souvent combinée avec La Tour.		\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
ed55069b-0022-4b67-be51-b5a76afd569f	Muraille Infinie	Infinite Wall	Gardien	- La seule Supertechnique qui ait réussi à la passer est l'Eclair Pulvérisant. Pareil pour le match contre Neo Japon.\n- Cette Supertechnique a une faiblesse : elle doit être réalisée avec le gardien, mais aussi avec deux défenseurs. Si un des deux défenseurs s'éloigne trop, la Supertechnique ne peut pas être réalisée.	\N	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
1a807ccd-64dc-4902-9cb2-f79bc96ef41d	Danse des Bambous	Kagome Kagome	Défense	\N	\N	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
300e7b11-4a45-4298-823b-d3cb6b096a46	Ombre Furtive	Kagenui	Défense	- Quand le joueur de Shuriken utilise cette Supertechnique dans l'Anime, il dit "Technique ninja d'Igajima, Ombre Furtive !" tout comme les joueurs de son équipe.	\N	{https://youtu.be/rxkqQrZVU00}	2451ef9f-9bd1-499b-83fc-5505be405ed5
dbcf9e99-bb6b-43d6-8bd3-5d7bf284492b	Oiseau de Feu	Honoo no Kazamidori	Tir	- C'est l'une des rares Supertechniques dans laquelle Axel Blaze tire du pied droit.\n- Dans l'Anime, cette Supertechnique a été réalisable grâce à Jim Wraith.\n- Cette Supertechnique a été créée par des joueurs du 11 d'Inazuma.\n- La seule fois où Axel a raté cette Supertechnique, c'est lors du 2nd match contre la Tempête des Gémeaux, durant l'Episode 030.	\N	{https://youtu.be/trrUYrvIHnI}	2451ef9f-9bd1-499b-83fc-5505be405ed5
3b7fe383-5d9d-43fd-8081-4985fb59f1a1	Tête Kung-Fu	Kung Fu Head	Tir	- Cette technique n'apparaît qu'une seule fois dans l'animée.	\N	{https://youtu.be/Qx7j8zpucgQ}	2451ef9f-9bd1-499b-83fc-5505be405ed5
cedd92ea-7710-460c-8667-76617f1005cb	Hache du Bûcheron	\N	Gardien	\N	\N	{https://youtu.be/h9pGbfKhTNA}	2451ef9f-9bd1-499b-83fc-5505be405ed5
7e6d27bd-cf47-49a6-9bc2-3cdaeafa78c1	Tir Aveuglant	Shine Drive	Tir	- Cette Supertechnique est inarrêtable dans l'Anime car quand l'utilisateur tire le gardien est obligé de fermer ses yeux, aveuglé par la lumière.	\N	{https://youtu.be/vlVErLBo6AY}	2451ef9f-9bd1-499b-83fc-5505be405ed5
150f3b7f-c5b1-4723-a101-fcdd6d93d00f	Feinte de la Taupe	Mogura Feint	Attaque	- La Taupe Factice est la fusion de la Feinte de la Taupe et de la Balle Factice.	\N	{https://youtu.be/72Mu6zNDzHo}	2451ef9f-9bd1-499b-83fc-5505be405ed5
f3bde92b-de79-414d-9707-93baf6e9e44d	Super Rotation	Run Ball Run	Tir	- On peut dire que dans l'Anime Super Rotation est une Supertechnique de Dribble parce que l'utilisateur a réussit à passer ses adversaires.	\N	{https://youtu.be/IFHCcmVlQf4}	2451ef9f-9bd1-499b-83fc-5505be405ed5
964f1077-700a-4cdb-a974-40a82ad54696	Tir Hélicoptère	Spinning Shot	Tir	- Cette Supertechnique ressemble beaucoup au Tourbillon Vivant.\n- Dans l'épisode 19 de l'Anime, Erik Eagle dit "Toupie Hurlante" et pas "Tir Hélicoptère" en utilisant cette Supertechnique.	\N	{https://youtu.be/uUDS6Xpfg2A}	2451ef9f-9bd1-499b-83fc-5505be405ed5
1a52ebab-766e-4ea3-b243-7007d1c08929	Tri-Pégase	Tri-Pegasus	Tir	- Cette Supertechnique est similaire au Phénix.\n- Cette Supertechnique est la base de l'évolution pour le Tir Pégase.\n- La Supertechnique capable de bloquer Tri-Pégase est Scie Circulaire, une Supertechnique de Malcolm Night, un des inventeurs du Tri-Pégase.\n- C'est Bobby Shearer, Malcolm Night et Erik Eagle qui ont inventé cette Supertechnique quand ils étaient aux Etats-Unis. Erik et Bobby l'ont réutilisée avec Mark Evans dès l'arrive de Erik à Raimon.		{https://youtu.be/5BnAoQjVGLw}	2451ef9f-9bd1-499b-83fc-5505be405ed5
47366cd9-e9cb-4dda-9e43-089dd57163fc	Tornade du Dragon	\N	Tir	- Elle a été la première Supertechnique combinée de l'équipe Raimon dans l'Anime.	- La Supertechnique Tornade du Dragon est une combinaison entre la Tornade de Feu d'Axel Blaze et le Choc du Dragon de Kevin Dragonfly. Elle sera utilisée pour la première fois contre l'Institut Occulte dans l'Episode 004. En effet, Kevin décide de faire une passe à Axel avec son Choc du Dragon. Axel enchaîne ensuite avec sa Tornade de Feu.	{https://youtu.be/562va37ta1w}	2451ef9f-9bd1-499b-83fc-5505be405ed5
2362167f-7dd1-40c2-a439-1e6cc5de2359	Eclair Pulvérisant	Inazuma Bureiku	Tir	- Cette Supertechnique a pulvérisée la même Supertechnique à deux reprises : la Muraille Infinie de Terria et la Nouvelle Muraille Infinie de Neo Japon.\n- Il s'agit de l'évolution de la Foudre.	\N	{https://youtu.be/_yH7Tl-2CUk}	2451ef9f-9bd1-499b-83fc-5505be405ed5
5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7	Choc du Dragon	Dragon Crash	Tir	- C'est la première Supertechnique de Kevin Dragonfly.	- Cette Supertechnique a été utilisée pour la première fois par Kevin Dragonfly lors de l'épisode 3, durant l'entrainement de Raimon sur le terrain de la rivière. Lors de l'épisode 4, elle a été nommée "Choc du Dragon" par William Glass,. Elle fut combinée avec la Tornade de Feu d'Axel, ce qui a créé la Tornade du Dragon. Kevin a voulu créer cette Supertechnique car il voulait être aussi bon qu'Axel.	{https://youtu.be/MsYQZ2sZCeU}	2451ef9f-9bd1-499b-83fc-5505be405ed5
63eb99ce-fe82-460f-b879-ffd2b0854dba	Tornade Inversée	Back Tornado	Tir	- Dans l'Anime, il est dit que cette Supertechnique est plus puissante que la Tornade de Feu. 	\N	{https://youtu.be/JUcAQyVU8DY}	2451ef9f-9bd1-499b-83fc-5505be405ed5
093bbc31-ceb1-441b-95ee-68b70bc02e96	Triangle Z	Triangle Z	Tir	\N	\N	{https://youtu.be/etAmXzJF75k}	2451ef9f-9bd1-499b-83fc-5505be405ed5
52e228c2-d127-4069-a430-7024367042f3	Phénix	The Phoenix	Tir	- Cette Supertechnique fut appelée ainsi par Malcolm Night car ce nom représente parfaitement Erik Eagle, qui fit semblant d'être mort. Ensuite, tel un phénix, il renait de ses cendres. \n- Lors l'épisode 26, une version plus puissante du Phénix apparait. Axel Blaze utilisa la Tornade de Feu pour accroitre la puissance du tir. Cet enchainement fut baptisé "Tornade Finale" par les fans puisqu'elle fut utilisée lors du dernier épisode de la saison 1. Cette [Supertechnique se nomme véritablement "Tornade du Phénix" d'après la version espagnole de la série. \n- Il existe une version plus "sombre" et plus puissante de cette Supertechnique, appelée le "Phénix Noir".	\N	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
c0298e15-3d0a-487d-9120-b9c6e2fe5cf3	Scie Circulaire	Spinning Cut	Défense	- Lors de l'épisode 127, Tod Ironside l'a appelée "Barrière Circulaire" et non "Scie Circulaire".\n- Jude l'utilisa deux fois dans le Manga, mais jamais en plein match. Il l'utilisa la première fois pour écarter Mark de Ray Dark, tandis que la deuxième fois, Jude l'utilisa pour protéger Mark des poutres métalliques qui allaient lui tomber dessus. 	\N	{https://youtu.be/-jr6aSIghU8}	2451ef9f-9bd1-499b-83fc-5505be405ed5
fb8cc7fa-06d4-4c58-b35f-0ab72c58cb36	Blocage de Force	Tafunesu Burokku	Gardien	\N	\N	{https://youtu.be/1RjH93gNYng}	2451ef9f-9bd1-499b-83fc-5505be405ed5
bcb6866c-069c-4d35-b0dd-256756dfc5ed	Flèche Ouragan	Hurricane Arrows	Défense	- On ne sait pas qui utilise cette supertechnique dans l'anime	\N	{https://youtu.be/xHrD2lcutj0}	2451ef9f-9bd1-499b-83fc-5505be405ed5
ece9a390-8381-4ea9-ad78-769e1c89e2a4	Triple Défense	Triple Defense	Gardien	- Dans l'Anime, il s'agit simplement de la Main Céleste combinée aux poussées de Tod et de Jack, ils n'appellent pas ça Triple Défense.	\N	{https://youtu.be/QeqlyzVqlIY}	2451ef9f-9bd1-499b-83fc-5505be405ed5
6fbc8ad4-b945-425b-ae70-dafe253cb7c9	Savoir Suprême	Goddo Nouzu	Tir	- Lorsque Byron rejoint Raimon pour affronter Diamond Dust, Savoir Suprême est beaucoup plus puissant et ce sans l'utilisation du Nectar des Dieux. \n- Byron Love utilise aussi Savoir Suprême 2 lors du match Inazuma Japon contre Dragons de Feu. C'est aussi le cas de Dave Quagmire en tant que joueur de Néo Japon. \n- Cette technique évolue en Tir Solaire lors du match de sélection contre Inazuma Japon lorsque Byron était dans la sélection coréenne des Dragons de Feu qui évoluera lui même en Tir Chaotique lors du même match avec Claude Beacons (Torch) et Bryce Whitingale (Gazelle/Fox). Il existe également la version XXL du Savoir suprême, le Savoir Ultime qui est aussi tiré par Byron dans la série Arès..	\N	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
4155f230-b355-4267-a81e-0e0b5be7df02	Méga Séisme	Mega Quake	Défense	\N	\N	{https://youtu.be/EY63B_7_UCM}	2451ef9f-9bd1-499b-83fc-5505be405ed5
48a5b83c-69d9-49a3-bbec-e37f91d12455	Instant Céleste	Heaven's Time	Attaque	\N	\N	\N	2451ef9f-9bd1-499b-83fc-5505be405ed5
8d074acc-1d1e-4be7-8082-6f7a3b2a37ba	Attaque Tempête	Dash Storm	Attaque	\N	\N	{https://youtu.be/Q9gG30RaL_s}	2451ef9f-9bd1-499b-83fc-5505be405ed5
30d1a342-c192-41ac-aea2-b2f234b31aae	Flèche Céleste	Divine Arrow	Tir	\N	\N	{https://youtu.be/awoRUG6gWxw}	2451ef9f-9bd1-499b-83fc-5505be405ed5
af536aa1-e23f-47eb-8384-16f45cf699ab	Muraille Tsunami	Tsunami Wall	Gardien	\N	\N	{https://youtu.be/JS3jCo5Loig}	2451ef9f-9bd1-499b-83fc-5505be405ed5
0da08037-311f-4c32-a63d-a683888abbc3	Muraille Géante	Gigant Wall	Gardien	\N	\N	{https://youtu.be/QKHV4VsS8do}	2451ef9f-9bd1-499b-83fc-5505be405ed5
3a041235-6c8c-45fa-9370-74de42faa31e	Tir Ricochets	Rifurekuto Basutā	Tir	\N	\N	{https://youtu.be/1jOfrbIzPI4}	2451ef9f-9bd1-499b-83fc-5505be405ed5
c88cfb8e-f11d-4bef-abb0-8fba9ab51474	Spirale de Défense	Koiru Tãn	Défense	\N	\N	{https://youtu.be/O7axun1FMzI}	2451ef9f-9bd1-499b-83fc-5505be405ed5
5e045d21-9f73-4088-abd6-4130e31d87fe	Main Magique	Majin Za Hando	Gardien	- Elle a été inventée par David Evans, le grand-père de Mark Evans. D'après le second cahier secret de David Evans, il s'agit de la plus puissante Supertechnique qu'un gardien puisse réaliser.\n- Celle de Mark est jaune et celle de Darren est bleue.	\N	{https://youtu.be/F7DuJ46Dtuk}	2451ef9f-9bd1-499b-83fc-5505be405ed5
ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827	Tornade de Feu	Faia Torunēdo	Tir	- Il s'agit de la cinquième Supertechnique utilisée dans la série Inazuma Eleven, après le Triangle de la Mort, Cyclone, le Tir Rafale et la Main Céleste.\n- Dans le Manga, quand il fait face à Jude Sharp dans un duel et quand Jude est sur le point de tirer avec sa Tornade Noire, Axel utilisa alors sa Tornade de Feu pour bloquer le tir. Cependant, il tira en utilisant son pied droit, à la place de son pied gauche normalement.\n- Il s'agit de la première Supertechnique qui a évolué dans l'Anime, à l'instar du Poing de la Justice et des Mains de l'Infini.\n- Lors du match qui décida des joueurs qui intègreront la sélection nationale Inazuma Japon, la Tornade de Feu évolua en Tornade de Feu 2.\n- Quand la Tornade de Feu évolue en Tornade de Feu 2 dans l'Anime, il y a davantage de feu qui apparait sur le ballon.\n- Cette Supertechnique est semblable à la Tornade Noire et à la Tornade Inversée.\n- Cette Supertechnique est nécessaire pour utiliser les Tornade Double, Tornade Puissance 2 et Tornade du Dragon.\n- Elle est la première Supertechnique de Tir de Raimon.\n- Dans l'Anime, Neil Turner a copié la Supertechnique à Axel Blaze.\n- Il s'agit de la Supertechnique emblématique d'Axel Blaze.\n- Axel utilise cette Supertechnique sur certains joueurs de Raimon, afin de leur faire comprendre que renoncer n'est pas la solution.	\N	{https://youtu.be/-UySNQa3uKM}	2451ef9f-9bd1-499b-83fc-5505be405ed5
24008724-7f61-4c38-8ee5-fbb80f110a61	Main Céleste	Goddo Hando	Gardien	- Lors de l'épisode 65, on voit deux versions plus opaques de la Main Céleste, la deuxième pouvant être la Nouvelle Main Céleste. Officiellement, la Nouvelle Main Céleste apparait lors de l'épisode 69, durant le match de sélection pour l'intégration dans l'équipe d'Inazuma Japon opposant l'équipe de Mark Evans à celle de Jude Sharp.\n- Dans la version française de l'épisode 98, durant une analepse, Mark dit "Mains de l'Infini", une autre Supertechnique de Gardien, au lieu de "Main Céleste". De ce fait, il s'agit d'une erreur.\n- Hector Hélio connait lui aussi la Main Céleste dans l'Anime. Mais, cette dernière est de couleur rouge. Ce mouvement n'est vu qu'une fois. Sa Main Céleste est sortie plus rapidement que celle de Mark et de Darren.\n- Dans le manga, la Main Céleste ressemble beaucoup à la Main Magique, avec le démon derrière lui. À partir du tome 6, au début du tournoi Football Frontier International, la Main Céleste ressemble plus à celle de l'Anime et des jeux. Malgré cela, la Main Magique n'apparait que dans le manga GO en tant que Supertechnique d'Esprit Guerrier.\n- C'est la première Supertechnique que Mark réalise lors de l'épisode 2 et la dernière qu'il réalise dans la série originale Inazuma Eleven lors de l'épisode 127.\n- La Main Oméga est une surévolution de cette Supertechnique.\n- Hector Hélio et Keenan DiFortune sont les deux seuls à faire une évolution de la Main Céleste : la Main Céleste X.\n- Durant le match de la Remise des Diplômes, Mark utilise sa Main Céleste, mais prononce le nom de la Supertechnique sans mentionner le degré d'évolution.\n- Dans l'Anime, à travers le titre de l'épisode 65, elle est appelée la Supertechnique de l'amitié.\n- Dans le Manga, cette Supertechnique a permis d'arrêter le Rayon X V3.	- Mark Evans l'apprend lors du premier match contre la Royal Academy.	{https://youtu.be/YVblbjbCsgM}	2451ef9f-9bd1-499b-83fc-5505be405ed5
\.


--
-- Data for Name: supertechnique_episodes_episode; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.supertechnique_episodes_episode ("supertechniqueId", "episodeId") FROM stdin;
47366cd9-e9cb-4dda-9e43-089dd57163fc	be80eb60-f867-454f-97e7-86a675c09f53
47366cd9-e9cb-4dda-9e43-089dd57163fc	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
47366cd9-e9cb-4dda-9e43-089dd57163fc	99519aee-5871-4ab9-a5b5-2309e4e11117
47366cd9-e9cb-4dda-9e43-089dd57163fc	aeb63f75-d22d-492b-bfb3-700d2343c915
47366cd9-e9cb-4dda-9e43-089dd57163fc	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
47366cd9-e9cb-4dda-9e43-089dd57163fc	4016b5fa-c380-496f-a3a5-251e48a9db66
300e7b11-4a45-4298-823b-d3cb6b096a46	aeb63f75-d22d-492b-bfb3-700d2343c915
648c4240-7cc3-4e39-9aa8-f038b1b3ec59	4016b5fa-c380-496f-a3a5-251e48a9db66
648c4240-7cc3-4e39-9aa8-f038b1b3ec59	66abafd9-5110-4c47-a81c-9a2a4f74cb08
16569a09-6cef-461c-869b-62533f389999	be80eb60-f867-454f-97e7-86a675c09f53
8dbee186-f703-4374-ae66-6098242c5660	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
a6c4ecbd-345d-4d83-a3fb-381fd155ba90	22a06b40-2b8c-46a1-bc90-df535a96e07e
2362167f-7dd1-40c2-a439-1e6cc5de2359	4016b5fa-c380-496f-a3a5-251e48a9db66
dbcf9e99-bb6b-43d6-8bd3-5d7bf284492b	4016b5fa-c380-496f-a3a5-251e48a9db66
dbcf9e99-bb6b-43d6-8bd3-5d7bf284492b	aeb63f75-d22d-492b-bfb3-700d2343c915
dbcf9e99-bb6b-43d6-8bd3-5d7bf284492b	2228af33-de0e-4227-916f-e958fea744cf
afa4c495-1884-4e0b-bf12-9ce6916f8ab6	e3d98622-d761-402e-a105-cff6c35f7a58
68e47d86-544b-4b58-ae47-d3c2a379ffcb	be80eb60-f867-454f-97e7-86a675c09f53
5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7	2228af33-de0e-4227-916f-e958fea744cf
5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7	22a06b40-2b8c-46a1-bc90-df535a96e07e
5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7	4016b5fa-c380-496f-a3a5-251e48a9db66
5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7	66abafd9-5110-4c47-a81c-9a2a4f74cb08
5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7	99519aee-5871-4ab9-a5b5-2309e4e11117
5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7	ff30ed09-db6a-4b2b-8c21-e74a54f61e25
14211596-bbfb-44b1-afdc-3539e34beb60	aeb63f75-d22d-492b-bfb3-700d2343c915
04855b47-7f52-442b-933e-75f60e576f7b	99519aee-5871-4ab9-a5b5-2309e4e11117
978d2fc4-b8aa-4b88-8995-d3086c8a7a7b	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
635b7ae5-e564-4ee5-8be0-11ee0be2944e	22a06b40-2b8c-46a1-bc90-df535a96e07e
0aefa877-7d31-4721-9d5c-e27a56b20ebb	99519aee-5871-4ab9-a5b5-2309e4e11117
3b7fe383-5d9d-43fd-8081-4985fb59f1a1	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
4126a5c0-5a0b-4f0a-aae2-292012a64b55	2228af33-de0e-4227-916f-e958fea744cf
610e6efa-e893-4e3d-a78c-5bee27eeee0f	66abafd9-5110-4c47-a81c-9a2a4f74cb08
6b2fe94d-a136-433d-802b-14c41078c39a	99519aee-5871-4ab9-a5b5-2309e4e11117
1a807ccd-64dc-4902-9cb2-f79bc96ef41d	4016b5fa-c380-496f-a3a5-251e48a9db66
ed55069b-0022-4b67-be51-b5a76afd569f	4016b5fa-c380-496f-a3a5-251e48a9db66
cedd92ea-7710-460c-8667-76617f1005cb	4016b5fa-c380-496f-a3a5-251e48a9db66
7e6d27bd-cf47-49a6-9bc2-3cdaeafa78c1	4016b5fa-c380-496f-a3a5-251e48a9db66
150f3b7f-c5b1-4723-a101-fcdd6d93d00f	4016b5fa-c380-496f-a3a5-251e48a9db66
f3bde92b-de79-414d-9707-93baf6e9e44d	4016b5fa-c380-496f-a3a5-251e48a9db66
04a67f8f-d41f-41eb-be32-c962ebfa41c3	aeb63f75-d22d-492b-bfb3-700d2343c915
92acb0d8-19b4-4d23-87ba-8d6761d4536b	aeb63f75-d22d-492b-bfb3-700d2343c915
5dbf3891-8435-4877-8081-e45815e0865a	aeb63f75-d22d-492b-bfb3-700d2343c915
22d2aa53-910a-4310-8f5c-66141348e409	aeb63f75-d22d-492b-bfb3-700d2343c915
7577e5ca-a9e4-4973-80f5-0d42d596f125	aeb63f75-d22d-492b-bfb3-700d2343c915
f1c7c566-2fdb-479f-9b3e-a1148760d21c	aeb63f75-d22d-492b-bfb3-700d2343c915
8dbbb644-a161-4105-ad39-eca821f70f48	22a06b40-2b8c-46a1-bc90-df535a96e07e
1bae1658-f971-4b0e-9acc-fc5b2999d335	22a06b40-2b8c-46a1-bc90-df535a96e07e
ddd2538b-718a-4069-9994-d4c8a4ed650a	99519aee-5871-4ab9-a5b5-2309e4e11117
ddd2538b-718a-4069-9994-d4c8a4ed650a	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
399f5c78-382b-4795-8204-38e17a947877	99519aee-5871-4ab9-a5b5-2309e4e11117
83d3c062-8ab6-4538-9d87-3088ab618a31	99519aee-5871-4ab9-a5b5-2309e4e11117
7ed876fa-6b35-4435-9ac2-bc71b35a70aa	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
7ed876fa-6b35-4435-9ac2-bc71b35a70aa	d102057f-4e62-4e78-b37d-a764e8256a1b
09c253c5-5b70-4933-bba8-d9d330963b38	99519aee-5871-4ab9-a5b5-2309e4e11117
ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827	2228af33-de0e-4227-916f-e958fea744cf
ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827	99519aee-5871-4ab9-a5b5-2309e4e11117
ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827	9e680f6b-a12f-4fb1-9dcd-b27ff3970af9
ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827	aeb63f75-d22d-492b-bfb3-700d2343c915
ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827	b1806a16-509d-49e5-a2e2-3a484cd16455
ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
ce7d62f3-b679-47a9-8afe-e8635d081f92	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
ce7d62f3-b679-47a9-8afe-e8635d081f92	b1806a16-509d-49e5-a2e2-3a484cd16455
0d58e2e8-5b7d-471c-92ea-3503952361b4	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
307222cc-4ea9-423a-9305-d9fbafe692ff	66abafd9-5110-4c47-a81c-9a2a4f74cb08
de717d77-13a0-498c-af82-ab4751bfbf6f	66abafd9-5110-4c47-a81c-9a2a4f74cb08
fee38ff1-00f9-40f5-a809-9556d6ff7655	66abafd9-5110-4c47-a81c-9a2a4f74cb08
fee38ff1-00f9-40f5-a809-9556d6ff7655	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
fee38ff1-00f9-40f5-a809-9556d6ff7655	4016b5fa-c380-496f-a3a5-251e48a9db66
4560c1d7-23c9-4cc1-861e-17063e24e460	aeb63f75-d22d-492b-bfb3-700d2343c915
4560c1d7-23c9-4cc1-861e-17063e24e460	4016b5fa-c380-496f-a3a5-251e48a9db66
16af5557-b14c-4168-9acb-5dae4cb664fc	99519aee-5871-4ab9-a5b5-2309e4e11117
ad527b4c-643e-4321-bc49-0d34e28917d8	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
ad527b4c-643e-4321-bc49-0d34e28917d8	4016b5fa-c380-496f-a3a5-251e48a9db66
81541c14-f7ae-4dd4-98a3-ce92428d76e3	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
81541c14-f7ae-4dd4-98a3-ce92428d76e3	2228af33-de0e-4227-916f-e958fea744cf
81541c14-f7ae-4dd4-98a3-ce92428d76e3	66abafd9-5110-4c47-a81c-9a2a4f74cb08
81541c14-f7ae-4dd4-98a3-ce92428d76e3	99519aee-5871-4ab9-a5b5-2309e4e11117
81541c14-f7ae-4dd4-98a3-ce92428d76e3	aeb63f75-d22d-492b-bfb3-700d2343c915
81541c14-f7ae-4dd4-98a3-ce92428d76e3	b1806a16-509d-49e5-a2e2-3a484cd16455
81541c14-f7ae-4dd4-98a3-ce92428d76e3	be80eb60-f867-454f-97e7-86a675c09f53
81541c14-f7ae-4dd4-98a3-ce92428d76e3	d102057f-4e62-4e78-b37d-a764e8256a1b
6d283ab7-0e4e-4f3e-92de-25b5500cf018	99519aee-5871-4ab9-a5b5-2309e4e11117
24008724-7f61-4c38-8ee5-fbb80f110a61	2228af33-de0e-4227-916f-e958fea744cf
24008724-7f61-4c38-8ee5-fbb80f110a61	3ac8a7cb-c773-45d7-a114-d9654d4d68c4
24008724-7f61-4c38-8ee5-fbb80f110a61	66abafd9-5110-4c47-a81c-9a2a4f74cb08
24008724-7f61-4c38-8ee5-fbb80f110a61	aeb63f75-d22d-492b-bfb3-700d2343c915
24008724-7f61-4c38-8ee5-fbb80f110a61	b2dd9288-e9c2-4906-baec-3379aa3c3a9b
24008724-7f61-4c38-8ee5-fbb80f110a61	d102057f-4e62-4e78-b37d-a764e8256a1b
8fc435b4-d4fc-4952-be2c-39d41119f6bd	e3d98622-d761-402e-a105-cff6c35f7a58
5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7	926f5ca0-3486-4b57-97db-5d0e8f417d43
81541c14-f7ae-4dd4-98a3-ce92428d76e3	926f5ca0-3486-4b57-97db-5d0e8f417d43
24008724-7f61-4c38-8ee5-fbb80f110a61	926f5ca0-3486-4b57-97db-5d0e8f417d43
964f1077-700a-4cdb-a974-40a82ad54696	926f5ca0-3486-4b57-97db-5d0e8f417d43
1a52ebab-766e-4ea3-b243-7007d1c08929	926f5ca0-3486-4b57-97db-5d0e8f417d43
24008724-7f61-4c38-8ee5-fbb80f110a61	be80eb60-f867-454f-97e7-86a675c09f53
0aefa877-7d31-4721-9d5c-e27a56b20ebb	69125a81-1480-486f-a2f1-2a6c6624187e
63eb99ce-fe82-460f-b879-ffd2b0854dba	69125a81-1480-486f-a2f1-2a6c6624187e
093bbc31-ceb1-441b-95ee-68b70bc02e96	69125a81-1480-486f-a2f1-2a6c6624187e
63eb99ce-fe82-460f-b879-ffd2b0854dba	1ea85325-d23b-4700-8a5b-40884b779c52
093bbc31-ceb1-441b-95ee-68b70bc02e96	1ea85325-d23b-4700-8a5b-40884b779c52
24008724-7f61-4c38-8ee5-fbb80f110a61	1ea85325-d23b-4700-8a5b-40884b779c52
0aefa877-7d31-4721-9d5c-e27a56b20ebb	1ea85325-d23b-4700-8a5b-40884b779c52
4560c1d7-23c9-4cc1-861e-17063e24e460	1ea85325-d23b-4700-8a5b-40884b779c52
1a52ebab-766e-4ea3-b243-7007d1c08929	1ea85325-d23b-4700-8a5b-40884b779c52
47366cd9-e9cb-4dda-9e43-089dd57163fc	1ea85325-d23b-4700-8a5b-40884b779c52
ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827	1ea85325-d23b-4700-8a5b-40884b779c52
4126a5c0-5a0b-4f0a-aae2-292012a64b55	1ea85325-d23b-4700-8a5b-40884b779c52
c0298e15-3d0a-487d-9120-b9c6e2fe5cf3	1ea85325-d23b-4700-8a5b-40884b779c52
fb8cc7fa-06d4-4c58-b35f-0ab72c58cb36	1ea85325-d23b-4700-8a5b-40884b779c52
bcb6866c-069c-4d35-b0dd-256756dfc5ed	1ea85325-d23b-4700-8a5b-40884b779c52
ece9a390-8381-4ea9-ad78-769e1c89e2a4	1ea85325-d23b-4700-8a5b-40884b779c52
52e228c2-d127-4069-a430-7024367042f3	1ea85325-d23b-4700-8a5b-40884b779c52
6fbc8ad4-b945-425b-ae70-dafe253cb7c9	d1564e33-79a5-42e2-a7fb-38f59297432b
24008724-7f61-4c38-8ee5-fbb80f110a61	d1564e33-79a5-42e2-a7fb-38f59297432b
ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827	d1564e33-79a5-42e2-a7fb-38f59297432b
47366cd9-e9cb-4dda-9e43-089dd57163fc	3b138675-1889-4e1e-b772-1a5189ff6301
6b2fe94d-a136-433d-802b-14c41078c39a	3b138675-1889-4e1e-b772-1a5189ff6301
2362167f-7dd1-40c2-a439-1e6cc5de2359	a85b89de-2acd-4e95-a83a-31bf1edd6244
0da08037-311f-4c32-a63d-a683888abbc3	10c29f7a-f084-4eb4-87ab-419707c80fb4
af536aa1-e23f-47eb-8384-16f45cf699ab	10c29f7a-f084-4eb4-87ab-419707c80fb4
4155f230-b355-4267-a81e-0e0b5be7df02	10c29f7a-f084-4eb4-87ab-419707c80fb4
48a5b83c-69d9-49a3-bbec-e37f91d12455	10c29f7a-f084-4eb4-87ab-419707c80fb4
8d074acc-1d1e-4be7-8082-6f7a3b2a37ba	10c29f7a-f084-4eb4-87ab-419707c80fb4
3a041235-6c8c-45fa-9370-74de42faa31e	10c29f7a-f084-4eb4-87ab-419707c80fb4
30d1a342-c192-41ac-aea2-b2f234b31aae	10c29f7a-f084-4eb4-87ab-419707c80fb4
0aefa877-7d31-4721-9d5c-e27a56b20ebb	10c29f7a-f084-4eb4-87ab-419707c80fb4
24008724-7f61-4c38-8ee5-fbb80f110a61	10c29f7a-f084-4eb4-87ab-419707c80fb4
6fbc8ad4-b945-425b-ae70-dafe253cb7c9	10c29f7a-f084-4eb4-87ab-419707c80fb4
47366cd9-e9cb-4dda-9e43-089dd57163fc	10c29f7a-f084-4eb4-87ab-419707c80fb4
52e228c2-d127-4069-a430-7024367042f3	10c29f7a-f084-4eb4-87ab-419707c80fb4
83d3c062-8ab6-4538-9d87-3088ab618a31	10c29f7a-f084-4eb4-87ab-419707c80fb4
4155f230-b355-4267-a81e-0e0b5be7df02	f453fce2-0cb7-4e97-952e-a72d4347a756
8d074acc-1d1e-4be7-8082-6f7a3b2a37ba	f453fce2-0cb7-4e97-952e-a72d4347a756
30d1a342-c192-41ac-aea2-b2f234b31aae	f453fce2-0cb7-4e97-952e-a72d4347a756
48a5b83c-69d9-49a3-bbec-e37f91d12455	f453fce2-0cb7-4e97-952e-a72d4347a756
6fbc8ad4-b945-425b-ae70-dafe253cb7c9	f453fce2-0cb7-4e97-952e-a72d4347a756
648c4240-7cc3-4e39-9aa8-f038b1b3ec59	f453fce2-0cb7-4e97-952e-a72d4347a756
c88cfb8e-f11d-4bef-abb0-8fba9ab51474	f453fce2-0cb7-4e97-952e-a72d4347a756
5e045d21-9f73-4088-abd6-4130e31d87fe	f453fce2-0cb7-4e97-952e-a72d4347a756
ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827	f453fce2-0cb7-4e97-952e-a72d4347a756
6b2fe94d-a136-433d-802b-14c41078c39a	f453fce2-0cb7-4e97-952e-a72d4347a756
af536aa1-e23f-47eb-8384-16f45cf699ab	f453fce2-0cb7-4e97-952e-a72d4347a756
0da08037-311f-4c32-a63d-a683888abbc3	f453fce2-0cb7-4e97-952e-a72d4347a756
52e228c2-d127-4069-a430-7024367042f3	f453fce2-0cb7-4e97-952e-a72d4347a756
2362167f-7dd1-40c2-a439-1e6cc5de2359	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
04855b47-7f52-442b-933e-75f60e576f7b	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7	48f68bdb-12f4-47f7-b87a-c13b8af99cc6
\.


--
-- Data for Name: supertechnique_equipes_equipe; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.supertechnique_equipes_equipe ("supertechniqueId", "equipeId") FROM stdin;
7ed876fa-6b35-4435-9ac2-bc71b35a70aa	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
978d2fc4-b8aa-4b88-8995-d3086c8a7a7b	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
ddd2538b-718a-4069-9994-d4c8a4ed650a	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
24008724-7f61-4c38-8ee5-fbb80f110a61	1065b087-500b-4129-b4aa-ff5247c15bfc
ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827	1065b087-500b-4129-b4aa-ff5247c15bfc
ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827	1c35f137-9ba2-4536-ba1a-87de80e704a4
5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7	1065b087-500b-4129-b4aa-ff5247c15bfc
68e47d86-544b-4b58-ae47-d3c2a379ffcb	57e1080f-926b-4f05-a4fa-3d56704221c2
16569a09-6cef-461c-869b-62533f389999	57e1080f-926b-4f05-a4fa-3d56704221c2
81541c14-f7ae-4dd4-98a3-ce92428d76e3	1065b087-500b-4129-b4aa-ff5247c15bfc
47366cd9-e9cb-4dda-9e43-089dd57163fc	1065b087-500b-4129-b4aa-ff5247c15bfc
610e6efa-e893-4e3d-a78c-5bee27eeee0f	0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00
307222cc-4ea9-423a-9305-d9fbafe692ff	0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00
de717d77-13a0-498c-af82-ab4751bfbf6f	0b29c0a3-de1c-4a82-8cbc-d5fd67df4d00
648c4240-7cc3-4e39-9aa8-f038b1b3ec59	1065b087-500b-4129-b4aa-ff5247c15bfc
fee38ff1-00f9-40f5-a809-9556d6ff7655	1065b087-500b-4129-b4aa-ff5247c15bfc
ce7d62f3-b679-47a9-8afe-e8635d081f92	1c35f137-9ba2-4536-ba1a-87de80e704a4
ad527b4c-643e-4321-bc49-0d34e28917d8	1065b087-500b-4129-b4aa-ff5247c15bfc
8dbee186-f703-4374-ae66-6098242c5660	1c35f137-9ba2-4536-ba1a-87de80e704a4
0d58e2e8-5b7d-471c-92ea-3503952361b4	1c35f137-9ba2-4536-ba1a-87de80e704a4
a6c4ecbd-345d-4d83-a3fb-381fd155ba90	18189270-3ac7-4e97-a47f-178f1a0421b0
8dbbb644-a161-4105-ad39-eca821f70f48	18189270-3ac7-4e97-a47f-178f1a0421b0
1bae1658-f971-4b0e-9acc-fc5b2999d335	18189270-3ac7-4e97-a47f-178f1a0421b0
635b7ae5-e564-4ee5-8be0-11ee0be2944e	18189270-3ac7-4e97-a47f-178f1a0421b0
afa4c495-1884-4e0b-bf12-9ce6916f8ab6	1065b087-500b-4129-b4aa-ff5247c15bfc
8fc435b4-d4fc-4952-be2c-39d41119f6bd	1065b087-500b-4129-b4aa-ff5247c15bfc
399f5c78-382b-4795-8204-38e17a947877	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
83d3c062-8ab6-4538-9d87-3088ab618a31	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
6b2fe94d-a136-433d-802b-14c41078c39a	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
0aefa877-7d31-4721-9d5c-e27a56b20ebb	1065b087-500b-4129-b4aa-ff5247c15bfc
04855b47-7f52-442b-933e-75f60e576f7b	1065b087-500b-4129-b4aa-ff5247c15bfc
6d283ab7-0e4e-4f3e-92de-25b5500cf018	1065b087-500b-4129-b4aa-ff5247c15bfc
09c253c5-5b70-4933-bba8-d9d330963b38	7867fcf3-647e-4b7b-bf1e-f6ecb5027232
4126a5c0-5a0b-4f0a-aae2-292012a64b55	79de6a43-1c49-449e-bed9-a67965d23a37
dbcf9e99-bb6b-43d6-8bd3-5d7bf284492b	79de6a43-1c49-449e-bed9-a67965d23a37
dbcf9e99-bb6b-43d6-8bd3-5d7bf284492b	1065b087-500b-4129-b4aa-ff5247c15bfc
5dbf3891-8435-4877-8081-e45815e0865a	1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5
f1c7c566-2fdb-479f-9b3e-a1148760d21c	1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5
14211596-bbfb-44b1-afdc-3539e34beb60	1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5
04a67f8f-d41f-41eb-be32-c962ebfa41c3	1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5
92acb0d8-19b4-4d23-87ba-8d6761d4536b	1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5
300e7b11-4a45-4298-823b-d3cb6b096a46	1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5
7577e5ca-a9e4-4973-80f5-0d42d596f125	1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5
22d2aa53-910a-4310-8f5c-66141348e409	1ab7e9d5-e464-4ef6-bdd3-18768fa3b7d5
4560c1d7-23c9-4cc1-861e-17063e24e460	1065b087-500b-4129-b4aa-ff5247c15bfc
3b7fe383-5d9d-43fd-8081-4985fb59f1a1	1065b087-500b-4129-b4aa-ff5247c15bfc
150f3b7f-c5b1-4723-a101-fcdd6d93d00f	2d695421-8627-4982-a86a-6e810e07f354
f3bde92b-de79-414d-9707-93baf6e9e44d	2d695421-8627-4982-a86a-6e810e07f354
7e6d27bd-cf47-49a6-9bc2-3cdaeafa78c1	2d695421-8627-4982-a86a-6e810e07f354
cedd92ea-7710-460c-8667-76617f1005cb	2d695421-8627-4982-a86a-6e810e07f354
ed55069b-0022-4b67-be51-b5a76afd569f	2d695421-8627-4982-a86a-6e810e07f354
1a807ccd-64dc-4902-9cb2-f79bc96ef41d	2d695421-8627-4982-a86a-6e810e07f354
2362167f-7dd1-40c2-a439-1e6cc5de2359	1065b087-500b-4129-b4aa-ff5247c15bfc
964f1077-700a-4cdb-a974-40a82ad54696	1065b087-500b-4129-b4aa-ff5247c15bfc
1a52ebab-766e-4ea3-b243-7007d1c08929	1065b087-500b-4129-b4aa-ff5247c15bfc
16af5557-b14c-4168-9acb-5dae4cb664fc	1065b087-500b-4129-b4aa-ff5247c15bfc
63eb99ce-fe82-460f-b879-ffd2b0854dba	5222805c-7848-4c9c-865d-0e6d6b71f885
093bbc31-ceb1-441b-95ee-68b70bc02e96	5222805c-7848-4c9c-865d-0e6d6b71f885
4126a5c0-5a0b-4f0a-aae2-292012a64b55	1065b087-500b-4129-b4aa-ff5247c15bfc
c0298e15-3d0a-487d-9120-b9c6e2fe5cf3	5222805c-7848-4c9c-865d-0e6d6b71f885
fb8cc7fa-06d4-4c58-b35f-0ab72c58cb36	1065b087-500b-4129-b4aa-ff5247c15bfc
bcb6866c-069c-4d35-b0dd-256756dfc5ed	5222805c-7848-4c9c-865d-0e6d6b71f885
ece9a390-8381-4ea9-ad78-769e1c89e2a4	1065b087-500b-4129-b4aa-ff5247c15bfc
52e228c2-d127-4069-a430-7024367042f3	1065b087-500b-4129-b4aa-ff5247c15bfc
6b2fe94d-a136-433d-802b-14c41078c39a	1065b087-500b-4129-b4aa-ff5247c15bfc
6fbc8ad4-b945-425b-ae70-dafe253cb7c9	82290c3e-1d64-407e-becb-7fcfe8fab4b6
0da08037-311f-4c32-a63d-a683888abbc3	82290c3e-1d64-407e-becb-7fcfe8fab4b6
af536aa1-e23f-47eb-8384-16f45cf699ab	82290c3e-1d64-407e-becb-7fcfe8fab4b6
4155f230-b355-4267-a81e-0e0b5be7df02	82290c3e-1d64-407e-becb-7fcfe8fab4b6
48a5b83c-69d9-49a3-bbec-e37f91d12455	82290c3e-1d64-407e-becb-7fcfe8fab4b6
8d074acc-1d1e-4be7-8082-6f7a3b2a37ba	82290c3e-1d64-407e-becb-7fcfe8fab4b6
3a041235-6c8c-45fa-9370-74de42faa31e	82290c3e-1d64-407e-becb-7fcfe8fab4b6
30d1a342-c192-41ac-aea2-b2f234b31aae	82290c3e-1d64-407e-becb-7fcfe8fab4b6
83d3c062-8ab6-4538-9d87-3088ab618a31	1065b087-500b-4129-b4aa-ff5247c15bfc
5e045d21-9f73-4088-abd6-4130e31d87fe	1065b087-500b-4129-b4aa-ff5247c15bfc
c88cfb8e-f11d-4bef-abb0-8fba9ab51474	1065b087-500b-4129-b4aa-ff5247c15bfc
\.


--
-- Data for Name: supertechnique_matchs_match; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.supertechnique_matchs_match ("supertechniqueId", "matchId") FROM stdin;
ddd2538b-718a-4069-9994-d4c8a4ed650a	b019f860-ba93-42b1-a67d-9de9755a595e
ddd2538b-718a-4069-9994-d4c8a4ed650a	38cd4e40-8bde-4cda-a758-106487cd52ba
7ed876fa-6b35-4435-9ac2-bc71b35a70aa	b019f860-ba93-42b1-a67d-9de9755a595e
978d2fc4-b8aa-4b88-8995-d3086c8a7a7b	b019f860-ba93-42b1-a67d-9de9755a595e
24008724-7f61-4c38-8ee5-fbb80f110a61	b019f860-ba93-42b1-a67d-9de9755a595e
24008724-7f61-4c38-8ee5-fbb80f110a61	00282566-2519-4aef-9c52-805b2fc50f5d
24008724-7f61-4c38-8ee5-fbb80f110a61	c3847f17-5aac-4521-b7f8-4e11e39f96a9
24008724-7f61-4c38-8ee5-fbb80f110a61	90b08eb9-3508-4129-8560-60db3686a580
24008724-7f61-4c38-8ee5-fbb80f110a61	309dbe3a-6c37-4842-acd8-521a6e19c9a1
ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827	309dbe3a-6c37-4842-acd8-521a6e19c9a1
ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827	b019f860-ba93-42b1-a67d-9de9755a595e
ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827	90b08eb9-3508-4129-8560-60db3686a580
ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827	38cd4e40-8bde-4cda-a758-106487cd52ba
ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827	c3847f17-5aac-4521-b7f8-4e11e39f96a9
5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7	309dbe3a-6c37-4842-acd8-521a6e19c9a1
5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7	00282566-2519-4aef-9c52-805b2fc50f5d
5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7	847cb605-72f3-4c60-b254-55e9bfcbf7cf
5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7	30e325d2-6051-42ca-a89d-f4296dc3c0b5
5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7	38cd4e40-8bde-4cda-a758-106487cd52ba
5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7	c3847f17-5aac-4521-b7f8-4e11e39f96a9
68e47d86-544b-4b58-ae47-d3c2a379ffcb	68a00b4a-ba72-4c2a-ba08-d1c2bc44b348
16569a09-6cef-461c-869b-62533f389999	68a00b4a-ba72-4c2a-ba08-d1c2bc44b348
81541c14-f7ae-4dd4-98a3-ce92428d76e3	309dbe3a-6c37-4842-acd8-521a6e19c9a1
81541c14-f7ae-4dd4-98a3-ce92428d76e3	00282566-2519-4aef-9c52-805b2fc50f5d
81541c14-f7ae-4dd4-98a3-ce92428d76e3	90b08eb9-3508-4129-8560-60db3686a580
81541c14-f7ae-4dd4-98a3-ce92428d76e3	38cd4e40-8bde-4cda-a758-106487cd52ba
81541c14-f7ae-4dd4-98a3-ce92428d76e3	68a00b4a-ba72-4c2a-ba08-d1c2bc44b348
81541c14-f7ae-4dd4-98a3-ce92428d76e3	c3847f17-5aac-4521-b7f8-4e11e39f96a9
47366cd9-e9cb-4dda-9e43-089dd57163fc	68a00b4a-ba72-4c2a-ba08-d1c2bc44b348
47366cd9-e9cb-4dda-9e43-089dd57163fc	c3847f17-5aac-4521-b7f8-4e11e39f96a9
47366cd9-e9cb-4dda-9e43-089dd57163fc	38cd4e40-8bde-4cda-a758-106487cd52ba
47366cd9-e9cb-4dda-9e43-089dd57163fc	847cb605-72f3-4c60-b254-55e9bfcbf7cf
47366cd9-e9cb-4dda-9e43-089dd57163fc	90b08eb9-3508-4129-8560-60db3686a580
610e6efa-e893-4e3d-a78c-5bee27eeee0f	00282566-2519-4aef-9c52-805b2fc50f5d
307222cc-4ea9-423a-9305-d9fbafe692ff	00282566-2519-4aef-9c52-805b2fc50f5d
de717d77-13a0-498c-af82-ab4751bfbf6f	00282566-2519-4aef-9c52-805b2fc50f5d
648c4240-7cc3-4e39-9aa8-f038b1b3ec59	00282566-2519-4aef-9c52-805b2fc50f5d
fee38ff1-00f9-40f5-a809-9556d6ff7655	00282566-2519-4aef-9c52-805b2fc50f5d
fee38ff1-00f9-40f5-a809-9556d6ff7655	c3847f17-5aac-4521-b7f8-4e11e39f96a9
fee38ff1-00f9-40f5-a809-9556d6ff7655	847cb605-72f3-4c60-b254-55e9bfcbf7cf
ad527b4c-643e-4321-bc49-0d34e28917d8	847cb605-72f3-4c60-b254-55e9bfcbf7cf
ad527b4c-643e-4321-bc49-0d34e28917d8	c3847f17-5aac-4521-b7f8-4e11e39f96a9
8dbee186-f703-4374-ae66-6098242c5660	c3847f17-5aac-4521-b7f8-4e11e39f96a9
0d58e2e8-5b7d-471c-92ea-3503952361b4	c3847f17-5aac-4521-b7f8-4e11e39f96a9
a6c4ecbd-345d-4d83-a3fb-381fd155ba90	30e325d2-6051-42ca-a89d-f4296dc3c0b5
8dbbb644-a161-4105-ad39-eca821f70f48	30e325d2-6051-42ca-a89d-f4296dc3c0b5
1bae1658-f971-4b0e-9acc-fc5b2999d335	30e325d2-6051-42ca-a89d-f4296dc3c0b5
635b7ae5-e564-4ee5-8be0-11ee0be2944e	30e325d2-6051-42ca-a89d-f4296dc3c0b5
399f5c78-382b-4795-8204-38e17a947877	38cd4e40-8bde-4cda-a758-106487cd52ba
83d3c062-8ab6-4538-9d87-3088ab618a31	38cd4e40-8bde-4cda-a758-106487cd52ba
6b2fe94d-a136-433d-802b-14c41078c39a	38cd4e40-8bde-4cda-a758-106487cd52ba
0aefa877-7d31-4721-9d5c-e27a56b20ebb	38cd4e40-8bde-4cda-a758-106487cd52ba
04855b47-7f52-442b-933e-75f60e576f7b	38cd4e40-8bde-4cda-a758-106487cd52ba
6d283ab7-0e4e-4f3e-92de-25b5500cf018	38cd4e40-8bde-4cda-a758-106487cd52ba
09c253c5-5b70-4933-bba8-d9d330963b38	38cd4e40-8bde-4cda-a758-106487cd52ba
16af5557-b14c-4168-9acb-5dae4cb664fc	38cd4e40-8bde-4cda-a758-106487cd52ba
4126a5c0-5a0b-4f0a-aae2-292012a64b55	309dbe3a-6c37-4842-acd8-521a6e19c9a1
dbcf9e99-bb6b-43d6-8bd3-5d7bf284492b	309dbe3a-6c37-4842-acd8-521a6e19c9a1
dbcf9e99-bb6b-43d6-8bd3-5d7bf284492b	847cb605-72f3-4c60-b254-55e9bfcbf7cf
dbcf9e99-bb6b-43d6-8bd3-5d7bf284492b	90b08eb9-3508-4129-8560-60db3686a580
5dbf3891-8435-4877-8081-e45815e0865a	90b08eb9-3508-4129-8560-60db3686a580
f1c7c566-2fdb-479f-9b3e-a1148760d21c	90b08eb9-3508-4129-8560-60db3686a580
14211596-bbfb-44b1-afdc-3539e34beb60	90b08eb9-3508-4129-8560-60db3686a580
04a67f8f-d41f-41eb-be32-c962ebfa41c3	90b08eb9-3508-4129-8560-60db3686a580
92acb0d8-19b4-4d23-87ba-8d6761d4536b	90b08eb9-3508-4129-8560-60db3686a580
300e7b11-4a45-4298-823b-d3cb6b096a46	90b08eb9-3508-4129-8560-60db3686a580
7577e5ca-a9e4-4973-80f5-0d42d596f125	90b08eb9-3508-4129-8560-60db3686a580
22d2aa53-910a-4310-8f5c-66141348e409	90b08eb9-3508-4129-8560-60db3686a580
4560c1d7-23c9-4cc1-861e-17063e24e460	90b08eb9-3508-4129-8560-60db3686a580
4560c1d7-23c9-4cc1-861e-17063e24e460	847cb605-72f3-4c60-b254-55e9bfcbf7cf
150f3b7f-c5b1-4723-a101-fcdd6d93d00f	847cb605-72f3-4c60-b254-55e9bfcbf7cf
f3bde92b-de79-414d-9707-93baf6e9e44d	847cb605-72f3-4c60-b254-55e9bfcbf7cf
7e6d27bd-cf47-49a6-9bc2-3cdaeafa78c1	847cb605-72f3-4c60-b254-55e9bfcbf7cf
cedd92ea-7710-460c-8667-76617f1005cb	847cb605-72f3-4c60-b254-55e9bfcbf7cf
ed55069b-0022-4b67-be51-b5a76afd569f	847cb605-72f3-4c60-b254-55e9bfcbf7cf
1a807ccd-64dc-4902-9cb2-f79bc96ef41d	847cb605-72f3-4c60-b254-55e9bfcbf7cf
2362167f-7dd1-40c2-a439-1e6cc5de2359	847cb605-72f3-4c60-b254-55e9bfcbf7cf
648c4240-7cc3-4e39-9aa8-f038b1b3ec59	847cb605-72f3-4c60-b254-55e9bfcbf7cf
ce7d62f3-b679-47a9-8afe-e8635d081f92	c3847f17-5aac-4521-b7f8-4e11e39f96a9
63eb99ce-fe82-460f-b879-ffd2b0854dba	d3b1787f-9750-4e08-8437-6ebd521bec94
24008724-7f61-4c38-8ee5-fbb80f110a61	d3b1787f-9750-4e08-8437-6ebd521bec94
0aefa877-7d31-4721-9d5c-e27a56b20ebb	d3b1787f-9750-4e08-8437-6ebd521bec94
4560c1d7-23c9-4cc1-861e-17063e24e460	d3b1787f-9750-4e08-8437-6ebd521bec94
1a52ebab-766e-4ea3-b243-7007d1c08929	d3b1787f-9750-4e08-8437-6ebd521bec94
093bbc31-ceb1-441b-95ee-68b70bc02e96	d3b1787f-9750-4e08-8437-6ebd521bec94
c0298e15-3d0a-487d-9120-b9c6e2fe5cf3	d3b1787f-9750-4e08-8437-6ebd521bec94
47366cd9-e9cb-4dda-9e43-089dd57163fc	d3b1787f-9750-4e08-8437-6ebd521bec94
fb8cc7fa-06d4-4c58-b35f-0ab72c58cb36	d3b1787f-9750-4e08-8437-6ebd521bec94
ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827	d3b1787f-9750-4e08-8437-6ebd521bec94
4126a5c0-5a0b-4f0a-aae2-292012a64b55	d3b1787f-9750-4e08-8437-6ebd521bec94
bcb6866c-069c-4d35-b0dd-256756dfc5ed	d3b1787f-9750-4e08-8437-6ebd521bec94
ece9a390-8381-4ea9-ad78-769e1c89e2a4	d3b1787f-9750-4e08-8437-6ebd521bec94
52e228c2-d127-4069-a430-7024367042f3	d3b1787f-9750-4e08-8437-6ebd521bec94
4155f230-b355-4267-a81e-0e0b5be7df02	345c2d60-a9d0-40e9-9055-00eb22bb6ad2
8d074acc-1d1e-4be7-8082-6f7a3b2a37ba	345c2d60-a9d0-40e9-9055-00eb22bb6ad2
30d1a342-c192-41ac-aea2-b2f234b31aae	345c2d60-a9d0-40e9-9055-00eb22bb6ad2
48a5b83c-69d9-49a3-bbec-e37f91d12455	345c2d60-a9d0-40e9-9055-00eb22bb6ad2
6fbc8ad4-b945-425b-ae70-dafe253cb7c9	345c2d60-a9d0-40e9-9055-00eb22bb6ad2
648c4240-7cc3-4e39-9aa8-f038b1b3ec59	345c2d60-a9d0-40e9-9055-00eb22bb6ad2
c88cfb8e-f11d-4bef-abb0-8fba9ab51474	345c2d60-a9d0-40e9-9055-00eb22bb6ad2
5e045d21-9f73-4088-abd6-4130e31d87fe	345c2d60-a9d0-40e9-9055-00eb22bb6ad2
ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827	345c2d60-a9d0-40e9-9055-00eb22bb6ad2
6b2fe94d-a136-433d-802b-14c41078c39a	345c2d60-a9d0-40e9-9055-00eb22bb6ad2
af536aa1-e23f-47eb-8384-16f45cf699ab	345c2d60-a9d0-40e9-9055-00eb22bb6ad2
0da08037-311f-4c32-a63d-a683888abbc3	345c2d60-a9d0-40e9-9055-00eb22bb6ad2
52e228c2-d127-4069-a430-7024367042f3	345c2d60-a9d0-40e9-9055-00eb22bb6ad2
0aefa877-7d31-4721-9d5c-e27a56b20ebb	345c2d60-a9d0-40e9-9055-00eb22bb6ad2
24008724-7f61-4c38-8ee5-fbb80f110a61	345c2d60-a9d0-40e9-9055-00eb22bb6ad2
47366cd9-e9cb-4dda-9e43-089dd57163fc	345c2d60-a9d0-40e9-9055-00eb22bb6ad2
83d3c062-8ab6-4538-9d87-3088ab618a31	345c2d60-a9d0-40e9-9055-00eb22bb6ad2
3a041235-6c8c-45fa-9370-74de42faa31e	345c2d60-a9d0-40e9-9055-00eb22bb6ad2
2362167f-7dd1-40c2-a439-1e6cc5de2359	0a8c5e7d-a06b-453e-a1ed-74140f3e27d1
04855b47-7f52-442b-933e-75f60e576f7b	0a8c5e7d-a06b-453e-a1ed-74140f3e27d1
5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7	0a8c5e7d-a06b-453e-a1ed-74140f3e27d1
\.


--
-- Data for Name: supertechnique_personnages_personnage; Type: TABLE DATA; Schema: public; Owner: lora
--

COPY public.supertechnique_personnages_personnage ("supertechniqueId", "personnageId") FROM stdin;
7ed876fa-6b35-4435-9ac2-bc71b35a70aa	2262a0fd-6a23-4b63-840d-270ba57265f1
7ed876fa-6b35-4435-9ac2-bc71b35a70aa	d39825c3-b0fe-4a00-a481-f262a33d0843
7ed876fa-6b35-4435-9ac2-bc71b35a70aa	b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba
978d2fc4-b8aa-4b88-8995-d3086c8a7a7b	dee66d99-2fe1-4ff8-a327-cee3a0a284e9
ddd2538b-718a-4069-9994-d4c8a4ed650a	d39825c3-b0fe-4a00-a481-f262a33d0843
24008724-7f61-4c38-8ee5-fbb80f110a61	2054bb43-179d-42d6-b601-31eb342745a9
24008724-7f61-4c38-8ee5-fbb80f110a61	677ac23b-3140-4ef4-a71b-6821191f067b
ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827	747633f6-9821-4db8-81b5-cf2374cf773e
ad6a007f-5bac-4a30-ba2f-f4d8cbbcb827	b7df9bbc-f07e-49ce-9656-b3a9aa28599c
5561cf59-ec85-42e5-a7b5-3ff7f38fbfe7	4d076373-8444-4909-b28d-b7665c8b76f7
68e47d86-544b-4b58-ae47-d3c2a379ffcb	de217141-cfb6-4a2a-bb74-689764d901b8
68e47d86-544b-4b58-ae47-d3c2a379ffcb	68419050-a862-4810-b4a4-1a35cfa72991
16569a09-6cef-461c-869b-62533f389999	b6bd3c06-c2cb-4778-bbfe-beaa53a0c08c
81541c14-f7ae-4dd4-98a3-ce92428d76e3	2054bb43-179d-42d6-b601-31eb342745a9
47366cd9-e9cb-4dda-9e43-089dd57163fc	747633f6-9821-4db8-81b5-cf2374cf773e
47366cd9-e9cb-4dda-9e43-089dd57163fc	4d076373-8444-4909-b28d-b7665c8b76f7
610e6efa-e893-4e3d-a78c-5bee27eeee0f	1d16af31-8260-4617-a678-9b4a69af14c7
307222cc-4ea9-423a-9305-d9fbafe692ff	75842ba4-b8b1-46f3-a69b-d79627616252
de717d77-13a0-498c-af82-ab4751bfbf6f	68649379-8432-432d-8c2a-9e9da6f85b4f
648c4240-7cc3-4e39-9aa8-f038b1b3ec59	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
ce7d62f3-b679-47a9-8afe-e8635d081f92	1b288bd9-dd9d-4c04-9871-438c5bd55011
ad527b4c-643e-4321-bc49-0d34e28917d8	2054bb43-179d-42d6-b601-31eb342745a9
ad527b4c-643e-4321-bc49-0d34e28917d8	747633f6-9821-4db8-81b5-cf2374cf773e
8dbee186-f703-4374-ae66-6098242c5660	1b288bd9-dd9d-4c04-9871-438c5bd55011
0d58e2e8-5b7d-471c-92ea-3503952361b4	b7df9bbc-f07e-49ce-9656-b3a9aa28599c
a6c4ecbd-345d-4d83-a3fb-381fd155ba90	fe856efa-7e36-480f-a7cf-9988b6cef346
8dbbb644-a161-4105-ad39-eca821f70f48	cbad2a62-82da-4c7f-bdd1-6c3b3666aa0c
8dbbb644-a161-4105-ad39-eca821f70f48	7cda746f-c186-4f88-bc9f-9e402a84c0e8
1bae1658-f971-4b0e-9acc-fc5b2999d335	2f7ed9f8-e502-4cb3-b095-da1099fc6b84
1bae1658-f971-4b0e-9acc-fc5b2999d335	7cda746f-c186-4f88-bc9f-9e402a84c0e8
1bae1658-f971-4b0e-9acc-fc5b2999d335	80f3cc8a-5da9-47c3-94c2-6f424d395155
1bae1658-f971-4b0e-9acc-fc5b2999d335	a2306519-360f-4c44-a0d3-bd6633f73d8b
1bae1658-f971-4b0e-9acc-fc5b2999d335	fe856efa-7e36-480f-a7cf-9988b6cef346
635b7ae5-e564-4ee5-8be0-11ee0be2944e	e9119b2e-1b37-493b-a4d0-7279d2e8daf1
afa4c495-1884-4e0b-bf12-9ce6916f8ab6	a1c91aa2-a103-41bc-a545-1590f1cb0547
8fc435b4-d4fc-4952-be2c-39d41119f6bd	dab55b53-7354-46fd-8914-ef48b8c695f0
399f5c78-382b-4795-8204-38e17a947877	03f04e6f-690c-43f0-a037-0bb816a768bc
83d3c062-8ab6-4538-9d87-3088ab618a31	71228913-c490-4f69-b53f-e610b64da380
83d3c062-8ab6-4538-9d87-3088ab618a31	b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba
83d3c062-8ab6-4538-9d87-3088ab618a31	d39825c3-b0fe-4a00-a481-f262a33d0843
6b2fe94d-a136-433d-802b-14c41078c39a	71228913-c490-4f69-b53f-e610b64da380
6b2fe94d-a136-433d-802b-14c41078c39a	b8a7a6d8-9bd8-4fbe-ab2d-4feca41e3eba
0aefa877-7d31-4721-9d5c-e27a56b20ebb	2054bb43-179d-42d6-b601-31eb342745a9
04855b47-7f52-442b-933e-75f60e576f7b	659b157a-8cc9-4442-ae93-3f8f635a81a6
6d283ab7-0e4e-4f3e-92de-25b5500cf018	3a5352b6-d7a0-4b51-a013-7f2b005174c3
09c253c5-5b70-4933-bba8-d9d330963b38	03f04e6f-690c-43f0-a037-0bb816a768bc
16af5557-b14c-4168-9acb-5dae4cb664fc	0ac890a8-3e5f-4267-8261-830d39b0b62d
16af5557-b14c-4168-9acb-5dae4cb664fc	747633f6-9821-4db8-81b5-cf2374cf773e
16af5557-b14c-4168-9acb-5dae4cb664fc	2054bb43-179d-42d6-b601-31eb342745a9
4126a5c0-5a0b-4f0a-aae2-292012a64b55	1fcf9196-0db5-4f3c-a465-563b2f2eca76
dbcf9e99-bb6b-43d6-8bd3-5d7bf284492b	c050c6c1-1d2a-4dda-9365-dec2acfa96b0
dbcf9e99-bb6b-43d6-8bd3-5d7bf284492b	cc364f58-137d-4afe-b16b-edd8a8dc7b8b
dbcf9e99-bb6b-43d6-8bd3-5d7bf284492b	747633f6-9821-4db8-81b5-cf2374cf773e
dbcf9e99-bb6b-43d6-8bd3-5d7bf284492b	659b157a-8cc9-4442-ae93-3f8f635a81a6
5dbf3891-8435-4877-8081-e45815e0865a	457cea5b-6cd2-4dc7-9e38-8d0f23f88ef8
5dbf3891-8435-4877-8081-e45815e0865a	0c8c9915-327c-414d-80db-4e16a0e8e9dc
f1c7c566-2fdb-479f-9b3e-a1148760d21c	18ce93b1-e30d-48db-9dc9-57c555dde8a1
f1c7c566-2fdb-479f-9b3e-a1148760d21c	b4ce3897-6134-439b-b071-2c68f4cd65e9
14211596-bbfb-44b1-afdc-3539e34beb60	7f296a30-104f-4803-b711-ea7fff34de1c
04a67f8f-d41f-41eb-be32-c962ebfa41c3	6be300b6-aff9-4c3c-91ce-ddab2217b2a3
04a67f8f-d41f-41eb-be32-c962ebfa41c3	caf4be28-0825-49d3-81c8-f2b88b6aeeec
92acb0d8-19b4-4d23-87ba-8d6761d4536b	75401584-d7cc-4ef2-b3aa-bb293ba8ff2c
300e7b11-4a45-4298-823b-d3cb6b096a46	06876434-2c1d-4c96-b18c-ca13f5b93f3e
7577e5ca-a9e4-4973-80f5-0d42d596f125	457cea5b-6cd2-4dc7-9e38-8d0f23f88ef8
22d2aa53-910a-4310-8f5c-66141348e409	3359d42e-77e7-4a33-b08c-abad892c829e
4560c1d7-23c9-4cc1-861e-17063e24e460	0ac890a8-3e5f-4267-8261-830d39b0b62d
3b7fe383-5d9d-43fd-8081-4985fb59f1a1	3a5352b6-d7a0-4b51-a013-7f2b005174c3
150f3b7f-c5b1-4723-a101-fcdd6d93d00f	6203bb89-4dab-4f4f-a147-70f1e20f3a23
f3bde92b-de79-414d-9707-93baf6e9e44d	3fb4a546-96fa-4bd2-a312-cd3629c3e391
7e6d27bd-cf47-49a6-9bc2-3cdaeafa78c1	33fa83e0-37c4-4f3e-b3c5-ce344ca305d8
cedd92ea-7710-460c-8667-76617f1005cb	007caf86-1bf9-42a9-a163-a95ed8663eb0
ed55069b-0022-4b67-be51-b5a76afd569f	007caf86-1bf9-42a9-a163-a95ed8663eb0
ed55069b-0022-4b67-be51-b5a76afd569f	f0435863-c6f2-471f-bb14-84623acae1af
ed55069b-0022-4b67-be51-b5a76afd569f	1bcbe7f3-bc0d-4f8e-a8f9-63de56b6e23e
1a807ccd-64dc-4902-9cb2-f79bc96ef41d	4a3b664b-bb2d-4f8a-8eed-16e67d2d533e
1a807ccd-64dc-4902-9cb2-f79bc96ef41d	31e32402-8790-4d6d-bc25-05b327645ac2
1a807ccd-64dc-4902-9cb2-f79bc96ef41d	5a5edb3c-0f9d-49e5-a05d-431224792e30
2362167f-7dd1-40c2-a439-1e6cc5de2359	71228913-c490-4f69-b53f-e610b64da380
2362167f-7dd1-40c2-a439-1e6cc5de2359	2054bb43-179d-42d6-b601-31eb342745a9
2362167f-7dd1-40c2-a439-1e6cc5de2359	747633f6-9821-4db8-81b5-cf2374cf773e
2362167f-7dd1-40c2-a439-1e6cc5de2359	677ac23b-3140-4ef4-a71b-6821191f067b
964f1077-700a-4cdb-a974-40a82ad54696	41ed930e-fdde-455c-b75f-305ff5c59d7c
1a52ebab-766e-4ea3-b243-7007d1c08929	41ed930e-fdde-455c-b75f-305ff5c59d7c
1a52ebab-766e-4ea3-b243-7007d1c08929	2054bb43-179d-42d6-b601-31eb342745a9
1a52ebab-766e-4ea3-b243-7007d1c08929	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
fee38ff1-00f9-40f5-a809-9556d6ff7655	0ac890a8-3e5f-4267-8261-830d39b0b62d
fee38ff1-00f9-40f5-a809-9556d6ff7655	747633f6-9821-4db8-81b5-cf2374cf773e
1a52ebab-766e-4ea3-b243-7007d1c08929	ad246772-bdd1-4423-9dd6-8435ac38b82d
63eb99ce-fe82-460f-b879-ffd2b0854dba	cec9c8ae-b54b-4698-a647-1cf2b645431a
63eb99ce-fe82-460f-b879-ffd2b0854dba	2b957305-0b01-4a68-90e6-a3393b771611
63eb99ce-fe82-460f-b879-ffd2b0854dba	98af9d29-90fb-40e6-88e9-11203916e16a
093bbc31-ceb1-441b-95ee-68b70bc02e96	cec9c8ae-b54b-4698-a647-1cf2b645431a
093bbc31-ceb1-441b-95ee-68b70bc02e96	2b957305-0b01-4a68-90e6-a3393b771611
093bbc31-ceb1-441b-95ee-68b70bc02e96	98af9d29-90fb-40e6-88e9-11203916e16a
4126a5c0-5a0b-4f0a-aae2-292012a64b55	6a5193ae-b7e1-4804-98fe-7d0c6bedbf91
c0298e15-3d0a-487d-9120-b9c6e2fe5cf3	ad246772-bdd1-4423-9dd6-8435ac38b82d
fb8cc7fa-06d4-4c58-b35f-0ab72c58cb36	34d4b5ff-39da-4a9f-ba98-4fab806a64ec
ece9a390-8381-4ea9-ad78-769e1c89e2a4	c5aabd21-29cd-4d77-b7b0-f071f971ed47
ece9a390-8381-4ea9-ad78-769e1c89e2a4	0ac890a8-3e5f-4267-8261-830d39b0b62d
ece9a390-8381-4ea9-ad78-769e1c89e2a4	2054bb43-179d-42d6-b601-31eb342745a9
52e228c2-d127-4069-a430-7024367042f3	2054bb43-179d-42d6-b601-31eb342745a9
52e228c2-d127-4069-a430-7024367042f3	41ed930e-fdde-455c-b75f-305ff5c59d7c
52e228c2-d127-4069-a430-7024367042f3	4e288bc2-6e23-4cdf-a894-7b6379be6bd4
6fbc8ad4-b945-425b-ae70-dafe253cb7c9	0f5bd1ea-3bdd-4199-8a83-2c42e066d7ed
6b2fe94d-a136-433d-802b-14c41078c39a	41ed930e-fdde-455c-b75f-305ff5c59d7c
0da08037-311f-4c32-a63d-a683888abbc3	ffee3101-5934-40c3-bb95-87392970ab9e
af536aa1-e23f-47eb-8384-16f45cf699ab	ffee3101-5934-40c3-bb95-87392970ab9e
4155f230-b355-4267-a81e-0e0b5be7df02	c9bf9b95-78b0-4ac8-93ac-4624c051bed5
48a5b83c-69d9-49a3-bbec-e37f91d12455	0f5bd1ea-3bdd-4199-8a83-2c42e066d7ed
8d074acc-1d1e-4be7-8082-6f7a3b2a37ba	56d64848-6fe4-40b6-9d72-18a206da6562
3a041235-6c8c-45fa-9370-74de42faa31e	56d64848-6fe4-40b6-9d72-18a206da6562
30d1a342-c192-41ac-aea2-b2f234b31aae	9e83bd19-bb8b-4247-bc5f-98e5390932a6
83d3c062-8ab6-4538-9d87-3088ab618a31	41ed930e-fdde-455c-b75f-305ff5c59d7c
83d3c062-8ab6-4538-9d87-3088ab618a31	747633f6-9821-4db8-81b5-cf2374cf773e
5e045d21-9f73-4088-abd6-4130e31d87fe	2054bb43-179d-42d6-b601-31eb342745a9
c88cfb8e-f11d-4bef-abb0-8fba9ab51474	6f500bde-c229-48d8-9a48-6d38f2ce7191
\.


--
-- Name: equipe_supertactiques_supertactique PK_009086093771c29b1e3a9023421; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_supertactiques_supertactique
    ADD CONSTRAINT "PK_009086093771c29b1e3a9023421" PRIMARY KEY ("equipeId", "supertactiqueId");


--
-- Name: equipe_joueurs_personnage PK_0b261233aef499269b1c118e100; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_joueurs_personnage
    ADD CONSTRAINT "PK_0b261233aef499269b1c118e100" PRIMARY KEY ("equipeId", "personnageId");


--
-- Name: episode_supertactiques_supertactique PK_0f97f4e4c1160df895d130f8856; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.episode_supertactiques_supertactique
    ADD CONSTRAINT "PK_0f97f4e4c1160df895d130f8856" PRIMARY KEY ("episodeId", "supertactiqueId");


--
-- Name: supertactique_episodes_episode PK_161b91ede2ec576b6323eb13520; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.supertactique_episodes_episode
    ADD CONSTRAINT "PK_161b91ede2ec576b6323eb13520" PRIMARY KEY ("supertactiqueId", "episodeId");


--
-- Name: equipe_entraineur_personnage PK_23d14f4a4fe4dd0c183c2e59dce; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_entraineur_personnage
    ADD CONSTRAINT "PK_23d14f4a4fe4dd0c183c2e59dce" PRIMARY KEY ("equipeId", "personnageId");


--
-- Name: episode_supertechniques_supertechnique PK_2b20a09f404f20de32d0af94a34; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.episode_supertechniques_supertechnique
    ADD CONSTRAINT "PK_2b20a09f404f20de32d0af94a34" PRIMARY KEY ("episodeId", "supertechniqueId");


--
-- Name: personnage_equipes_equipe PK_36bb26393f2cfa3559bac162f36; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.personnage_equipes_equipe
    ADD CONSTRAINT "PK_36bb26393f2cfa3559bac162f36" PRIMARY KEY ("personnageId", "equipeId");


--
-- Name: episode_equipes_equipe PK_490dc78cd6c84b5129b9199fbdd; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.episode_equipes_equipe
    ADD CONSTRAINT "PK_490dc78cd6c84b5129b9199fbdd" PRIMARY KEY ("episodeId", "equipeId");


--
-- Name: supertechnique_episodes_episode PK_55e9e7eb20a6a9e91c03be324b7; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.supertechnique_episodes_episode
    ADD CONSTRAINT "PK_55e9e7eb20a6a9e91c03be324b7" PRIMARY KEY ("supertechniqueId", "episodeId");


--
-- Name: image_equipe_equipe PK_563d17c2b75d3b068d529fc8aca; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.image_equipe_equipe
    ADD CONSTRAINT "PK_563d17c2b75d3b068d529fc8aca" PRIMARY KEY ("imageId", "equipeId");


--
-- Name: equipe_episodes_episode PK_59b613cde326ece03d4b7d9c48d; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_episodes_episode
    ADD CONSTRAINT "PK_59b613cde326ece03d4b7d9c48d" PRIMARY KEY ("equipeId", "episodeId");


--
-- Name: supertactique_matchs_match PK_71c92a0708247d96736df796152; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.supertactique_matchs_match
    ADD CONSTRAINT "PK_71c92a0708247d96736df796152" PRIMARY KEY ("supertactiqueId", "matchId");


--
-- Name: image_personnages_personnage PK_71ea614a8ef59991591686e1fd1; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.image_personnages_personnage
    ADD CONSTRAINT "PK_71ea614a8ef59991591686e1fd1" PRIMARY KEY ("imageId", "personnageId");


--
-- Name: episode PK_7258b95d6d2bf7f621845a0e143; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.episode
    ADD CONSTRAINT "PK_7258b95d6d2bf7f621845a0e143" PRIMARY KEY (id);


--
-- Name: supertechnique PK_7331830ab694590496d989204ff; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.supertechnique
    ADD CONSTRAINT "PK_7331830ab694590496d989204ff" PRIMARY KEY (id);


--
-- Name: supertechnique_equipes_equipe PK_81336162a682aa345f7fc0aec61; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.supertechnique_equipes_equipe
    ADD CONSTRAINT "PK_81336162a682aa345f7fc0aec61" PRIMARY KEY ("supertechniqueId", "equipeId");


--
-- Name: match_supertechniques_supertechnique PK_851aa409e0fe4cd64e813a98e7c; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.match_supertechniques_supertechnique
    ADD CONSTRAINT "PK_851aa409e0fe4cd64e813a98e7c" PRIMARY KEY ("matchId", "supertechniqueId");


--
-- Name: serie PK_8c8f5d9ab9991a8b07a7b2726fa; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.serie
    ADD CONSTRAINT "PK_8c8f5d9ab9991a8b07a7b2726fa" PRIMARY KEY (id);


--
-- Name: equipe_images_image PK_8f062f232d33016af3ad94921b8; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_images_image
    ADD CONSTRAINT "PK_8f062f232d33016af3ad94921b8" PRIMARY KEY ("equipeId", "imageId");


--
-- Name: equipe_manageurs_personnage PK_9128173eee375b03745b528ee6d; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_manageurs_personnage
    ADD CONSTRAINT "PK_9128173eee375b03745b528ee6d" PRIMARY KEY ("equipeId", "personnageId");


--
-- Name: match PK_92b6c3a6631dd5b24a67c69f69d; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT "PK_92b6c3a6631dd5b24a67c69f69d" PRIMARY KEY (id);


--
-- Name: personnage_episode_episode PK_ad0f8d355478b3b1af7cbc86918; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.personnage_episode_episode
    ADD CONSTRAINT "PK_ad0f8d355478b3b1af7cbc86918" PRIMARY KEY ("personnageId", "episodeId");


--
-- Name: equipe_matchs_match PK_b3758ffdd206fec2e91ed32a615; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_matchs_match
    ADD CONSTRAINT "PK_b3758ffdd206fec2e91ed32a615" PRIMARY KEY ("equipeId", "matchId");


--
-- Name: personnage PK_b4af79392773d4a3be881c8575e; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.personnage
    ADD CONSTRAINT "PK_b4af79392773d4a3be881c8575e" PRIMARY KEY (id);


--
-- Name: supertechnique_matchs_match PK_b66bc30f087350281d2e40ce5fb; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.supertechnique_matchs_match
    ADD CONSTRAINT "PK_b66bc30f087350281d2e40ce5fb" PRIMARY KEY ("supertechniqueId", "matchId");


--
-- Name: episode_personnages_personnage PK_ba284cf3c964655a12582640aba; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.episode_personnages_personnage
    ADD CONSTRAINT "PK_ba284cf3c964655a12582640aba" PRIMARY KEY ("episodeId", "personnageId");


--
-- Name: equipe_capitaines_personnage PK_c9a06db4c4f6f58446d77091d3d; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_capitaines_personnage
    ADD CONSTRAINT "PK_c9a06db4c4f6f58446d77091d3d" PRIMARY KEY ("equipeId", "personnageId");


--
-- Name: episode_matchs_match PK_ce05c3698b5d8c8370f69840725; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.episode_matchs_match
    ADD CONSTRAINT "PK_ce05c3698b5d8c8370f69840725" PRIMARY KEY ("episodeId", "matchId");


--
-- Name: personnage_supertechniques_supertechnique PK_d6a15eac3deb392d059a3e3a0f3; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.personnage_supertechniques_supertechnique
    ADD CONSTRAINT "PK_d6a15eac3deb392d059a3e3a0f3" PRIMARY KEY ("personnageId", "supertechniqueId");


--
-- Name: image PK_d6db1ab4ee9ad9dbe86c64e4cc3; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT "PK_d6db1ab4ee9ad9dbe86c64e4cc3" PRIMARY KEY (id);


--
-- Name: match_episodes_episode PK_d8b13787e790571f96373bb8469; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.match_episodes_episode
    ADD CONSTRAINT "PK_d8b13787e790571f96373bb8469" PRIMARY KEY ("matchId", "episodeId");


--
-- Name: supertactique PK_e771138928044381235aa2b43a7; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.supertactique
    ADD CONSTRAINT "PK_e771138928044381235aa2b43a7" PRIMARY KEY (id);


--
-- Name: supertactique_equipes_equipe PK_ee4b9dd0426fde69d6fb15586ba; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.supertactique_equipes_equipe
    ADD CONSTRAINT "PK_ee4b9dd0426fde69d6fb15586ba" PRIMARY KEY ("supertactiqueId", "equipeId");


--
-- Name: equipe PK_f2503347d661dac29b5a0035f22; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe
    ADD CONSTRAINT "PK_f2503347d661dac29b5a0035f22" PRIMARY KEY (id);


--
-- Name: personnage_images_image PK_f337627a68be557d9839e0529eb; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.personnage_images_image
    ADD CONSTRAINT "PK_f337627a68be557d9839e0529eb" PRIMARY KEY ("personnageId", "imageId");


--
-- Name: equipe_supertechniques_supertechnique PK_f430a31ffff63c1badc2756c7cc; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_supertechniques_supertechnique
    ADD CONSTRAINT "PK_f430a31ffff63c1badc2756c7cc" PRIMARY KEY ("equipeId", "supertechniqueId");


--
-- Name: supertechnique_personnages_personnage PK_f866e2d2b2fc09e28f8069c6995; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.supertechnique_personnages_personnage
    ADD CONSTRAINT "PK_f866e2d2b2fc09e28f8069c6995" PRIMARY KEY ("supertechniqueId", "personnageId");


--
-- Name: match_supertactiques_supertactique PK_fb867df048d8c0993093e09d80e; Type: CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.match_supertactiques_supertactique
    ADD CONSTRAINT "PK_fb867df048d8c0993093e09d80e" PRIMARY KEY ("matchId", "supertactiqueId");


--
-- Name: IDX_0b0729938cb3331c347051d98d; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_0b0729938cb3331c347051d98d" ON public.supertactique_equipes_equipe USING btree ("supertactiqueId");


--
-- Name: IDX_0d8573e59f1807a4f3f1117469; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_0d8573e59f1807a4f3f1117469" ON public.personnage_equipes_equipe USING btree ("personnageId");


--
-- Name: IDX_0f8b9de5f8b832f9bf24540af6; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_0f8b9de5f8b832f9bf24540af6" ON public.match_episodes_episode USING btree ("matchId");


--
-- Name: IDX_0fa8588f793f97a74e97ac9f17; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_0fa8588f793f97a74e97ac9f17" ON public.supertechnique_equipes_equipe USING btree ("supertechniqueId");


--
-- Name: IDX_0ffdbff034298d8e5479957994; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_0ffdbff034298d8e5479957994" ON public.equipe_manageurs_personnage USING btree ("equipeId");


--
-- Name: IDX_126ce62685ee79ccbb4db72b24; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_126ce62685ee79ccbb4db72b24" ON public.equipe_supertechniques_supertechnique USING btree ("supertechniqueId");


--
-- Name: IDX_18305d7d38bcf653cea505dd2f; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_18305d7d38bcf653cea505dd2f" ON public.match_supertactiques_supertactique USING btree ("supertactiqueId");


--
-- Name: IDX_1f9eb7fd8f5319c08e842b4a10; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_1f9eb7fd8f5319c08e842b4a10" ON public.episode_matchs_match USING btree ("episodeId");


--
-- Name: IDX_264a6df156e1c89cd2269f0f4b; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_264a6df156e1c89cd2269f0f4b" ON public.equipe_capitaines_personnage USING btree ("personnageId");


--
-- Name: IDX_268221031809e00d363d1b021c; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_268221031809e00d363d1b021c" ON public.match_supertechniques_supertechnique USING btree ("matchId");


--
-- Name: IDX_271c5041971e95c7b1edbeaae3; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_271c5041971e95c7b1edbeaae3" ON public.equipe_matchs_match USING btree ("equipeId");


--
-- Name: IDX_2d85efa67ececda7deb189b8c5; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_2d85efa67ececda7deb189b8c5" ON public.image_equipe_equipe USING btree ("equipeId");


--
-- Name: IDX_2f652a4fdb1b755671da2c15bf; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_2f652a4fdb1b755671da2c15bf" ON public.match_supertechniques_supertechnique USING btree ("supertechniqueId");


--
-- Name: IDX_2fc19a6e42f2e19a4e22454df8; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_2fc19a6e42f2e19a4e22454df8" ON public.episode_equipes_equipe USING btree ("episodeId");


--
-- Name: IDX_3214c1673fa9069f27033504b0; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_3214c1673fa9069f27033504b0" ON public.episode_personnages_personnage USING btree ("episodeId");


--
-- Name: IDX_3c145b31bc7ddf267d8f7eec63; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_3c145b31bc7ddf267d8f7eec63" ON public.equipe_images_image USING btree ("equipeId");


--
-- Name: IDX_3f26f63e5fda6a8b2e91259198; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_3f26f63e5fda6a8b2e91259198" ON public.supertactique_episodes_episode USING btree ("episodeId");


--
-- Name: IDX_4711ff6a602d18020625dded5f; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_4711ff6a602d18020625dded5f" ON public.supertechnique_personnages_personnage USING btree ("personnageId");


--
-- Name: IDX_5217a3712925195bbe860f81b1; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_5217a3712925195bbe860f81b1" ON public.supertactique_matchs_match USING btree ("matchId");


--
-- Name: IDX_55f21626ecfb57d24aff6a250e; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_55f21626ecfb57d24aff6a250e" ON public.supertactique_equipes_equipe USING btree ("equipeId");


--
-- Name: IDX_65a015c61277848942bbe7cef5; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_65a015c61277848942bbe7cef5" ON public.equipe_supertactiques_supertactique USING btree ("supertactiqueId");


--
-- Name: IDX_69ebef00b91ae49a5534d194ce; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_69ebef00b91ae49a5534d194ce" ON public.episode_supertechniques_supertechnique USING btree ("episodeId");


--
-- Name: IDX_6d776db9d0c5a2fa8a045b8510; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_6d776db9d0c5a2fa8a045b8510" ON public.equipe_joueurs_personnage USING btree ("personnageId");


--
-- Name: IDX_7cf5c17d841cafdce31717aace; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_7cf5c17d841cafdce31717aace" ON public.image_equipe_equipe USING btree ("imageId");


--
-- Name: IDX_7decced9a41de9899cf25a2ccf; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_7decced9a41de9899cf25a2ccf" ON public.equipe_episodes_episode USING btree ("equipeId");


--
-- Name: IDX_8091f1dc5894e64a5060ea7c27; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_8091f1dc5894e64a5060ea7c27" ON public.equipe_capitaines_personnage USING btree ("equipeId");


--
-- Name: IDX_84ebf0be83e03bd6c620711626; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_84ebf0be83e03bd6c620711626" ON public.supertactique_episodes_episode USING btree ("supertactiqueId");


--
-- Name: IDX_8577d47e5715c850148df12f56; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_8577d47e5715c850148df12f56" ON public.episode_supertactiques_supertactique USING btree ("episodeId");


--
-- Name: IDX_8d7f508752e7b9e29b58302480; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_8d7f508752e7b9e29b58302480" ON public.episode_equipes_equipe USING btree ("equipeId");


--
-- Name: IDX_8dc90b2ded9fa085fe5b5da5ac; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_8dc90b2ded9fa085fe5b5da5ac" ON public.supertechnique_personnages_personnage USING btree ("supertechniqueId");


--
-- Name: IDX_9556dcf4afd2014ddf3e9f9e5f; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_9556dcf4afd2014ddf3e9f9e5f" ON public.personnage_supertechniques_supertechnique USING btree ("personnageId");


--
-- Name: IDX_962353c8b256c9945eadff2f3d; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_962353c8b256c9945eadff2f3d" ON public.supertactique_matchs_match USING btree ("supertactiqueId");


--
-- Name: IDX_9dbcff677148da6612c8de5d16; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_9dbcff677148da6612c8de5d16" ON public.supertechnique_episodes_episode USING btree ("supertechniqueId");


--
-- Name: IDX_9e92aee85a2e1e372869509fa4; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_9e92aee85a2e1e372869509fa4" ON public.equipe_episodes_episode USING btree ("episodeId");


--
-- Name: IDX_a44251f74ce02c922c4cb77fa1; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_a44251f74ce02c922c4cb77fa1" ON public.equipe_supertechniques_supertechnique USING btree ("equipeId");


--
-- Name: IDX_a7b568b91347f6eadd342cd39e; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_a7b568b91347f6eadd342cd39e" ON public.personnage_episode_episode USING btree ("personnageId");


--
-- Name: IDX_aa9cdb18134ffb09a23e8e1ca9; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_aa9cdb18134ffb09a23e8e1ca9" ON public.personnage_images_image USING btree ("imageId");


--
-- Name: IDX_ae396693a2bd9dafc8dc462be5; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_ae396693a2bd9dafc8dc462be5" ON public.match_episodes_episode USING btree ("episodeId");


--
-- Name: IDX_b0b4d201c57ee7d705cfffd1b8; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_b0b4d201c57ee7d705cfffd1b8" ON public.supertechnique_episodes_episode USING btree ("episodeId");


--
-- Name: IDX_b350c8dcb33044332ed931facb; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_b350c8dcb33044332ed931facb" ON public.image_personnages_personnage USING btree ("personnageId");


--
-- Name: IDX_b4225790b3283a07e9ad0c76fa; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_b4225790b3283a07e9ad0c76fa" ON public.personnage_supertechniques_supertechnique USING btree ("supertechniqueId");


--
-- Name: IDX_b8d441d1211d610cb17b130823; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_b8d441d1211d610cb17b130823" ON public.episode_supertechniques_supertechnique USING btree ("supertechniqueId");


--
-- Name: IDX_b9f5986d289796b76855356495; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_b9f5986d289796b76855356495" ON public.episode_matchs_match USING btree ("matchId");


--
-- Name: IDX_ba9b9b976414e3f81cdeb332d3; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_ba9b9b976414e3f81cdeb332d3" ON public.match_supertactiques_supertactique USING btree ("matchId");


--
-- Name: IDX_bd4e66e596c4b46c81a26602e1; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_bd4e66e596c4b46c81a26602e1" ON public.equipe_images_image USING btree ("imageId");


--
-- Name: IDX_c1dd406e5f0a18e5f7f18c11d0; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_c1dd406e5f0a18e5f7f18c11d0" ON public.personnage_images_image USING btree ("personnageId");


--
-- Name: IDX_c751794280dd9c05468fc8c7f4; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_c751794280dd9c05468fc8c7f4" ON public.personnage_episode_episode USING btree ("episodeId");


--
-- Name: IDX_cbfda60f26b67a79f5e0f15c59; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_cbfda60f26b67a79f5e0f15c59" ON public.personnage_equipes_equipe USING btree ("equipeId");


--
-- Name: IDX_cd38580d7d3f55339b5957f215; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_cd38580d7d3f55339b5957f215" ON public.equipe_supertactiques_supertactique USING btree ("equipeId");


--
-- Name: IDX_ce3c7405733931096c0a40a168; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_ce3c7405733931096c0a40a168" ON public.supertechnique_matchs_match USING btree ("matchId");


--
-- Name: IDX_ce9a6a485267a786ccb9602a81; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_ce9a6a485267a786ccb9602a81" ON public.episode_personnages_personnage USING btree ("personnageId");


--
-- Name: IDX_d750ecd0db5eb29297f8631069; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_d750ecd0db5eb29297f8631069" ON public.episode_supertactiques_supertactique USING btree ("supertactiqueId");


--
-- Name: IDX_dafb9b0c678ff79751d33c7192; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_dafb9b0c678ff79751d33c7192" ON public.equipe_joueurs_personnage USING btree ("equipeId");


--
-- Name: IDX_db7e233d7a3a37adeea3533d64; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_db7e233d7a3a37adeea3533d64" ON public.supertechnique_equipes_equipe USING btree ("equipeId");


--
-- Name: IDX_dfa509e118eb99ae328b955f79; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_dfa509e118eb99ae328b955f79" ON public.equipe_entraineur_personnage USING btree ("equipeId");


--
-- Name: IDX_e2380cb56e69db4039ff591dcc; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_e2380cb56e69db4039ff591dcc" ON public.equipe_matchs_match USING btree ("matchId");


--
-- Name: IDX_e65c3e8b8176fea731e72354a0; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_e65c3e8b8176fea731e72354a0" ON public.supertechnique_matchs_match USING btree ("supertechniqueId");


--
-- Name: IDX_eb8f33ee704c79cb80081a3026; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_eb8f33ee704c79cb80081a3026" ON public.equipe_manageurs_personnage USING btree ("personnageId");


--
-- Name: IDX_f481f6df314bdaae9564f34be9; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_f481f6df314bdaae9564f34be9" ON public.image_personnages_personnage USING btree ("imageId");


--
-- Name: IDX_fe2794e0a95614ed39fce8d060; Type: INDEX; Schema: public; Owner: lora
--

CREATE INDEX "IDX_fe2794e0a95614ed39fce8d060" ON public.equipe_entraineur_personnage USING btree ("personnageId");


--
-- Name: episode FK_06d26c588fe1e692a4c17cd59af; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.episode
    ADD CONSTRAINT "FK_06d26c588fe1e692a4c17cd59af" FOREIGN KEY ("serieId") REFERENCES public.serie(id);


--
-- Name: supertactique_equipes_equipe FK_0b0729938cb3331c347051d98d6; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.supertactique_equipes_equipe
    ADD CONSTRAINT "FK_0b0729938cb3331c347051d98d6" FOREIGN KEY ("supertactiqueId") REFERENCES public.supertactique(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: personnage FK_0d0943b370e0ef1967d591206b3; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.personnage
    ADD CONSTRAINT "FK_0d0943b370e0ef1967d591206b3" FOREIGN KEY ("serieId") REFERENCES public.serie(id);


--
-- Name: personnage_equipes_equipe FK_0d8573e59f1807a4f3f11174698; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.personnage_equipes_equipe
    ADD CONSTRAINT "FK_0d8573e59f1807a4f3f11174698" FOREIGN KEY ("personnageId") REFERENCES public.personnage(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: match_episodes_episode FK_0f8b9de5f8b832f9bf24540af6f; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.match_episodes_episode
    ADD CONSTRAINT "FK_0f8b9de5f8b832f9bf24540af6f" FOREIGN KEY ("matchId") REFERENCES public.match(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: supertechnique_equipes_equipe FK_0fa8588f793f97a74e97ac9f179; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.supertechnique_equipes_equipe
    ADD CONSTRAINT "FK_0fa8588f793f97a74e97ac9f179" FOREIGN KEY ("supertechniqueId") REFERENCES public.supertechnique(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: equipe_manageurs_personnage FK_0ffdbff034298d8e54799579946; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_manageurs_personnage
    ADD CONSTRAINT "FK_0ffdbff034298d8e54799579946" FOREIGN KEY ("equipeId") REFERENCES public.equipe(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: equipe_supertechniques_supertechnique FK_126ce62685ee79ccbb4db72b24f; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_supertechniques_supertechnique
    ADD CONSTRAINT "FK_126ce62685ee79ccbb4db72b24f" FOREIGN KEY ("supertechniqueId") REFERENCES public.supertechnique(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: match FK_1415bf1c45f4074f454654c2fae; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT "FK_1415bf1c45f4074f454654c2fae" FOREIGN KEY ("idEquipe2Id") REFERENCES public.equipe(id);


--
-- Name: match_supertactiques_supertactique FK_18305d7d38bcf653cea505dd2fd; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.match_supertactiques_supertactique
    ADD CONSTRAINT "FK_18305d7d38bcf653cea505dd2fd" FOREIGN KEY ("supertactiqueId") REFERENCES public.supertactique(id);


--
-- Name: episode_matchs_match FK_1f9eb7fd8f5319c08e842b4a107; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.episode_matchs_match
    ADD CONSTRAINT "FK_1f9eb7fd8f5319c08e842b4a107" FOREIGN KEY ("episodeId") REFERENCES public.episode(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: equipe_capitaines_personnage FK_264a6df156e1c89cd2269f0f4bf; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_capitaines_personnage
    ADD CONSTRAINT "FK_264a6df156e1c89cd2269f0f4bf" FOREIGN KEY ("personnageId") REFERENCES public.personnage(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: match_supertechniques_supertechnique FK_268221031809e00d363d1b021c6; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.match_supertechniques_supertechnique
    ADD CONSTRAINT "FK_268221031809e00d363d1b021c6" FOREIGN KEY ("matchId") REFERENCES public.match(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: equipe_matchs_match FK_271c5041971e95c7b1edbeaae3a; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_matchs_match
    ADD CONSTRAINT "FK_271c5041971e95c7b1edbeaae3a" FOREIGN KEY ("equipeId") REFERENCES public.equipe(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: image_equipe_equipe FK_2d85efa67ececda7deb189b8c5e; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.image_equipe_equipe
    ADD CONSTRAINT "FK_2d85efa67ececda7deb189b8c5e" FOREIGN KEY ("equipeId") REFERENCES public.equipe(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: match_supertechniques_supertechnique FK_2f652a4fdb1b755671da2c15bff; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.match_supertechniques_supertechnique
    ADD CONSTRAINT "FK_2f652a4fdb1b755671da2c15bff" FOREIGN KEY ("supertechniqueId") REFERENCES public.supertechnique(id);


--
-- Name: episode_equipes_equipe FK_2fc19a6e42f2e19a4e22454df8b; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.episode_equipes_equipe
    ADD CONSTRAINT "FK_2fc19a6e42f2e19a4e22454df8b" FOREIGN KEY ("episodeId") REFERENCES public.episode(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: episode_personnages_personnage FK_3214c1673fa9069f27033504b09; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.episode_personnages_personnage
    ADD CONSTRAINT "FK_3214c1673fa9069f27033504b09" FOREIGN KEY ("episodeId") REFERENCES public.episode(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: equipe_images_image FK_3c145b31bc7ddf267d8f7eec635; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_images_image
    ADD CONSTRAINT "FK_3c145b31bc7ddf267d8f7eec635" FOREIGN KEY ("equipeId") REFERENCES public.equipe(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: supertactique_episodes_episode FK_3f26f63e5fda6a8b2e91259198b; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.supertactique_episodes_episode
    ADD CONSTRAINT "FK_3f26f63e5fda6a8b2e91259198b" FOREIGN KEY ("episodeId") REFERENCES public.episode(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: supertechnique_personnages_personnage FK_4711ff6a602d18020625dded5f9; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.supertechnique_personnages_personnage
    ADD CONSTRAINT "FK_4711ff6a602d18020625dded5f9" FOREIGN KEY ("personnageId") REFERENCES public.personnage(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: image FK_4ce343c43e60ddc2bf3bb97de68; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT "FK_4ce343c43e60ddc2bf3bb97de68" FOREIGN KEY ("serieId") REFERENCES public.serie(id);


--
-- Name: supertactique_matchs_match FK_5217a3712925195bbe860f81b17; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.supertactique_matchs_match
    ADD CONSTRAINT "FK_5217a3712925195bbe860f81b17" FOREIGN KEY ("matchId") REFERENCES public.match(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: supertactique_equipes_equipe FK_55f21626ecfb57d24aff6a250e6; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.supertactique_equipes_equipe
    ADD CONSTRAINT "FK_55f21626ecfb57d24aff6a250e6" FOREIGN KEY ("equipeId") REFERENCES public.equipe(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: equipe_supertactiques_supertactique FK_65a015c61277848942bbe7cef55; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_supertactiques_supertactique
    ADD CONSTRAINT "FK_65a015c61277848942bbe7cef55" FOREIGN KEY ("supertactiqueId") REFERENCES public.supertactique(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: episode_supertechniques_supertechnique FK_69ebef00b91ae49a5534d194ced; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.episode_supertechniques_supertechnique
    ADD CONSTRAINT "FK_69ebef00b91ae49a5534d194ced" FOREIGN KEY ("episodeId") REFERENCES public.episode(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: equipe_joueurs_personnage FK_6d776db9d0c5a2fa8a045b85104; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_joueurs_personnage
    ADD CONSTRAINT "FK_6d776db9d0c5a2fa8a045b85104" FOREIGN KEY ("personnageId") REFERENCES public.personnage(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: image_equipe_equipe FK_7cf5c17d841cafdce31717aacee; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.image_equipe_equipe
    ADD CONSTRAINT "FK_7cf5c17d841cafdce31717aacee" FOREIGN KEY ("imageId") REFERENCES public.image(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: equipe_episodes_episode FK_7decced9a41de9899cf25a2ccfc; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_episodes_episode
    ADD CONSTRAINT "FK_7decced9a41de9899cf25a2ccfc" FOREIGN KEY ("equipeId") REFERENCES public.equipe(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: match FK_800caf0292c5993aeb53f77098c; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT "FK_800caf0292c5993aeb53f77098c" FOREIGN KEY ("serieId") REFERENCES public.serie(id);


--
-- Name: equipe_capitaines_personnage FK_8091f1dc5894e64a5060ea7c273; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_capitaines_personnage
    ADD CONSTRAINT "FK_8091f1dc5894e64a5060ea7c273" FOREIGN KEY ("equipeId") REFERENCES public.equipe(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: equipe FK_80b4b1dce5c3eee0e8f6284056f; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe
    ADD CONSTRAINT "FK_80b4b1dce5c3eee0e8f6284056f" FOREIGN KEY ("serieId") REFERENCES public.serie(id);


--
-- Name: match FK_81a7d07021f2602b926dc4d623d; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.match
    ADD CONSTRAINT "FK_81a7d07021f2602b926dc4d623d" FOREIGN KEY ("idEquipe1Id") REFERENCES public.equipe(id);


--
-- Name: supertactique_episodes_episode FK_84ebf0be83e03bd6c620711626a; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.supertactique_episodes_episode
    ADD CONSTRAINT "FK_84ebf0be83e03bd6c620711626a" FOREIGN KEY ("supertactiqueId") REFERENCES public.supertactique(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: episode_supertactiques_supertactique FK_8577d47e5715c850148df12f569; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.episode_supertactiques_supertactique
    ADD CONSTRAINT "FK_8577d47e5715c850148df12f569" FOREIGN KEY ("episodeId") REFERENCES public.episode(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: episode_equipes_equipe FK_8d7f508752e7b9e29b583024807; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.episode_equipes_equipe
    ADD CONSTRAINT "FK_8d7f508752e7b9e29b583024807" FOREIGN KEY ("equipeId") REFERENCES public.equipe(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: supertechnique_personnages_personnage FK_8dc90b2ded9fa085fe5b5da5aca; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.supertechnique_personnages_personnage
    ADD CONSTRAINT "FK_8dc90b2ded9fa085fe5b5da5aca" FOREIGN KEY ("supertechniqueId") REFERENCES public.supertechnique(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: personnage_supertechniques_supertechnique FK_9556dcf4afd2014ddf3e9f9e5fc; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.personnage_supertechniques_supertechnique
    ADD CONSTRAINT "FK_9556dcf4afd2014ddf3e9f9e5fc" FOREIGN KEY ("personnageId") REFERENCES public.personnage(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: supertactique_matchs_match FK_962353c8b256c9945eadff2f3d5; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.supertactique_matchs_match
    ADD CONSTRAINT "FK_962353c8b256c9945eadff2f3d5" FOREIGN KEY ("supertactiqueId") REFERENCES public.supertactique(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: supertechnique_episodes_episode FK_9dbcff677148da6612c8de5d16d; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.supertechnique_episodes_episode
    ADD CONSTRAINT "FK_9dbcff677148da6612c8de5d16d" FOREIGN KEY ("supertechniqueId") REFERENCES public.supertechnique(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: equipe_episodes_episode FK_9e92aee85a2e1e372869509fa42; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_episodes_episode
    ADD CONSTRAINT "FK_9e92aee85a2e1e372869509fa42" FOREIGN KEY ("episodeId") REFERENCES public.episode(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: equipe_supertechniques_supertechnique FK_a44251f74ce02c922c4cb77fa1a; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_supertechniques_supertechnique
    ADD CONSTRAINT "FK_a44251f74ce02c922c4cb77fa1a" FOREIGN KEY ("equipeId") REFERENCES public.equipe(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: personnage_episode_episode FK_a7b568b91347f6eadd342cd39ed; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.personnage_episode_episode
    ADD CONSTRAINT "FK_a7b568b91347f6eadd342cd39ed" FOREIGN KEY ("personnageId") REFERENCES public.personnage(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: supertactique FK_a98d15937bb8ee97d69251b8038; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.supertactique
    ADD CONSTRAINT "FK_a98d15937bb8ee97d69251b8038" FOREIGN KEY ("serieId") REFERENCES public.serie(id);


--
-- Name: personnage_images_image FK_aa9cdb18134ffb09a23e8e1ca9a; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.personnage_images_image
    ADD CONSTRAINT "FK_aa9cdb18134ffb09a23e8e1ca9a" FOREIGN KEY ("imageId") REFERENCES public.image(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: match_episodes_episode FK_ae396693a2bd9dafc8dc462be53; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.match_episodes_episode
    ADD CONSTRAINT "FK_ae396693a2bd9dafc8dc462be53" FOREIGN KEY ("episodeId") REFERENCES public.episode(id);


--
-- Name: supertechnique_episodes_episode FK_b0b4d201c57ee7d705cfffd1b83; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.supertechnique_episodes_episode
    ADD CONSTRAINT "FK_b0b4d201c57ee7d705cfffd1b83" FOREIGN KEY ("episodeId") REFERENCES public.episode(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: image_personnages_personnage FK_b350c8dcb33044332ed931facbe; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.image_personnages_personnage
    ADD CONSTRAINT "FK_b350c8dcb33044332ed931facbe" FOREIGN KEY ("personnageId") REFERENCES public.personnage(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: personnage_supertechniques_supertechnique FK_b4225790b3283a07e9ad0c76faf; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.personnage_supertechniques_supertechnique
    ADD CONSTRAINT "FK_b4225790b3283a07e9ad0c76faf" FOREIGN KEY ("supertechniqueId") REFERENCES public.supertechnique(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: episode_supertechniques_supertechnique FK_b8d441d1211d610cb17b1308239; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.episode_supertechniques_supertechnique
    ADD CONSTRAINT "FK_b8d441d1211d610cb17b1308239" FOREIGN KEY ("supertechniqueId") REFERENCES public.supertechnique(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: episode_matchs_match FK_b9f5986d289796b76855356495a; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.episode_matchs_match
    ADD CONSTRAINT "FK_b9f5986d289796b76855356495a" FOREIGN KEY ("matchId") REFERENCES public.match(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: match_supertactiques_supertactique FK_ba9b9b976414e3f81cdeb332d32; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.match_supertactiques_supertactique
    ADD CONSTRAINT "FK_ba9b9b976414e3f81cdeb332d32" FOREIGN KEY ("matchId") REFERENCES public.match(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: equipe_images_image FK_bd4e66e596c4b46c81a26602e16; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_images_image
    ADD CONSTRAINT "FK_bd4e66e596c4b46c81a26602e16" FOREIGN KEY ("imageId") REFERENCES public.image(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: supertechnique FK_bde89eaaf9296c3446caa0c91a2; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.supertechnique
    ADD CONSTRAINT "FK_bde89eaaf9296c3446caa0c91a2" FOREIGN KEY ("serieId") REFERENCES public.serie(id);


--
-- Name: image FK_c009c4ddd5dc87f7795a4465a0f; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT "FK_c009c4ddd5dc87f7795a4465a0f" FOREIGN KEY ("episodeId") REFERENCES public.episode(id);


--
-- Name: personnage_images_image FK_c1dd406e5f0a18e5f7f18c11d0d; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.personnage_images_image
    ADD CONSTRAINT "FK_c1dd406e5f0a18e5f7f18c11d0d" FOREIGN KEY ("personnageId") REFERENCES public.personnage(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: personnage_episode_episode FK_c751794280dd9c05468fc8c7f4a; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.personnage_episode_episode
    ADD CONSTRAINT "FK_c751794280dd9c05468fc8c7f4a" FOREIGN KEY ("episodeId") REFERENCES public.episode(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: personnage_equipes_equipe FK_cbfda60f26b67a79f5e0f15c59f; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.personnage_equipes_equipe
    ADD CONSTRAINT "FK_cbfda60f26b67a79f5e0f15c59f" FOREIGN KEY ("equipeId") REFERENCES public.equipe(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: equipe_supertactiques_supertactique FK_cd38580d7d3f55339b5957f2157; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_supertactiques_supertactique
    ADD CONSTRAINT "FK_cd38580d7d3f55339b5957f2157" FOREIGN KEY ("equipeId") REFERENCES public.equipe(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: supertechnique_matchs_match FK_ce3c7405733931096c0a40a1682; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.supertechnique_matchs_match
    ADD CONSTRAINT "FK_ce3c7405733931096c0a40a1682" FOREIGN KEY ("matchId") REFERENCES public.match(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: episode_personnages_personnage FK_ce9a6a485267a786ccb9602a817; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.episode_personnages_personnage
    ADD CONSTRAINT "FK_ce9a6a485267a786ccb9602a817" FOREIGN KEY ("personnageId") REFERENCES public.personnage(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: episode_supertactiques_supertactique FK_d750ecd0db5eb29297f8631069c; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.episode_supertactiques_supertactique
    ADD CONSTRAINT "FK_d750ecd0db5eb29297f8631069c" FOREIGN KEY ("supertactiqueId") REFERENCES public.supertactique(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: equipe_joueurs_personnage FK_dafb9b0c678ff79751d33c7192b; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_joueurs_personnage
    ADD CONSTRAINT "FK_dafb9b0c678ff79751d33c7192b" FOREIGN KEY ("equipeId") REFERENCES public.equipe(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: supertechnique_equipes_equipe FK_db7e233d7a3a37adeea3533d641; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.supertechnique_equipes_equipe
    ADD CONSTRAINT "FK_db7e233d7a3a37adeea3533d641" FOREIGN KEY ("equipeId") REFERENCES public.equipe(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: equipe_entraineur_personnage FK_dfa509e118eb99ae328b955f79a; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_entraineur_personnage
    ADD CONSTRAINT "FK_dfa509e118eb99ae328b955f79a" FOREIGN KEY ("equipeId") REFERENCES public.equipe(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: equipe_matchs_match FK_e2380cb56e69db4039ff591dcce; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_matchs_match
    ADD CONSTRAINT "FK_e2380cb56e69db4039ff591dcce" FOREIGN KEY ("matchId") REFERENCES public.match(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: supertechnique_matchs_match FK_e65c3e8b8176fea731e72354a0f; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.supertechnique_matchs_match
    ADD CONSTRAINT "FK_e65c3e8b8176fea731e72354a0f" FOREIGN KEY ("supertechniqueId") REFERENCES public.supertechnique(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: equipe_manageurs_personnage FK_eb8f33ee704c79cb80081a30260; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_manageurs_personnage
    ADD CONSTRAINT "FK_eb8f33ee704c79cb80081a30260" FOREIGN KEY ("personnageId") REFERENCES public.personnage(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: image_personnages_personnage FK_f481f6df314bdaae9564f34be99; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.image_personnages_personnage
    ADD CONSTRAINT "FK_f481f6df314bdaae9564f34be99" FOREIGN KEY ("imageId") REFERENCES public.image(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: equipe_entraineur_personnage FK_fe2794e0a95614ed39fce8d060c; Type: FK CONSTRAINT; Schema: public; Owner: lora
--

ALTER TABLE ONLY public.equipe_entraineur_personnage
    ADD CONSTRAINT "FK_fe2794e0a95614ed39fce8d060c" FOREIGN KEY ("personnageId") REFERENCES public.personnage(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

