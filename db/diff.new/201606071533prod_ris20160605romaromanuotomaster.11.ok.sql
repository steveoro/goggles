--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.D.CHIMERA NUOTO':
-- aliased with: 'CHIMERA NUOTO 1980' (ID:374)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (847, '2016-06-07 15:35:52', '2016-06-07 15:35:52', 'A.S.D.CHIMERA NUOTO', 374);


-- Processing:...'EDOARDO ANTONELLI SSD ARL':
-- aliased with: 'EDOARDO ANTONELLI 2' (ID:432)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (848, '2016-06-07 15:35:52', '2016-06-07 15:35:52', 'EDOARDO ANTONELLI SSD ARL', 432);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'D`AURIA ROBERTO' (1964, gender: 1)
-- aliased with: 'D'AURIA ROBERTO' (ID:21540)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (534, '2016-06-07 15:36:53', '2016-06-07 15:36:53', 'D`AURIA ROBERTO', 21540);


COMMIT;
