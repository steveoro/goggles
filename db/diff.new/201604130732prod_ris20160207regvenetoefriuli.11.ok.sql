--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'KDP PRIMORJE':

-- Processing:...'KOPER':

-- Processing:...'Kuma ssd Arl':
-- aliased with: 'KUMA S.S.DILETT. AR' (ID:636)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (649, '2016-04-13 07:34:39', '2016-04-13 07:34:39', 'Kuma ssd Arl', 636);


-- Processing:...'Vigili Fuoco - Trieste':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CUCE` ROSARIO' (1955, gender: 1)
-- aliased with: 'CUCE' ROSARIO' (ID:23303)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (374, '2016-04-13 07:35:24', '2016-04-13 07:35:24', 'CUCE` ROSARIO', 23303);


-- Processing:...'DEL GOBBO MASSIMO' (1960, gender: 1)

-- Processing:...'D`ALESSANDRO CRISTINA' (1971, gender: 2)
-- aliased with: 'D'ALESSANDRO CRISTINA' (ID:14019)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (375, '2016-04-13 07:35:24', '2016-04-13 07:35:24', 'D`ALESSANDRO CRISTINA', 14019);


COMMIT;
