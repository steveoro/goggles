--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Amatori Nuoto Savona':
-- aliased with: 'AMATORI N SAVONA SC' (ID:279)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (504, '2015-12-29 20:14:13', '2015-12-29 20:14:13', 'Amatori Nuoto Savona', 279);


-- Processing:...'Idea Sport ssd':
-- aliased with: 'IDEA SPORT' (ID:718)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (505, '2015-12-29 20:14:13', '2015-12-29 20:14:13', 'Idea Sport ssd', 718);


-- Processing:...'NUOTO CLUB LIGURIA':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'FABBRI ANDREA' (1983, gender: 1)

COMMIT;
