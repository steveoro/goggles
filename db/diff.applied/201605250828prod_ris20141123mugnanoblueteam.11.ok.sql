--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'D'ELIA GIOVANNI' (1993, gender: 1)
-- aliased with: 'D`ELIA GIOVANNI' (ID:26725)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (527, '2016-05-25 08:28:46', '2016-05-25 08:28:46', 'D\'ELIA GIOVANNI', 26725);


COMMIT;
