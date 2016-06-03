--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'5 TERRE SWIMMING':
-- aliased with: 'ASD 5 TERRE SWIMMIN' (ID:750)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (815, '2016-05-25 08:05:25', '2016-05-25 08:05:25', '5 TERRE SWIMMING', 750);


-- Processing:...'CANOTTIERI ANIENE':
-- aliased with: 'C.C. ANIENE ASD' (ID:89)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (816, '2016-05-25 08:05:25', '2016-05-25 08:05:25', 'CANOTTIERI ANIENE', 89);


-- Processing:...'CANOTTIERI VITTORINO':
-- aliased with: 'CAN VITTORINO' (ID:100)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (817, '2016-05-25 08:05:25', '2016-05-25 08:05:25', 'CANOTTIERI VITTORINO', 100);


-- Processing:...'COOPERATIVA IL CIGNO':
-- aliased with: 'COOP IL CIGNO' (ID:75)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (818, '2016-05-25 08:05:25', '2016-05-25 08:05:25', 'COOPERATIVA IL CIGNO', 75);


-- Processing:...'POLISPORTIVA SAN GIULIANO':
-- aliased with: 'POL S.GIULIANO' (ID:41)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (819, '2016-05-25 08:05:25', '2016-05-25 08:05:25', 'POLISPORTIVA SAN GIULIANO', 41);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'FERRARI MATTIA' (1991, gender: 1)

-- Processing:...'RESTIVO VITTORIO' (1974, gender: 1)

COMMIT;
