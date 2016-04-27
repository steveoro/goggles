--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ACQUASPORT - A':
-- aliased with: 'ACQUASPORT SRL SSD' (ID:539)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (683, '2016-04-27 06:25:55', '2016-04-27 06:25:55', 'ACQUASPORT - A', 539);


-- Processing:...'ACQUASPORT - B':
-- aliased with: 'ACQUASPORT SRL SSD' (ID:539)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (684, '2016-04-27 06:25:55', '2016-04-27 06:25:55', 'ACQUASPORT - B', 539);


-- Processing:...'ACQUASPORT - C':
-- aliased with: 'ACQUASPORT SRL SSD' (ID:539)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (685, '2016-04-27 06:25:55', '2016-04-27 06:25:55', 'ACQUASPORT - C', 539);


-- Processing:...'Asd Luna':
-- aliased with: 'Luna Socio Culturale Asd' (ID:909)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (686, '2016-04-27 06:25:55', '2016-04-27 06:25:55', 'Asd Luna', 909);


-- Processing:...'Esperia A.S.D.':
-- aliased with: 'ESPERIA ASD - CAGLI' (ID:543)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (687, '2016-04-27 06:25:55', '2016-04-27 06:25:55', 'Esperia A.S.D.', 543);


-- Processing:...'Frog Swimming Libertas':
-- aliased with: 'FROG SWIMMING LIB.C' (ID:544)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (688, '2016-04-27 06:25:55', '2016-04-27 06:25:55', 'Frog Swimming Libertas', 544);


-- Processing:...'FROG SWIMMING LIBERTAS - A':
-- aliased with: 'FROG SWIMMING LIB.C' (ID:544)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (689, '2016-04-27 06:25:55', '2016-04-27 06:25:55', 'FROG SWIMMING LIBERTAS - A', 544);


-- Processing:...'FROG SWIMMING LIBERTAS - B':
-- aliased with: 'FROG SWIMMING LIB.C' (ID:544)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (690, '2016-04-27 06:25:55', '2016-04-27 06:25:55', 'FROG SWIMMING LIBERTAS - B', 544);


-- Processing:...'Ogliastra Nuoto':
-- aliased with: 'ASD OGLIASTRA NUOTO' (ID:707)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (691, '2016-04-27 06:25:55', '2016-04-27 06:25:55', 'Ogliastra Nuoto', 707);


-- Processing:...'S.S. Promosport Arl':
-- aliased with: 'PROMOSPORT SSD' (ID:550)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (692, '2016-04-27 06:25:55', '2016-04-27 06:25:55', 'S.S. Promosport Arl', 550);


-- Processing:...'X-Team Olbia':
-- aliased with: 'X - TEAM OLBIA ASD' (ID:556)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (693, '2016-04-27 06:25:55', '2016-04-27 06:25:55', 'X-Team Olbia', 556);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CANZINI YUKI' (1974, gender: 2)
-- aliased with: 'CANZINI YUKY' (ID:22882)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (403, '2016-04-27 06:28:08', '2016-04-27 06:28:08', 'CANZINI YUKI', 22882);


-- Processing:...'CARBE' LUCA' (1980, gender: 1)
-- aliased with: 'CARBE` LUCA' (ID:25096)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (404, '2016-04-27 06:28:08', '2016-04-27 06:28:08', 'CARBE\' LUCA', 25096);


-- Processing:...'CECCO FRANCESCO PAOLO' (1978, gender: 1)
-- aliased with: 'CECCO FRANCESCO' (ID:11032)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (405, '2016-04-27 06:28:08', '2016-04-27 06:28:08', 'CECCO FRANCESCO PAOLO', 11032);


-- Processing:...'FALCONI RITA' (1962, gender: 2)

-- Processing:...'GIBILLINI VALENTINA' (1983, gender: 2)
-- aliased with: 'GIBILLI VALENTINA' (ID:23584)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (406, '2016-04-27 06:28:08', '2016-04-27 06:28:08', 'GIBILLINI VALENTINA', 23584);


COMMIT;
