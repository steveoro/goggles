--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CSM TIMISOARA':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BUSCEMI STEFANO' (1969, gender: 1)

-- Processing:...'CHIAVETTA NICOLO`' (1978, gender: 1)
-- aliased with: 'CHIAVETTA NICOLO'' (ID:16396)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (262, '2015-09-18 16:05:32', '2015-09-18 16:05:32', 'CHIAVETTA NICOLO`', 16396);


-- Processing:...'FERRARA FABRIZIO' (1971, gender: 1)

-- Processing:...'GALLI NUNZIO' (1975, gender: 1)

-- Processing:...'MULE` PELLEGRINO' (1966, gender: 1)

-- Processing:...'PILERI PIETRO' (1983, gender: 1)

-- Processing:...'TRIPODI MARCO' (1975, gender: 1)

COMMIT;
