--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'FROG SWIMMING LIB.CAGLIARI':
-- aliased with: 'FROG SWIMMING LIB.C' (ID:544)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (733, '2016-05-16 12:28:40', '2016-05-16 12:28:40', 'FROG SWIMMING LIB.CAGLIARI', 544);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ORRU` ELISABETTA' (1978, gender: 2)
-- aliased with: 'ORRU' ELISABETTA' (ID:22975)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (429, '2016-05-16 12:31:13', '2016-05-16 12:31:13', 'ORRU` ELISABETTA', 22975);


-- Processing:...'ORRÏ¿½ SALVATORE' (1964, gender: 1)
-- aliased with: 'ORRÙ SALVATORE' (ID:11190)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (430, '2016-05-16 12:31:13', '2016-05-16 12:31:13', 'ORRÏ¿½ SALVATORE', 11190);


-- Processing:...'PALERMO LUIGI' (1985, gender: 1)

COMMIT;
