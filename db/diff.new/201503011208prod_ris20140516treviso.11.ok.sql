--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'2001 TEAM A.S.D.':
-- aliased with: 'ASD 2001 TEAM' (ID:557)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (259, '2015-03-01 12:14:57', '2015-03-01 12:14:57', '2001 TEAM A.S.D.', 557);


-- Processing:...'A.S. DILETT. MODENA':
-- aliased with: 'MODENA NUOTO' (ID:67)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (260, '2015-03-01 12:14:57', '2015-03-01 12:14:57', 'A.S. DILETT. MODENA', 67);


-- Processing:...'A.S. DILETT. NUOTO':
-- aliased with: 'NUOTO OTELLO PUTINA' (ID:342)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (261, '2015-03-01 12:14:57', '2015-03-01 12:14:57', 'A.S. DILETT. NUOTO', 342);


-- Processing:...'A.S.DILETT. ZERO9':
-- aliased with: 'ZERO9 SSD' (ID:213)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (262, '2015-03-01 12:14:57', '2015-03-01 12:14:57', 'A.S.DILETT. ZERO9', 213);


-- Processing:...'CIRCOLO NUOTO UISP':
-- aliased with: 'CN UISP BOLOGNA' (ID:233)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (263, '2015-03-01 12:14:57', '2015-03-01 12:14:57', 'CIRCOLO NUOTO UISP', 233);


-- Processing:...'ESTENSE NUOTO  CSI':
-- aliased with: 'ESTENSE NUOTO' (ID:28)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (264, '2015-03-01 12:14:57', '2015-03-01 12:14:57', 'ESTENSE NUOTO  CSI', 28);


-- Processing:...'MOLINELLA NUOTO A.S':
-- aliased with: 'AS MOLINELLA NUOTO' (ID:2)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (265, '2015-03-01 12:14:57', '2015-03-01 12:14:57', 'MOLINELLA NUOTO A.S', 2);


-- Processing:...'RARI NANTES MAROSTI':

-- Processing:...'RN NOVARA AS DILETT':
-- aliased with: 'RN NOVARA ASD' (ID:287)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (266, '2015-03-01 12:14:57', '2015-03-01 12:14:57', 'RN NOVARA AS DILETT', 287);


-- Processing:...'S.S.D. G.P. MODUGNO':

-- Processing:...'SAN GIUSEPPE S.S.DI':
-- aliased with: 'SAN GIUSEPPE SSD -' (ID:275)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (267, '2015-03-01 12:14:58', '2015-03-01 12:14:58', 'SAN GIUSEPPE S.S.DI', 275);


-- Processing:...'SND NUOTATORI TRENT':
-- aliased with: 'NUOTATORI TRENTINI' (ID:364)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (268, '2015-03-01 12:14:58', '2015-03-01 12:14:58', 'SND NUOTATORI TRENT', 364);


-- Processing:...'TIBIDABO SSD SRL':
-- aliased with: 'TIBIDABO SSD' (ID:97)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (269, '2015-03-01 12:14:58', '2015-03-01 12:14:58', 'TIBIDABO SSD SRL', 97);


-- Processing:...'VIS NOVA ROMA A.S.D':
-- aliased with: 'US VIS NOVA' (ID:448)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (270, '2015-03-01 12:14:58', '2015-03-01 12:14:58', 'VIS NOVA ROMA A.S.D', 448);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CALLEGARI FRANCO' (1966, gender: 1)

-- Processing:...'CAVIOLA LUCA' (1972, gender: 1)

-- Processing:...'PAVAN SILVIA' (1991, gender: 2)

-- Processing:...'TESSARO FRANCESCA' (1989, gender: 2)

-- Processing:...'TOME' ELISA' (1987, gender: 2)
-- aliased with: 'TOME` ELISA' (ID:17533)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (189, '2015-03-01 12:15:31', '2015-03-01 12:15:31', 'TOME\' ELISA', 17533);


COMMIT;
