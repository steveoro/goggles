--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ASD NEW WAVE - TORI':
-- aliased with: 'NEW WAVE ASD' (ID:413)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (152, '2015-02-19 18:41:02', '2015-02-19 18:41:02', 'ASD NEW WAVE - TORI', 413);


-- Processing:...'DINAMICA TORINO ASD':

-- Processing:...'LIB DUE VALLI - LUS':
-- aliased with: 'LIBERTAS DUE VALLI A.S.D' (ID:410)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (153, '2015-02-19 18:41:02', '2015-02-19 18:41:02', 'LIB DUE VALLI - LUS', 410);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'AROASIO ROBERTA' (1987, gender: 2)

-- Processing:...'BERGONZI STEFANO' (1972, gender: 1)

-- Processing:...'BORDONI ANDREA' (1979, gender: 1)

-- Processing:...'DE LUCA FRANCESCA' (1989, gender: 2)

-- Processing:...'DELFINI MICHELE' (1967, gender: 1)

-- Processing:...'MELCHIONNA DAVIDE' (1985, gender: 1)

-- Processing:...'ROTUNNO MAURO' (1960, gender: 1)

COMMIT;
