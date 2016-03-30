--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.D. CENTRO NUOTO':

-- Processing:...'A.S.D. NUOTO MASTER VERONA IN-':
-- aliased with: 'ASD NUOTO MASTER VERONA IN-SPORT' (ID:154)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (585, '2016-03-26 14:32:39', '2016-03-26 14:32:39', 'A.S.D. NUOTO MASTER VERONA IN-', 154);


-- Processing:...'A.S.D. NUOTO VENEZI':

-- Processing:...'CENTRO NUOTO LE BAN':

-- Processing:...'CENTRO NUOTO LE BANDIE SSD ARL':

-- Processing:...'S.NUOTATORI PADOVAN':
-- aliased with: 'S.NUOTATORI PADOVANI A.S.D.' (ID:171)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (586, '2016-03-26 14:32:45', '2016-03-26 14:32:45', 'S.NUOTATORI PADOVAN', 171);


-- Processing:...'S.S.DILETT. ADRIATI':
-- aliased with: 'ADRIATIKA NUOTO ASD' (ID:372)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (587, '2016-03-26 14:32:45', '2016-03-26 14:32:45', 'S.S.DILETT. ADRIATI', 372);


-- Processing:...'SOC. S. D. 2001 SRL':
-- aliased with: 'SOC. S. D. 2001 SRL - PADOVA' (ID:177)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (588, '2016-03-26 14:32:45', '2016-03-26 14:32:45', 'SOC. S. D. 2001 SRL', 177);


-- Processing:...'SPORTING CLUB NOALE':
-- aliased with: 'SPORTING CLUB NOALE S.S.D.' (ID:178)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (589, '2016-03-26 14:32:46', '2016-03-26 14:32:46', 'SPORTING CLUB NOALE', 178);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BOSCOLO GIOACHINA FRANCES' (1993, gender: 1)
-- aliased with: 'BOSCOLO GIOACCHINA FRANCESCO' (ID:4955)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (314, '2016-03-26 14:39:26', '2016-03-26 14:39:26', 'BOSCOLO GIOACHINA FRANCES', 4955);


-- Processing:...'DALLA VALLE ELENA' (1965, gender: 2)

-- Processing:...'FERRARA ANDREA ISOLINA' (1976, gender: 2)

-- Processing:...'FRACCHIA LORENZO' (1988, gender: 1)

-- Processing:...'LORENZETTO ELEONORA' (1991, gender: 2)
-- aliased with: 'LORENZOTTO ELEONORA' (ID:14121)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (315, '2016-03-26 14:39:27', '2016-03-26 14:39:27', 'LORENZETTO ELEONORA', 14121);


-- Processing:...'MIGLIORIN VIVIANA' (1971, gender: 2)

COMMIT;
