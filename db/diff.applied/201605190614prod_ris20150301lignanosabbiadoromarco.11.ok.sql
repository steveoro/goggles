--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BENATELLI LUCA' (1979, gender: 1)

-- Processing:...'ZANCHI MIRKO' (1969, gender: 1)
-- aliased with: 'ZANCHI MIRCO' (ID:2772)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (450, '2016-05-19 06:16:01', '2016-05-19 06:16:01', 'ZANCHI MIRKO', 2772);


COMMIT;
