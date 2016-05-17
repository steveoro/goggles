--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ASD TEAM NUOTO SIRACUSA':
-- aliased with: 'TEAM NUOTO SIRACUSA' (ID:514)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (734, '2016-05-16 12:47:20', '2016-05-16 12:47:20', 'ASD TEAM NUOTO SIRACUSA', 514);


-- Processing:...'ATHLON S.S.D.':
-- aliased with: 'ATHLON SSD - ROMA' (ID:796)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (735, '2016-05-16 12:47:20', '2016-05-16 12:47:20', 'ATHLON S.S.D.', 796);


-- Processing:...'SPORT CLUB S.S. DILETT ARL':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ABATE DINO DONATO' (1985, gender: 1)
-- aliased with: 'ABATE DINO' (ID:22272)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (431, '2016-05-16 12:47:49', '2016-05-16 12:47:49', 'ABATE DINO DONATO', 22272);


-- Processing:...'DI FOLCO ILARIO' (1977, gender: 1)
-- aliased with: 'DIFOLCO ILARIO' (ID:23953)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (432, '2016-05-16 12:47:49', '2016-05-16 12:47:49', 'DI FOLCO ILARIO', 23953);


COMMIT;
