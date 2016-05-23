--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.D. ATHON AUGUSTA':
-- aliased with: 'ASD ATHON AUGUSTA' (ID:601)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (777, '2016-05-21 17:10:51', '2016-05-21 17:10:51', 'A.S.D. ATHON AUGUSTA', 601);


-- Processing:...'A.S.D. NUOTO ATLANTIS':
-- aliased with: 'NUOTO ATLANTIS - SIRACUSA' (ID:955)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (778, '2016-05-21 17:10:51', '2016-05-21 17:10:51', 'A.S.D. NUOTO ATLANTIS', 955);


-- Processing:...'A.S.D. NUOTO MILAZZO':
-- aliased with: 'NUOTO MILAZZO ASD' (ID:690)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (779, '2016-05-21 17:10:51', '2016-05-21 17:10:51', 'A.S.D. NUOTO MILAZZO', 690);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'FARINA SILVO' (1979, gender: 1)

COMMIT;
