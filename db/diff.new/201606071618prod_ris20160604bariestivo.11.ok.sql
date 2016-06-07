--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Centro Nuoto Lucano Savigi':
-- aliased with: 'As.Dil. C.N. Savigi' (ID:913)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (850, '2016-06-07 16:22:25', '2016-06-07 16:22:25', 'Centro Nuoto Lucano Savigi', 913);


-- Processing:...'Molfetta Nuoto S.S.D':
-- aliased with: 'MOLFETTA NUOTO' (ID:583)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (851, '2016-06-07 16:22:25', '2016-06-07 16:22:25', 'Molfetta Nuoto S.S.D', 583);


-- Processing:...'S.S.D. Sport Club Arl':
-- aliased with: 'SPORT CLUB SSD - BA' (ID:591)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (852, '2016-06-07 16:22:25', '2016-06-07 16:22:25', 'S.S.D. Sport Club Arl', 591);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'GIANCARLO RINALDI' (1952, gender: 1)
-- aliased with: 'RINALDI GIANCARLO' (ID:18315)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (537, '2016-06-07 16:24:04', '2016-06-07 16:24:04', 'GIANCARLO RINALDI', 18315);


-- Processing:...'VENTURA FEDERICO BARTOLO' (1990, gender: 1)
-- aliased with: 'VENTURA BARTOLOMEO' (ID:12363)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (538, '2016-06-07 16:24:04', '2016-06-07 16:24:04', 'VENTURA FEDERICO BARTOLO', 12363);


COMMIT;
