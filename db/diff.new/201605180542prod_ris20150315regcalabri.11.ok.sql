--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'HIPPONION NUOTO ASD':

-- Processing:...'LAMEZIA SHARK ASD':

-- Processing:...'NADIR AS DILETT.':
-- aliased with: 'NADIR SSD - PUTIGNA' (ID:564)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (743, '2016-05-18 05:48:22', '2016-05-18 05:48:22', 'NADIR AS DILETT.', 564);


-- Processing:...'SOCIETA' ADRIATIKA NUOTO':
-- aliased with: 'ADRIATIKA NUOTO ASD' (ID:372)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (744, '2016-05-18 05:48:22', '2016-05-18 05:48:22', 'SOCIETA\' ADRIATIKA NUOTO', 372);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'POSTERINO DOMENICO' (1958, gender: 1)
-- aliased with: 'POSTERIVO DOMENICO' (ID:15772)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (444, '2016-05-18 05:49:08', '2016-05-18 05:49:08', 'POSTERINO DOMENICO', 15772);


COMMIT;
