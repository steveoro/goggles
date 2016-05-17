--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.DILETT. OLIMPICA SALENTIN':
-- aliased with: 'OLIMPICA SALENTINA ASD' (ID:725)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (741, '2016-05-16 15:23:39', '2016-05-16 15:23:39', 'A.S.DILETT. OLIMPICA SALENTIN', 725);


COMMIT;
