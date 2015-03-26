--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'FORUM S.S.DILETT. A':
-- aliased with: 'FORUM SSD' (ID:96)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (251, '2015-03-01 00:29:39', '2015-03-01 00:29:39', 'FORUM S.S.DILETT. A', 96);


-- Processing:...'LECCO OLIMPICA NUOT':
-- aliased with: 'LECCOLIMPICA NUOTO' (ID:85)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (252, '2015-03-01 00:29:40', '2015-03-01 00:29:40', 'LECCO OLIMPICA NUOT', 85);


-- Processing:...'NUOTO CLUB SEREGNO':
-- aliased with: 'NC SEREGNO' (ID:238)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (253, '2015-03-01 00:29:40', '2015-03-01 00:29:40', 'NUOTO CLUB SEREGNO', 238);


COMMIT;
