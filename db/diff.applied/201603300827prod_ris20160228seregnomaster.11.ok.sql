--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Asa Asd Cinisello Balsamo':
-- aliased with: 'ASA  CINISELLO' (ID:77)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (619, '2016-03-30 08:29:41', '2016-03-30 08:29:41', 'Asa Asd Cinisello Balsamo', 77);


-- Processing:...'Asd Viribus Unitis':
-- aliased with: 'VIRIBUS UNITIS' (ID:481)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (620, '2016-03-30 08:29:41', '2016-03-30 08:29:41', 'Asd Viribus Unitis', 481);


-- Processing:...'Life Pool & Fitness Ssd':

-- Processing:...'Sky Line Nuoto':
-- aliased with: 'SKY LINE N' (ID:98)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (621, '2016-03-30 08:29:42', '2016-03-30 08:29:42', 'Sky Line Nuoto', 98);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BENZONI DAVIDE' (1993, gender: 1)

-- Processing:...'CATTANEO GRETA' (1991, gender: 2)

-- Processing:...'CERRAI MASSIMO' (1971, gender: 1)
-- aliased with: 'MASSIMO CERRAI' (ID:23220)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (330, '2016-03-30 08:30:48', '2016-03-30 08:30:48', 'CERRAI MASSIMO', 23220);


-- Processing:...'LA MILIA LAURA' (1991, gender: 2)

-- Processing:...'LIGAMMARI MARTA SILVANA' (1993, gender: 2)
-- aliased with: 'LIGAMMARI MARTA' (ID:12539)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (331, '2016-03-30 08:30:48', '2016-03-30 08:30:48', 'LIGAMMARI MARTA SILVANA', 12539);


-- Processing:...'MAZZANTI SILVIA' (1994, gender: 2)

COMMIT;
