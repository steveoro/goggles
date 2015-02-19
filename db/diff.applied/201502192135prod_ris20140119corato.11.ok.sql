--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ALBATROS SP. CLUB S':

-- Processing:...'MURGIA SPORT A.S.D.':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CALELLA ALESSANDRO' (1983, gender: 1)

-- Processing:...'DI MOLFETTA BATOLOMO' (1977, gender: 1)
-- aliased with: 'DI MOLFETTA BARTOLO' (ID:11946)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (79, '2015-02-19 21:41:11', '2015-02-19 21:41:11', 'DI MOLFETTA BATOLOMO', 11946);


-- Processing:...'DINARDO FABRZIO' (1988, gender: 1)
-- aliased with: 'DINARDO FABRIZIO' (ID:11957)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (80, '2015-02-19 21:41:11', '2015-02-19 21:41:11', 'DINARDO FABRZIO', 11957);


-- Processing:...'FANELLI ANTONIO' (1988, gender: 1)

-- Processing:...'LOPANE GIUSEPPE' (1977, gender: 1)

-- Processing:...'LORUSSO VITO' (1951, gender: 1)

-- Processing:...'TORTELLI MICHELE' (1980, gender: 1)

-- Processing:...'TRIBUZIO ROSSELLA' (1979, gender: 2)

COMMIT;
