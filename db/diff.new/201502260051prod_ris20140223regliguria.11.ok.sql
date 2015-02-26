--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'AQUARIUM VALLESCRIV':

-- Processing:...'CNAM ALASSIO':

-- Processing:...'R.N.ARENZANO':
-- aliased with: 'RN ARENZANO' (ID:286)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (205, '2015-02-26 00:54:56', '2015-02-26 00:54:56', 'R.N.ARENZANO', 286);


-- Processing:...'R.N.SPEZIA 86':

-- Processing:...'RN TORINO':
-- aliased with: 'RNTORINO S.C.S.D.' (ID:358)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (206, '2015-02-26 00:54:57', '2015-02-26 00:54:57', 'RN TORINO', 358);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BALDINETI ELISABETTA' (1965, gender: 2)

-- Processing:...'BERRUTI ROBERTO' (1976, gender: 1)

-- Processing:...'CAMARDELLA ENRICO' (1983, gender: 1)

-- Processing:...'CHIAVARI GIAN LUCA' (1972, gender: 1)

-- Processing:...'MASON MASSIMILIANO' (1971, gender: 1)

-- Processing:...'MILONE GIUSEPPE' (1977, gender: 1)

-- Processing:...'PANEALBO MARCO' (1958, gender: 1)

-- Processing:...'POMI MARCO' (1969, gender: 1)

COMMIT;
