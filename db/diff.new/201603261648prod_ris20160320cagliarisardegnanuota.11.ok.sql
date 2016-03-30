--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Antares Iglesias':

-- Processing:...'Asd Nuoto San Sperate':

-- Processing:...'Luna Socio Culturale Asd':

-- Processing:...'Tennis Club San Gavino':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CABONI MASSIMILIANO' (1974, gender: 1)
-- aliased with: 'CABONI MASSIMO' (ID:11008)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (318, '2016-03-26 17:03:51', '2016-03-26 17:03:51', 'CABONI MASSIMILIANO', 11008);


-- Processing:...'CARRESE FRANCESCO' (1972, gender: 1)

-- Processing:...'COCCO ALESSANDRO PIERPAOLO' (1992, gender: 1)
-- aliased with: 'COCCO ALESSANDRO' (ID:22888)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (319, '2016-03-26 17:03:52', '2016-03-26 17:03:52', 'COCCO ALESSANDRO PIERPAOLO', 22888);


-- Processing:...'ORRU` MARIANO' (1990, gender: 1)
-- aliased with: 'ORRU' MARIANO' (ID:22976)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (320, '2016-03-26 17:03:52', '2016-03-26 17:03:52', 'ORRU` MARIANO', 22976);


-- Processing:...'PINTUS ROSSANA' (1975, gender: 2)

COMMIT;
