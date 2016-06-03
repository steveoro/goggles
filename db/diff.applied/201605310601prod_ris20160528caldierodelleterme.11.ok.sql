--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ASD BUONCONSIGLIO N':
-- aliased with: 'SS BUONCONSIGLIO N' (ID:466)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (828, '2016-05-31 06:05:12', '2016-05-31 06:05:12', 'ASD BUONCONSIGLIO N', 466);


-- Processing:...'ASD BUONCONSIGLIO NUOTO':
-- aliased with: 'SS BUONCONSIGLIO N' (ID:466)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (829, '2016-05-31 06:05:12', '2016-05-31 06:05:12', 'ASD BUONCONSIGLIO NUOTO', 466);


-- Processing:...'ASD MASTER MELZO NU':
-- aliased with: 'MASTER MELZO N' (ID:64)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (830, '2016-05-31 06:05:12', '2016-05-31 06:05:12', 'ASD MASTER MELZO NU', 64);


-- Processing:...'C.U.S. FERRARA ASD':
-- aliased with: 'CUS Ferrara asd' (ID:824)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (831, '2016-05-31 06:05:12', '2016-05-31 06:05:12', 'C.U.S. FERRARA ASD', 824);


-- Processing:...'DE AKKER TEAM S.S.D':
-- aliased with: 'CIVATURS DE AKKER' (ID:255)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (832, '2016-05-31 06:05:12', '2016-05-31 06:05:12', 'DE AKKER TEAM S.S.D', 255);


-- Processing:...'LENO 2001 SSD A RL':
-- aliased with: 'ASD 2001 TEAM' (ID:557)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (833, '2016-05-31 06:05:12', '2016-05-31 06:05:12', 'LENO 2001 SSD A RL', 557);


-- Processing:...'SETTEFRATI LIBERTAS MN 33 ASD':
-- aliased with: 'SETTEFRATI LIBERTAS' (ID:333)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (834, '2016-05-31 06:05:12', '2016-05-31 06:05:12', 'SETTEFRATI LIBERTAS MN 33 ASD', 333);


-- Processing:...'SWIMMING WHY NOT S.':

-- Processing:...'TEAM NUOTO FORLI' A':
-- aliased with: 'TEAM NUOTO FORLÌ ASD' (ID:865)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (835, '2016-05-31 06:05:12', '2016-05-31 06:05:12', 'TEAM NUOTO FORLI\' A', 865);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'D'ANGELI VALENTINA' (1985, gender: 2)
-- aliased with: 'D`ANGELI VALENTINA' (ID:22410)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (531, '2016-05-31 06:09:59', '2016-05-31 06:09:59', 'D\'ANGELI VALENTINA', 22410);


-- Processing:...'DONEGA' DANIELE' (1980, gender: 1)
-- aliased with: 'DONEGA` DANIELE' (ID:21335)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (532, '2016-05-31 06:09:59', '2016-05-31 06:09:59', 'DONEGA\' DANIELE', 21335);


-- Processing:...'ROSSATO GIUSEPPE' (1965, gender: 1)

COMMIT;
