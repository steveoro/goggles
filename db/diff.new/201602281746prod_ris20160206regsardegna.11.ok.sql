--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Acquasport ssd - Ca':
-- aliased with: 'ACQUASPORT SRL SSD' (ID:539)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (568, '2016-02-28 17:49:13', '2016-02-28 17:49:13', 'Acquasport ssd - Ca', 539);


-- Processing:...'As Nuotomania - Cag':
-- aliased with: 'NUOTOMANIA ASD' (ID:545)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (569, '2016-02-28 17:49:13', '2016-02-28 17:49:13', 'As Nuotomania - Cag', 545);


-- Processing:...'Asd Swim Sassari':

-- Processing:...'Dolphin - Delfino a':
-- aliased with: 'ASD DOLPHIN DELFINO' (ID:541)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (570, '2016-02-28 17:49:13', '2016-02-28 17:49:13', 'Dolphin - Delfino a', 541);


-- Processing:...'Green Alghero asd':

-- Processing:...'Nuoto Club Cagliari':

-- Processing:...'Promogest Coop - Ca':
-- aliased with: 'PROMOGEST S.C. A R.' (ID:549)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (571, '2016-02-28 17:49:14', '2016-02-28 17:49:14', 'Promogest Coop - Ca', 549);


-- Processing:...'Ssd Promosport - Ca':
-- aliased with: 'PROMOSPORT SSD' (ID:550)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (572, '2016-02-28 17:49:14', '2016-02-28 17:49:14', 'Ssd Promosport - Ca', 550);


-- Processing:...'Tennis Club Su Plan':
-- aliased with: 'TENNIS CLUB S.P.SEZ.' (ID:88)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (573, '2016-02-28 17:49:14', '2016-02-28 17:49:14', 'Tennis Club Su Plan', 88);


-- Processing:...'Waterland Nuoto asd':
-- aliased with: 'WATERLAND ASD' (ID:555)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (574, '2016-02-28 17:49:14', '2016-02-28 17:49:14', 'Waterland Nuoto asd', 555);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ANGIONI STEFANO' (1982, gender: 1)

-- Processing:...'ARESU MARCO GIOVANNI' (1984, gender: 1)

-- Processing:...'CALZIA GUIDO' (1966, gender: 1)

-- Processing:...'DESSI' MARIA ANTONIETTA' (1963, gender: 2)
-- aliased with: 'DESSI` MARIA ANTONIETTA' (ID:11075)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (306, '2016-02-28 17:50:41', '2016-02-28 17:50:41', 'DESSI\' MARIA ANTONIETTA', 11075);


-- Processing:...'JORES RITA M.DESIRE'' (1962, gender: 2)
-- aliased with: 'JORES RITA M.DESIRE`' (ID:11109)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (307, '2016-02-28 17:50:41', '2016-02-28 17:50:41', 'JORES RITA M.DESIRE\'', 11109);


-- Processing:...'MARROCU GIANCARLO' (1982, gender: 1)

-- Processing:...'MONTALDO BRUNO' (1975, gender: 1)

-- Processing:...'MURGIA MARCO' (1969, gender: 1)

-- Processing:...'PISA' ALBERTO' (1969, gender: 1)
-- aliased with: 'PISA` ALBERTO' (ID:11234)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (308, '2016-02-28 17:50:41', '2016-02-28 17:50:41', 'PISA\' ALBERTO', 11234);


-- Processing:...'PODDA ROBERTA' (1988, gender: 2)

-- Processing:...'SODARO ALESSANDRO' (1995, gender: 1)

COMMIT;
