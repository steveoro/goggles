--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Centro Sport Palladio spa':

-- Processing:...'RNV Team':
-- aliased with: 'R.N. VALSUGANA' (ID:595)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (541, '2016-01-27 14:30:49', '2016-01-27 14:30:49', 'RNV Team', 595);


-- Processing:...'SCHWIMMCLUB VINSCHGAU':

-- Processing:...'SSV LEIFERS SCHWIMMEN':

-- Processing:...'SV FREIZEITCENTER STUBAY':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'HUBER CHRISTINA' (1953, gender: 2)
-- aliased with: 'HUBER CHRISTA' (ID:8543)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (293, '2016-01-27 14:34:24', '2016-01-27 14:34:24', 'HUBER CHRISTINA', 8543);


-- Processing:...'ROSSI MICHELE' (1984, gender: 1)

-- Processing:...'SPARBER FLORIAN' (1969, gender: 1)
-- aliased with: 'SPARER FLORIAN' (ID:21293)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (294, '2016-01-27 14:34:25', '2016-01-27 14:34:25', 'SPARBER FLORIAN', 21293);


COMMIT;
