--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'NUOTO SICILIA SSD':
-- aliased with: 'SICILIA NUOTO SSD ARL' (ID:715)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (283, '2015-03-01 13:58:02', '2015-03-01 13:58:02', 'NUOTO SICILIA SSD', 715);


COMMIT;
