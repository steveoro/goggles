--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'AQUARIUM NOVI LIGURE - AL':

-- Processing:...'CUS PALERMO':
-- aliased with: 'CUS PALERMO A.S.D.' (ID:507)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (345, '2015-05-15 14:37:15', '2015-05-15 14:37:15', 'CUS PALERMO', 507);


-- Processing:...'FIORENZUOLA N 90':

-- Processing:...'SPORTING LODI SSD':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ANDREIS MATTEO' (1976, gender: 1)

-- Processing:...'COLLAVINI DARIO' (1990, gender: 1)

-- Processing:...'FRIGE` STEFANIA' (1986, gender: 2)
-- aliased with: 'FRIGE` SREFANIA' (ID:9486)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (234, '2015-05-15 14:39:09', '2015-05-15 14:39:09', 'FRIGE` STEFANIA', 9486);


-- Processing:...'LORVETTI STEFANO' (1984, gender: 1)
-- aliased with: 'LORVETTI STAFANO' (ID:6325)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (235, '2015-05-15 14:39:09', '2015-05-15 14:39:09', 'LORVETTI STEFANO', 6325);


-- Processing:...'MASSENZA MILANI GIORGIO GIUSE' (1965, gender: 1)
-- aliased with: 'MASSENZA MILANI GIORGIO GIUS' (ID:18508)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (236, '2015-05-15 14:39:09', '2015-05-15 14:39:09', 'MASSENZA MILANI GIORGIO GIUSE', 18508);


-- Processing:...'MONTINI VALERIA' (1994, gender: 2)

-- Processing:...'PALUMBO GIOVANNI' (1971, gender: 1)

COMMIT;
