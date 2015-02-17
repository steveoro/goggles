--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'NC AZZURRA 91':
-- aliased with: 'N.C. AZZURRA 1991' (ID:9)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (75, '2015-02-17 17:43:28', '2015-02-17 17:43:28', 'NC AZZURRA 91', 9);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BALDAZZI MARIA' (1983, gender: 2)

-- Processing:...'BOCCHINI PIETRO' (1976, gender: 1)

-- Processing:...'DAVI` ELISABETTA' (1967, gender: 2)

-- Processing:...'DE LORENZO ANTONIO' (1983, gender: 1)

-- Processing:...'FABRIS MASSIMILIANO' (1970, gender: 1)

-- Processing:...'MONTARULI MARIA ELENA' (1969, gender: 2)
-- aliased with: 'MONTARULI ELENA' (ID:798)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (21, '2015-02-17 17:44:49', '2015-02-17 17:44:49', 'MONTARULI MARIA ELENA', 798);


COMMIT;
