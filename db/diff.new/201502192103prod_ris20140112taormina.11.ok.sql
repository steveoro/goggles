--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.D. ONDA AZZURRA':

-- Processing:...'A.S.D. SYNTHESIS NUOTO':

-- Processing:...'ASD ATHON AUGUSTA':

-- Processing:...'ASD MAYDAY ITALIA':

-- Processing:...'CC ORTIGIA ASD':

-- Processing:...'HDUEO SPORT & ANIMA':

-- Processing:...'LA MERIDIANA PALAST':

-- Processing:...'P.S.C. CATANIA':

-- Processing:...'POL. MIMMO FERRITO':
-- aliased with: 'POL.MIMMO FERRITO S' (ID:330)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (155, '2015-02-19 21:10:08', '2015-02-19 21:10:08', 'POL. MIMMO FERRITO', 330);


-- Processing:...'TORRE DEL GRIFO VIL':

-- Processing:...'WATERPOLO MESSINA':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ALDISIO FRANCESCO' (1972, gender: 1)

-- Processing:...'ARENA MARIO' (1968, gender: 1)

-- Processing:...'BARBARIA GIORGIO' (1985, gender: 1)

-- Processing:...'CAMPISI RICCARDO' (1967, gender: 1)

-- Processing:...'CANTONE DAVIDE' (1982, gender: 1)

-- Processing:...'CIATTO LUCA ANTONIO' (1983, gender: 1)

-- Processing:...'CINA' VALERIO' (1986, gender: 1)
-- aliased with: 'CINA` VALERIO' (ID:10011)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (74, '2015-02-19 21:12:12', '2015-02-19 21:12:12', 'CINA\' VALERIO', 10011);


-- Processing:...'DEL ROSSI GIANCARLO' (1971, gender: 1)
-- aliased with: 'DEL ROSSO GIANCARLO' (ID:10047)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (75, '2015-02-19 21:12:12', '2015-02-19 21:12:12', 'DEL ROSSI GIANCARLO', 10047);


-- Processing:...'MATTALIANO FABIO' (1963, gender: 1)

-- Processing:...'MESSINA MARCO' (1969, gender: 1)

-- Processing:...'PANTELLARO CLAUDIA' (1982, gender: 2)

-- Processing:...'PECORA BRUNO' (1959, gender: 1)

-- Processing:...'PICCIONE MARCO' (1969, gender: 1)

-- Processing:...'ROTONDO ROSSELLA' (1986, gender: 2)

COMMIT;
