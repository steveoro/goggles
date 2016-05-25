--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.D. FLY ON THE WATER':
-- aliased with: 'FLY ON THE WATER ASD' (ID:435)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (805, '2016-05-24 17:10:44', '2016-05-24 17:10:44', 'A.S.D. FLY ON THE WATER', 435);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'D'AMBROSIO SERENA' (1974, gender: 2)
-- aliased with: 'D`AMBROSIO SERENA' (ID:14938)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (513, '2016-05-24 17:11:37', '2016-05-24 17:11:37', 'D\'AMBROSIO SERENA', 14938);


-- Processing:...'D'ARCO RAFFAELE' (1971, gender: 1)

-- Processing:...'MORETTI JENNIFER' (1992, gender: 2)
-- aliased with: 'MORETTI JENNIPHER' (ID:3291)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (514, '2016-05-24 17:11:37', '2016-05-24 17:11:37', 'MORETTI JENNIFER', 3291);


COMMIT;
