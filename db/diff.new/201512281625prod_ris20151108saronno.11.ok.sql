--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'asd Viribus Unitis - Bosi':
-- aliased with: 'VIRIBUS UNITIS' (ID:481)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (491, '2015-12-28 16:32:50', '2015-12-28 16:32:50', 'asd Viribus Unitis - Bosi', 481);


-- Processing:...'Leaena ssd - San Benedett':
-- aliased with: 'LEAENA SSD' (ID:72)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (492, '2015-12-28 16:32:50', '2015-12-28 16:32:50', 'Leaena ssd - San Benedett', 72);


-- Processing:...'New Swim asd - Castiglion':
-- aliased with: 'NEW SWIM' (ID:480)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (493, '2015-12-28 16:32:50', '2015-12-28 16:32:50', 'New Swim asd - Castiglion', 480);


-- Processing:...'Nuotatori del Carroccio':

-- Processing:...'Rari Nantes Legnano':
-- aliased with: 'RN LEGNANO' (ID:273)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (494, '2015-12-28 16:32:51', '2015-12-28 16:32:51', 'Rari Nantes Legnano', 273);


-- Processing:...'SMGM Team Nuoto Lombardia':
-- aliased with: 'TEAM NUOTO LOMBARDI' (ID:277)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (495, '2015-12-28 16:32:51', '2015-12-28 16:32:51', 'SMGM Team Nuoto Lombardia', 277);


-- Processing:...'Sporting Club 63 ssd':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'PEDACCHIOLA DANIELA MARIA' (1963, gender: 2)
-- aliased with: 'PEDACCHIOLA DANIELA' (ID:2353)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (283, '2015-12-28 16:34:44', '2015-12-28 16:34:44', 'PEDACCHIOLA DANIELA MARIA', 2353);


COMMIT;
