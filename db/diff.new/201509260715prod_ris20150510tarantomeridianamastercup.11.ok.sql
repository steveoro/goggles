--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'GAROFANO GIUSEPPE' (1973, gender: 1)
-- aliased with: 'GAROFALO GIUSEPPE' (ID:18124)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (267, '2015-09-26 07:21:19', '2015-09-26 07:21:19', 'GAROFANO GIUSEPPE', 18124);


-- Processing:...'SASSANELLI DONATO' (1984, gender: 1)

COMMIT;
