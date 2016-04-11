--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Aqualife':
-- aliased with: 'Acqualife Stezzano' (ID:897)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (637, '2016-04-06 07:37:06', '2016-04-06 07:37:06', 'Aqualife', 897);


COMMIT;
