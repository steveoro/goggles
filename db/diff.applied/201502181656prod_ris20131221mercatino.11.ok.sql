--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ASD 2001 TEAM':

-- Processing:...'SC INNSBRUCK':
-- aliased with: 'SCHWIMMCLUB INNSBRUCK' (ID:462)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (137, '2015-02-18 17:00:16', '2015-02-18 17:00:16', 'SC INNSBRUCK', 462);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CONTI MAURO' (1969, gender: 1)

-- Processing:...'CORTIANA ROBERTO' (1976, gender: 1)

-- Processing:...'D`ALBERTO DARIO' (1971, gender: 1)
-- aliased with: 'D'ALBERTO DARIO' (ID:7765)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (58, '2015-02-18 17:00:53', '2015-02-18 17:00:53', 'D`ALBERTO DARIO', 7765);


-- Processing:...'KLOTZ-BAIR ELISABETH' (1968, gender: 2)
-- aliased with: 'BAIR-KLOTZ ELISABETH' (ID:8435)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (59, '2015-02-18 17:00:53', '2015-02-18 17:00:53', 'KLOTZ-BAIR ELISABETH', 8435);


-- Processing:...'POSTINGHEL ELENA' (1981, gender: 2)

-- Processing:...'ZANON ALESSANDRA' (1983, gender: 2)

-- Processing:...'ZUMIANI PATRIZIO' (1980, gender: 1)

COMMIT;
