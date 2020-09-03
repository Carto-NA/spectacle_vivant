# spectacle_vivant

Le spectacle vivant
se caractérise par la coprésence d'actants (ceux qui donnent à voir et à entendre) et d'un public (ceux qui ont accepté de voir et d'entendre).

En cela, le spectacle vivant désigne de nombreux modes d'expression artistique : le théâtre, la danse, les arts du cirque, les arts de la rue, les arts de la marionnette, l'opéra, le spectacle de rue et la musique live.


Le vocable "spectacle vivant" désigne l'ensemble des spectacles "produits ou diffusés par des personnes qui, en vue de la représentation en public d'une œuvre de l'esprit, s'assurent la présence physique d'au moins un artiste du spectacle". La danse, la musique, le théâtre, dans toute la diversité de leurs formes (opéra, musique de variété, chorales, fanfares, cirque, arts de la rue, conte, marionnettes...), appartiennent au spectacle vivant, par opposition au spectacle enregistré (cinéma-audiovisuel).


### Dictionnaire de données

| Table | Champ | Désignation | Type/Taille | Contrainte | Règle de calcul | Clé étrangère | Commentaire |
| :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: | :--: |
|  | id | Identifiant | sérial | clé primaire |  |  | Identifiant non signifiant |
|  | code | Code | varchar(15) | unique | calculé |  |  |
|  | siret | SIRET de la structure | varchar(15) |  |  |  |  |
|  | nom | Nom de la structure | varchar |  |  |  |  |
|  | nom_cplt | Nom complémentaire de la structure | varchar |  |  |  |  |
|  | numcom | Code INSEE de la commune | varchar(5) |  |  |  |  |
|  | nomcom | Nom de la commune | varchar |  |  |  |  |
|  | adresse |  |  |  |  |  |  |
|  | adresse_cplt |  |  |  |  |  |  |
|  | adresse_cedex |  |  |  |  |  |  |
|  | code_postal |  |  |  |  |  |  |
|  | ville_cp |  |  |  |  |  |  |
|  | web |  |  |  |  |  |  |
|  | annee |  |  |  |  |  |  |
|  | direction |  |  |  |  |  |  |
|  | budget_global |  |  |  |  |  |  |
|  | montant_aide |  |  |  |  |  |  |
|  | rayonnement_aide |  |  |  |  |  |  |
|  | commentaire |  |  |  |  |  |  |
|  | localisation_pertinence |  |  |  |  |  |  |
|  | localisation_type |  |  |  |  |  |  |
|  | date_creation |  |  |  |  |  |  |
|  | date_actualisation |  |  |  |  |  |  |
|  | geom |  |  |  |  |  |  |
|  | dispositif |  |  |  |  |  |  |
|  | categorie |  |  |  |  |  |  |
|  | classification |  |  |  |  |  |  |
|  | sous_categorie1 |  |  |  |  |  |  |
|  | sous_categorie2 |  |  |  |  |  |  |
|  | esthetique |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |


### Listes de valeurs

#### m_cul_spect_vivant_lt_dispositif
| Code | Libellé |
| :--: | :--: |
| 00 | Non renseigné |
| D1	| Soutien équipes |
| D2	| Soutien lieux de fab |
| D3	| Soutien labels |
| D4	| Soutien scènes & saisons |
| D5	| Soutien orchestres |
| 99 | Autre |


#### m_cul_spect_vivant_lt_direction
| Code | Libellé |
| :--: | :--: |
| 00 | Non renseigné |
| 01	| F |
| 02	| H |
| 03	| Paritaire |
| 04	| Collectif femmes |
| 05	| Collectif hommes |
| 06 | / |
| 99 | Autre |


#### m_cult_spect_vivant_lt_categorie
* Labels de la diffusion
* Scènes de territoires et saisons sans lieu
* Labels de la création
* Équipes artistiques
* Orchestres
* Opéras
* Labels de la production
* Lieux de fabrique
* Opérateurs spécifiques


#### m_cult_spect_vivant_lt_ss_categorie1
* Scène nationale
* Scène conventionnée
* Scène de territoire
* Saison sans lieu
* Centre Chorégraphique National
* Centre de Développement Chorégraphique national
* Centre Dramatique National
* Équipes artistiques Spectacle Vivant
* Ensembles musicaux
* Orchestres
* Opéra
* Centre National des Arts de la Rue
* Pôle National des Arts du Cirque
* Atelier de Fabrique Artistiques
* Centre Culturel des Rencontres
* Dirigé par un artistique
* Dirigé par un opérateur


### m_cult_spect_vivant_lt_ss_categorie2
* Art et création
* Art en territoire
* Art, enfance, jeunesse
* Langue et culture régionale


### m_cult_spect_vivant_lt_esthetique
* Théâtre
* Danse
* Musique
* Arts de la rue
* Arts du cirque
* Arts pluriels
* Autre

### m_cult_spect_vivant_lt_rayonnement_aide
| Code | Libellé |
| :--: | :--: |
| 00 | Non renseigné |
| 0	| lieu fermé |
| 1	| plutôt urbain |
| 2	| plutôt « bassin de vie » |
| 3	| plutôt local |
| 4	| rayon d'env. 20Km |
| 99 | Autre |


### m_cult_spect_vivant_lt_
*
*
*
*
