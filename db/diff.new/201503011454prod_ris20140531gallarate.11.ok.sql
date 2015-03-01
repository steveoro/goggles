--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'DE VAL STEFANIA' (1988, gender: 2)

-- Processing:...'SANTHIA` TIZIANA' (1961, gender: 2)
-- aliased with: 'SANTHIA' TIZIANA' (ID:14808)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (196, '2015-03-01 14:55:33', '2015-03-01 14:55:33', 'SANTHIA` TIZIANA', 14808);


COMMIT;
