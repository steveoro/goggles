--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'INCONTRO SSD ARL':

-- Processing:...'PIANETA BENESSERE A.':
-- aliased with: 'NUOVA PIANETA BENESSERE' (ID:587)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (401, '2015-09-26 07:51:41', '2015-09-26 07:51:41', 'PIANETA BENESSERE A.', 587);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'DALO' AMBROGIO' (1970, gender: 1)
-- aliased with: 'D'ALO' AMBROGIO' (ID:14916)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (268, '2015-09-26 07:55:09', '2015-09-26 07:55:09', 'DALO\' AMBROGIO', 14916);


-- Processing:...'DEL PRETE ACHILLE' (1995, gender: 1)

-- Processing:...'GABRIELI DOMENICO' (1990, gender: 1)
-- aliased with: 'GABRIELLI DOMENICO' (ID:13646)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (269, '2015-09-26 07:55:09', '2015-09-26 07:55:09', 'GABRIELI DOMENICO', 13646);


-- Processing:...'MAISTO CONCETTA EMILIANA' (1974, gender: 2)
-- aliased with: 'MAISTO EMILIANA' (ID:18334)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (270, '2015-09-26 07:55:09', '2015-09-26 07:55:09', 'MAISTO CONCETTA EMILIANA', 18334);


COMMIT;
