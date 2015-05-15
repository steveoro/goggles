--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'DELFINO CLUB TERAMO ASD':

-- Processing:...'GS SAMB 87 A.S.D.':
-- aliased with: 'G.S. SAMB 87 A.S.D.' (ID:121)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (346, '2015-05-15 15:08:30', '2015-05-15 15:08:30', 'GS SAMB 87 A.S.D.', 121);


-- Processing:...'NUOVO NUOTO - Bologna':
-- aliased with: 'NUOVONUOTO' (ID:7)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (347, '2015-05-15 15:08:30', '2015-05-15 15:08:30', 'NUOVO NUOTO - Bologna', 7);


-- Processing:...'POL. Comunale RICCIONE':
-- aliased with: 'POL. COM. RICCIONE' (ID:131)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (348, '2015-05-15 15:08:30', '2015-05-15 15:08:30', 'POL. Comunale RICCIONE', 131);


-- Processing:...'PRO NUOTO GENOVA':
-- aliased with: 'PRONUOTO GENOVA SSD' (ID:749)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (349, '2015-05-15 15:08:30', '2015-05-15 15:08:30', 'PRO NUOTO GENOVA', 749);


-- Processing:...'TERAMO NUOTO ASD':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CORBO` SIMONE' (1985, gender: 1)
-- aliased with: 'CORBÒ SIMONE' (ID:13078)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (237, '2015-05-15 15:08:41', '2015-05-15 15:08:41', 'CORBO` SIMONE', 13078);


COMMIT;
