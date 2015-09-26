--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'NUOTATORI GENOVESI ASD - A':
-- aliased with: 'NUOTATORI GENOVESI' (ID:221)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (391, '2015-09-26 06:36:13', '2015-09-26 06:36:13', 'NUOTATORI GENOVESI ASD - A', 221);


-- Processing:...'NUOTATORI GENOVESI ASD - C':
-- aliased with: 'NUOTATORI GENOVESI' (ID:221)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (392, '2015-09-26 06:36:13', '2015-09-26 06:36:13', 'NUOTATORI GENOVESI ASD - C', 221);


COMMIT;
