--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ALEEVA ROSA' (1967, gender: 2)
-- aliased with: 'ALEEVA REZEDA' (ID:14321)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (526, '2016-05-25 08:21:25', '2016-05-25 08:21:25', 'ALEEVA ROSA', 14321);


COMMIT;
