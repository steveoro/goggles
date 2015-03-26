--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CUSUNIME':

-- Processing:...'SWIMBLU ASD':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CESARIO GAETANO' (1986, gender: 1)

-- Processing:...'FARANDA CRISTINA' (1976, gender: 2)
-- aliased with: 'FARANDA MARIA CRISTINA' (ID:16444)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (186, '2015-03-01 12:03:35', '2015-03-01 12:03:35', 'FARANDA CRISTINA', 16444);


-- Processing:...'REPACI STEFANO GABRIELE' (1985, gender: 1)
-- aliased with: 'REPACI STEFANO' (ID:12964)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (187, '2015-03-01 12:03:35', '2015-03-01 12:03:35', 'REPACI STEFANO GABRIELE', 12964);


-- Processing:...'SALEMI MARIA CRISTINA' (1968, gender: 2)

-- Processing:...'SCARCELLA PERINO GIUSEPPE' (1962, gender: 1)
-- aliased with: 'SCARCELLA GIUSEPPE' (ID:16619)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (188, '2015-03-01 12:03:35', '2015-03-01 12:03:35', 'SCARCELLA PERINO GIUSEPPE', 16619);


COMMIT;
