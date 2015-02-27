--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'DISC.SPORT.BELLE AR':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'D`AMORE GIOACCHINO' (1967, gender: 1)
-- aliased with: 'D'AMORE GIOACCHINO' (ID:3874)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (141, '2015-02-26 11:06:04', '2015-02-26 11:06:04', 'D`AMORE GIOACCHINO', 3874);


-- Processing:...'D`APICE ANNAMARIA' (1975, gender: 2)
-- aliased with: 'D'APICE ANNAMARIA' (ID:14426)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (142, '2015-02-26 11:06:04', '2015-02-26 11:06:04', 'D`APICE ANNAMARIA', 14426);


-- Processing:...'MANFREDI IAVARONE' (1971, gender: 1)

-- Processing:...'RUBERTA` ANTONINO' (1969, gender: 1)
-- aliased with: 'RUBERTA' ANTONINO' (ID:10896)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (143, '2015-02-26 11:06:04', '2015-02-26 11:06:04', 'RUBERTA` ANTONINO', 10896);


-- Processing:...'SCARPARI DI PRA` ALTO CARLO' (1986, gender: 1)
-- aliased with: 'SCARPARI DI PRA' ALTO CAR' (ID:14624)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (144, '2015-02-26 11:06:04', '2015-02-26 11:06:04', 'SCARPARI DI PRA` ALTO CARLO', 14624);


-- Processing:...'SCARSELLETTI MARIA CRISTINA' (1968, gender: 2)
-- aliased with: 'SCARSELLETTI MARIA CRISTI' (ID:14625)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (145, '2015-02-26 11:06:04', '2015-02-26 11:06:04', 'SCARSELLETTI MARIA CRISTINA', 14625);


COMMIT;
