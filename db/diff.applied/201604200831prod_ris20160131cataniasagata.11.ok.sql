--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.D. ULYSSE':
-- aliased with: 'ULYSSE ASD' (ID:335)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (675, '2016-04-20 08:36:12', '2016-04-20 08:36:12', 'A.S.D. ULYSSE', 335);


-- Processing:...'ATHON AUGUSTA':
-- aliased with: 'ASD ATHON AUGUSTA' (ID:601)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (676, '2016-04-20 08:36:12', '2016-04-20 08:36:12', 'ATHON AUGUSTA', 601);


-- Processing:...'P.S.C. CATANIA A.P.D':
-- aliased with: 'P.S.C. CATANIA' (ID:606)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (677, '2016-04-20 08:36:12', '2016-04-20 08:36:12', 'P.S.C. CATANIA A.P.D', 606);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CAPUTO STEFANO' (1984, gender: 1)

COMMIT;
