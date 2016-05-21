--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'RANAZZURRA S.S.D.':
-- aliased with: 'RANAZZURRA CONEGLIANO S.S.D. rl' (ID:168)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (767, '2016-05-21 10:19:28', '2016-05-21 10:19:28', 'RANAZZURRA S.S.D.', 168);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BOSCARI MICHELA' (1977, gender: 2)

-- Processing:...'D'ADAMO LUCIANO' (1973, gender: 1)
-- aliased with: 'D`ADAMO LUCIANO' (ID:19144)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (466, '2016-05-21 10:21:08', '2016-05-21 10:21:08', 'D\'ADAMO LUCIANO', 19144);


-- Processing:...'DE FABRIS STEFANO' (1982, gender: 1)

-- Processing:...'GEROMEL GIULIANO' (1976, gender: 1)

-- Processing:...'SANTANDREA GIORDIA' (1990, gender: 2)
-- aliased with: 'SANTANDREA GIORGIA' (ID:24976)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (467, '2016-05-21 10:21:08', '2016-05-21 10:21:08', 'SANTANDREA GIORDIA', 24976);


-- Processing:...'SPINATO GIULIA' (1991, gender: 2)

COMMIT;
