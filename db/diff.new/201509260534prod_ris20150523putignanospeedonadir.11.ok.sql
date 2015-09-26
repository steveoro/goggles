--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'AQUARIUS PISCINA CANOSA SSD':
-- aliased with: 'AQUARIUS PISCINA CA' (ID:571)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (384, '2015-09-26 06:03:17', '2015-09-26 06:03:17', 'AQUARIUS PISCINA CANOSA SSD', 571);


-- Processing:...'AQUATIKA ASD - CRISPIANO - A':
-- aliased with: 'AQUATIKA ASD - CRIS' (ID:296)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (385, '2015-09-26 06:03:17', '2015-09-26 06:03:17', 'AQUATIKA ASD - CRISPIANO - A', 296);


-- Processing:...'AQUATIKA ASD - CRISPIANO - B':
-- aliased with: 'AQUATIKA ASD - CRIS' (ID:296)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (386, '2015-09-26 06:03:17', '2015-09-26 06:03:17', 'AQUATIKA ASD - CRISPIANO - B', 296);


-- Processing:...'AS.SO.RI ASD - FOGGIA':

-- Processing:...'GESTIONE POLIV.  MODUGNO - A':
-- aliased with: 'GESTIONE POLIV.  MO' (ID:579)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (387, '2015-09-26 06:03:18', '2015-09-26 06:03:18', 'GESTIONE POLIV.  MODUGNO - A', 579);


-- Processing:...'GESTIONE POLIV.  MODUGNO - B':
-- aliased with: 'GESTIONE POLIV.  MO' (ID:579)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (388, '2015-09-26 06:03:18', '2015-09-26 06:03:18', 'GESTIONE POLIV.  MODUGNO - B', 579);


-- Processing:...'PAYTON BARI':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ANTONACCI GIOVANNI' (1967, gender: 1)

-- Processing:...'CASUCCI ANDREA' (1982, gender: 1)

-- Processing:...'DE SANTIS BERARDINO ROBERTO' (1987, gender: 1)

-- Processing:...'D`ELIA CATERINA' (1971, gender: 2)
-- aliased with: 'D'ELIA CATERINA' (ID:20247)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (263, '2015-09-26 06:08:21', '2015-09-26 06:08:21', 'D`ELIA CATERINA', 20247);


-- Processing:...'D`ONGHIA FABIO' (1992, gender: 1)
-- aliased with: 'D'ONGHIA FABIO' (ID:20248)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (264, '2015-09-26 06:08:21', '2015-09-26 06:08:21', 'D`ONGHIA FABIO', 20248);


-- Processing:...'RICCIO GIULIA' (1991, gender: 2)

COMMIT;
