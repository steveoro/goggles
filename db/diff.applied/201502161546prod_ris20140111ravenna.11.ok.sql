--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'APD DELTA':

-- Processing:...'CONSELVE NUOTO SSD':
-- aliased with: 'CONSELVE NUOTO S.S.D.RL' (ID:157)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (64, '2015-02-17 12:38:42', '2015-02-17 12:38:42', 'CONSELVE NUOTO SSD', 157);


-- Processing:...'GENS AQUATICA SAN M':

-- Processing:...'NUOTATORI VENEZIANI':
-- aliased with: 'A.S.D.B.N. Nuotatori Veneziani' (ID:145)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (65, '2015-02-17 12:38:42', '2015-02-17 12:38:42', 'NUOTATORI VENEZIANI', 145);


-- Processing:...'NUOTO CLUB LUGO':

-- Processing:...'NUOTO LIB ROSIGNANO':

-- Processing:...'NUOTO MASTER VERONA':
-- aliased with: 'ASD NUOTO MASTER VERONA IN-SPORT' (ID:154)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (66, '2015-02-17 12:38:43', '2015-02-17 12:38:43', 'NUOTO MASTER VERONA', 154);


-- Processing:...'NUOTO OTELLO PUTINA':

-- Processing:...'POL. AMATORI PRATO':

-- Processing:...'SAN MARINO NUOTO':
-- aliased with: 'SAN MARINO MASTER' (ID:262)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (67, '2015-02-17 12:38:44', '2015-02-17 12:38:44', 'SAN MARINO NUOTO', 262);


-- Processing:...'VILLAGGIO FANCIULLO':
-- aliased with: 'ASD VILLAGGIO' (ID:25)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (68, '2015-02-17 12:38:44', '2015-02-17 12:38:44', 'VILLAGGIO FANCIULLO', 25);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'APRIGLIANO VALERIA' (1994, gender: 2)

-- Processing:...'ARGENIDI LORENZO' (1985, gender: 1)

-- Processing:...'CIMATTI ANDREA' (1972, gender: 1)

-- Processing:...'CODATO NICOLO`' (1989, gender: 1)
-- aliased with: 'CODATO NICOLO'' (ID:2700)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (15, '2015-02-17 12:41:01', '2015-02-17 12:41:01', 'CODATO NICOLO`', 2700);


-- Processing:...'CORDIOLI CHRISTIAN' (1975, gender: 1)

-- Processing:...'DONINI ANTONIO' (1983, gender: 1)

-- Processing:...'FASOLO MATTEO' (1986, gender: 1)

-- Processing:...'GIOVANNINI LORENZO' (1986, gender: 1)

-- Processing:...'GOLFRE` ANDREASI RUBEN' (1988, gender: 1)
-- aliased with: 'GOLFRE' ANDREASI RUBEN' (ID:3241)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (16, '2015-02-17 12:41:01', '2015-02-17 12:41:01', 'GOLFRE` ANDREASI RUBEN', 3241);


-- Processing:...'GRADI MARCO' (1969, gender: 1)

-- Processing:...'LENZI FRANCESCO' (1983, gender: 1)

-- Processing:...'MINGHETTI LUCIO' (1974, gender: 1)

-- Processing:...'TURINI ALBERTO' (1989, gender: 1)

-- Processing:...'ZWANKHUINZEN GINA ELEONORA' (1987, gender: 2)
-- aliased with: 'ZWANKHUIZEN GINA ELEONORA' (ID:4104)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (17, '2015-02-17 12:41:02', '2015-02-17 12:41:02', 'ZWANKHUINZEN GINA ELEONORA', 4104);


COMMIT;
