--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'LAVINA LEONARDO' (1972, gender: 1)
-- aliased with: 'LADINA LEONARDO' (ID:1974)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (519, '2016-05-25 06:49:09', '2016-05-25 06:49:09', 'LAVINA LEONARDO', 1974);


COMMIT;
