--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Asd C.N.Sub Villa':
-- aliased with: 'CN SUB VILLA ASD' (ID:506)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (790, '2016-05-22 19:57:06', '2016-05-22 19:57:06', 'Asd C.N.Sub Villa', 506);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'AITALA FRANCESCO MARIA PASQU' (1962, gender: 1)
-- aliased with: 'AITALA FRANCESCO' (ID:23427)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (499, '2016-05-22 20:00:27', '2016-05-22 20:00:27', 'AITALA FRANCESCO MARIA PASQU', 23427);


-- Processing:...'PERROTTA GIAN CARLO' (1960, gender: 1)
-- aliased with: 'PERROTTA GIANCARLO' (ID:23523)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (500, '2016-05-22 20:00:27', '2016-05-22 20:00:27', 'PERROTTA GIAN CARLO', 23523);


-- Processing:...'VERMIGLIO ANTONELLA' (1983, gender: 2)
-- aliased with: 'VERMIGLIO ANTONINA' (ID:16647)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (501, '2016-05-22 20:00:27', '2016-05-22 20:00:27', 'VERMIGLIO ANTONELLA', 16647);


COMMIT;
