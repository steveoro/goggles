--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'GYM SPORT MANIA S.S. DILETT.':
-- aliased with: 'Gym Sport Mania Ssd' (ID:917)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (668, '2016-04-20 07:23:26', '2016-04-20 07:23:26', 'GYM SPORT MANIA S.S. DILETT.', 917);


-- Processing:...'LA MASSERIA CLUB':
-- aliased with: 'LA MASSERIA AQUA AS' (ID:698)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (669, '2016-04-20 07:23:26', '2016-04-20 07:23:26', 'LA MASSERIA CLUB', 698);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'COZZOLINO FRANCECA' (1991, gender: 2)
-- aliased with: 'COZZOLINO FRANCESCA' (ID:9128)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (392, '2016-04-20 07:24:49', '2016-04-20 07:24:49', 'COZZOLINO FRANCECA', 9128);


-- Processing:...'D'ONZA DIANA' (1972, gender: 2)
-- aliased with: 'D`ONZA DIANA' (ID:13629)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (393, '2016-04-20 07:24:49', '2016-04-20 07:24:49', 'D\'ONZA DIANA', 13629);


-- Processing:...'EMANUELA ROMANO' (1990, gender: 2)
-- aliased with: 'ROMANO EMANUELA' (ID:23790)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (394, '2016-04-20 07:24:49', '2016-04-20 07:24:49', 'EMANUELA ROMANO', 23790);


-- Processing:...'FRANZONI ,ARCO ANTONIO' (1989, gender: 1)
-- aliased with: 'FRANZONI ANTONIO MARCO' (ID:23745)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (395, '2016-04-20 07:24:49', '2016-04-20 07:24:49', 'FRANZONI ,ARCO ANTONIO', 23745);


-- Processing:...'MICHELANGELO GIANSIRACUSA' (1971, gender: 1)
-- aliased with: 'GIANSIRACUSA MICHELANGELO' (ID:24188)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (396, '2016-04-20 07:24:49', '2016-04-20 07:24:49', 'MICHELANGELO GIANSIRACUSA', 24188);


-- Processing:...'SALVATORE NUBILE' (1965, gender: 1)
-- aliased with: 'NUBILE SALVATORE' (ID:13704)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (397, '2016-04-20 07:24:49', '2016-04-20 07:24:49', 'SALVATORE NUBILE', 13704);


-- Processing:...'SEVERINO ANGELO' (1977, gender: 1)
-- aliased with: 'SEVERINO GAETANO' (ID:17487)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (398, '2016-04-20 07:24:49', '2016-04-20 07:24:49', 'SEVERINO ANGELO', 17487);


COMMIT;
