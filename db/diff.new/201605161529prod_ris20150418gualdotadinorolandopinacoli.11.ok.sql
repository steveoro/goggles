--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ASD NANTES C.MASTER':
-- aliased with: 'NANTES CLUB MASTER' (ID:82)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (742, '2016-05-16 15:31:18', '2016-05-16 15:31:18', 'ASD NANTES C.MASTER', 82);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'GRAZINI GIACOMO' (1989, gender: 1)
-- aliased with: 'GRAZINI GIASCOMO' (ID:25432)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (443, '2016-05-16 15:32:38', '2016-05-16 15:32:38', 'GRAZINI GIACOMO', 25432);


COMMIT;
