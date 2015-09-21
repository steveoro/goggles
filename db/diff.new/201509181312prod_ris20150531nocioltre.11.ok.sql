--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ACCADEMIA NUOTO  BARLETTA':
-- aliased with: 'BARLETTA NUOTO' (ID:573)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (373, '2015-09-18 13:28:50', '2015-09-18 13:28:50', 'ACCADEMIA NUOTO  BARLETTA', 573);


-- Processing:...'CUS BARI':

-- Processing:...'MASTER VALENZANO SSD':
-- aliased with: 'MS VALENZANO ASD' (ID:584)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (374, '2015-09-18 13:28:50', '2015-09-18 13:28:50', 'MASTER VALENZANO SSD', 584);


-- Processing:...'MILLESPORT SAN SALVO':
-- aliased with: 'M.SPORT SAN SALVO S' (ID:370)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (375, '2015-09-18 13:28:50', '2015-09-18 13:28:50', 'MILLESPORT SAN SALVO', 370);


-- Processing:...'OLTREMARE SSD - LECCE':
-- aliased with: 'OLTREMARE ASD - LEC' (ID:588)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (376, '2015-09-18 13:28:50', '2015-09-18 13:28:50', 'OLTREMARE SSD - LECCE', 588);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'D'ONGHIA DIEGO' (1993, gender: 1)
-- aliased with: 'D`ONGHIA DIEGO' (ID:15438)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (257, '2015-09-18 13:34:09', '2015-09-18 13:34:09', 'D\'ONGHIA DIEGO', 15438);


-- Processing:...'D'ONGHIA FRANCESCO' (1991, gender: 1)
-- aliased with: 'D`ONGHIA FRANCESCO' (ID:15439)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (258, '2015-09-18 13:34:09', '2015-09-18 13:34:09', 'D\'ONGHIA FRANCESCO', 15439);


-- Processing:...'DALENA GIOVANNI' (1986, gender: 1)

-- Processing:...'MARCIANO' ANTONIO' (1958, gender: 1)
-- aliased with: 'MARCIANO` ANTONIO' (ID:12110)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (259, '2015-09-18 13:34:09', '2015-09-18 13:34:09', 'MARCIANO\' ANTONIO', 12110);


-- Processing:...'RENNA VALENTINA' (1987, gender: 2)

-- Processing:...'VENTURA BARTOLO FEDERICO' (1990, gender: 1)
-- aliased with: 'VENTURA BARTOLOMEO' (ID:12363)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (260, '2015-09-18 13:34:09', '2015-09-18 13:34:09', 'VENTURA BARTOLO FEDERICO', 12363);


COMMIT;
