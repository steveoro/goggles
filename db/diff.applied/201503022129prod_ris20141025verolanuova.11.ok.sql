--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.D. FLAMINIO S.C.':
-- aliased with: 'FLAMINIO SPORTING C' (ID:202)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (304, '2015-03-02 21:35:44', '2015-03-02 21:35:44', 'A.S.D. FLAMINIO S.C.', 202);


-- Processing:...'ACQUARE' FRANCIACORTA':
-- aliased with: 'ACQUAR` FRANCIACORT' (ID:661)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (305, '2015-03-02 21:35:45', '2015-03-02 21:35:45', 'ACQUARE\' FRANCIACORTA', 661);


-- Processing:...'AQUATIC CENTER SSD':

-- Processing:...'AQVASPORT SSD':
-- aliased with: 'AQVASPORT DK SSD' (ID:91)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (306, '2015-03-02 21:35:45', '2015-03-02 21:35:45', 'AQVASPORT SSD', 91);


-- Processing:...'IL CIGNO COOP.SPORT':
-- aliased with: 'COOP IL CIGNO' (ID:75)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (307, '2015-03-02 21:35:45', '2015-03-02 21:35:45', 'IL CIGNO COOP.SPORT', 75);


-- Processing:...'VIMERCATE N':
-- aliased with: 'VIMERCATE NUOTO' (ID:52)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (308, '2015-03-02 21:35:45', '2015-03-02 21:35:45', 'VIMERCATE N', 52);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CANTONI GIAMPAOLO' (1961, gender: 1)

-- Processing:...'PELO' SIMONE' (1975, gender: 1)
-- aliased with: 'PELO` SIMONE' (ID:2237)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (215, '2015-03-02 21:39:56', '2015-03-02 21:39:56', 'PELO\' SIMONE', 2237);


-- Processing:...'VANELLI ANDREA' (1979, gender: 1)

-- Processing:...'VENÏ¿½ FRANCESCO' (1973, gender: 1)
-- aliased with: 'VENÈ FRANCESCO' (ID:3949)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (216, '2015-03-02 21:39:56', '2015-03-02 21:39:56', 'VENÏ¿½ FRANCESCO', 3949);


COMMIT;
