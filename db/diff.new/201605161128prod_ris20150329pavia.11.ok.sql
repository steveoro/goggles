--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'DI SARÏ¿½ ANDREA' (1991, gender: 1)
-- aliased with: 'DI SARÒ ANDREA' (ID:8805)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (426, '2016-05-16 11:29:12', '2016-05-16 11:29:12', 'DI SARÏ¿½ ANDREA', 8805);


COMMIT;
