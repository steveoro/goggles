--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Aquafit 2.0 S.S.D. Rl':
-- aliased with: 'Aquafit 2.0 Ssd R.L.' (ID:891)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (635, '2016-04-06 07:28:03', '2016-04-06 07:28:03', 'Aquafit 2.0 S.S.D. Rl', 891);


-- Processing:...'Riviera Nuoto - Dolo':
-- aliased with: 'S.S.D. RIVIERA NUOTO SRL' (ID:175)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (636, '2016-04-06 07:28:03', '2016-04-06 07:28:03', 'Riviera Nuoto - Dolo', 175);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ALESSANDRO MAZZOLI' (1974, gender: 1)
-- aliased with: 'MAZZOLI ALESSANDRO' (ID:4862)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (352, '2016-04-06 07:28:41', '2016-04-06 07:28:41', 'ALESSANDRO MAZZOLI', 4862);


-- Processing:...'TALE' FABRIZIO' (1966, gender: 1)
-- aliased with: 'TALE` FABRIZIO' (ID:3957)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (353, '2016-04-06 07:28:41', '2016-04-06 07:28:41', 'TALE\' FABRIZIO', 3957);


-- Processing:...'TOMESANI MASSIMILIANO' (1971, gender: 1)

COMMIT;
