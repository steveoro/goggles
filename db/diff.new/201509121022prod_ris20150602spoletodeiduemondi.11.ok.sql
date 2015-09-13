--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CLUB L`AQUILA NUOTO':
-- aliased with: 'ASD CLUB L`AQUILA N' (ID:119)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (362, '2015-09-12 10:24:25', '2015-09-12 10:24:25', 'CLUB L`AQUILA NUOTO', 119);


-- Processing:...'FONTE MERAVIGLIOSA SPORT':

-- Processing:...'PANTA REI SPORT ASD':

-- Processing:...'ZERO9 ASD':
-- aliased with: 'ZERO9 SSD' (ID:213)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (363, '2015-09-12 10:24:26', '2015-09-12 10:24:26', 'ZERO9 ASD', 213);


COMMIT;
