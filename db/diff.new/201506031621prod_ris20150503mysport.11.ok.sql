--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'DORIA NUOTO 2000 LOANO ASD':
-- aliased with: 'DORIA NUOTO 2000 LO' (ID:282)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (351, '2015-06-03 16:23:43', '2015-06-03 16:23:43', 'DORIA NUOTO 2000 LOANO ASD', 282);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'D'ANTONIO MASSIMILIANO' (1981, gender: 1)
-- aliased with: 'D`ANTONIO MASSIMILIANO' (ID:4765)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (241, '2015-06-03 16:25:25', '2015-06-03 16:25:25', 'D\'ANTONIO MASSIMILIANO', 4765);


-- Processing:...'DEMAESTRI ALBERTO' (1970, gender: 1)
-- aliased with: 'DEMAESTRIS ALBERTO' (ID:14736)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (242, '2015-06-03 16:25:25', '2015-06-03 16:25:25', 'DEMAESTRI ALBERTO', 14736);


-- Processing:...'POGGI PATRIZIA' (1960, gender: 2)

COMMIT;
