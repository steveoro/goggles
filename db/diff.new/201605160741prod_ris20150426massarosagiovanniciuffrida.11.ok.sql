--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S. DIL. MASSA NUOT':

-- Processing:...'FUTURA CLUB PRATO S':
-- aliased with: 'FUTURA CLUB I CAVALIERI' (ID:766)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (711, '2016-05-16 07:46:14', '2016-05-16 07:46:14', 'FUTURA CLUB PRATO S', 766);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'LUCCHESI ALESSIA' (1980, gender: 2)
-- aliased with: 'LUCCHESI ALESSI' (ID:9794)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (416, '2016-05-16 07:49:36', '2016-05-16 07:49:36', 'LUCCHESI ALESSIA', 9794);


-- Processing:...'MAGGINI CARLO' (1978, gender: 1)

-- Processing:...'TOMMASINI ANDREA' (1983, gender: 1)

COMMIT;
