--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'AQUAFIT CLUB':
-- aliased with: 'Aqua Fit Ssd - S.Gregorio' (ID:902)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (662, '2016-04-20 07:00:52', '2016-04-20 07:00:52', 'AQUAFIT CLUB', 902);


-- Processing:...'C.C. 7 SCOGLI SIRACUSA':
-- aliased with: 'Circ.Canottieri 7 Scogli' (ID:904)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (663, '2016-04-20 07:00:52', '2016-04-20 07:00:52', 'C.C. 7 SCOGLI SIRACUSA', 904);


-- Processing:...'SPRINTEAM SSDRL - A':
-- aliased with: 'Sprinteam Ssd' (ID:906)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (664, '2016-04-20 07:00:52', '2016-04-20 07:00:52', 'SPRINTEAM SSDRL - A', 906);


-- Processing:...'SPRINTEAM SSDRL - B':
-- aliased with: 'Sprinteam Ssd' (ID:906)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (665, '2016-04-20 07:00:52', '2016-04-20 07:00:52', 'SPRINTEAM SSDRL - B', 906);


-- Processing:...'Waterpolo Despar Messina - A':
-- aliased with: 'WATERPOLO MESSINA' (ID:608)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (666, '2016-04-20 07:00:52', '2016-04-20 07:00:52', 'Waterpolo Despar Messina - A', 608);


-- Processing:...'Waterpolo Despar Messina - B':
-- aliased with: 'WATERPOLO MESSINA' (ID:608)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (667, '2016-04-20 07:00:52', '2016-04-20 07:00:52', 'Waterpolo Despar Messina - B', 608);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ALBO BENEDETTO GIOVANNI MARIA' (1969, gender: 1)
-- aliased with: 'ALBO BENEDETTO GIOVANNI MARI' (ID:20008)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (387, '2016-04-20 07:01:48', '2016-04-20 07:01:48', 'ALBO BENEDETTO GIOVANNI MARIA', 20008);


-- Processing:...'CUCE' ANDREA GABRIELE' (1992, gender: 1)
-- aliased with: 'CUCE` ANDREA GABRIELE' (ID:10034)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (388, '2016-04-20 07:01:48', '2016-04-20 07:01:48', 'CUCE\' ANDREA GABRIELE', 10034);


-- Processing:...'DELL'AQUILA ANTONELLA' (1959, gender: 2)
-- aliased with: 'DELL`AQUILA ANTONELLA' (ID:23470)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (389, '2016-04-20 07:01:48', '2016-04-20 07:01:48', 'DELL\'AQUILA ANTONELLA', 23470);


-- Processing:...'GARI' MARZIO' (1973, gender: 1)
-- aliased with: 'GARI MARZIO' (ID:12872)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (390, '2016-04-20 07:01:48', '2016-04-20 07:01:48', 'GARI\' MARZIO', 12872);


-- Processing:...'SCATA' GIUSEPPE' (1976, gender: 1)
-- aliased with: 'SCATA` GIUSEPPE' (ID:12984)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (391, '2016-04-20 07:01:48', '2016-04-20 07:01:48', 'SCATA\' GIUSEPPE', 12984);


COMMIT;
