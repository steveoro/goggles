--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.D WOLF'S SWIMMER':
-- aliased with: 'WOLF`S SWIMMER ASD' (ID:681)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (339, '2015-03-02 23:50:06', '2015-03-02 23:50:06', 'A.S.D WOLF\'S SWIMMER', 681);


-- Processing:...'ASD TEAM SPOT ISOLA':
-- aliased with: 'TEAM SPORT ISOLA AS' (ID:713)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (340, '2015-03-02 23:50:06', '2015-03-02 23:50:06', 'ASD TEAM SPOT ISOLA', 713);


-- Processing:...'LERICI SPORT':
-- aliased with: 'LERICI SPORT 1954' (ID:396)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (341, '2015-03-02 23:50:06', '2015-03-02 23:50:06', 'LERICI SPORT', 396);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'GALLIANO DAVIDE' (1988, gender: 1)
-- aliased with: 'GALIANO DAVIDE' (ID:1863)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (223, '2015-03-02 23:54:01', '2015-03-02 23:54:01', 'GALLIANO DAVIDE', 1863);


-- Processing:...'MENOZZI MIRKO VINCENZO' (1962, gender: 1)
-- aliased with: 'MENOZZI MIRKO' (ID:1543)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (224, '2015-03-02 23:54:01', '2015-03-02 23:54:01', 'MENOZZI MIRKO VINCENZO', 1543);


-- Processing:...'PALTRINIERI ALBERTO' (1987, gender: 1)

-- Processing:...'TIRELLI MARIA TERESA' (1967, gender: 2)
-- aliased with: 'TIRELLI MARIATERESA' (ID:15893)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (225, '2015-03-02 23:54:01', '2015-03-02 23:54:01', 'TIRELLI MARIA TERESA', 15893);


COMMIT;
