--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ASD NUOT MODENESI PO':
-- aliased with: 'N MODENESI' (ID:257)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (630, '2016-04-01 14:45:51', '2016-04-01 14:45:51', 'ASD NUOT MODENESI PO', 257);


-- Processing:...'Milano Nuoto Master asd - A':
-- aliased with: 'MILANO NUOTO MASTER' (ID:236)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (631, '2016-04-01 14:45:51', '2016-04-01 14:45:51', 'Milano Nuoto Master asd - A', 236);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CONSOLO MASSIMO' (1981, gender: 1)
-- aliased with: 'CONSOLI MASSIMO' (ID:346)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (340, '2016-04-01 14:47:01', '2016-04-01 14:47:01', 'CONSOLO MASSIMO', 346);


-- Processing:...'MAFFI MARCO' (1979, gender: 1)

COMMIT;
