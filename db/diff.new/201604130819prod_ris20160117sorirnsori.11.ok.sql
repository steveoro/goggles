--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'R.N. SORI':
-- aliased with: 'RARI NANTES SORI' (ID:285)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (654, '2016-04-13 08:19:32', '2016-04-13 08:19:32', 'R.N. SORI', 285);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'FOGLIARINI GIAN MARCO' (1968, gender: 1)
-- aliased with: 'FOGLIARINI GIANMARCO' (ID:21569)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (377, '2016-04-13 08:21:43', '2016-04-13 08:21:43', 'FOGLIARINI GIAN MARCO', 21569);


COMMIT;
