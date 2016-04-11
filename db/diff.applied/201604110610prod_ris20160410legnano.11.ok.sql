--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'VISONE DONATO ALDO' (1953, gender: 1)
-- aliased with: 'VISONE DONATO' (ID:4508)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (373, '2016-04-11 06:11:22', '2016-04-11 06:11:22', 'VISONE DONATO ALDO', 4508);


COMMIT;
