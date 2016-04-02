--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Zerouno ssd - Firenze':
-- aliased with: 'ZEROUNO SSD ARL' (ID:337)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (632, '2016-04-01 15:40:34', '2016-04-01 15:40:34', 'Zerouno ssd - Firenze', 337);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ANTICHI ALESSANDRO' (1984, gender: 1)

-- Processing:...'D`AULERIO MATTIA' (1979, gender: 1)
-- aliased with: 'D'AULERIO MATTIA' (ID:22614)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (341, '2016-04-01 15:42:24', '2016-04-01 15:42:24', 'D`AULERIO MATTIA', 22614);


COMMIT;
