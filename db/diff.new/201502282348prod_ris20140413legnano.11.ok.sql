--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.D. R.N. APRILIA':
-- aliased with: 'RARI NANTES APRILIA' (ID:443)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (248, '2015-02-28 23:49:48', '2015-02-28 23:49:48', 'A.S.D. R.N. APRILIA', 443);


-- Processing:...'CSI VERBANIA ASD':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'GOBBI FILIPPO' (1974, gender: 1)

-- Processing:...'PANARELLO ANNAMARIA' (1957, gender: 2)
-- aliased with: 'PANARIELLO ANNAMARIA' (ID:9653)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (179, '2015-02-28 23:51:30', '2015-02-28 23:51:30', 'PANARELLO ANNAMARIA', 9653);


-- Processing:...'SONCIN MICHELA' (1971, gender: 2)

COMMIT;
