--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'AS.MERANO':
-- aliased with: 'AS MERANO' (ID:450)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (752, '2016-05-19 07:06:42', '2016-05-19 07:06:42', 'AS.MERANO', 450);


-- Processing:...'ESC SSD BRESCIA':
-- aliased with: 'ESC SSD - BRESCIA' (ID:59)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (753, '2016-05-19 07:06:42', '2016-05-19 07:06:42', 'ESC SSD BRESCIA', 59);


-- Processing:...'POLISP. AVI VIPITENO':

-- Processing:...'R.N. TRENTO':
-- aliased with: 'POL. R.N. TRENTO' (ID:102)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (754, '2016-05-19 07:06:42', '2016-05-19 07:06:42', 'R.N. TRENTO', 102);


-- Processing:...'R.N. TRENTO - A':
-- aliased with: 'POL. R.N. TRENTO' (ID:102)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (755, '2016-05-19 07:06:42', '2016-05-19 07:06:42', 'R.N. TRENTO - A', 102);


-- Processing:...'R.N. TRENTO - B':
-- aliased with: 'POL. R.N. TRENTO' (ID:102)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (756, '2016-05-19 07:06:42', '2016-05-19 07:06:42', 'R.N. TRENTO - B', 102);


-- Processing:...'TEAM 2001':
-- aliased with: 'ASD 2001 TEAM' (ID:557)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (757, '2016-05-19 07:06:42', '2016-05-19 07:06:42', 'TEAM 2001', 557);


-- Processing:...'TEAM 2001 - A':
-- aliased with: 'ASD 2001 TEAM' (ID:557)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (758, '2016-05-19 07:06:42', '2016-05-19 07:06:42', 'TEAM 2001 - A', 557);


-- Processing:...'TEAM 2001 - B':
-- aliased with: 'ASD 2001 TEAM' (ID:557)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (759, '2016-05-19 07:06:42', '2016-05-19 07:06:42', 'TEAM 2001 - B', 557);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'D'ORO MASSIMO' (1989, gender: 1)
-- aliased with: 'D´ORO MASSIMO' (ID:8498)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (451, '2016-05-19 07:08:37', '2016-05-19 07:08:37', 'D\'ORO MASSIMO', 8498);


-- Processing:...'DEMATTE' STEFANIA' (1989, gender: 2)
-- aliased with: 'DEMATTE` STEFANIA' (ID:8490)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (452, '2016-05-19 07:08:37', '2016-05-19 07:08:37', 'DEMATTE\' STEFANIA', 8490);


-- Processing:...'GHELMI ANDREA' (1972, gender: 1)
-- aliased with: 'GHIELMI ANDREA' (ID:19768)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (453, '2016-05-19 07:08:37', '2016-05-19 07:08:37', 'GHELMI ANDREA', 19768);


-- Processing:...'ORFINO MANUEL' (1991, gender: 1)

-- Processing:...'PITTONE FEDERICO' (1968, gender: 1)
-- aliased with: 'PITONE FEDERICO' (ID:21304)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (454, '2016-05-19 07:08:37', '2016-05-19 07:08:37', 'PITTONE FEDERICO', 21304);


-- Processing:...'POCHIESA ANREINA' (1951, gender: 2)
-- aliased with: 'POCHIESA ANDREINA' (ID:22413)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (455, '2016-05-19 07:08:37', '2016-05-19 07:08:37', 'POCHIESA ANREINA', 22413);


COMMIT;
