--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ERACLE SPORTS SSD':

-- Processing:...'EUROPA SPORTING CLUB':

-- Processing:...'GRUPPO PESCE ROMA ASD':
-- aliased with: 'GRUPPO PESCE' (ID:353)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (360, '2015-06-10 11:41:28', '2015-06-10 11:41:28', 'GRUPPO PESCE ROMA ASD', 353);


-- Processing:...'INSUBRIKA NUOTO SSD':

-- Processing:...'LEONE XIII SPORT SSD':

-- Processing:...'QSWIM ASD':

-- Processing:...'WET LIFE VILLA GUARDIA SSD':
-- aliased with: 'WET LIFE VILLA GUAR' (ID:278)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (361, '2015-06-10 11:41:29', '2015-06-10 11:41:29', 'WET LIFE VILLA GUARDIA SSD', 278);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ACQUISTAPACE MARCO' (1986, gender: 1)

-- Processing:...'BERNO UGO' (1970, gender: 1)

-- Processing:...'CONTI STEFANO' (1982, gender: 1)

-- Processing:...'LEONI STEFANO' (1975, gender: 1)

-- Processing:...'SCANNELLA GIULIANO' (1990, gender: 1)

-- Processing:...'TESSARI YURI' (1991, gender: 1)

COMMIT;
