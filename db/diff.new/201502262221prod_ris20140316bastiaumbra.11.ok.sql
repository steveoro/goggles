--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ALESIANI JOY' (1986, gender: 1)
-- aliased with: 'ALESIANI GIOI' (ID:16014)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (156, '2015-02-26 22:24:06', '2015-02-26 22:24:06', 'ALESIANI JOY', 16014);


-- Processing:...'CIARALLI STEFANO' (1979, gender: 1)
-- aliased with: 'CIARALI STEFANO' (ID:16140)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (157, '2015-02-26 22:24:06', '2015-02-26 22:24:06', 'CIARALLI STEFANO', 16140);


-- Processing:...'CRESCENZI ROBERTO' (1976, gender: 1)

COMMIT;
