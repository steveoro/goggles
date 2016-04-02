--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'D'ANDREA GIOVANNI' (1969, gender: 1)
-- aliased with: 'D`ANDREA GIOVANNI' (ID:19793)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (338, '2016-04-01 13:45:20', '2016-04-01 13:45:20', 'D\'ANDREA GIOVANNI', 19793);


-- Processing:...'SACCA' FABIO MARIA' (1952, gender: 1)
-- aliased with: 'SACCA` FABIO MARIA' (ID:6449)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (339, '2016-04-01 13:45:20', '2016-04-01 13:45:20', 'SACCA\' FABIO MARIA', 6449);


COMMIT;
