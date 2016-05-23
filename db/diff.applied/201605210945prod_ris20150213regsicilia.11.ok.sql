--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'AQUARIUS AS - A':
-- aliased with: 'AQUARIUS AS' (ID:503)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (762, '2016-05-21 09:48:58', '2016-05-21 09:48:58', 'AQUARIUS AS - A', 503);


-- Processing:...'CENTRO SPORT. OLIMPIADI - A':
-- aliased with: 'CENTRO SPORTIVO LE OLIMPIADI' (ID:505)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (763, '2016-05-21 09:48:58', '2016-05-21 09:48:58', 'CENTRO SPORT. OLIMPIADI - A', 505);


-- Processing:...'SUN CLUB S.S.D.':

-- Processing:...'SYNTHESIS NUOTO SSD - A':
-- aliased with: 'A.S.D. SYNTHESIS NUOTO' (ID:600)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (764, '2016-05-21 09:48:58', '2016-05-21 09:48:58', 'SYNTHESIS NUOTO SSD - A', 600);


-- Processing:...'TEAM NUOTO SIRACUSA ASD - A':
-- aliased with: 'TEAM NUOTO SIRACUSA' (ID:514)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (765, '2016-05-21 09:48:58', '2016-05-21 09:48:58', 'TEAM NUOTO SIRACUSA ASD - A', 514);


-- Processing:...'ULYSSE ASD - A':
-- aliased with: 'ULYSSE ASD' (ID:335)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (766, '2016-05-21 09:48:58', '2016-05-21 09:48:58', 'ULYSSE ASD - A', 335);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'DAVI' MAURO' (1988, gender: 1)
-- aliased with: 'DAVI` MAURO' (ID:20513)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (464, '2016-05-21 10:04:21', '2016-05-21 10:04:21', 'DAVI\' MAURO', 20513);


-- Processing:...'SINITO' SALVATORE FRANCESCO' (1959, gender: 1)
-- aliased with: 'SINITO` SALVATORE FRANCESCO' (ID:13893)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (465, '2016-05-21 10:04:21', '2016-05-21 10:04:21', 'SINITO\' SALVATORE FRANCESCO', 13893);


COMMIT;
