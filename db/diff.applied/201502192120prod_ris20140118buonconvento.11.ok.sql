--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'01ZEROUNO SSD ARL':
-- aliased with: 'ZEROUNO SSD ARL' (ID:337)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (156, '2015-02-19 21:22:07', '2015-02-19 21:22:07', '01ZEROUNO SSD ARL', 337);


-- Processing:...'TEAM ACQUA SPORT SSD RL':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'GHIGI LUCA' (1979, gender: 1)

-- Processing:...'LUCIANO` ANGELO' (1968, gender: 1)
-- aliased with: 'LUCIANO ANGELO' (ID:367)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (76, '2015-02-19 21:30:10', '2015-02-19 21:30:10', 'LUCIANO` ANGELO', 367);


-- Processing:...'PIANIGIANI JACOPO' (1981, gender: 1)
-- aliased with: 'PIANIGIANI IACOPO' (ID:5385)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (77, '2015-02-19 21:30:10', '2015-02-19 21:30:10', 'PIANIGIANI JACOPO', 5385);


-- Processing:...'RIGHI ANDREA' (1979, gender: 1)

-- Processing:...'TORRICELLI GABRIELE' (1984, gender: 1)
-- aliased with: 'TORRI CELLI GABRIELE' (ID:5535)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (78, '2015-02-19 21:30:10', '2015-02-19 21:30:10', 'TORRICELLI GABRIELE', 5535);


-- Processing:...'VALERI GIANLUCA' (1972, gender: 1)

COMMIT;
