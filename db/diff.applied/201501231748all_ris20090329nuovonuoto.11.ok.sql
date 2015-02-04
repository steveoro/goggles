--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.D. "MILLE SPORT"':

-- Processing:...'ACQUAMBIENTE':
-- aliased with: 'ACQUAMBIENTE SRL SSD' (ID:151)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
VALUES (15, '2015-01-23 17:54:14', '2015-01-23 17:54:14', 'ACQUAMBIENTE', 151);


-- Processing:...'ACQUAVIVA 2001 SRL S.S.D.':
-- aliased with: 'ACQUAVIVA 2001' (ID:12)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
VALUES (16, '2015-01-23 17:54:14', '2015-01-23 17:54:14', 'ACQUAVIVA 2001 SRL S.S.D.', 12);


-- Processing:...'AQVASPORT TUATHA DE':

-- Processing:...'AS GIS PORDENUOTO':

-- Processing:...'AS SOGEIS':

-- Processing:...'ASD NUOTO MASTER VR':
-- aliased with: 'ASD NUOTO MASTER VERONA IN-SPORT' (ID:154)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
VALUES (17, '2015-01-23 17:54:15', '2015-01-23 17:54:15', 'ASD NUOTO MASTER VR', 154);


-- Processing:...'BUONCONSIGLIO N.':

-- Processing:...'C.S. PALLADIO SPA V':

-- Processing:...'CANOTTIERI ARNO':

-- Processing:...'CENTRO NUOTO JESOLO':

-- Processing:...'DUEMILA SSD A RL':

-- Processing:...'ESSECI NUOTO':

-- Processing:...'FERRARANUOTO ASD':

-- Processing:...'FIORENTINA NUOTO':

-- Processing:...'FUMANE NUOTO ASD':

-- Processing:...'G.P. NUOTO MIRA SSD':
-- aliased with: 'S.S.D. G.P. NUOTO MIRA a r.l.' (ID:172)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
VALUES (18, '2015-01-23 17:54:16', '2015-01-23 17:54:16', 'G.P. NUOTO MIRA SSD', 172);


-- Processing:...'HIDRON SPORT SSD':

-- Processing:...'MARCONI 93 APD':

-- Processing:...'NC VALLE AOSTA ASD':

-- Processing:...'NUOTO CLUB FIRENZE':

-- Processing:...'NUOTO VICENZA LIB A':
-- aliased with: 'NUOTO VICENZA LIBERTAS A.S.D.' (ID:163)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
VALUES (19, '2015-01-23 17:54:17', '2015-01-23 17:54:17', 'NUOTO VICENZA LIB A', 163);


-- Processing:...'NUOTOROMAGNA':

-- Processing:...'OASI BOSCHETTO':

-- Processing:...'OLD STARS FIRENZE':

-- Processing:...'ONDABLU S.C. A RL':
-- aliased with: 'ONDABLU Soc. Coop. Sportiva Dil' (ID:164)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
VALUES (20, '2015-01-23 17:54:17', '2015-01-23 17:54:17', 'ONDABLU S.C. A RL', 164);


-- Processing:...'PADOVANUOTO S.R.L.':
-- aliased with: 'PADOVANUOTO S.R.L. SOC. DIL.' (ID:165)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
VALUES (21, '2015-01-23 17:54:17', '2015-01-23 17:54:17', 'PADOVANUOTO S.R.L.', 165);


-- Processing:...'POL COMUNALE RICCIO':
-- aliased with: 'POL. COM. RICCIONE' (ID:131)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
VALUES (22, '2015-01-23 17:54:17', '2015-01-23 17:54:17', 'POL COMUNALE RICCIO', 131);


-- Processing:...'PROGETTO NUOTO THIE':
-- aliased with: 'PROGETTO NUOTO THIENE SRL S.SD' (ID:167)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
VALUES (23, '2015-01-23 17:54:17', '2015-01-23 17:54:17', 'PROGETTO NUOTO THIE', 167);


-- Processing:...'RARI NANTES U.O.E.I':

-- Processing:...'RARI NANTES VENEZIA':
-- aliased with: 'RARI NANTES FLEGREA' (ID:143)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
VALUES (24, '2015-01-23 17:54:17', '2015-01-23 17:54:17', 'RARI NANTES VENEZIA', 143);


-- Processing:...'SCM MONDADORI':

-- Processing:...'SOC. S.D. 2001 SRL-PADOVA':
-- aliased with: 'SOC. S. D. 2001 SRL - PADOVA' (ID:177)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
VALUES (25, '2015-01-23 17:54:17', '2015-01-23 17:54:17', 'SOC. S.D. 2001 SRL-PADOVA', 177);


-- Processing:...'TNT CREMONA':

-- Processing:...'VERSILIANUOTO':

-- Processing:...'VILLAGGIO FANCIULLO':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'MAZZINI MIRCO' (1975, gender: 1)
-- aliased with: 'MAZZINI MIRKO' (ID:385)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
VALUES (1, '2015-01-23 17:55:00', '2015-01-23 17:55:00', 'MAZZINI MIRCO', 385);


-- Processing:...'ORLANDINI IDO PIER ALBERTO' (1957, gender: 1)
-- aliased with: 'ORLANDINI IDO PIERALDO' (ID:64)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
VALUES (2, '2015-01-23 17:55:00', '2015-01-23 17:55:00', 'ORLANDINI IDO PIER ALBERTO', 64);


-- Processing:...'TOMBA DAVIDE' (1985, gender: 1)

COMMIT;
