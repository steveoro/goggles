--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ENJOY SSD - CERNUSCO':
-- aliased with: 'ENJOY SSD' (ID:351)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (510, '2016-01-07 11:00:16', '2016-01-07 11:00:16', 'ENJOY SSD - CERNUSCO', 351);


-- Processing:...'GSL asd - Cinisello B.':

-- Processing:...'H2O MUGGIO'':

-- Processing:...'In Sport ssd - Vimercate':
-- aliased with: 'IN SPORT SRL' (ID:478)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (511, '2016-01-07 11:00:19', '2016-01-07 11:00:19', 'In Sport ssd - Vimercate', 478);


-- Processing:...'Libertas Due Valli - Luse':
-- aliased with: 'LIBERTAS DUE VALLI A.S.D' (ID:410)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (512, '2016-01-07 11:00:19', '2016-01-07 11:00:19', 'Libertas Due Valli - Luse', 410);


-- Processing:...'Libertas Merate Due asd':
-- aliased with: 'LIB MERATE DUE' (ID:65)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (513, '2016-01-07 11:00:19', '2016-01-07 11:00:19', 'Libertas Merate Due asd', 65);


-- Processing:...'Polisp San Giuliano ssd':
-- aliased with: 'POLISPORTIVA SANGIULIANESE' (ID:400)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (514, '2016-01-07 11:00:19', '2016-01-07 11:00:19', 'Polisp San Giuliano ssd', 400);


-- Processing:...'Pratogrande Sport - Garla':
-- aliased with: 'PRATOGRANDE SPORT' (ID:53)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (515, '2016-01-07 11:00:19', '2016-01-07 11:00:19', 'Pratogrande Sport - Garla', 53);


-- Processing:...'Rane Rosse asd':

-- Processing:...'San Carlo Sport - Milano':
-- aliased with: 'SAN CARLO SPORT SSD' (ID:384)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (516, '2016-01-07 11:00:21', '2016-01-07 11:00:21', 'San Carlo Sport - Milano', 384);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CIARDIELLO STEFANO' (1986, gender: 1)

-- Processing:...'DEGASPERI EMILIA' (1988, gender: 2)
-- aliased with: 'DE GASPARI EMILIA' (ID:18433)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (287, '2016-01-07 11:03:55', '2016-01-07 11:03:55', 'DEGASPERI EMILIA', 18433);


-- Processing:...'MARCHESE DOMENICO' (1967, gender: 1)

-- Processing:...'MORANDI ANDREA' (1979, gender: 1)

-- Processing:...'SPIALTINI ANDREA' (1976, gender: 1)

-- Processing:...'VILLA LUCA' (1993, gender: 1)

COMMIT;
