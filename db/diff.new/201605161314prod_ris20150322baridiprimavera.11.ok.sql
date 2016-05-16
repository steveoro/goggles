--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'DE PALO LUCA' (1982, gender: 1)
-- aliased with: 'DEPALO LUCA' (ID:11938)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (437, '2016-05-16 13:19:45', '2016-05-16 13:19:45', 'DE PALO LUCA', 11938);


COMMIT;
