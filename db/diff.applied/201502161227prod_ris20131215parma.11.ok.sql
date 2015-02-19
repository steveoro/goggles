--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.D. LARUS NUOTO':
-- aliased with: 'AS LARUS NUOTO' (ID:116)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (63, '2015-02-16 12:31:24', '2015-02-16 12:31:24', 'A.S.D. LARUS NUOTO', 116);


-- Processing:...'ALTAIR VULCANIA NUO':

-- Processing:...'AS SOGEIS':

-- Processing:...'ASOLA N':

-- Processing:...'BENFICA PALLANUOTO':

-- Processing:...'FOLTZER N.':

-- Processing:...'LERICI NUOTO MASTER':

-- Processing:...'MASTERNUOTOFIDENZA':

-- Processing:...'NUOTO LIVORNO SSD':

-- Processing:...'POL.MIMMO FERRITO S':

-- Processing:...'POL.SPORTEVOLUTION':

-- Processing:...'QUANTA SPORT VILLAG':

-- Processing:...'SETTEFRATI LIBERTAS':

-- Processing:...'SPM SPORT - PAULLO':

-- Processing:...'ULYSSE ASD':

-- Processing:...'VIADANA NUOTO LIBER':

-- Processing:...'ZEROUNO SSD ARL':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ANGIOLINI ANGELO' (1953, gender: 1)

-- Processing:...'BALESTRA GIOVANNI' (1971, gender: 1)

-- Processing:...'CHINI FRANCESCO' (1967, gender: 1)

-- Processing:...'DEDOLA BARBARA' (1970, gender: 2)

-- Processing:...'D`AMBROSIO MARCO ALESSANDRO' (1966, gender: 1)
-- aliased with: 'D'AMBROSIO MARCO ALESSANDRO' (ID:748)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (13, '2015-02-16 12:33:51', '2015-02-16 12:33:51', 'D`AMBROSIO MARCO ALESSANDRO', 748);


-- Processing:...'ERRA ANGELO' (1981, gender: 1)

-- Processing:...'MICHELINI GIOVANNI GAETANO' (1983, gender: 1)
-- aliased with: 'MICHELINI GIOVANNI' (ID:2086)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (14, '2015-02-16 12:33:51', '2015-02-16 12:33:51', 'MICHELINI GIOVANNI GAETANO', 2086);


-- Processing:...'NATALE MATTEO' (1991, gender: 1)

-- Processing:...'PASQUALIN MATTEO' (1976, gender: 1)

-- Processing:...'PERTISETTI DANIELE' (1984, gender: 1)

-- Processing:...'RILEI ANDREA' (1975, gender: 1)

-- Processing:...'TOGNON MARCO' (1973, gender: 1)

-- Processing:...'TOMASI ANDREA' (1966, gender: 1)

-- Processing:...'UGOLOTTI FEDERICA' (1974, gender: 2)

-- Processing:...'ZANASI NICOLA' (1970, gender: 1)

COMMIT;
