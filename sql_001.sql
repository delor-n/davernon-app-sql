/*
	Version 0.0.1
*/

/*	
	Création BDD
*/


/*
	Création nouvelle table card
*/

-- Suppression de la table (aucune donnée)
 DROP TABLE IF EXISTS card CASCADE;

-- Suppression de la nouvelle séquence
DROP SEQUENCE IF EXISTS card CASCADE;

CREATE TABLE card (
id SERIAL PRIMARY KEY  -- implicit primary key constraint
,name VARCHAR,

logo bytea,

speed INTEGER,


description VARCHAR,
stamina INTEGER,
player_vitality_modifier INTEGER,
player_stamina_modifier INTEGER,
enemy_vitality_modifier INTEGER,
enemy_stamina_modifier INTEGER,

description_bax VARCHAR,
stamina_bax INTEGER,
player_vitality_modifier_bax INTEGER,
player_stamina_modifier_bax INTEGER,
enemy_vitality_modifier_bax INTEGER,
enemy_stamina_modifier_bax INTEGER);

INSERT INTO card(name, speed,
description,stamina, player_vitality_modifier, player_stamina_modifier, enemy_vitality_modifier, enemy_stamina_modifier,
description_bax,stamina_bax , player_vitality_modifier_bax ,player_stamina_modifier_bax ,enemy_vitality_modifier_bax ,enemy_stamina_modifier_bax)
VALUES ('Attaquer',1,
'Attaque',2,0,-2,4,0,
'AttaqueBax',2,0,-2,0,0);
INSERT INTO card(name, speed, 
description,stamina, player_vitality_modifier, player_stamina_modifier, enemy_vitality_modifier, enemy_stamina_modifier,
description_bax,stamina_bax , player_vitality_modifier_bax ,player_stamina_modifier_bax ,enemy_vitality_modifier_bax ,enemy_stamina_modifier_bax)
VALUES ('Soigner',3,
'Soin',2,2,-2,0,0,
'SoinBax',2,0,-2,-4,0);


/*
	Création nouvelle table stance
*/

-- Suppression de la table (aucune donnée)
 DROP TABLE IF EXISTS stance CASCADE;

-- Suppression de la nouvelle séquence
DROP SEQUENCE IF EXISTS stance CASCADE;


CREATE TABLE stance (
id SERIAL PRIMARY KEY  -- implicit primary key constraint
,name VARCHAR,
description VARCHAR);

INSERT INTO stance(name, description)
VALUES ('Debout','La cible est debout');
INSERT INTO stance(name, description)
VALUES ('Au sol','La cible est au sol');



-- Suppression de la table (aucune donnée)
 DROP TABLE IF EXISTS card_stance CASCADE;

-- Suppression de la nouvelle séquence
DROP SEQUENCE IF EXISTS card_stance CASCADE;


CREATE TABLE card_stance (
	card_id    int REFERENCES card (id) ON UPDATE CASCADE ON DELETE CASCADE
	, stance_id int REFERENCES stance (id) ON UPDATE CASCADE
            , CONSTRAINT card_stance_pkey PRIMARY KEY (card_id, stance_id)  -- explicit pk
);

/*
	Création nouvelle table mind_set
*/

-- Suppression de la table (aucune donnée)
 DROP TABLE IF EXISTS mind_set CASCADE;

-- Suppression de la nouvelle séquence
DROP SEQUENCE IF EXISTS mind_set CASCADE;


CREATE TABLE mind_set (
id SERIAL PRIMARY KEY  -- implicit primary key constraint
,name VARCHAR,
description VARCHAR);

INSERT INTO mind_set(name, description)
VALUES ('Sournoiserie','Permet dutiliser certaines capacitées');
INSERT INTO mind_set(name, description)
VALUES ('Fureur','Permet dutiliser certaines capacitées');
INSERT INTO mind_set(name, description)
VALUES ('Pacifisme','Permet dutiliser certaines capacitées');



-- Suppression de la table (aucune donnée)
 DROP TABLE IF EXISTS card_mind_set CASCADE;

-- Suppression de la nouvelle séquence
DROP SEQUENCE IF EXISTS card_mind_set CASCADE;


CREATE TABLE card_mind_set (
	card_id    int REFERENCES card (id) ON UPDATE CASCADE ON DELETE CASCADE
	, mind_set_id int REFERENCES mind_set (id) ON UPDATE CASCADE
            , CONSTRAINT card_mind_set_pkey PRIMARY KEY (card_id, mind_set_id)  -- explicit pk
);


INSERT INTO card_mind_set(card_id, mind_set_id)
VALUES (1,1);
INSERT INTO card_mind_set(card_id, mind_set_id)
VALUES (1,2);
INSERT INTO card_mind_set(card_id, mind_set_id)
VALUES (2,1);
INSERT INTO card_mind_set(card_id, mind_set_id)
VALUES (2,2);

INSERT INTO card_stance(card_id, stance_id)
VALUES (2,1);
INSERT INTO card_stance(card_id, stance_id)
VALUES (2,2);
INSERT INTO card_stance(card_id, stance_id)
VALUES (1,1);
INSERT INTO card_stance(card_id, stance_id)
VALUES (1,2);