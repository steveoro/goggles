--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Aquafit 2.0 Ssd R.L.':

-- Processing:...'Circolo Sub Teseo Tesei':
-- aliased with: 'TESEO TESEI PORTOFERRAIO' (ID:403)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (580, '2016-03-07 00:01:57', '2016-03-07 00:01:57', 'Circolo Sub Teseo Tesei', 403);


-- Processing:...'Jesolonuoto':
-- aliased with: 'A.S.DILETT. JESOLONUOTO' (ID:149)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (581, '2016-03-07 00:01:57', '2016-03-07 00:01:57', 'Jesolonuoto', 149);


-- Processing:...'Massa Lubrense Nuoto Asd':

-- Processing:...'Piacenza Pallanuoto':

-- Processing:...'Piscine Com. Stezzano - Bg':

-- Processing:...'Serenissima Nuoto Club':
-- aliased with: 'ASD SERENISSIMA NUOTO CLU' (ID:346)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (582, '2016-03-07 00:01:58', '2016-03-07 00:01:58', 'Serenissima Nuoto Club', 346);


-- Processing:...'Uoei Candido Cabbia - Tre':
-- aliased with: 'RN U.O.E.I. CANDIDO CABBIA ASD' (ID:170)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (583, '2016-03-07 00:01:58', '2016-03-07 00:01:58', 'Uoei Candido Cabbia - Tre', 170);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BALLACCI JESSICA' (1990, gender: 2)

-- Processing:...'BENDOTTI MICHAEL' (1984, gender: 1)

-- Processing:...'FEICHTER GIORGIA' (1982, gender: 2)

-- Processing:...'GHIRARDELLI CHRISTIAN MARCO' (1990, gender: 1)
-- aliased with: 'GHIRARDELLI CRISTIAN' (ID:1506)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (311, '2016-03-07 00:02:54', '2016-03-07 00:02:54', 'GHIRARDELLI CHRISTIAN MARCO', 1506);


-- Processing:...'RANDON GIULIA' (1992, gender: 2)

-- Processing:...'RAVELLI MARIA ELENA' (1967, gender: 2)
-- aliased with: 'RAVELLI MARIAELENA' (ID:15274)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (312, '2016-03-07 00:02:54', '2016-03-07 00:02:54', 'RAVELLI MARIA ELENA', 15274);


COMMIT;
