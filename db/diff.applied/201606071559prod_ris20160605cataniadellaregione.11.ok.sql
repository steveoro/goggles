--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Forum S.S.D. Assago':
-- aliased with: 'FORUM SSD' (ID:96)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (849, '2016-06-07 16:10:36', '2016-06-07 16:10:36', 'Forum S.S.D. Assago', 96);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CALI' IGOR MARIA GIUSEPPE' (1980, gender: 1)
-- aliased with: 'CALÏ¿½ IGOR MARIA GIUSEPPE' (ID:23442)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (535, '2016-06-07 16:12:21', '2016-06-07 16:12:21', 'CALI\' IGOR MARIA GIUSEPPE', 23442);


-- Processing:...'IMPALA` NATALE' (1970, gender: 1)

-- Processing:...'MORALE SALVATORE' (1990, gender: 1)
-- aliased with: 'MORALE SALVO' (ID:26822)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (536, '2016-06-07 16:12:21', '2016-06-07 16:12:21', 'MORALE SALVATORE', 26822);


-- Processing:...'PASSARO ADELE' (1969, gender: 2)

COMMIT;
