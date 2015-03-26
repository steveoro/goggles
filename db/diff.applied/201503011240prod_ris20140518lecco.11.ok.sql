--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'SALA CRISTIAN' (1975, gender: 1)

-- Processing:...'VIGANO' RODOLFO' (1932, gender: 1)
-- aliased with: 'VIGANO` RODOLFO' (ID:15897)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (190, '2015-03-01 12:41:14', '2015-03-01 12:41:14', 'VIGANO\' RODOLFO', 15897);


COMMIT;
