--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'SSA VIENNA OLDIES':
-- aliased with: 'VIENNA OLDIES' (ID:781)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (806, '2016-05-24 18:32:28', '2016-05-24 18:32:28', 'SSA VIENNA OLDIES', 781);


COMMIT;
