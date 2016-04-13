--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ASD CALCIO SAN SPERATE':
-- aliased with: 'Asd Nuoto San Sperate' (ID:908)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (651, '2016-04-13 08:02:32', '2016-04-13 08:02:32', 'ASD CALCIO SAN SPERATE', 908);


-- Processing:...'Atlantide ssd - Elmas':
-- aliased with: 'Atlantide ssd - Cia' (ID:520)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (652, '2016-04-13 08:02:32', '2016-04-13 08:02:32', 'Atlantide ssd - Elmas', 520);


COMMIT;
