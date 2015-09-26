--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ALL STARS S.C. MOSCOW':

-- Processing:...'AQAVION A.S.DILETT.':
-- aliased with: 'AQAVION ASD - NAPOL' (ID:623)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (393, '2015-09-26 06:51:55', '2015-09-26 06:51:55', 'AQAVION A.S.DILETT.', 623);


-- Processing:...'AQAVION A.S.DILETT. - A':
-- aliased with: 'AQAVION ASD - NAPOL' (ID:623)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (394, '2015-09-26 06:51:55', '2015-09-26 06:51:55', 'AQAVION A.S.DILETT. - A', 623);


-- Processing:...'ASD ARIETE':
-- aliased with: 'A.S.DILETT. ARIETE' (ID:622)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (395, '2015-09-26 06:51:55', '2015-09-26 06:51:55', 'ASD ARIETE', 622);


-- Processing:...'CARAVAGGIO S.V. AQUA SSD':
-- aliased with: 'CARAVAGGIO SPORTING VILLAGE' (ID:731)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (396, '2015-09-26 06:51:55', '2015-09-26 06:51:55', 'CARAVAGGIO S.V. AQUA SSD', 731);


-- Processing:...'CIRC.SPORT.NAPOLI NUOTO':

-- Processing:...'FLAMINIO SPORTING CLUB - A':
-- aliased with: 'FLAMINIO SPORTING C' (ID:202)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (397, '2015-09-26 06:51:55', '2015-09-26 06:51:55', 'FLAMINIO SPORTING CLUB - A', 202);


-- Processing:...'RARI NANTES NUOTO SALERNO - A':
-- aliased with: 'RARI NANTES NUOTO S' (ID:492)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (398, '2015-09-26 06:51:55', '2015-09-26 06:51:55', 'RARI NANTES NUOTO SALERNO - A', 492);


-- Processing:...'RHYFLEL SSD':

-- Processing:...'SINTESI SSD - A':
-- aliased with: 'SINTESI S.S.D.' (ID:194)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (399, '2015-09-26 06:51:56', '2015-09-26 06:51:56', 'SINTESI SSD - A', 194);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'FORQUET ERALDO' (1965, gender: 1)
-- aliased with: 'FORQUET ALDO' (ID:14964)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (265, '2015-09-26 06:55:54', '2015-09-26 06:55:54', 'FORQUET ERALDO', 14964);


-- Processing:...'LANDI FRANCESCO' (1978, gender: 1)

-- Processing:...'SIANO SERENA' (1987, gender: 2)

-- Processing:...'TERRIBILE FORTUNATO' (1965, gender: 1)

COMMIT;
