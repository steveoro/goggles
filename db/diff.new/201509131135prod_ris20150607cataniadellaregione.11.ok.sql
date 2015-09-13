--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ALTAIR NUOTO SSD':
-- aliased with: 'ALTAIR VULCANIA NUO' (ID:322)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (370, '2015-09-13 11:49:24', '2015-09-13 11:49:24', 'ALTAIR NUOTO SSD', 322);


-- Processing:...'BARCELLONA NUOTO ASD':

-- Processing:...'CITTÀ DELLO SPORT SSD':

-- Processing:...'FAMILA MURI ANTICHI CT':
-- aliased with: 'POL. DIL. MURI ANTICHI' (ID:631)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (371, '2015-09-13 11:49:25', '2015-09-13 11:49:25', 'FAMILA MURI ANTICHI CT', 631);


-- Processing:...'H2O AQUATIC CENTER ASD':

-- Processing:...'NUOTO CATANIA':

-- Processing:...'NUOTO `95 - SIRACUSA':
-- aliased with: 'TEAM NUOTO SIRACUSA' (ID:514)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (372, '2015-09-13 11:49:25', '2015-09-13 11:49:25', 'NUOTO `95 - SIRACUSA', 514);


-- Processing:...'ODYSSEUS MESSINA ASD':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BARBAGALLO NUNZIATA' (1979, gender: 2)

-- Processing:...'BIONDI SALVATORE MICHELE' (1987, gender: 1)

-- Processing:...'FARANDA MARIACRISTINA' (1976, gender: 2)
-- aliased with: 'FARANDA MARIA CRISTINA' (ID:16444)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (249, '2015-09-13 11:53:07', '2015-09-13 11:53:07', 'FARANDA MARIACRISTINA', 16444);


-- Processing:...'GENNARO GIUSEPPE' (1973, gender: 1)

-- Processing:...'HERBERG ROLAND MIRKO' (1975, gender: 1)
-- aliased with: 'HERBERG ROLAND' (ID:16480)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (250, '2015-09-13 11:53:08', '2015-09-13 11:53:08', 'HERBERG ROLAND MIRKO', 16480);


-- Processing:...'LUPICA DAVIDE SEBASTIANO' (1991, gender: 1)
-- aliased with: 'LUPICA DAVIDE' (ID:13854)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (251, '2015-09-13 11:53:08', '2015-09-13 11:53:08', 'LUPICA DAVIDE SEBASTIANO', 13854);


-- Processing:...'MANGIU` DANIELE' (1994, gender: 1)
-- aliased with: 'MANGIU' DANIELE' (ID:13858)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (252, '2015-09-13 11:53:08', '2015-09-13 11:53:08', 'MANGIU` DANIELE', 13858);


-- Processing:...'MUDO` ANNALISA MARIA' (1973, gender: 2)

-- Processing:...'NOE` VALERIA AGATA' (1978, gender: 2)
-- aliased with: 'NOE' VALERIA AGATA' (ID:18374)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (253, '2015-09-13 11:53:08', '2015-09-13 11:53:08', 'NOE` VALERIA AGATA', 18374);


-- Processing:...'SICLARI MARZIA ROSY' (1967, gender: 2)
-- aliased with: 'SICLARI MARZIA' (ID:12993)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (254, '2015-09-13 11:53:08', '2015-09-13 11:53:08', 'SICLARI MARZIA ROSY', 12993);


-- Processing:...'TRIFILO` ANTONINO' (1987, gender: 1)
-- aliased with: 'TRIFILO' ANTONINO' (ID:16641)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (255, '2015-09-13 11:53:08', '2015-09-13 11:53:08', 'TRIFILO` ANTONINO', 16641);


-- Processing:...'ZANGHI` GIOVANNI' (1975, gender: 1)
-- aliased with: 'ZANGHI' GIOVANNI' (ID:18040)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (256, '2015-09-13 11:53:08', '2015-09-13 11:53:08', 'ZANGHI` GIOVANNI', 18040);


COMMIT;
