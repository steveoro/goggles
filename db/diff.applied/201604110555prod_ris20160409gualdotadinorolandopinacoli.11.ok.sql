--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Asd D.L.F. Nuoto Livorno':
-- aliased with: 'D.L.F. LIVORNO' (ID:219)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (648, '2016-04-11 05:57:11', '2016-04-11 05:57:11', 'Asd D.L.F. Nuoto Livorno', 219);


-- Processing:...'G.I.S. Veneto':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'FEDELE GIANLUCA' (1983, gender: 1)

-- Processing:...'ORTOLANI ALBERO' (1963, gender: 1)
-- aliased with: 'ORTOLANI ALBERTO' (ID:17573)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (371, '2016-04-11 05:58:40', '2016-04-11 05:58:40', 'ORTOLANI ALBERO', 17573);


-- Processing:...'VALACCHIA MARTINA' (1987, gender: 2)
-- aliased with: 'VALACCHI MARTINA' (ID:24293)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (372, '2016-04-11 05:58:40', '2016-04-11 05:58:40', 'VALACCHIA MARTINA', 24293);


COMMIT;
