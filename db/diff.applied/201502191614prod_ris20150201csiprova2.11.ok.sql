--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'GruppoSportivo Riale':
-- aliased with: 'GRUPPO SPORTIVO RIALE' (ID:290)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (148, '2015-02-19 16:15:00', '2015-02-19 16:15:00', 'GruppoSportivo Riale', 290);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'AGRESTINI PIERFRANCESCO' (1940, gender: 1)
-- aliased with: 'AGRESTINI PIERFRANCO' (ID:2538)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (62, '2015-02-19 16:15:20', '2015-02-19 16:15:20', 'AGRESTINI PIERFRANCESCO', 2538);


-- Processing:...'AGUSTO MICHELE' (1991, gender: 1)
-- aliased with: 'AUGUSTO MICHELE' (ID:4867)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (63, '2015-02-19 16:15:20', '2015-02-19 16:15:20', 'AGUSTO MICHELE', 4867);


-- Processing:...'INCERTI TELANI JONATHAN' (1982, gender: 1)
-- aliased with: 'INCERTI TELANI JOHNATAN' (ID:1218)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (64, '2015-02-19 16:15:20', '2015-02-19 16:15:20', 'INCERTI TELANI JONATHAN', 1218);


-- Processing:...'MENOZZI MIRCO' (1962, gender: 1)
-- aliased with: 'MENOZZI MIRKO' (ID:1543)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (65, '2015-02-19 16:15:20', '2015-02-19 16:15:20', 'MENOZZI MIRCO', 1543);


-- Processing:...'PARENTI CHRISTIAN' (1968, gender: 1)
-- aliased with: 'PARENTI CRISTIAN' (ID:4019)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (66, '2015-02-19 16:15:20', '2015-02-19 16:15:20', 'PARENTI CHRISTIAN', 4019);


COMMIT;
