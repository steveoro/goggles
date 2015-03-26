--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'AQUATIC CLUB SASSAR':

-- Processing:...'ASD OGLIASTRA NUOTO':

-- Processing:...'RN ORISTANO':

-- Processing:...'ULIVI E PALME SPORT':
-- aliased with: 'ULIVI E PALME' (ID:554)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (230, '2015-02-27 00:15:36', '2015-02-27 00:15:36', 'ULIVI E PALME SPORT', 554);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'DORO CLAUDIA' (1988, gender: 2)

-- Processing:...'MARCIAS ANDREA' (1974, gender: 1)

-- Processing:...'PITZIANTI ALESSANDRO' (1983, gender: 1)

-- Processing:...'SERRA GIANNI ANTONIO' (1960, gender: 1)

-- Processing:...'SOLLA DANIELA' (1970, gender: 2)

-- Processing:...'STARA GIULIA' (1991, gender: 2)

COMMIT;
