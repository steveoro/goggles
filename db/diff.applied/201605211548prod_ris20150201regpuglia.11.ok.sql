--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ASSORI FOGGIA':
-- aliased with: 'AS.SO.RI ASD - FOGGIA' (ID:812)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (768, '2016-05-21 15:50:16', '2016-05-21 15:50:16', 'ASSORI FOGGIA', 812);


-- Processing:...'NEWTON PAYTON BARI':
-- aliased with: 'PAYTON BARI' (ID:813)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (769, '2016-05-21 15:50:16', '2016-05-21 15:50:16', 'NEWTON PAYTON BARI', 813);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'AZZARRO CONCETTA' (1987, gender: 2)
-- aliased with: 'AZZARO CONCETTA' (ID:26140)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (468, '2016-05-21 15:55:57', '2016-05-21 15:55:57', 'AZZARRO CONCETTA', 26140);


-- Processing:...'CAZZATO CARLO ANTONIO' (1954, gender: 1)
-- aliased with: 'CAZZATO CARLO' (ID:26080)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (469, '2016-05-21 15:55:57', '2016-05-21 15:55:57', 'CAZZATO CARLO ANTONIO', 26080);


-- Processing:...'D'APRILE ANTONIO' (1954, gender: 1)
-- aliased with: 'D`APRILE ANTONIO' (ID:15437)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (470, '2016-05-21 15:55:57', '2016-05-21 15:55:57', 'D\'APRILE ANTONIO', 15437);


-- Processing:...'DE ROBERTIS SILVIA' (1979, gender: 2)

-- Processing:...'ESPOSITO DANIELE' (1975, gender: 1)

COMMIT;
