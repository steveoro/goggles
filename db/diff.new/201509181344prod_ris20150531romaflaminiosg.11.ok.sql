--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'KRISTALL SPORTING CLUB SS':

-- Processing:...'LIFE PER TE - CECCHINA':

-- Processing:...'MR SPORT F.LLI MARCONI':

-- Processing:...'RN SAN FRANCESCO - PAOLA':
-- aliased with: 'RN SAN FRANCESCO -' (ID:680)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (377, '2015-09-18 13:53:05', '2015-09-18 13:53:05', 'RN SAN FRANCESCO - PAOLA', 680);


-- Processing:...'SPORT TEAM 2000 - FIUGGI':
-- aliased with: 'Sport Team 2000 Col' (ID:650)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (378, '2015-09-18 13:53:05', '2015-09-18 13:53:05', 'SPORT TEAM 2000 - FIUGGI', 650);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ODOARDI PIERO' (1940, gender: 1)

-- Processing:...'VILLANI MANUELE' (1985, gender: 1)

COMMIT;
