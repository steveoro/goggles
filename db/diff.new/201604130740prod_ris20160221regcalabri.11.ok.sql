--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Acli Arvalia Nuoto Lamezi':

-- Processing:...'Nettuno Nuoto asd - Palmi':
-- aliased with: 'NETTUNO PALMI ASD' (ID:679)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (650, '2016-04-13 07:42:47', '2016-04-13 07:42:47', 'Nettuno Nuoto asd - Palmi', 679);


-- Processing:...'Nuoto Andrea Maria - RC':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'AIELLO RAFFAELE PANTALEONE' (1981, gender: 1)

-- Processing:...'CUNZOLO GIUSEPPE' (1983, gender: 1)

-- Processing:...'DE MORELLI GIANLUCA' (1973, gender: 1)

-- Processing:...'GAGLIARDI VITALIANO' (1956, gender: 1)

-- Processing:...'ROMEO SIMONE' (1991, gender: 1)

-- Processing:...'SESTITO SALVATORE' (1986, gender: 1)

-- Processing:...'TUTONE GIORGIO' (1989, gender: 1)

COMMIT;
