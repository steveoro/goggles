--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CAN BALDESIO - A':
-- aliased with: 'CAN BALDESIO' (ID:45)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (389, '2015-09-26 06:20:20', '2015-09-26 06:20:20', 'CAN BALDESIO - A', 45);


-- Processing:...'CAN BALDESIO - B':
-- aliased with: 'CAN BALDESIO' (ID:45)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (390, '2015-09-26 06:20:20', '2015-09-26 06:20:20', 'CAN BALDESIO - B', 45);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'DENTICO TOMMASO' (1988, gender: 1)

-- Processing:...'MORELLI GIUSEPPE' (1969, gender: 1)

COMMIT;
