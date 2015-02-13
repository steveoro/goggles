--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.R.C.A. SSD. RL':
-- aliased with: 'A.R.C.A. S.S.D. a RL' (ID:138)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (54, '2015-02-13 18:00:16', '2015-02-13 18:00:16', 'A.R.C.A. SSD. RL', 138);


-- Processing:...'ACQUA TIME SSD':
-- aliased with: 'ACQUA TIME' (ID:6)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (55, '2015-02-13 18:00:16', '2015-02-13 18:00:16', 'ACQUA TIME SSD', 6);


-- Processing:...'ACQUAMBIENTE SSD -':
-- aliased with: 'ACQUAMBIENTE SRL SSD' (ID:151)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (56, '2015-02-13 18:00:16', '2015-02-13 18:00:16', 'ACQUAMBIENTE SSD -', 151);


-- Processing:...'ALBATROS':

-- Processing:...'AM.NUOTO CASALE SCO':

-- Processing:...'AMATORI NUOTO LIB':

-- Processing:...'AN VALDINIEVOLE':

-- Processing:...'AQUATIKA ASD - CRIS':

-- Processing:...'AREZZO NUOTO ASD':

-- Processing:...'AS.D.VILLAGGIO FANCIULLO':
-- aliased with: 'ASD VILLAGGIO' (ID:25)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (57, '2015-02-13 18:00:18', '2015-02-13 18:00:18', 'AS.D.VILLAGGIO FANCIULLO', 25);


-- Processing:...'ASD BLU WATER':

-- Processing:...'BONDENO NUOTO 2012':

-- Processing:...'C.S. TEAM PADOVA':

-- Processing:...'CENTRO NUOTO CEPAGA':

-- Processing:...'CENTRO NUOTO CORTON':

-- Processing:...'CLODIA PISCINA FITN':

-- Processing:...'CONERO WELLNESS SSD':

-- Processing:...'DLF NUOTO RIMINI':

-- Processing:...'FANO +SPORT ASD POL':

-- Processing:...'FONDAZIONE M.BENTEG':

-- Processing:...'GYMNASIUM SPILIMBER':

-- Processing:...'H. SPORT SSD - PRAT':
-- aliased with: 'HAPPY SPORT' (ID:16)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (58, '2015-02-13 18:00:21', '2015-02-13 18:00:21', 'H. SPORT SSD - PRAT', 16);


-- Processing:...'LEOSPORT S.C. A R.L':

-- Processing:...'MARCHE NUOTO':

-- Processing:...'MEDITERRANEO SPORT':

-- Processing:...'MONTENUOTO S.S.D RL':
-- aliased with: 'MONTENUOTO S.S.D. A R.L.' (ID:161)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (59, '2015-02-13 18:00:22', '2015-02-13 18:00:22', 'MONTENUOTO S.S.D RL', 161);


-- Processing:...'NUOTATORI RAVENNATI':

-- Processing:...'NUOTO AICS BOLOGNA':

-- Processing:...'NUOTO UISP 2003':

-- Processing:...'RARI MASTER PESARO':

-- Processing:...'RARI NANTES U.O.E.I':

-- Processing:...'RIVIERA NUOTO VENET':
-- aliased with: 'S.S.D. RIVIERA NUOTO SRL' (ID:175)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (60, '2015-02-13 18:00:23', '2015-02-13 18:00:23', 'RIVIERA NUOTO VENET', 175);


-- Processing:...'SAVENA NUOTO TEAM A':
-- aliased with: 'SAVENA NUOTO' (ID:11)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (61, '2015-02-13 18:00:23', '2015-02-13 18:00:23', 'SAVENA NUOTO TEAM A', 11);


-- Processing:...'SEVEN MASTER NUOTO':

-- Processing:...'SIENA NUOTO UISP':

-- Processing:...'SIMPLY SPORT':

-- Processing:...'TEAM EUGANEO':
-- aliased with: 'S.S.D. TEAM EUGANEO RL' (ID:176)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (62, '2015-02-13 18:00:24', '2015-02-13 18:00:24', 'TEAM EUGANEO', 176);


-- Processing:...'VERSILIANUOTO':

-- Processing:...'VIRTUS BUONCONVENTO':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BACCILIERI ANNA' (1993, gender: 2)
-- aliased with: 'BACILIERI ANNA' (ID:1526)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (5, '2015-02-13 18:04:23', '2015-02-13 18:04:23', 'BACCILIERI ANNA', 1526);


-- Processing:...'BARBIERI FABIO' (1978, gender: 1)

-- Processing:...'BERTANI FEDERICA' (1977, gender: 2)

-- Processing:...'BIAGI ENRICO' (1975, gender: 1)

-- Processing:...'CANTELLO ENTONI' (1986, gender: 1)
-- aliased with: 'CANTELLO ANTONY' (ID:1703)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (6, '2015-02-13 18:04:23', '2015-02-13 18:04:23', 'CANTELLO ENTONI', 1703);


-- Processing:...'CAPPELLETTI MAURO' (1965, gender: 1)

-- Processing:...'CARPANELLI SARA' (1992, gender: 2)
-- aliased with: 'CARPNELLI SARA' (ID:1706)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (7, '2015-02-13 18:04:23', '2015-02-13 18:04:23', 'CARPANELLI SARA', 1706);


-- Processing:...'CERVELLATI FABRIZIO' (1963, gender: 1)

-- Processing:...'COZZARI CORRADO' (1951, gender: 1)

-- Processing:...'DALL`OLIO ELENA' (1964, gender: 2)
-- aliased with: 'DALL'OLIO ELENA' (ID:300)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (8, '2015-02-13 18:04:24', '2015-02-13 18:04:24', 'DALL`OLIO ELENA', 300);


-- Processing:...'FERRONI STEFANIA' (1966, gender: 2)

-- Processing:...'GERACI DANIELA' (1985, gender: 2)

-- Processing:...'GIANI FEDERICO' (1964, gender: 1)

-- Processing:...'GRILLI MARCO' (1970, gender: 1)

-- Processing:...'MAINARDI VALERIO' (1979, gender: 1)

-- Processing:...'MANTARRO MASSIMO' (1971, gender: 1)

-- Processing:...'MORELLI MASSIMO' (1962, gender: 1)

-- Processing:...'OCCELLI FRANCESCO' (1983, gender: 1)

-- Processing:...'PALLAVICINI LUCA' (1965, gender: 1)

-- Processing:...'PATRIARCA DANIELE' (1983, gender: 1)

-- Processing:...'PINTORI MASSIMILIANO' (1972, gender: 1)

-- Processing:...'PIREDDA ALESSANDRO' (1974, gender: 1)

-- Processing:...'PIZZINELLI ALBERTO' (1976, gender: 1)

-- Processing:...'RIOS FIDEL MARCIAL' (1961, gender: 1)
-- aliased with: 'RIOS FIDEL' (ID:111)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (9, '2015-02-13 18:04:25', '2015-02-13 18:04:25', 'RIOS FIDEL MARCIAL', 111);


-- Processing:...'SELVA MARIA' (1969, gender: 2)

-- Processing:...'SORMANI CLAUDIO' (1976, gender: 1)

-- Processing:...'THOMPSON JOHN MICHEAL' (1976, gender: 1)
-- aliased with: 'THOMPSON JHON' (ID:2428)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (10, '2015-02-13 18:04:26', '2015-02-13 18:04:26', 'THOMPSON JOHN MICHEAL', 2428);


-- Processing:...'TIPOLONE FABIO' (1985, gender: 1)
-- aliased with: 'TRIPOLONE FABIO' (ID:2517)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (11, '2015-02-13 18:04:26', '2015-02-13 18:04:26', 'TIPOLONE FABIO', 2517);


-- Processing:...'TUGNOLI GIAMPAOLO' (1963, gender: 1)
-- aliased with: 'TUGNOLI GIANPAOLO' (ID:747)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (12, '2015-02-13 18:04:26', '2015-02-13 18:04:26', 'TUGNOLI GIAMPAOLO', 747);


-- Processing:...'VENTURINI MICHELE' (1982, gender: 1)

-- Processing:...'VIOLA GIOVANNI' (1972, gender: 1)

COMMIT;
