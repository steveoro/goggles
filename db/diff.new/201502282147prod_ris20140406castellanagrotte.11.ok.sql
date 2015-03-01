--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'PERRELLI LUCA' (1972, gender: 1)
-- aliased with: 'PERELLI LUCA' (ID:17204)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (170, '2015-02-28 21:49:05', '2015-02-28 21:49:05', 'PERRELLI LUCA', 17204);


COMMIT;
