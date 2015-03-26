--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ALESSANDRO ROSSI' (1970, gender: 1)
-- aliased with: 'ROSSI ALESSANDRO' (ID:2123)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (212, '2015-03-01 18:58:05', '2015-03-01 18:58:05', 'ALESSANDRO ROSSI', 2123);


COMMIT;
