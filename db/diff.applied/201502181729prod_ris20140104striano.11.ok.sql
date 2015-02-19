--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.D.JOLLY N.C.':
-- aliased with: 'JOLLY NUOTO CL. BEN' (ID:490)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (144, '2015-02-18 17:34:11', '2015-02-18 17:34:11', 'A.S.D.JOLLY N.C.', 490);


-- Processing:...'AS SOTTOSOPRA':

-- Processing:...'AS. DIL. ATLANDITE NUOTO':
-- aliased with: 'ASD ATLANTIDE NUOTO' (ID:484)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (145, '2015-02-18 17:34:11', '2015-02-18 17:34:11', 'AS. DIL. ATLANDITE NUOTO', 484);


-- Processing:...'NADIR SSD - PUTIGNA':

-- Processing:...'NUOTO CASTELLANA AR':

-- Processing:...'PIAVE NUOTO AS':
-- aliased with: 'PIAVE NUOTO A.S.D.' (ID:166)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (146, '2015-02-18 17:34:12', '2015-02-18 17:34:12', 'PIAVE NUOTO AS', 166);


-- Processing:...'RANIDAE CSSD':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'DE MICCO CARIMINE' (1957, gender: 1)
-- aliased with: 'DE MICCO CARMINE' (ID:9146)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (61, '2015-02-18 17:34:34', '2015-02-18 17:34:34', 'DE MICCO CARIMINE', 9146);


-- Processing:...'SCATIGNA ANTONIA MARIA' (1978, gender: 2)

COMMIT;
