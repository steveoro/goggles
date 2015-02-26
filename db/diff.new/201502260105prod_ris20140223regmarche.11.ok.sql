--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BONNET IGOR VINCENZO' (1971, gender: 1)

-- Processing:...'CASTELLI LUANA' (1970, gender: 2)

-- Processing:...'CIARALI STEFANO' (1979, gender: 1)

-- Processing:...'DE MARTINIS STEFANO' (1968, gender: 1)
-- aliased with: 'DE MARTINIIS STEFANO' (ID:12417)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (128, '2015-02-26 01:09:50', '2015-02-26 01:09:50', 'DE MARTINIS STEFANO', 12417);


-- Processing:...'FEDELI FRANCESCO' (1972, gender: 1)

-- Processing:...'GENNARI MARCO' (1959, gender: 1)

-- Processing:...'GIOVANNELLI RAFFAELLA' (1972, gender: 2)

-- Processing:...'MORANDI ANDREA' (1983, gender: 1)

-- Processing:...'ORLANDI DANIELE' (1991, gender: 1)

-- Processing:...'UBALDI LUCA' (1972, gender: 1)

COMMIT;
