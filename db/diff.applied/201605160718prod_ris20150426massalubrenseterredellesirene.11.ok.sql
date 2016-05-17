--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ASD MASSA LUBRENSE NUOTO':
-- aliased with: 'Massa Lubrense Nuoto Asd' (ID:892)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (698, '2016-05-16 07:19:21', '2016-05-16 07:19:21', 'ASD MASSA LUBRENSE NUOTO', 892);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'D'AMBROSIO FABRIZIO' (1963, gender: 1)
-- aliased with: 'D`AMBROSIO FABRIZIO' (ID:20761)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (415, '2016-05-16 07:19:35', '2016-05-16 07:19:35', 'D\'AMBROSIO FABRIZIO', 20761);


COMMIT;
