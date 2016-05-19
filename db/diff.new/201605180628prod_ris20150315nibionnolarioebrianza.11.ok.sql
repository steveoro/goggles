--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'FERRARIÂ MARIANTONIA' (1947, gender: 2)
-- aliased with: 'FERRARI MARIANTONIA' (ID:8818)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (447, '2016-05-18 06:29:55', '2016-05-18 06:29:55', 'FERRARIÂ MARIANTONIA', 8818);


-- Processing:...'TUCCIÂ GABRIELLA' (1938, gender: 2)
-- aliased with: 'TUCCI GABRIELLA' (ID:11721)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (448, '2016-05-18 06:29:55', '2016-05-18 06:29:55', 'TUCCIÂ GABRIELLA', 11721);


COMMIT;
