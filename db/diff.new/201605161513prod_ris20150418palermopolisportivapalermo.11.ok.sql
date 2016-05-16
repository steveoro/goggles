--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'VALENZA SALVO' (1947, gender: 1)
-- aliased with: 'VALENZA SALVATORE' (ID:18308)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (442, '2016-05-16 15:15:02', '2016-05-16 15:15:02', 'VALENZA SALVO', 18308);


COMMIT;
