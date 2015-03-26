--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'AS C. FUTURA TIRANO':
-- aliased with: 'FUTURA TIRANO' (ID:220)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (207, '2015-02-26 10:25:09', '2015-02-26 10:25:09', 'AS C. FUTURA TIRANO', 220);


-- Processing:...'ASD B2K SWIM TEAM':
-- aliased with: 'B2K SWIM TEAM ASD' (ID:391)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (208, '2015-02-26 10:25:09', '2015-02-26 10:25:09', 'ASD B2K SWIM TEAM', 391);


-- Processing:...'ASOLA NUOTO':
-- aliased with: 'ASOLA N' (ID:324)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (209, '2015-02-26 10:25:09', '2015-02-26 10:25:09', 'ASOLA NUOTO', 324);


-- Processing:...'CAN NINO BIXIO':

-- Processing:...'REZZATO NUOTO':
-- aliased with: 'REZZATO N' (ID:60)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (210, '2015-02-26 10:25:10', '2015-02-26 10:25:10', 'REZZATO NUOTO', 60);


-- Processing:...'RN UOEI TREVISO':
-- aliased with: 'RARI NANTES U.O.E.I' (ID:316)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (211, '2015-02-26 10:25:10', '2015-02-26 10:25:10', 'RN UOEI TREVISO', 316);


-- Processing:...'SAN GIUSEPPE SSD - ARESE':
-- aliased with: 'SAN GIUSEPPE SSD -' (ID:275)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (212, '2015-02-26 10:25:10', '2015-02-26 10:25:10', 'SAN GIUSEPPE SSD - ARESE', 275);


-- Processing:...'SPORT & FITNESS MILLENNIUM BS':
-- aliased with: 'SPORT & FITNESS SSD' (ID:464)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (213, '2015-02-26 10:25:10', '2015-02-26 10:25:10', 'SPORT & FITNESS MILLENNIUM BS', 464);


-- Processing:...'TORINO NUOTO':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'MASSETTI BARBARA' (1987, gender: 2)
-- aliased with: 'MASETTI BARBARA' (ID:8870)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (129, '2015-02-26 10:26:56', '2015-02-26 10:26:56', 'MASSETTI BARBARA', 8870);


-- Processing:...'MORO GIACOMO MARIA' (1961, gender: 1)
-- aliased with: 'MORO GIACOMO' (ID:10502)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (130, '2015-02-26 10:26:56', '2015-02-26 10:26:56', 'MORO GIACOMO MARIA', 10502);


-- Processing:...'POLA ELENA' (1967, gender: 2)

-- Processing:...'SERAMONDI FRANCESCA' (1987, gender: 2)

COMMIT;
