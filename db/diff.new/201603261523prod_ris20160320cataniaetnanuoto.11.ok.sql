--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Aqua Fit Ssd - S.Gregorio':

-- Processing:...'Blu Team Nuoto Asd':

-- Processing:...'Circ.Canottieri 7 Scogli':

-- Processing:...'Cn Sub Villa S.Giovanni':
-- aliased with: 'CN SUB VILLA ASD' (ID:506)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (590, '2016-03-26 15:46:27', '2016-03-26 15:46:27', 'Cn Sub Villa S.Giovanni', 506);


-- Processing:...'Ekipe Ssd':

-- Processing:...'Sporting Club Catania asd - A':
-- aliased with: 'SPORTING CLUB CATAN' (ID:512)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (591, '2016-03-26 15:46:28', '2016-03-26 15:46:28', 'Sporting Club Catania asd - A', 512);


-- Processing:...'Sporting Club Catania asd - B':
-- aliased with: 'SPORTING CLUB CATAN' (ID:512)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (592, '2016-03-26 15:46:28', '2016-03-26 15:46:28', 'Sporting Club Catania asd - B', 512);


-- Processing:...'Sprinteam Ssd':

-- Processing:...'Sprinteam ssd - A':

-- Processing:...'Sprinteam ssd - B':

-- Processing:...'Swimblu asd - A':
-- aliased with: 'SWIMBLU ASD' (ID:722)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (593, '2016-03-26 15:46:32', '2016-03-26 15:46:32', 'Swimblu asd - A', 722);


-- Processing:...'Swimblu asd - B':
-- aliased with: 'SWIMBLU ASD' (ID:722)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (594, '2016-03-26 15:46:33', '2016-03-26 15:46:33', 'Swimblu asd - B', 722);


-- Processing:...'Synthesis Ssd':
-- aliased with: 'A.S.D. SYNTHESIS NUOTO' (ID:600)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (595, '2016-03-26 15:46:33', '2016-03-26 15:46:33', 'Synthesis Ssd', 600);


-- Processing:...'Synthesis ssd - A':
-- aliased with: 'A.S.D. SYNTHESIS NUOTO' (ID:600)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (596, '2016-03-26 15:46:33', '2016-03-26 15:46:33', 'Synthesis ssd - A', 600);


-- Processing:...'Synthesis ssd - B':
-- aliased with: 'A.S.D. SYNTHESIS NUOTO' (ID:600)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (597, '2016-03-26 15:46:33', '2016-03-26 15:46:33', 'Synthesis ssd - B', 600);


-- Processing:...'Tennis Cl. Match Ball -SR - B':
-- aliased with: 'TENNIS CLUB MATCH B' (ID:371)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (598, '2016-03-26 15:46:33', '2016-03-26 15:46:33', 'Tennis Cl. Match Ball -SR - B', 371);


-- Processing:...'Torre Del Grifo Village - A':
-- aliased with: 'TORRE DEL GRIFO VIL' (ID:607)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (599, '2016-03-26 15:46:33', '2016-03-26 15:46:33', 'Torre Del Grifo Village - A', 607);


-- Processing:...'Torre Del Grifo Village - B':
-- aliased with: 'TORRE DEL GRIFO VIL' (ID:607)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (600, '2016-03-26 15:46:33', '2016-03-26 15:46:33', 'Torre Del Grifo Village - B', 607);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CALI` SERGIO' (1971, gender: 1)
-- aliased with: 'CALI' SERGIO' (ID:18365)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (316, '2016-03-26 16:04:56', '2016-03-26 16:04:56', 'CALI` SERGIO', 18365);


-- Processing:...'COSTANTINO GIOVANNI' (1987, gender: 1)

-- Processing:...'DEBELLA SARA CLARISSA' (1994, gender: 2)
-- aliased with: 'DI BELLA SARA CLARISSA' (ID:20044)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (317, '2016-03-26 16:04:57', '2016-03-26 16:04:57', 'DEBELLA SARA CLARISSA', 20044);


-- Processing:...'GALLETTA SILVIA' (1988, gender: 2)

-- Processing:...'GIACOBBE ANDREA' (1970, gender: 1)

-- Processing:...'GRIFO` SALVATORE' (1966, gender: 1)

-- Processing:...'MILANA ROBERTA' (1972, gender: 2)

-- Processing:...'MUSMECI DANIELE' (1991, gender: 1)

-- Processing:...'PAPPALARDO MARCO' (1969, gender: 1)

-- Processing:...'PATTI GIUSY' (1991, gender: 2)

-- Processing:...'PUGLISI MARCO VINCENZO' (1976, gender: 1)

COMMIT;
