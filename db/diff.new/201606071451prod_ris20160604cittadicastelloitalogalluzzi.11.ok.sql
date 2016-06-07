--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Asd Umbria Nuoto':
-- aliased with: 'UMBRIA NUOTO ASD' (ID:685)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (843, '2016-06-07 14:52:58', '2016-06-07 14:52:58', 'Asd Umbria Nuoto', 685);


-- Processing:...'Piscine Dello Stadio Fitness':
-- aliased with: 'PISCINE DELLO STADIO SSD ARL' (ID:830)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (844, '2016-06-07 14:52:58', '2016-06-07 14:52:58', 'Piscine Dello Stadio Fitness', 830);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'SANTINI GABRIELE FRANCO MARIA' (1961, gender: 1)
-- aliased with: 'SANTINI GABRIELE LELIO FRANC' (ID:13169)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (533, '2016-06-07 14:54:03', '2016-06-07 14:54:03', 'SANTINI GABRIELE FRANCO MARIA', 13169);


COMMIT;
