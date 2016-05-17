--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ACQUA1 VILLAGE':
-- aliased with: 'ACQUA1VILLAGE ASD' (ID:265)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (712, '2016-05-16 08:06:11', '2016-05-16 08:06:11', 'ACQUA1 VILLAGE', 265);


-- Processing:...'SIS NUOTO VERONA ASD':
-- aliased with: 'A.S.D. SIS NUOTO VERONA' (ID:144)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (713, '2016-05-16 08:06:11', '2016-05-16 08:06:11', 'SIS NUOTO VERONA ASD', 144);


COMMIT;
