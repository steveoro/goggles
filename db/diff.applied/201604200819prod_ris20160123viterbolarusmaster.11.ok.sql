--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Dimensione N Vitorchiano - A':
-- aliased with: 'DIMENSIONE N VITORC' (ID:617)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (670, '2016-04-20 08:21:06', '2016-04-20 08:21:06', 'Dimensione N Vitorchiano - A', 617);


-- Processing:...'Dimensione N Vitorchiano - B':
-- aliased with: 'DIMENSIONE N VITORC' (ID:617)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (671, '2016-04-20 08:21:06', '2016-04-20 08:21:06', 'Dimensione N Vitorchiano - B', 617);


-- Processing:...'Larus Nuoto - A':
-- aliased with: 'AS LARUS NUOTO' (ID:116)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (672, '2016-04-20 08:21:06', '2016-04-20 08:21:06', 'Larus Nuoto - A', 116);


-- Processing:...'Larus Nuoto - B':
-- aliased with: 'AS LARUS NUOTO' (ID:116)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (673, '2016-04-20 08:21:06', '2016-04-20 08:21:06', 'Larus Nuoto - B', 116);


-- Processing:...'TEAM NUOTO ORTE':
-- aliased with: 'Team Orte asd' (ID:881)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (674, '2016-04-20 08:21:06', '2016-04-20 08:21:06', 'TEAM NUOTO ORTE', 881);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'RINCHIUSI EMANUELE TANCREDO' (1977, gender: 1)
-- aliased with: 'RINCHIUSI EMANUELE TANCRE' (ID:22780)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (399, '2016-04-20 08:21:24', '2016-04-20 08:21:24', 'RINCHIUSI EMANUELE TANCREDO', 22780);


COMMIT;
