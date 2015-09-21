--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S. DILETT. AQUATI':
-- aliased with: 'AQUATIC TEAM RAVENN' (ID:251)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (380, '2015-09-18 14:44:17', '2015-09-18 14:44:17', 'A.S. DILETT. AQUATI', 251);


-- Processing:...'AS DILET. NUOTO CLU':
-- aliased with: 'N.C. AZZURRA 1991' (ID:9)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (381, '2015-09-18 14:44:17', '2015-09-18 14:44:17', 'AS DILET. NUOTO CLU', 9);


-- Processing:...'ASS. SPORT. DIL. VE':
-- aliased with: 'VERSILIANUOTO' (ID:320)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (382, '2015-09-18 14:44:17', '2015-09-18 14:44:17', 'ASS. SPORT. DIL. VE', 320);


-- Processing:...'CENTRO SPORTIVO HOF':

-- Processing:...'VEROLANUOTO ASD':
-- aliased with: 'VEROLANUOTO' (ID:80)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (383, '2015-09-18 14:44:17', '2015-09-18 14:44:17', 'VEROLANUOTO ASD', 80);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'LIBE' GABRIELE' (1965, gender: 1)
-- aliased with: 'LIBE` GABRIELE' (ID:18905)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (261, '2015-09-18 14:44:58', '2015-09-18 14:44:58', 'LIBE\' GABRIELE', 18905);


-- Processing:...'MODENESE MATTEO' (1976, gender: 1)

-- Processing:...'ZANINI LETIZIA' (1986, gender: 2)

COMMIT;
