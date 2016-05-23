--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ASD H2O AQUATIC CENTER GIARRE':
-- aliased with: 'H2O AQUATIC CENTER ASD' (ID:801)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (770, '2016-05-21 16:08:09', '2016-05-21 16:08:09', 'ASD H2O AQUATIC CENTER GIARRE', 801);


-- Processing:...'ASD NUOTO ATLANTIS':
-- aliased with: 'NUOTO ATLANTIS - SIRACUSA' (ID:955)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (771, '2016-05-21 16:08:09', '2016-05-21 16:08:09', 'ASD NUOTO ATLANTIS', 955);


-- Processing:...'POLISPORTIVA ZENION RAGUSA':
-- aliased with: 'Pol.va Zenion CRAI' (ID:732)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (772, '2016-05-21 16:08:09', '2016-05-21 16:08:09', 'POLISPORTIVA ZENION RAGUSA', 732);


-- Processing:...'S.S.D. SYNTHESIS NUOTO ARL':
-- aliased with: 'A.S.D. SYNTHESIS NUOTO' (ID:600)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (773, '2016-05-21 16:08:09', '2016-05-21 16:08:09', 'S.S.D. SYNTHESIS NUOTO ARL', 600);


-- Processing:...'SOC. POL. MIMMO FERRITO':
-- aliased with: 'POL.MIMMO FERRITO S' (ID:330)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (774, '2016-05-21 16:08:09', '2016-05-21 16:08:09', 'SOC. POL. MIMMO FERRITO', 330);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CICCIARELLO ROCCO' (1974, gender: 1)

-- Processing:...'DE MATINO LORENA' (1980, gender: 2)
-- aliased with: 'DE MARTINO LORENA' (ID:16790)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (471, '2016-05-21 16:11:51', '2016-05-21 16:11:51', 'DE MATINO LORENA', 16790);


-- Processing:...'MUDO' ANNALISA' (1973, gender: 2)
-- aliased with: 'MUDO` ANNALISA MARIA' (ID:20158)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (472, '2016-05-21 16:11:51', '2016-05-21 16:11:51', 'MUDO\' ANNALISA', 20158);


-- Processing:...'ZAPPALA' VERONICA' (1984, gender: 2)
-- aliased with: 'ZAPPALA` VERONICA' (ID:20154)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (473, '2016-05-21 16:11:51', '2016-05-21 16:11:51', 'ZAPPALA\' VERONICA', 20154);


COMMIT;
