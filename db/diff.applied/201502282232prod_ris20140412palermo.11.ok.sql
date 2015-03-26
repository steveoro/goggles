--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'KAS NUOTO ASD':
-- aliased with: 'KAS NUOTO COMISO' (ID:689)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (246, '2015-02-28 22:34:35', '2015-02-28 22:34:35', 'KAS NUOTO ASD', 689);


-- Processing:...'POLISPORTIVA MIMMO FERRITO SS':
-- aliased with: 'POL.MIMMO FERRITO S' (ID:330)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (247, '2015-02-28 22:34:35', '2015-02-28 22:34:35', 'POLISPORTIVA MIMMO FERRITO SS', 330);


-- Processing:...'SICILIA NUOTO SSD ARL':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ALAZIO FABRIZIO' (1969, gender: 1)

-- Processing:...'ARICO` COSTANZA' (1973, gender: 2)
-- aliased with: 'ARICO' COSTANZA' (ID:9927)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (172, '2015-02-28 22:35:13', '2015-02-28 22:35:13', 'ARICO` COSTANZA', 9927);


-- Processing:...'MARCENO' GIUSEPPE' (1975, gender: 1)
-- aliased with: 'MARCENO` GIUSEPPE' (ID:10173)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (173, '2015-02-28 22:35:13', '2015-02-28 22:35:13', 'MARCENO\' GIUSEPPE', 10173);


-- Processing:...'MARCHELLO DANIELE' (1992, gender: 1)

-- Processing:...'PATERNO' IVAN' (1979, gender: 1)
-- aliased with: 'PATERNO` IVAN' (ID:16563)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (174, '2015-02-28 22:35:13', '2015-02-28 22:35:13', 'PATERNO\' IVAN', 16563);


-- Processing:...'PLATANIA CRISTINA' (1974, gender: 2)

COMMIT;
