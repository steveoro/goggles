--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CRISTELLOTTI CRISTIAN' (1983, gender: 1)
-- aliased with: 'CRISTELOTTI CRISTIAN' (ID:19765)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (423, '2016-05-16 08:33:12', '2016-05-16 08:33:12', 'CRISTELLOTTI CRISTIAN', 19765);


COMMIT;
