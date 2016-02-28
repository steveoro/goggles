--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'asd Wolf`s Swimmer - C.Ar':
-- aliased with: 'WOLF`S SWIMMER ASD' (ID:681)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (552, '2016-02-28 14:11:51', '2016-02-28 14:11:51', 'asd Wolf`s Swimmer - C.Ar', 681);


-- Processing:...'Campus Team':

-- Processing:...'Chiavenna Nuoto':

-- Processing:...'Fanfulla Nuoto e Pallanuo':
-- aliased with: 'FANFULLA N PN' (ID:758)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (553, '2016-02-28 14:11:52', '2016-02-28 14:11:52', 'Fanfulla Nuoto e Pallanuo', 758);


-- Processing:...'Gonzaga Sport Club ssd':

-- Processing:...'H2O SSD - MUGGIÒ':
-- aliased with: 'H2O MUGGIO'' (ID:853)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (554, '2016-02-28 14:11:52', '2016-02-28 14:11:52', 'H2O SSD - MUGGIÒ', 853);


-- Processing:...'Ronchiverdi ssd':
-- aliased with: 'RONCHIVERDI S.S.DILETT.ARL' (ID:856)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (555, '2016-02-28 14:11:52', '2016-02-28 14:11:52', 'Ronchiverdi ssd', 856);


-- Processing:...'SPM Sport ssd - Paullo':
-- aliased with: 'SPM SPORT - PAULLO' (ID:334)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (556, '2016-02-28 14:11:52', '2016-02-28 14:11:52', 'SPM Sport ssd - Paullo', 334);


-- Processing:...'Sport Club 12 sd - Ispra':
-- aliased with: 'SPORT CLUB 12 SRL S' (ID:276)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (557, '2016-02-28 14:11:52', '2016-02-28 14:11:52', 'Sport Club 12 sd - Ispra', 276);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ALLI GABRIELE' (1990, gender: 1)

-- Processing:...'FONTANA ELENA' (1976, gender: 2)

-- Processing:...'GENNARI PIERLUIGI' (1969, gender: 1)

-- Processing:...'LAGRASTA FRANCESCA' (1985, gender: 2)

-- Processing:...'MARINONI AMANDA GIULIA' (1968, gender: 2)
-- aliased with: 'MARINONI AMANDA G' (ID:2283)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (299, '2016-02-28 14:13:13', '2016-02-28 14:13:13', 'MARINONI AMANDA GIULIA', 2283);


-- Processing:...'PALLINI LEONARDO' (1974, gender: 1)

-- Processing:...'PIEMONTESI JACOPO' (1990, gender: 1)

COMMIT;
