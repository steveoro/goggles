--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'LARUS VITERBO':
-- aliased with: 'AS LARUS NUOTO' (ID:116)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (775, '2016-05-21 16:42:26', '2016-05-21 16:42:26', 'LARUS VITERBO', 116);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BUGLIOSI ALESSIO' (1992, gender: 1)
-- aliased with: 'BUGLIOSO ALESSIO' (ID:20340)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (475, '2016-05-21 16:43:14', '2016-05-21 16:43:14', 'BUGLIOSI ALESSIO', 20340);


-- Processing:...'DE GIOVANNI MAURIZIO' (1978, gender: 1)

COMMIT;
