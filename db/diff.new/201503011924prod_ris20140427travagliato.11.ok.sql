--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BECCALETTO MICHELE ALBERTO' (1982, gender: 1)
-- aliased with: 'BECCALETTO MICHELE ALBERT' (ID:7728)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (214, '2015-03-01 19:24:56', '2015-03-01 19:24:56', 'BECCALETTO MICHELE ALBERTO', 7728);


COMMIT;
