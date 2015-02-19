--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'C.S. VELATHRI NUOTO':
-- aliased with: 'VELATHRI NUOTO' (ID:404)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (114, '2015-02-18 14:49:19', '2015-02-18 14:49:19', 'C.S. VELATHRI NUOTO', 404);


-- Processing:...'CIRCOLO SUB T. TESEI':
-- aliased with: 'TESEO TESEI PORTOFERRAIO' (ID:403)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (115, '2015-02-18 14:49:19', '2015-02-18 14:49:19', 'CIRCOLO SUB T. TESEI', 403);


-- Processing:...'POLISPORTIVA AMATORI PRATO AS':
-- aliased with: 'POL. AMATORI PRATO' (ID:343)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (116, '2015-02-18 14:49:19', '2015-02-18 14:49:19', 'POLISPORTIVA AMATORI PRATO AS', 343);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BERTINI MARCO' (1970, gender: 1)

-- Processing:...'CASATI MARCO' (1967, gender: 1)

-- Processing:...'CASCIOTTI SERENA' (1987, gender: 2)

-- Processing:...'DE MARTINO ALBERTO' (1971, gender: 1)

-- Processing:...'DEL DIANDA FRANCESCA' (1974, gender: 2)

-- Processing:...'GABELLONE MARCO' (1970, gender: 1)

-- Processing:...'MORETTI ANDREA' (1979, gender: 1)

-- Processing:...'PADUANO ANTONIO' (1988, gender: 1)

-- Processing:...'PIERONI CHIARA' (1982, gender: 2)

-- Processing:...'PUCCINELLI DANIELE' (1974, gender: 1)

-- Processing:...'STEFANONI ENRICO' (1982, gender: 1)
-- aliased with: 'STEFANORI ENRICO' (ID:6794)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (42, '2015-02-18 14:51:02', '2015-02-18 14:51:02', 'STEFANONI ENRICO', 6794);


COMMIT;
