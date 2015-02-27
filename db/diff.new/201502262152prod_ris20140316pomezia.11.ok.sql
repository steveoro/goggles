--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.DILETT. AQUARIA':

-- Processing:...'LATINA NUOTO ASD':

-- Processing:...'TENNIS CLUB NEW COU':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BABAJEE HAROLD PHILIPPE ALFR' (1968, gender: 1)
-- aliased with: 'BABAJEE HAROLD PHILIPPE A' (ID:14341)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (150, '2015-02-26 21:56:08', '2015-02-26 21:56:08', 'BABAJEE HAROLD PHILIPPE ALFR', 14341);


-- Processing:...'BUTTICE` ALESSANDRO' (1986, gender: 1)
-- aliased with: 'BUTTICE' ALESSANDRO' (ID:10637)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (151, '2015-02-26 21:56:09', '2015-02-26 21:56:09', 'BUTTICE` ALESSANDRO', 10637);


-- Processing:...'DELL`AQUILA LORENZO' (1978, gender: 1)

-- Processing:...'IAVARONE MANFREDI' (1971, gender: 1)
-- aliased with: 'MANFREDI IAVARONE' (ID:16712)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (152, '2015-02-26 21:56:09', '2015-02-26 21:56:09', 'IAVARONE MANFREDI', 16712);


-- Processing:...'WHITE GIOVANNA' (1965, gender: 2)

COMMIT;
