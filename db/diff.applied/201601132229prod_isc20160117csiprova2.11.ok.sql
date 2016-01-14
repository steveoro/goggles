--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'RovigoNuoto':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'FIDANZA LORENZO' (1989, gender: 1)
-- aliased with: 'FIDANZA LOENZO' (ID:21000)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (292, '2016-01-13 22:30:15', '2016-01-13 22:30:15', 'FIDANZA LORENZO', 21000);


COMMIT;
