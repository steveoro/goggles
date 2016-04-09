--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Flipper Nuoto Ssd':
-- aliased with: 'FLIPPER NUOTO - MOL' (ID:668)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (638, '2016-04-08 16:19:30', '2016-04-08 16:19:30', 'Flipper Nuoto Ssd', 668);


-- Processing:...'Hydropolis Nuoto Ssd Arl':
-- aliased with: 'HYDROPOLIS NUOTO AS' (ID:580)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (639, '2016-04-08 16:19:30', '2016-04-08 16:19:30', 'Hydropolis Nuoto Ssd Arl', 580);


-- Processing:...'Meridiana Nuoto - Taranto':
-- aliased with: 'MERIDIANA NUOTO TAR' (ID:582)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (640, '2016-04-08 16:19:30', '2016-04-08 16:19:30', 'Meridiana Nuoto - Taranto', 582);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BERNARDO STEFANO' (1982, gender: 1)

-- Processing:...'BORACE DANIELE' (1991, gender: 1)

-- Processing:...'CAMBO' STEFANO' (1982, gender: 1)
-- aliased with: 'CAMBO` STEFANO' (ID:15640)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (354, '2016-04-08 16:20:37', '2016-04-08 16:20:37', 'CAMBO\' STEFANO', 15640);


-- Processing:...'DENOTARPIETRO MICHELA' (1990, gender: 2)
-- aliased with: 'DE NOTARPIETRO MICHELA' (ID:11921)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (355, '2016-04-08 16:20:37', '2016-04-08 16:20:37', 'DENOTARPIETRO MICHELA', 11921);


-- Processing:...'GIANNONE DARIO' (1983, gender: 1)

-- Processing:...'LEOCI FRANCESCA' (1987, gender: 2)

-- Processing:...'RAINO LUCA' (1974, gender: 1)
-- aliased with: 'RAINO' LUCA' (ID:24124)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (356, '2016-04-08 16:20:37', '2016-04-08 16:20:37', 'RAINO LUCA', 24124);


COMMIT;
