--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Pol.Villaggio Fanciullo':
-- aliased with: 'ASD VILLAGGIO' (ID:25)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (550, '2016-02-23 07:17:59', '2016-02-23 07:17:59', 'Pol.Villaggio Fanciullo', 25);


-- Processing:...'VV FF Reggio E. M.Marconi':
-- aliased with: 'VV.F. M.MARCONI' (ID:31)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (551, '2016-02-23 07:17:59', '2016-02-23 07:17:59', 'VV FF Reggio E. M.Marconi', 31);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BULGARELLI STEFANO' (1985, gender: 1)

-- Processing:...'CLO` ANDREA' (1972, gender: 1)
-- aliased with: 'CLO' ANDREA' (ID:22139)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (295, '2016-02-23 07:19:11', '2016-02-23 07:19:11', 'CLO` ANDREA', 22139);


-- Processing:...'FACETTI MARTA' (1988, gender: 2)
-- aliased with: 'FACCETTI MARTA' (ID:20952)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (296, '2016-02-23 07:19:11', '2016-02-23 07:19:11', 'FACETTI MARTA', 20952);


-- Processing:...'PASTORELLI GABIRELE' (1980, gender: 1)
-- aliased with: 'PASTORELLI GABRIELE' (ID:1574)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (297, '2016-02-23 07:19:11', '2016-02-23 07:19:11', 'PASTORELLI GABIRELE', 1574);


-- Processing:...'ROSSELLI PATRIZIA' (1969, gender: 2)

-- Processing:...'SABATINO GIORGIA' (1982, gender: 2)

COMMIT;
