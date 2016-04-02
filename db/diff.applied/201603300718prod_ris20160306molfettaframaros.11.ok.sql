--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Seven Sport Sistem Ssd':
-- aliased with: 'NEW SEVEN SPORT SRL' (ID:705)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (616, '2016-03-30 07:22:49', '2016-03-30 07:22:49', 'Seven Sport Sistem Ssd', 705);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'LOIUDICE GIUSEPPE' (1953, gender: 1)

-- Processing:...'MERRA SEBASTIANO' (1969, gender: 1)

-- Processing:...'MICELLO COSIMO DAMIANO' (1994, gender: 1)
-- aliased with: 'MICELLO COSIMO' (ID:13246)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (328, '2016-03-30 07:24:35', '2016-03-30 07:24:35', 'MICELLO COSIMO DAMIANO', 13246);


COMMIT;
