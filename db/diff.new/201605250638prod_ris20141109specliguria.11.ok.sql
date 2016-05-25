--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BOESGARD VALDEMAR' (1965, gender: 1)
-- aliased with: 'BOESGAARD VALDEMAR' (ID:4745)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (518, '2016-05-25 06:39:07', '2016-05-25 06:39:07', 'BOESGARD VALDEMAR', 4745);


COMMIT;
