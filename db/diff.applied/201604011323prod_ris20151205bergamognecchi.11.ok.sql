--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Clorolesi Treviglio asd - A':
-- aliased with: 'CLOROLESI TREVIGLIO' (ID:47)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (622, '2016-04-01 13:24:17', '2016-04-01 13:24:17', 'Clorolesi Treviglio asd - A', 47);


-- Processing:...'Clorolesi Treviglio asd - B':
-- aliased with: 'CLOROLESI TREVIGLIO' (ID:47)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (623, '2016-04-01 13:24:17', '2016-04-01 13:24:17', 'Clorolesi Treviglio asd - B', 47);


-- Processing:...'Piscina Com.le Stezzano':
-- aliased with: 'Piscine Com. Stezzano - Bg' (ID:894)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (624, '2016-04-01 13:24:17', '2016-04-01 13:24:17', 'Piscina Com.le Stezzano', 894);


COMMIT;
