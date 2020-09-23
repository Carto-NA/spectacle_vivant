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
COMMENT ON SCHEMA met_eco IS 'Schéma pour les données métiers sur la culture';


------------------------------------------------------------------------ 
-- Tables : Création des tables
------------------------------------------------------------------------

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
INSERT INTO met_cul.m_cul_spect_vivant_lt_rayonnement_aide (code, libelle) VALUES('0', 'lieu fermé');
INSERT INTO met_cul.m_cul_spect_vivant_lt_rayonnement_aide (code, libelle) VALUES('1', 'plutôt urbain');
INSERT INTO met_cul.m_cul_spect_vivant_lt_rayonnement_aide (code, libelle) VALUES('2', 'plutôt "bassin de vie"');
INSERT INTO met_cul.m_cul_spect_vivant_lt_rayonnement_aide (code, libelle) VALUES('3', 'plutôt local');
INSERT INTO met_cul.m_cul_spect_vivant_lt_rayonnement_aide (code, libelle) VALUES('4', 'rayon d''env. 20km');
INSERT INTO met_cul.m_cul_spect_vivant_lt_rayonnement_aide (code, libelle) VALUES('9', 'non renseigné');


---------------------------------------------------------------
-- Drop table
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
-- Drop table
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
INSERT INTO met_cul.m_cul_spect_vivant_lt_dispositif (code, libelle) VALUES('D1', 'Soutien équipes');
INSERT INTO met_cul.m_cul_spect_vivant_lt_dispositif (code, libelle) VALUES('D2', 'Soutien lieux de fab');
INSERT INTO met_cul.m_cul_spect_vivant_lt_dispositif (code, libelle) VALUES('D3', 'Soutien labels');
INSERT INTO met_cul.m_cul_spect_vivant_lt_dispositif (code, libelle) VALUES('D4', 'Soutien scènes & saisons');
INSERT INTO met_cul.m_cul_spect_vivant_lt_dispositif (code, libelle) VALUES('D5', 'Soutien orchestres');
INSERT INTO met_cul.m_cul_spect_vivant_lt_dispositif (code, libelle) VALUES('99', 'Autre');


---------------------------------------------------------------
-- Drop table
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


---------------------------------------------------------------
-- DROP TABLE IF EXISTS met_cul_test.m_cul_spect_vivant_structure_p_geo;
CREATE TABLE met_cul_test.m_cul_spect_vivant_structure_p_geo (
	id serial NOT NULL,
	siret varchar(15) NOT NULL,
	nom varchar NOT NULL,
	localisation_valide bool NOT NULL DEFAULT false,
	localisation_pertinence varchar NULL,
	localisation_type varchar NULL,
	date_creation timestamp NOT NULL DEFAULT now(),
	date_actualisation timestamp NULL,
	geom geometry(POINT, 2154) NULL,
	CONSTRAINT m_cul_spect_vivant_lt_direction_pkey PRIMARY KEY (id),
	CONSTRAINT m_cul_spect_vivant_lt_direction_uniq UNIQUE (siret, nom)
);
COMMENT ON TABLE met_cul_test.m_cul_spect_vivant_structure_p_geo IS 'Table contenant la géometrie des structures du spectacle vivant';

-- Permissions
ALTER TABLE met_cul_test.m_cul_spect_vivant_structure_p_geo OWNER TO "pre-sig-usr";


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
	struct_p_geom_siret varchar(15) NULL,
	struct_p_geom_nom varchar NULL,
	CONSTRAINT m_cul_spect_vivant_structure_pkey PRIMARY KEY (id),
	CONSTRAINT m_cul_spect_vivant_structure_uniq UNIQUE (siret, nom),
	CONSTRAINT positionner_structure_p_geom_fk FOREIGN KEY (struct_p_geom_siret, struct_p_geom_nom) REFERENCES met_cul_test.m_cul_spect_vivant_structure_p_geo(siret, nom)
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
COMMENT ON COLUMN met_cul.m_cul_spect_vivant_structure.date_creation IS 'Correspond à la date de saisie de la donnée, , valeur non null et par défaut : now()';
COMMENT ON COLUMN met_cul.m_cul_spect_vivant_structure.date_actualisation IS 'Correspond à la date de mise à jour de la donnée, à gérer par un trigger before pour update';
COMMENT ON COLUMN met_cul.m_cul_spect_vivant_structure.geom IS 'Attribut contenant la géométrie';

-- Permissions
ALTER TABLE met_cul.m_cul_spect_vivant_structure OWNER TO "pre-sig-usr";


---------------------------------------------------------------
-- Drop table
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

-- Permissions
ALTER TABLE met_cul.m_cul_spect_vivant_detail2 OWNER TO "pre-sig-usr";


---------------------------------------------------------------
-- DROP TABLE IF EXISTS met_cul_test.m_cul_spect_vivant_diriger;
CREATE TABLE  met_cul_test.m_cul_spect_vivant_diriger (
	structure_siret varchar(15) NOT NULL,
	structure_nom varchar NOT NULL,
	direction_code varchar(3) NOT NULL,
	annee varchar(5) NOT NULL,
	CONSTRAINT m_cul_spect_vivant_diriger_pkey PRIMARY KEY (structure_siret, direction_code, annee),
	CONSTRAINT diriger_direction_fk FOREIGN KEY (direction_code) REFERENCES met_cul_test.m_cul_spect_vivant_lt_direction(code),
	CONSTRAINT diriger_structure_fk FOREIGN KEY (structure_siret, structure_nom) REFERENCES met_cul_test.m_cul_spect_vivant_structure(siret, nom)
);
--
COMMENT ON TABLE met_cul_test.m_cul_spect_vivant_diriger IS 'Table d''appartenance structure - direction';

-- Permissions
ALTER TABLE met_cul_test.m_cul_spect_vivant_diriger OWNER TO "pre-sig-usr";


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




---------------------------------------------------------------
-- Drop table
-- DROP TABLE met_cul.m_cul_spect_vivant_aider;
CREATE TABLE met_cul.m_cul_spect_vivant_aider(
   rayonnement_code VARCHAR(3),
   structure_siret VARCHAR(50),
   budget numeric(12,2),
   montant_aide numeric(12,2),
   annee VARCHAR(4) NOT NULL,
   CONSTRAINT aider_pkey PRIMARY KEY(rayonnement_code, structure_siret, annee),
   CONSTRAINT aider_structure_fk FOREIGN KEY(structure_siret) REFERENCES met_cul_test.m_cul_spect_vivant_structure(siret),
   CONSTRAINT aider_rayonnement_fk FOREIGN KEY(rayonnement_code) REFERENCES met_cul_test.m_cul_spect_vivant_lt_rayonnement_aide(code)
);


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
