/* SPECTACLE VIVANT V1.0 */
/* Creation de la structure des données (schéma, tables, séquences, triggers,...) */
/* spectacle_vivant_10_structure.sql */
/* PostgreSQL/PostGIS */
/* Conseil régional Nouvelle-Aquitaine - https://cartographie.nouvelle-aquitaine.fr/ */
/* Auteur : Tony VINCENT */

------------------------------------------------------------------------ 
-- Schéma : Création du schéma
------------------------------------------------------------------------

-- Schema: met_eco
CREATE SCHEMA IF NOT EXISTS met_cul_test;

--
COMMENT ON SCHEMA met_cul_test IS 'Schéma pour les données métiers sur la culture';


------------------------------------------------------------------------ 
-- Tables : Création des tables
------------------------------------------------------------------------

-------------------------------------------------------
-- Table: met_cul_test.m_cul_spect_vivant_lt_src_geom
-- DROP TABLE met_cul_test.m_cul_spect_vivant_lt_src_geom;
CREATE TABLE met_cul_test.m_cul_spect_vivant_lt_src_geom
(
  code character varying(2) NOT NULL, -- Code de la liste énumérée relative au type de référentiel géométrique
  valeur character varying(254) NOT NULL, -- Valeur de la liste énumérée relative au type de référentiel géométrique
  CONSTRAINT lt_src_geom_pkey PRIMARY KEY (code)
);

-- Droits
GRANT SELECT ON TABLE met_cul_test.m_cul_spect_vivant_lt_src_geom TO "pre-sig-usr";

-- Commentaires
COMMENT ON TABLE met_cul_test.m_cul_spect_vivant_lt_src_geom IS 'Code permettant de décrire le type de référentiel géométrique';
COMMENT ON COLUMN met_cul_test.m_cul_spect_vivant_lt_src_geom.code IS 'Code de la liste énumérée relative au type de référentiel géométrique';
COMMENT ON COLUMN met_cul_test.m_cul_spect_vivant_lt_src_geom.valeur IS 'Valeur de la liste énumérée relative au type de référentiel géométrique';
-- 
INSERT INTO met_cul_test.m_cul_spect_vivant_lt_src_geom(code, valeur)
VALUES
    ('10', 'Cadastre'),
    ('11', 'PCI vecteur'),
    ('12', 'BD Parcellaire'),
    ('13', 'RPCU'),
    ('20', 'Ortho-images'),
    ('21', 'Orthophotoplan IGN'),
    ('22', 'Orthophotoplan partenaire'),
    ('23', 'Orthophotoplan local'),
    ('30', 'Filaire voirie'),
    ('31', 'Route BDTopo'),
    ('32', 'Route OSM'),
    ('40', 'Cartes'),
    ('41', 'Scan25'),
    ('50', 'Lever'),
    ('51', 'Plan topographique'),
    ('52', 'PCRS'),
    ('53', 'Trace GPS'),
    ('60', 'Geocodage'),
    ('61', 'Base Adresse Locale'),
    ('70', 'Plan masse'),
    ('71', 'Plan masse vectoriel'),
    ('72', 'Plan masse redessiné'),
    ('80', 'Thématique'),
    ('81', 'Document d''urbanisme'),
    ('82', 'Occupation du Sol'),
    ('83', 'Thèmes BDTopo'),
    ('99', 'Autre'),
    ('00', 'Non renseigné');
  

------------------------------------------------------------------------
-- Table: met_cul_test.m_cul_spect_vivant_lt_annee

-- DROP TABLE met_cul_test.m_cul_spect_vivant_lt_annee;
 CREATE TABLE met_cul_test.m_cul_spect_vivant_lt_annee(
   id serial NOT NULL,
   annee VARCHAR(4),
   CONSTRAINT lt_annee_pkey PRIMARY KEY (id),
   CONSTRAINT lt_annee_uniq UNIQUE (annee)
);

-- Commentaires
COMMENT ON TABLE met_cul_test.m_cul_spect_vivant_lt_annee IS 'Table contenant la liste de valeurs des années de référence';

-- Droits
GRANT ALL ON TABLE met_cul_test.m_cul_spect_vivant_lt_annee TO "pre-sig-usr";

-- Ajouter des données
INSERT INTO met_cul_test.m_cul_spect_vivant_lt_annee (annee) 
VALUES ('2019'), ('2020');


------------------------------------------------------------------------
-- Table: met_cul.m_cul_spect_vivant_lt_rayonnement_aide

-- DROP TABLE met_cul.m_cul_spect_vivant_lt_rayonnement_aide;
CREATE TABLE met_cul.m_cul_spect_vivant_lt_rayonnement_aide (
	id serial NOT NULL,
	code varchar(3) NOT NULL,
	libelle varchar(150) NOT NULL,
	CONSTRAINT lt_type_localisation_pkey PRIMARY KEY (id),
	CONSTRAINT lt_type_localisation_uniq UNIQUE (code)
);
COMMENT ON TABLE met_cul.m_cul_spect_vivant_lt_rayonnement_aide IS 'Table contenant la liste de valeurs du rayonnement de l''aide';

-- Permissions
ALTER TABLE met_cul.m_cul_spect_vivant_lt_rayonnement_aide OWNER TO "pre-sig-usr";
GRANT ALL ON TABLE met_cul.m_cul_spect_vivant_lt_rayonnement_aide TO "pre-sig-usr";

-- Ajouter  des données
INSERT INTO met_cul.m_cul_spect_vivant_lt_rayonnement_aide (code, libelle) VALUES('00', 'non renseigné');
INSERT INTO met_cul.m_cul_spect_vivant_lt_rayonnement_aide (code, libelle) VALUES('01', 'lieu fermé');
INSERT INTO met_cul.m_cul_spect_vivant_lt_rayonnement_aide (code, libelle) VALUES('02', 'plutôt urbain');
INSERT INTO met_cul.m_cul_spect_vivant_lt_rayonnement_aide (code, libelle) VALUES('03', 'plutôt "bassin de vie"');
INSERT INTO met_cul.m_cul_spect_vivant_lt_rayonnement_aide (code, libelle) VALUES('04', 'plutôt local');
INSERT INTO met_cul.m_cul_spect_vivant_lt_rayonnement_aide (code, libelle) VALUES('05', 'rayon d''env. 20km');
INSERT INTO met_cul.m_cul_spect_vivant_lt_rayonnement_aide (code, libelle) VALUES('99', 'non renseigné');


---------------------------------------------------------------
-- DROP TABLE met_cul.m_cul_spect_vivant_lt_type_localisation;
CREATE TABLE met_cul.m_cul_spect_vivant_lt_type_localisation (
	id serial NOT NULL,
	code varchar(3) NOT NULL,
	libelle varchar(150) NOT NULL,
	CONSTRAINT lt_type_localisation_pkey PRIMARY KEY (id),
	CONSTRAINT lt_type_localisation_uniq UNIQUE (code)
);
COMMENT ON TABLE met_cul.m_cul_spect_vivant_lt_type_localisation IS 'Table contenant la liste de valeurs des dispositifs';

-- Permissions
ALTER TABLE met_cul.m_cul_spect_vivant_lt_type_localisation OWNER TO "pre-sig-usr";
GRANT ALL ON TABLE met_cul.m_cul_spect_vivant_lt_type_localisation TO "pre-sig-usr";


---------------------------------------------------------------
-- DROP TABLE met_cul.m_cul_spect_vivant_lt_dispositif;
CREATE TABLE met_cul.m_cul_spect_vivant_lt_dispositif (
	id serial NOT NULL,
	code varchar(3) NOT NULL,
	libelle varchar(150) NOT NULL,
	CONSTRAINT lt_dispositif_pkey PRIMARY KEY (id),
	CONSTRAINT lt_dispositif_uniq UNIQUE (code)
);
COMMENT ON TABLE met_cul.m_cul_spect_vivant_lt_dispositif IS 'Table contenant la liste de valeurs des dispositifs';

-- Permissions
ALTER TABLE met_cul.m_cul_spect_vivant_lt_dispositif OWNER TO "pre-sig-usr";
GRANT ALL ON TABLE met_cul.m_cul_spect_vivant_lt_dispositif TO "pre-sig-usr";

-- Ajouter des données
INSERT INTO met_cul.m_cul_spect_vivant_lt_dispositif (code, libelle) VALUES('00', 'Non renseigné');
INSERT INTO met_cul.m_cul_spect_vivant_lt_dispositif (code, libelle) VALUES('d1', 'Soutien équipes');
INSERT INTO met_cul.m_cul_spect_vivant_lt_dispositif (code, libelle) VALUES('d2', 'Soutien lieux de fab');
INSERT INTO met_cul.m_cul_spect_vivant_lt_dispositif (code, libelle) VALUES('d3', 'Soutien labels');
INSERT INTO met_cul.m_cul_spect_vivant_lt_dispositif (code, libelle) VALUES('d4', 'Soutien scènes & saisons');
INSERT INTO met_cul.m_cul_spect_vivant_lt_dispositif (code, libelle) VALUES('d5', 'Soutien orchestres');
INSERT INTO met_cul.m_cul_spect_vivant_lt_dispositif (code, libelle) VALUES('99', 'Autre');


---------------------------------------------------------------
-- DROP TABLE met_cul.m_cul_spect_vivant_lt_direction;
CREATE TABLE met_cul.m_cul_spect_vivant_lt_direction (
	id serial NOT NULL,
	code varchar(3) NOT NULL,
	libelle varchar(150) NOT NULL,
	CONSTRAINT lt_direction_pkey PRIMARY KEY (id),
	CONSTRAINT lt_direction_uniq UNIQUE (code)
);
COMMENT ON TABLE met_cul.m_cul_spect_vivant_lt_direction IS 'Table contenant la liste de valeurs des types de direction';

-- Permissions
ALTER TABLE met_cul.m_cul_spect_vivant_lt_direction OWNER TO "pre-sig-usr";
GRANT ALL ON TABLE met_cul.m_cul_spect_vivant_lt_direction TO "pre-sig-usr";

-- Ajouter des données
INSERT INTO met_cul.m_cul_spect_vivant_lt_direction (code, libelle) VALUES('00', 'Non renseigné');
INSERT INTO met_cul.m_cul_spect_vivant_lt_direction (code, libelle) VALUES('01', 'F');
INSERT INTO met_cul.m_cul_spect_vivant_lt_direction (code, libelle) VALUES('02', 'H');
INSERT INTO met_cul.m_cul_spect_vivant_lt_direction (code, libelle) VALUES('03', 'Paritaire');
INSERT INTO met_cul.m_cul_spect_vivant_lt_direction (code, libelle) VALUES('04', 'Collectif Femmes');
INSERT INTO met_cul.m_cul_spect_vivant_lt_direction (code, libelle) VALUES('05', 'Collectif Hommes');
INSERT INTO met_cul.m_cul_spect_vivant_lt_direction (code, libelle) VALUES('06', '/');
INSERT INTO met_cul.m_cul_spect_vivant_lt_direction (code, libelle) VALUES('99', 'Autre');


CREATE TABLE structure_p_geo(
   id VARCHAR(50),
   siret VARCHAR(15) NOT NULL,
   geom VARCHAR(50),
   localisation_valide LOGICAL,
   id_1 VARCHAR(50) NOT NULL,
   id_2 VARCHAR(50) NOT NULL,
   id_3 VARCHAR(50) NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(id_3),
   UNIQUE(siret),
   FOREIGN KEY(id_1) REFERENCES lt_src_geom(id),
   FOREIGN KEY(id_2) REFERENCES lt_type_localisation(id),
   FOREIGN KEY(id_3) REFERENCES structure(id)
);


---------------------------------------------------------------
-- DROP TABLE IF EXISTS met_cul_test.m_cul_spect_vivant_structure_p_geo;
CREATE TABLE met_cul_test.m_cul_spect_vivant_structure_p_geo (
	id serial NOT NULL,
	siret varchar(15) NOT NULL,
	nom varchar NOT NULL,
	localisation_valide bool NOT NULL DEFAULT false,
	date_creation timestamp NOT NULL DEFAULT now(),
	date_actualisation timestamp NULL,
	geom geometry(POINT, 2154) NULL,
	src_geom_code varchar(2) NOT NULL DEFAULT '00',
	type_localisation_code varchar(3) NOT NULL DEFAULT '00',
	CONSTRAINT structure_p_geo_pkey PRIMARY KEY (id),
	CONSTRAINT structure_p_geo_uniq UNIQUE (siret, nom),
	CONSTRAINT structure_p_geo_src_geom_fk FOREIGN KEY (src_geom_code) REFERENCES met_cul_test.m_cul_spect_vivant_lt_src_geom(code),
	CONSTRAINT structure_p_geo_t_localisation_fk FOREIGN KEY (type_localisation_code) REFERENCES met_cul_test.m_cul_spect_vivant_lt_type_localisation(code),
	CONSTRAINT structure_p_geo_structure_fk FOREIGN KEY (siret, nom) REFERENCES met_cul_test.m_cul_spect_vivant_structure(siret, nom)
);
COMMENT ON TABLE met_cul_test.m_cul_spect_vivant_structure_p_geo IS 'Table contenant la géometrie des structures du spectacle vivant';

-- Droits
ALTER TABLE met_cul_test.m_cul_spect_vivant_structure_p_geo OWNER TO "pre-sig-usr";

-- Ajouter des données
INSERT INTO met_cul_test.m_cul_spect_vivant_structure_p_geo(
	siret, nom, localisation_valide, date_creation, geom, src_geom_code, type_localisation_code)
SELECT siret, nom, false, now(), (St_Dump(geom)).geom, '60', '00'
FROM met_cul.m_cul_spect_vivant_struct_p
WHERE annee='2019';
	

---------------------------------------------------------------
-- DROP TABLE IF EXISTS met_cul_test.m_cul_spect_vivant_structure;
CREATE TABLE met_cul_test.m_cul_spect_vivant_structure (
	id serial NOT NULL,
	code varchar(15) NULL,
	siret varchar(15) NOT NULL,
	nom varchar NOT NULL,
	nom_cplt varchar NULL,
	code_insee varchar(5) NULL,
	commune varchar(150) NULL,
	adresse varchar NULL,
	adresse_cplt varchar NULL,
	adresse_cedex varchar NULL,
	code_postal varchar(5) NULL,
	ville_cp varchar NULL,
	web varchar NULL,
	commentaire text NULL,
	donnees_valide bool NOT NULL DEFAULT false,
	date_creation timestamp NOT NULL DEFAULT now(),
	date_actualisation timestamp NULL,
	struct_p_geo_siret varchar(15) NULL,
	struct_p_geo_nom varchar NULL,
	CONSTRAINT m_cul_spect_vivant_structure_pkey PRIMARY KEY (id),
	CONSTRAINT m_cul_spect_vivant_structure_uniq UNIQUE (siret, nom),
	CONSTRAINT positionner_structure_p_geom_fk FOREIGN KEY (struct_p_geo_siret, struct_p_geo_nom) REFERENCES met_cul_test.m_cul_spect_vivant_structure_p_geo(siret, nom)
);
COMMENT ON TABLE met_cul.m_cul_spect_vivant_structure IS 'Contient les structures de Nouvelle-Aquitaine intervenant dans le spectacle vivant (Point)';

-- Column comments
COMMENT ON COLUMN met_cul.m_cul_spect_vivant_structure.code IS 'Code de la structure';
COMMENT ON COLUMN met_cul.m_cul_spect_vivant_structure.siret IS 'SIRET de la structure';
COMMENT ON COLUMN met_cul.m_cul_spect_vivant_structure.code_insee IS 'Code insee de la commune';
COMMENT ON COLUMN met_cul.m_cul_spect_vivant_structure.commune IS 'Libellé de la commune';
COMMENT ON COLUMN met_cul.m_cul_spect_vivant_structure.adresse IS 'Adresse de la structure';
COMMENT ON COLUMN met_cul.m_cul_spect_vivant_structure.adresse_cplt IS 'Adresse complémentaire de la structure';
COMMENT ON COLUMN met_cul.m_cul_spect_vivant_structure.adresse_cedex IS 'Cedex de l''adresse';
COMMENT ON COLUMN met_cul.m_cul_spect_vivant_structure.code_postal IS 'Code postal de la commune';
COMMENT ON COLUMN met_cul.m_cul_spect_vivant_structure.localisation_pertinence IS 'Pertinence de la localisation';
COMMENT ON COLUMN met_cul.m_cul_spect_vivant_structure.localisation_type IS 'Type de localisation';
COMMENT ON COLUMN met_cul.m_cul_spect_vivant_structure.date_creation IS 'Correspond à la date de saisie de la donnée, valeur non null et par défaut : now()';
COMMENT ON COLUMN met_cul.m_cul_spect_vivant_structure.date_actualisation IS 'Correspond à la date de mise à jour de la donnée, à gérer par un trigger before pour update';
COMMENT ON COLUMN met_cul.m_cul_spect_vivant_structure.geom IS 'Attribut contenant la géométrie';

-- Permissions
ALTER TABLE met_cul.m_cul_spect_vivant_structure OWNER TO "pre-sig-usr";

-- Ajouter des données
INSERT INTO met_cul_test.m_cul_spect_vivant_structure(
	code, siret, nom, nom_cplt, code_insee, commune, adresse, adresse_cplt, adresse_cedex, code_postal, ville_cp, web,
	commentaire, donnees_valide, date_creation, date_actualisation)
SELECT code, siret, nom, nom_cplt, code_insee, commune, adresse, adresse_cplt, adresse_cedex, code_postal, ville_cp, web,
	commentaire, donnees_valide, now(), date_actualisation
FROM met_cul.m_cul_spect_vivant_struct_p
WHERE annee ='2019';

---------------------------------------------------------------
-- DROP TABLE met_cul.m_cul_spect_vivant_detail2;
CREATE TABLE met_cul.m_cul_spect_vivant_detail2 (
	id serial NOT NULL,
	siret varchar(15) NOT NULL,
	nom varchar NULL,
	annee varchar(4) NOT NULL,
	classification varchar(100) NOT NULL,
	categorie varchar(150) NULL,
	categorie_sous_cat_1 varchar(150) NULL,
	categorie_sous_cat_2 varchar(150) NULL,
	esthetique varchar(150) NULL,
	donnees_valide bool NOT NULL DEFAULT false,
	date_creation date NULL,
	date_actualisation date NULL,
	CONSTRAINT m_cul_spect_vivant_detail2_pk PRIMARY KEY (id),
	CONSTRAINT m_cul_spect_vivant_detail2_uniq UNIQUE (siret, nom, annee, classification),
	CONSTRAINT m_cul_spect_vivant_detail2_fk FOREIGN KEY (siret, nom, annee) REFERENCES met_cul.m_cul_spect_vivant_structure_p_geo(siret, nom, annee)
);
COMMENT ON TABLE met_cul.m_cul_spect_vivant_detail2 IS 'Table détaillant les structures du spectacle vivant';

-- Droits
ALTER TABLE met_cul.m_cul_spect_vivant_detail2 OWNER TO "pre-sig-usr";


---------------------------------------------------------------
-- DROP TABLE IF EXISTS met_cul_test.m_cul_spect_vivant_diriger;
CREATE TABLE  met_cul_test.m_cul_spect_vivant_diriger (
	structure_siret varchar(15) NOT NULL,
	structure_nom varchar NOT NULL,
	direction_code varchar(3) NOT NULL,
	annee varchar(4) NOT NULL,
	CONSTRAINT m_cul_spect_vivant_diriger_pkey PRIMARY KEY (structure_siret, structure_nom, annee),
	CONSTRAINT diriger_direction_fk FOREIGN KEY (direction_code) REFERENCES met_cul_test.m_cul_spect_vivant_lt_direction(code),
	CONSTRAINT diriger_structure_fk FOREIGN KEY (structure_siret, structure_nom) REFERENCES met_cul_test.m_cul_spect_vivant_structure(siret, nom),
	CONSTRAINT diriger_annee_fk FOREIGN KEY (annee) REFERENCES met_cul_test.m_cul_spect_vivant_lt_annee(annee)
);
--
COMMENT ON TABLE met_cul_test.m_cul_spect_vivant_diriger IS 'Table d''appartenance structure - direction';

-- Droits
ALTER TABLE met_cul_test.m_cul_spect_vivant_diriger OWNER TO "pre-sig-usr";

-- Ajouter des données
INSERT INTO met_cul_test.m_cul_spect_vivant_diriger(
	structure_siret, structure_nom, direction_code, annee)
SELECT siret, nom, 
    CASE WHEN direction='F' THEN '01'
        WHEN direction='H' THEN '02'
        WHEN direction='Paritaire' THEN '03'
        WHEN direction='Collectif Femmes' THEN '04'
	WHEN direction='Collectif Hommes' THEN '05'
	ELSE '00'
    END, '2019'
FROM met_cul.m_cul_spect_vivant_struct_p
where annee ='2019';

INSERT INTO met_cul_test.m_cul_spect_vivant_diriger(
	structure_siret, structure_nom, direction_code, annee)
SELECT siret, nom, 
    CASE WHEN direction='F' THEN '01'
        WHEN direction='H' THEN '02'
        WHEN direction='Paritaire' THEN '03'
        WHEN direction='Collectif Femmes' THEN '04'
	WHEN direction='Collectif Hommes' THEN '05'
	ELSE '00'
    END, '2020'
FROM met_cul.m_cul_spect_vivant_struct_p
where annee ='2019' limit 5;

---------------------------------------------------------------
-- DROP TABLE IF EXISTS met_cul_test.m_cul_spect_vivant_appartenir;
CREATE TABLE  met_cul_test.m_cul_spect_vivant_appartenir (
	structure_siret varchar(15) NOT NULL,
	structure_nom varchar NOT NULL,
	dispositif_code varchar(3) NOT NULL,
	annee varchar(4) NOT NULL,
	CONSTRAINT m_cul_spect_vivant_appartenir_pkey PRIMARY KEY (structure_siret, structure_nom, dispositif_code, annee),
	CONSTRAINT appartenir_dispositif_fk FOREIGN KEY (dispositif_code) REFERENCES met_cul_test.m_cul_spect_vivant_lt_dispositif(code),
	CONSTRAINT appartenir_structure_fk FOREIGN KEY (structure_siret, structure_nom) REFERENCES met_cul_test.m_cul_spect_vivant_structure(siret, nom),
	CONSTRAINT appartenir_annee_fk FOREIGN KEY (annee) REFERENCES met_cul_test.m_cul_spect_vivant_lt_annee(annee)
);
--
COMMENT ON TABLE met_cul_test.m_cul_spect_vivant_appartenir IS 'Table d''appartenance structure - dispositif';

-- Droits
ALTER TABLE met_cul_test.m_cul_spect_vivant_appartenir OWNER TO "pre-sig-usr";

-- Ajouter des données
INSERT INTO met_cul_test.m_cul_spect_vivant_appartenir(structure_siret, structure_nom, annee, dispositif_code)
VALUES('42507515700031', 'Association Zo Prod', '2019', 'd1');

INSERT INTO met_cul_test.m_cul_spect_vivant_appartenir(structure_siret, structure_nom, annee, dispositif_code)
VALUES('53509159900014', 'La Maison des Arts', '2019', 'd1');
	
INSERT INTO met_cul_test.m_cul_spect_vivant_appartenir(structure_siret, structure_nom, annee, dispositif_code)
VALUES('53441577300025', 'Sur le Pont CNAREP en Nouvelle Aquitaine', '2019', 'd1');
	
INSERT INTO met_cul_test.m_cul_spect_vivant_appartenir(structure_siret, structure_nom, annee, dispositif_code)
VALUES('53441577300025', 'Sur le Pont CNAREP en Nouvelle Aquitaine', '2019', 'd2');

					  


---------------------------------------------------------------
-- DROP TABLE met_cul.m_cul_spect_vivant_aider;
CREATE TABLE met_cul.m_cul_spect_vivant_aider(
   structure_siret VARCHAR(50) NOT NULL,
   structure_nom VARCHAR NOT NULL,
   rayonnement_code VARCHAR(3) NOT NULL DEFAULT '00',
   budget numeric(12,2),
   montant_aide numeric(12,2),
   annee VARCHAR(4) NOT NULL,
   CONSTRAINT aider_pkey PRIMARY KEY(structure_siret, structure_nom, annee),
   CONSTRAINT aider_structure_fk FOREIGN KEY(structure_siret) REFERENCES met_cul_test.m_cul_spect_vivant_structure(siret),
   CONSTRAINT aider_rayonnement_fk FOREIGN KEY(rayonnement_code) REFERENCES met_cul_test.m_cul_spect_vivant_lt_rayonnement_aide(code),
   CONSTRAINT aider_annee_fk FOREIGN KEY (annee) REFERENCES met_cul_test.m_cul_spect_vivant_lt_annee(annee)
);

-- Droits
ALTER TABLE met_cul_test.m_cul_spect_vivant_aider OWNER TO "pre-sig-usr";

-- Commentaires
COMMENT ON TABLE met_cul_test.m_cul_spect_vivant_aider IS 'Table d''appartenance structure - aide';

-- Ajouter des données
INSERT INTO met_cul_test.m_cul_spect_vivant_aider(structure_siret, structure_nom, rayonnement_code, budget, montant_aide, annee)
SELECT siret, nom, '00', budget_global, montant_aide, '2019'
FROM met_cul.m_cul_spect_vivant_struct_p
WHERE annee='2019';

INSERT INTO met_cul_test.m_cul_spect_vivant_aider(structure_siret, structure_nom, rayonnement_code, budget, montant_aide, annee)
SELECT siret, nom, '00', budget_global, montant_aide, '2020'
FROM met_cul.m_cul_spect_vivant_struct_p
WHERE annee='2019' LIMIT 5;
					  

---------------------------------------------------------------
--DROP VIEW met_cul_test.m_cul_spect_vivant_view;
-- CREATE OR REPLACE VIEW met_cul_test.m_cul_spect_vivant_view
AS SELECT r1.structure_siret AS siret, r1.structure_nom AS nom, r1.nom_cplt, r1.code_insee, r1.code_postal, r1.commune, r1.adresse,
    r1.adresse_cplt, r1.adresse_cedex, r1.web,
    r1.budget, r1.montant_aide, r1.commentaire, r1.annee AS annee_reference, r1.rayonnement_code, r1.rayonnement_libelle,
    r1.direction_code, t5.libelle AS direction_libelle, r1.geom, r1.src_geom_code AS geom_src_code,
    t6.valeur AS geom_src_libelle, r1.type_localisation_code, t7.libelle AS type_localisation_libelle, r1.localisation_valide
   FROM ( SELECT t0.structure_siret,
            t0.structure_nom, t1.nom_cplt, t1.code_insee, t1.commune, t1.adresse, t1.adresse_cplt, t1.adresse_cedex, t1.code_postal, t1.web,
            t0.budget, t0.montant_aide, t1.commentaire, t0.rayonnement_code, t3.libelle AS rayonnement_libelle,
            t0.annee, t2.direction_code, t4.geom, t4.src_geom_code, t4.type_localisation_code, t4.localisation_valide
           FROM met_cul_test.m_cul_spect_vivant_aider t0
             JOIN met_cul_test.m_cul_spect_vivant_structure t1 ON t0.structure_siret::text = t1.siret::text AND t0.structure_nom::text = t1.nom::text
             JOIN met_cul_test.m_cul_spect_vivant_diriger t2 ON t0.structure_siret::text = t2.structure_siret::text AND t0.structure_nom::text = t2.structure_nom::text AND t0.annee::text = t2.annee::text
             JOIN met_cul_test.m_cul_spect_vivant_lt_rayonnement_aide t3 ON t0.rayonnement_code::text = t3.code::text
             JOIN met_cul_test.m_cul_spect_vivant_structure_p_geo t4 ON t0.structure_siret::text = t4.siret::text AND t0.structure_nom::text = t4.nom::text) r1
     JOIN met_cul_test.m_cul_spect_vivant_lt_direction t5 ON r1.direction_code::text = t5.code::text
     JOIN met_cul_test.m_cul_spect_vivant_lt_src_geom t6 ON r1.src_geom_code::text = t6.code::text
     JOIN met_cul_test.m_cul_spect_vivant_lt_type_localisation t7 ON r1.type_localisation_code::text = t7.code::text;

-- Permissions
ALTER TABLE met_cul_test.m_cul_spect_vivant_view OWNER TO "pre-sig-usr";
GRANT ALL ON TABLE met_cul_test.m_cul_spect_vivant_view TO "pre-sig-usr";					  

---------------------------------------------------------------
--DROP VIEW met_cul_test.m_cul_spect_vivant_dispositif_view;
CREATE VIEW met_cul_test.m_cul_spect_vivant_dispositif_view AS
SELECT 
	t0.structure_siret, t0.structure_nom, t0.annee, t0.dispositif_code, t1.libelle as dispositif_libelle
FROM met_cul_test.m_cul_spect_vivant_appartenir t0
INNER JOIN met_cul_test.m_cul_spect_vivant_lt_dispositif t1
	ON t0.dispositif_code=t1.code;
					  

---------------------------------------------------------------
--DROP VIEW met_cul_test.m_cul_spect_vivant_view;
--CREATE VIEW met_cul_test.m_cul_spect_vivant_view AS
select r2.*, r3.annee, r3.dispositif_code, r3.dispositif_libelle
FROM
(
SELECT r1.structure_siret as siret, r1.structure_nom as nom, r1.nom_cplt, 
	r1.code_insee, r1.code_postal, r1.commune, r1.adresse, r1.adresse_cplt, r1.adresse_cedex,  
	r1.web, r1.budget, r1.montant_aide, r1.commentaire, r1.annee as annee_reference,
	r1.rayonnement_code, r1.rayonnement_libelle,
	r1.direction_code, t5.libelle as direction_libelle,
	r1.geom, r1.src_geom_code as geom_src_code, t6.valeur as geom_src_libelle, 
	r1.type_localisation_code, t7.libelle as type_localisation_libelle, r1.localisation_valide
	--,
	--t8.dispositif_code
FROM (
	SELECT t0.structure_siret, t0.structure_nom, t1.nom_cplt, 
		t1.code_insee, t1.commune, t1.adresse, t1.adresse_cplt, t1.adresse_cedex, t1.code_postal, 
		t1.web, t0.budget, t0.montant_aide, t1.commentaire, 
		t0.rayonnement_code, t3.libelle as rayonnement_libelle, t0.annee,
		t2.direction_code, t4.geom, t4.src_geom_code, t4.type_localisation_code, t4.localisation_valide
	FROM met_cul_test.m_cul_spect_vivant_aider t0
	INNER JOIN met_cul_test.m_cul_spect_vivant_structure t1
		ON t0.structure_siret=t1.siret AND t0.structure_nom=t1.nom
	INNER JOIN met_cul_test.m_cul_spect_vivant_diriger t2
		ON t0.structure_siret=t2.structure_siret AND t0.structure_nom=t2.structure_nom AND t0.annee=t2.annee
	INNER JOIN met_cul_test.m_cul_spect_vivant_lt_rayonnement_aide t3
		ON t0.rayonnement_code=t3.code 
	INNER JOIN met_cul_test.m_cul_spect_vivant_structure_p_geo t4
		ON t0.structure_siret=t4.siret and t0.structure_nom=t4.nom
) r1
INNER JOIN met_cul_test.m_cul_spect_vivant_lt_direction t5
	ON r1.direction_code=t5.code
INNER JOIN met_cul_test.m_cul_spect_vivant_lt_src_geom t6
	ON r1.src_geom_code=t6.code
INNER JOIN met_cul_test.m_cul_spect_vivant_lt_type_localisation t7
	ON r1.type_localisation_code=t7.code
) r2
left join (
	SELECT 
		t0.structure_siret, t0.structure_nom, t0.annee, t0.dispositif_code, t1.libelle as dispositif_libelle
	FROM met_cul_test.m_cul_spect_vivant_appartenir t0
	INNER JOIN met_cul_test.m_cul_spect_vivant_lt_dispositif t1
		ON t0.dispositif_code=t1.code
) r3
on r2.siret=r3.structure_siret and r2.nom=r3.structure_nom and r2.annee_reference=r3.annee
order by dispositif_code asc;
					  
					  
					  
					  
					  
/*					  
--DROP VIEW met_cul_test.m_cul_spect_vivant_view;
--CREATE VIEW met_cul_test.m_cul_spect_vivant_view AS
select r2.* 
FROM
(SELECT r1.structure_siret as siret, r1.structure_nom as nom, r1.nom_cplt, 
	r1.code_insee, r1.code_postal, r1.commune, r1.adresse, r1.adresse_cplt, r1.adresse_cedex,  
	r1.web, r1.budget, r1.montant_aide, r1.commentaire, r1.annee as annee_reference,
	r1.rayonnement_code, r1.rayonnement_libelle,
	r1.direction_code, t5.libelle as direction_libelle,
	r1.geom, r1.src_geom_code as geom_src_code, t6.valeur as geom_src_libelle, 
	r1.type_localisation_code, t7.libelle as type_localisation_libelle, r1.localisation_valide
	--,
	--t8.dispositif_code
FROM (
	SELECT t0.structure_siret, t0.structure_nom, t1.nom_cplt, 
		t1.code_insee, t1.commune, t1.adresse, t1.adresse_cplt, t1.adresse_cedex, t1.code_postal, 
		t1.web, t0.budget, t0.montant_aide, t1.commentaire, 
		t0.rayonnement_code, t3.libelle as rayonnement_libelle, t0.annee,
		t2.direction_code, t4.geom, t4.src_geom_code, t4.type_localisation_code, t4.localisation_valide
	FROM met_cul_test.m_cul_spect_vivant_aider t0
	INNER JOIN met_cul_test.m_cul_spect_vivant_structure t1
		ON t0.structure_siret=t1.siret AND t0.structure_nom=t1.nom
	INNER JOIN met_cul_test.m_cul_spect_vivant_diriger t2
		ON t0.structure_siret=t2.structure_siret AND t0.structure_nom=t2.structure_nom AND t0.annee=t2.annee
	INNER JOIN met_cul_test.m_cul_spect_vivant_lt_rayonnement_aide t3
		ON t0.rayonnement_code=t3.code 
	INNER JOIN met_cul_test.m_cul_spect_vivant_structure_p_geo t4
		ON t0.structure_siret=t4.siret and t0.structure_nom=t4.nom
) r1
INNER JOIN met_cul_test.m_cul_spect_vivant_lt_direction t5
	ON r1.direction_code=t5.code
INNER JOIN met_cul_test.m_cul_spect_vivant_lt_src_geom t6
	ON r1.src_geom_code=t6.code
INNER JOIN met_cul_test.m_cul_spect_vivant_lt_type_localisation t7
	ON r1.type_localisation_code=t7.code
) r2
left join (
	SELECT 
		t0.structure_siret, t0.structure_nom, t0.annee, t0.dispositif_code, t1.libelle as dispositif_libelle
	FROM met_cul_test.m_cul_spect_vivant_appartenir t0
	INNER JOIN met_cul_test.m_cul_spect_vivant_lt_dispositif t1
		ON t0.dispositif_code=t1.code
) r3
on r2.siret=r3.structure_siret and r2.nom=r3.structure_nom and r2.annee_reference=r3.annee
	;					  
*/
					  
					  
/*
---------------------------------------------------------------
-- DROP TABLE IF EXISTS met_cul.m_cul_spect_vivant_positionner;
CREATE TABLE met_cul_test.m_cul_spect_vivant_positionner (
	structure_siret varchar(15) NOT NULL,
	structure_nom varchar NOT NULL,
	struct_p_geo_siret varchar(3) NOT NULL,
	CONSTRAINT positionner_structure_diriger_pkey PRIMARY KEY (structure_siret, struct_p_geo_siret),
	CONSTRAINT positionner_structure_fk FOREIGN KEY (structure_siret, structure_nom) REFERENCES met_cul_test.m_cul_spect_vivant_structure(siret, nom),
	CONSTRAINT positionner_structure_p_geo_fk FOREIGN KEY (struct_p_geo_siret, structure_nom) REFERENCES met_cul_test.m_cul_spect_vivant_structure_p_geo(siret, nom)
);
--
COMMENT ON TABLE met_cul_test.m_cul_spect_vivant_positionner IS 'Table d''appartenance structure - direction';

-- Permissions
ALTER TABLE met_cul_test.m_cul_spect_vivant_positionner OWNER TO "pre-sig-usr";
*/					  
					  
----------------------------------------------------------------------
----------------------------------------------------------------------
-- SQL à organiser


-- Mise à jour des libelllés "direction"
UPDATE met_cul.m_cul_spect_vivant_struct_p
SET direction='COLLECTIF FEMMES'
WHERE annee='2020' and direction ='Collectif F';

UPDATE met_cul.m_cul_spect_vivant_struct_p
SET direction='COLLECTIF FEMMES'
WHERE annee='2020' and direction ='collectif F';

UPDATE met_cul.m_cul_spect_vivant_struct_p
SET direction='COLLECTIF HOMMES'
WHERE annee='2020' and direction ='Collectif H';

UPDATE met_cul.m_cul_spect_vivant_struct_p
SET direction='COLLECTIF HOMMES'
WHERE annee='2020' and direction ='collectif H';

UPDATE met_cul.m_cul_spect_vivant_struct_p
SET direction='DUO PARITAIRE'
WHERE annee='2020' and direction ='duo paritaire';
