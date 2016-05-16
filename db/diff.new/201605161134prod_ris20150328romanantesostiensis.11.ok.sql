--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ATHLONS SSD - ROMA':
-- aliased with: 'ATHLON SSD - ROMA' (ID:796)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (731, '2016-05-16 11:36:18', '2016-05-16 11:36:18', 'ATHLONS SSD - ROMA', 796);


-- Processing:...'LUMANUOTO SSD - ARICCIA':
-- aliased with: 'LUMANUOTO SSD' (ID:797)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (732, '2016-05-16 11:36:18', '2016-05-16 11:36:18', 'LUMANUOTO SSD - ARICCIA', 797);


-- Processing:...'SISTEMI INTEGRATI SPORT':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ALESSANDRONI CHIARA' (1994, gender: 2)

-- Processing:...'BARBALISCI ILARIA' (1984, gender: 2)
-- aliased with: 'BARBALISCIA ILARIA' (ID:16875)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (427, '2016-05-16 11:37:33', '2016-05-16 11:37:33', 'BARBALISCI ILARIA', 16875);


-- Processing:...'CASULA ROBERTO' (1969, gender: 1)

-- Processing:...'PIETRANGELI FRANCESCO' (1982, gender: 1)
-- aliased with: 'PETRANGELI FRANCESCO' (ID:16229)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (428, '2016-05-16 11:37:33', '2016-05-16 11:37:33', 'PIETRANGELI FRANCESCO', 16229);


COMMIT;
