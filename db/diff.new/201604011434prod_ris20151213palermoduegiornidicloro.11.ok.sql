--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Aquarius asd - Trapani':
-- aliased with: 'AQUARIUS AS' (ID:503)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (627, '2016-04-01 14:38:56', '2016-04-01 14:38:56', 'Aquarius asd - Trapani', 503);


-- Processing:...'Asd Swim Power - Bagheria':
-- aliased with: 'SWIM POWER ASD' (ID:513)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (628, '2016-04-01 14:38:56', '2016-04-01 14:38:56', 'Asd Swim Power - Bagheria', 513);


-- Processing:...'Pol GIFA Città di Palermo':
-- aliased with: 'POLISPORTIVA GIFA' (ID:510)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (629, '2016-04-01 14:38:56', '2016-04-01 14:38:56', 'Pol GIFA Città di Palermo', 510);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'DATTILA DANIELA' (1975, gender: 2)

-- Processing:...'MARTELLO ROCCO' (1969, gender: 1)

-- Processing:...'MOLINA LUCA' (1975, gender: 1)

COMMIT;
