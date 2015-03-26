--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ALL ROUND':
-- aliased with: 'A.S.D.ALL ROUND' (ID:426)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (254, '2015-03-01 00:35:24', '2015-03-01 00:35:24', 'ALL ROUND', 426);


-- Processing:...'CIRC. CASETTA BIANC':
-- aliased with: 'Casetta Bianca ssd' (ID:522)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (255, '2015-03-01 00:35:24', '2015-03-01 00:35:24', 'CIRC. CASETTA BIANC', 522);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ARGENTI PITTALUGA GIULIO MAR' (1971, gender: 1)
-- aliased with: 'ARGENTI PITTALUGA GIULIO' (ID:14335)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (181, '2015-03-01 00:36:29', '2015-03-01 00:36:29', 'ARGENTI PITTALUGA GIULIO MAR', 14335);


-- Processing:...'CAMPBELL JAMES BARBARA CHRIS' (1962, gender: 2)
-- aliased with: 'CAMPBELL JAMES BARBARA CH' (ID:10642)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (182, '2015-03-01 00:36:29', '2015-03-01 00:36:29', 'CAMPBELL JAMES BARBARA CHRIS', 10642);


-- Processing:...'DELL`OMO FRANCA' (1952, gender: 2)
-- aliased with: 'DELL'OMO FRANCA' (ID:14443)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (183, '2015-03-01 00:36:29', '2015-03-01 00:36:29', 'DELL`OMO FRANCA', 14443);


-- Processing:...'D`ANGELO ILARIA' (1985, gender: 2)
-- aliased with: 'D'ANGELO ILARIA' (ID:10705)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (184, '2015-03-01 00:36:29', '2015-03-01 00:36:29', 'D`ANGELO ILARIA', 10705);


-- Processing:...'MAUTI SIMONE' (1976, gender: 1)

-- Processing:...'MONDINI ANDREA' (1983, gender: 1)

-- Processing:...'TESTUZZA GIORGIO' (1969, gender: 1)

COMMIT;
