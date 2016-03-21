--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Acqualife Stezzano':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BOLLANI MATTEO' (1974, gender: 1)

-- Processing:...'COSSA LAURA' (1989, gender: 2)

-- Processing:...'FEDELI MASSIMO' (1965, gender: 1)

-- Processing:...'NUCCI NICCOLO'' (1960, gender: 1)
-- aliased with: 'NUCCI NICCOLO`' (ID:4628)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (313, '2016-03-21 20:00:39', '2016-03-21 20:00:39', 'NUCCI NICCOLO\'', 4628);


-- Processing:...'PAVONE NICOLA' (1982, gender: 1)

-- Processing:...'SILVA CARLA' (1965, gender: 2)

COMMIT;
