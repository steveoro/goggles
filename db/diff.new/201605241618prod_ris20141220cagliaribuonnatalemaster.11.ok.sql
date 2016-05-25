--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ASD ACQUAMANIA':
-- aliased with: 'ACQUAMANIA ASD - CA' (ID:538)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (794, '2016-05-24 16:19:26', '2016-05-24 16:19:26', 'ASD ACQUAMANIA', 538);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'HEISTE EVELIN' (1972, gender: 2)
-- aliased with: 'HEISTE MODDE EVELIN' (ID:11105)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (508, '2016-05-24 16:19:43', '2016-05-24 16:19:43', 'HEISTE EVELIN', 11105);


COMMIT;
