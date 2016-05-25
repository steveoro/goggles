--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'COLAIACCO MARIO' (1995, gender: 1)
-- aliased with: 'COLAIOCCO MARIO' (ID:21444)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (520, '2016-05-25 06:55:24', '2016-05-25 06:55:24', 'COLAIACCO MARIO', 21444);


COMMIT;
