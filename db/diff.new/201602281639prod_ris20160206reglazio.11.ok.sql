--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Asd Octopus - Roma':

-- Processing:...'Centro Nuoto Anagni':

-- Processing:...'Circ.Nuoto SC Cassi':
-- aliased with: 'CUS CASSINO ASD' (ID:616)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (563, '2016-02-28 16:51:42', '2016-02-28 16:51:42', 'Circ.Nuoto SC Cassi', 616);


-- Processing:...'G. Sport Village ss':
-- aliased with: 'SPORT VILLAGE SSD -' (ID:359)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (564, '2016-02-28 16:51:42', '2016-02-28 16:51:42', 'G. Sport Village ss', 359);


-- Processing:...'G. Sport Village ssd':
-- aliased with: 'SPORT VILLAGE SSD -' (ID:359)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (565, '2016-02-28 16:51:42', '2016-02-28 16:51:42', 'G. Sport Village ssd', 359);


-- Processing:...'Meeting Club - Genz':

-- Processing:...'Sama Sporting ssd':

-- Processing:...'San Paolo Ostiense':

-- Processing:...'Ssd GP Modugno':
-- aliased with: 'S.S.D. G.P. MODUGNO' (ID:724)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (566, '2016-02-28 16:51:43', '2016-02-28 16:51:43', 'Ssd GP Modugno', 724);


-- Processing:...'Village Nuoto asd':
-- aliased with: 'VILLAGE SSD - CERVETERI' (ID:711)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (567, '2016-02-28 16:51:43', '2016-02-28 16:51:43', 'Village Nuoto asd', 711);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BARUFFI GIULIA' (1991, gender: 2)

-- Processing:...'CALABRO' ALESSIA' (1973, gender: 2)
-- aliased with: 'CALABRO` ALESSIA' (ID:20341)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (301, '2016-02-28 16:55:19', '2016-02-28 16:55:19', 'CALABRO\' ALESSIA', 20341);


-- Processing:...'CURZIO RICCARDO' (1986, gender: 1)

-- Processing:...'D'ALONZO CHIARA' (1988, gender: 2)
-- aliased with: 'D`ALONZO CHIARA' (ID:19902)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (302, '2016-02-28 16:55:19', '2016-02-28 16:55:19', 'D\'ALONZO CHIARA', 19902);


-- Processing:...'D'ANGELO MASSIMO' (1966, gender: 1)
-- aliased with: 'D`ANGELO MASSIMO' (ID:18248)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (303, '2016-02-28 16:55:19', '2016-02-28 16:55:19', 'D\'ANGELO MASSIMO', 18248);


-- Processing:...'D'ARCADIA FRANCO' (1962, gender: 1)

-- Processing:...'DAMIANI PAOLO' (1971, gender: 1)

-- Processing:...'DELL'AQUILA LORENZO' (1978, gender: 1)
-- aliased with: 'DELL`AQUILA LORENZO' (ID:16933)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (304, '2016-02-28 16:55:19', '2016-02-28 16:55:19', 'DELL\'AQUILA LORENZO', 16933);


-- Processing:...'FABRIZI SARA' (1980, gender: 2)

-- Processing:...'FAZI ANDREA' (1989, gender: 1)

-- Processing:...'GALLENO CHIARA' (1976, gender: 2)

-- Processing:...'GIANNANTONI LUCA' (1984, gender: 1)

-- Processing:...'GRIMALDI SALVATORE' (1970, gender: 1)

-- Processing:...'HAILE' LUKAS' (1974, gender: 1)
-- aliased with: 'HAILE` LUKAS' (ID:17158)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (305, '2016-02-28 16:55:20', '2016-02-28 16:55:20', 'HAILE\' LUKAS', 17158);


-- Processing:...'PACCHIAROTTI DEBORAH' (1977, gender: 2)

-- Processing:...'PASSA SIMONE' (1984, gender: 1)

-- Processing:...'PERA FABIO MASSIMO' (1959, gender: 1)

-- Processing:...'PICA PIERPAOLO' (1971, gender: 1)

-- Processing:...'PROIA SABRINA' (1990, gender: 2)

-- Processing:...'RAGO RAFFAELLA' (1972, gender: 2)

-- Processing:...'RAIMONDI MICHELE' (1974, gender: 1)

-- Processing:...'RIZZO FABIO' (1984, gender: 1)

-- Processing:...'SERRANTI JACOPO' (1988, gender: 1)

-- Processing:...'TACCONI PIETRO' (1968, gender: 1)

COMMIT;
