--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'D'AGOSTINO LUCIANO' (1941, gender: 1)
-- aliased with: 'D`AGOSTINO LUCIANO' (ID:10070)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (414, '2016-05-08 21:39:26', '2016-05-08 21:39:26', 'D\'AGOSTINO LUCIANO', 10070);


-- Processing:...'ROMANO SALVO' (1969, gender: 1)

COMMIT;
