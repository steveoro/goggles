--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'SORAGNI NICOLO'' (1998, gender: 1)
-- aliased with: 'SORAGNI NICOL�' (ID:24861)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (378, '2016-04-17 22:17:29', '2016-04-17 22:17:29', 'SORAGNI NICOLO\'', 24861);


COMMIT;
