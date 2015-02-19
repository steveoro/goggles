--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ARTIGLIO NUOTO  VIA':
-- aliased with: 'ARTIGLIO NUOTO VIAREGGIO' (ID:390)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (111, '2015-02-18 14:15:08', '2015-02-18 14:15:08', 'ARTIGLIO NUOTO  VIA', 390);


-- Processing:...'BUTTERFLY SSD - MAS':
-- aliased with: 'BUTTERFLY - MASSA' (ID:392)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (112, '2015-02-18 14:15:08', '2015-02-18 14:15:08', 'BUTTERFLY SSD - MAS', 392);


-- Processing:...'ON SPORT SESTRI LEV':

-- Processing:...'POLISPORTIVA RONCHI':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BETTINI FRANCESCA' (1989, gender: 2)

-- Processing:...'BOTTO FABIO' (1966, gender: 1)

-- Processing:...'CROSA MARINA' (1963, gender: 2)

-- Processing:...'FERRARI ILARIA' (1988, gender: 2)

-- Processing:...'MARCENARO LUCIO' (1974, gender: 1)

-- Processing:...'MAUCERI GIANLUCA' (1970, gender: 1)

-- Processing:...'RE MARCO' (1974, gender: 1)

-- Processing:...'TORRE GIORGIO' (1969, gender: 1)

-- Processing:...'TRAVERSO ALESSANDRO' (1969, gender: 1)

-- Processing:...'VESCOVI GABRIELE' (1980, gender: 1)

-- Processing:...'ZAPPULLO GIUSEPPE' (1968, gender: 1)

COMMIT;
