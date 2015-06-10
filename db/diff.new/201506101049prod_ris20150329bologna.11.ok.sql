--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CHITO' MARCO' (1984, gender: 1)
-- aliased with: 'CHITO` MARCO' (ID:2088)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (248, '2015-06-10 10:51:49', '2015-06-10 10:51:49', 'CHITO\' MARCO', 2088);


-- Processing:...'DIGIORGIO GIUSEPPE' (1984, gender: 1)

-- Processing:...'PEZZOLESI GIULIO' (1979, gender: 1)

COMMIT;
