
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
-- Drop table
-- DROP TABLE met_cul.m_cul_spect_vivant_structure_p_geo;
CREATE TABLE met_cul.m_cul_spect_vivant_structure_p_geo (
	id serial NOT NULL,
	code varchar(3) NOT NULL,
	--libelle varchar(150) NOT NULL,
	localisation_valide bool NOT NULL DEFAULT false,
	localisation_pertinence varchar NULL, -- Pertinence de la localisation
	localisation_type varchar NULL, -- Type de localisation
	date_creation timestamp NOT NULL DEFAULT now(), -- Correspond à la date de saisie de la donnée, , valeur non null et par défaut : now()
	date_actualisation timestamp NULL, -- Correspond à la date de mise à jour de la donnée, à gérer par un trigger before pour update
	geom geometry(POINT, 2154) NULL, -- Attribut contenant la géométrie
	CONSTRAINT m_cul_spect_vivant_lt_direction_pkey PRIMARY KEY (id),
	CONSTRAINT m_cul_spect_vivant_lt_direction_uniq UNIQUE (code)
);
COMMENT ON TABLE met_cul.m_cul_spect_vivant_structure_p_geo IS 'Table contenant la géometrie des structures du spectacle vivant';

-- Permissions
ALTER TABLE met_cul.m_cul_spect_vivant_structure_p_geo OWNER TO "pre-sig-usr";



---------------------------------------------------------------
-- Drop table
-- DROP TABLE met_cul.m_cul_spect_vivant_structure;
CREATE TABLE met_cul.m_cul_spect_vivant_structure (
	id serial NOT NULL,
	code varchar(15) NULL, -- Code de la structure
	siret varchar(15) NOT NULL, -- SIRET de la structure
	nom varchar NULL,
	nom_cplt varchar NULL,
	code_insee varchar(5) NULL, -- Code insee de la commune
	commune varchar(150) NULL, -- Libellé de la commune
	adresse varchar NULL, -- Adresse de la structure
	adresse_cplt varchar NULL, -- Adresse complémentaire de la structure
	adresse_cedex varchar NULL, -- Cedex de l'adresse
	code_postal varchar(5) NULL, -- Code postal de la commune
	ville_cp varchar NULL,
	web varchar NULL,
	--annee varchar(4) NOT NULL,
	--direction varchar(100) NULL,
	--budget_global numeric(12,2) NULL,
	--montant_aide numeric(9,2) NULL,
	--rayonnement_aide varchar(20) NULL,
	commentaire text NULL,
	--localisation_valide bool NOT NULL DEFAULT false,
	donnees_valide bool NOT NULL DEFAULT false,
	--localisation_pertinence varchar NULL, -- Pertinence de la localisation
	--localisation_type varchar NULL, -- Type de localisation
	date_creation timestamp NOT NULL DEFAULT now(), -- Correspond à la date de saisie de la donnée, , valeur non null et par défaut : now()
	date_actualisation timestamp NULL, -- Correspond à la date de mise à jour de la donnée, à gérer par un trigger before pour update
	--geom geometry(MULTIPOINT, 2154) NULL, -- Attribut contenant la géométrie
	struct_p_geom_siret varchar(15),
	CONSTRAINT m_cul_spect_vivant_structure_pkey PRIMARY KEY (id),
	--CONSTRAINT m_cul_spect_vivant_structure_uniq UNIQUE (siret, nom, annee),
	CONSTRAINT m_cul_spect_vivant_structure_uniq UNIQUE (siret, nom),
	CONSTRAINT positionner_structure_p_geom_fk FOREIGN KEY (struct_p_geom_siret) REFERENCES met_cul.m_cul_spect_vivant_structure_p_geo(siret)
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
-- Drop table
-- DROP TABLE met_cul.m_cul_spect_vivant_diriger;
CREATE TABLE met_cul.m_cul_spect_vivant_diriger (
	structure_siret varchar(15) NOT NULL,
	direction_code varchar(3) NOT NULL,
	annee varchar(5) NOT NULL,
	CONSTRAINT m_cul_spect_vivant_diriger_pkey PRIMARY KEY (structure_siret,direction_code, annee),
	--CONSTRAINT m_cul_spect_vivant_diriger_uniq UNIQUE (code)
	CONSTRAINT diriger_structure_fk FOREIGN KEY (structure_siret) REFERENCES met_cul.m_cul_spect_vivant_structure(code),
	CONSTRAINT diriger_direction_fk FOREIGN KEY (direction_code) REFERENCES met_cul.m_cul_spect_vivant_lt_direction(code)
);
COMMENT ON TABLE met_cul.m_cul_spect_vivant_diriger IS 'Table d\'appartenance structure - direction';

-- Permissions
ALTER TABLE met_cul.m_cul_spect_vivant_diriger OWNER TO "pre-sig-usr";


---------------------------------------------------------------
-- Drop table
-- DROP TABLE met_cul.m_cul_spect_vivant_positionner;
CREATE TABLE met_cul.m_cul_spect_vivant_positionner (
	structure_siret varchar(15) NOT NULL,
	struct_p_geo_siret varchar(3) NOT NULL,
	CONSTRAINT m_cul_spect_vivant_diriger_pkey PRIMARY KEY (structure_siret,direction_code, annee),
	--CONSTRAINT m_cul_spect_vivant_diriger_uniq UNIQUE (code)
	CONSTRAINT positionner_structure_fk FOREIGN KEY (structure_siret) REFERENCES met_cul.m_cul_spect_vivant_structure(code),
	CONSTRAINT positionner_structure_p_geo_fk FOREIGN KEY (direction_code) REFERENCES met_cul.m_cul_spect_vivant_structure_p_geo(struct_p_geom_siret)
);
--
COMMENT ON TABLE met_cul.m_cul_spect_vivant_positionner IS 'Table d\'appartenance structure - direction';

-- Permissions
ALTER TABLE met_cul.m_cul_spect_vivant_positionner OWNER TO "pre-sig-usr";


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
