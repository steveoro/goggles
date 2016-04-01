--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Payton Bari asd':
-- aliased with: 'PAYTON BARI' (ID:813)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (625, '2016-04-01 13:32:40', '2016-04-01 13:32:40', 'Payton Bari asd', 813);


-- Processing:...'PEPPE LAMBERTI NUOTO CLUB':
-- aliased with: 'PEPPE LAMBERTI N.C.' (ID:658)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (626, '2016-04-01 13:32:40', '2016-04-01 13:32:40', 'PEPPE LAMBERTI NUOTO CLUB', 658);


-- Processing:...'Pol Centrosport Brindisi':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CATAMERO' LUCA' (1992, gender: 1)
-- aliased with: 'CATAMERO` LUCA' (ID:11872)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (332, '2016-04-01 13:34:56', '2016-04-01 13:34:56', 'CATAMERO\' LUCA', 11872);


-- Processing:...'DEBENEDICTIS BERARDINO' (1964, gender: 1)
-- aliased with: 'DE BENEDICTIS BERARDINO' (ID:15410)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (333, '2016-04-01 13:34:56', '2016-04-01 13:34:56', 'DEBENEDICTIS BERARDINO', 15410);


-- Processing:...'DEGLI ABATI CLAUDIA' (1984, gender: 2)
-- aliased with: 'DEGLI ABBATI CLAUDIA' (ID:11928)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (334, '2016-04-01 13:34:56', '2016-04-01 13:34:56', 'DEGLI ABATI CLAUDIA', 11928);


-- Processing:...'DIVELLA SERENA' (1990, gender: 2)

-- Processing:...'LAGIOIA ORONZO' (1991, gender: 1)
-- aliased with: 'LA GIOIA ORONZO' (ID:12042)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (335, '2016-04-01 13:34:56', '2016-04-01 13:34:56', 'LAGIOIA ORONZO', 12042);


-- Processing:...'SENAFE' MARIA' (1971, gender: 2)
-- aliased with: 'SENAFE` MARIA' (ID:15604)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (336, '2016-04-01 13:34:56', '2016-04-01 13:34:56', 'SENAFE\' MARIA', 15604);


-- Processing:...'SINISI MICHELE' (1994, gender: 1)

-- Processing:...'VINCESILAO ARIANNA' (1996, gender: 2)
-- aliased with: 'VINCENSILAO ARIANNA' (ID:23912)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (337, '2016-04-01 13:34:56', '2016-04-01 13:34:56', 'VINCESILAO ARIANNA', 23912);


-- Processing:...'ZICARELLI DAVIDE MARIO' (1987, gender: 1)

COMMIT;
