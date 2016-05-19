--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ARCONZO VITO' (1980, gender: 1)

-- Processing:...'MARCIANO' ARCANGELO' (1953, gender: 1)
-- aliased with: 'MARCIANO` ARCANGELO' (ID:12111)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (449, '2016-05-18 06:37:09', '2016-05-18 06:37:09', 'MARCIANO\' ARCANGELO', 12111);


COMMIT;
