--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.DIL CENTRO SUB':
-- aliased with: 'NUOTO CLUB 2000' (ID:125)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (740, '2016-05-16 13:36:42', '2016-05-16 13:36:42', 'A.S.DIL CENTRO SUB', 125);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BARNABE' MICHELE' (1976, gender: 1)
-- aliased with: 'BARNABE` MICHELE' (ID:4906)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (439, '2016-05-16 13:37:25', '2016-05-16 13:37:25', 'BARNABE\' MICHELE', 4906);


-- Processing:...'BONDUA' FILIBERTO' (1935, gender: 1)
-- aliased with: 'BONDUA` FILIBERTO' (ID:4949)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (440, '2016-05-16 13:37:25', '2016-05-16 13:37:25', 'BONDUA\' FILIBERTO', 4949);


-- Processing:...'DI GREGORIO MATTEO RUDOLF' (1990, gender: 1)
-- aliased with: 'DI GREGORIO MATTEO' (ID:4087)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (441, '2016-05-16 13:37:25', '2016-05-16 13:37:25', 'DI GREGORIO MATTEO RUDOLF', 4087);


-- Processing:...'GABRIELLI SONIA' (1970, gender: 2)

COMMIT;
