--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Circolo CAN ANIENE':
-- aliased with: 'C.C. ANIENE ASD' (ID:89)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (726, '2016-05-16 11:06:43', '2016-05-16 11:06:43', 'Circolo CAN ANIENE', 89);


-- Processing:...'HIDRO SPORT ASD':
-- aliased with: 'Hidro Sport ssd arl' (ID:921)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (727, '2016-05-16 11:06:43', '2016-05-16 11:06:43', 'HIDRO SPORT ASD', 921);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CONTI VALENTINA' (1982, gender: 2)

COMMIT;
