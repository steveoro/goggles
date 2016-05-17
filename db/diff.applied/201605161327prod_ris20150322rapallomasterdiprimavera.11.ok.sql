--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CARBONARI FABIO' (1976, gender: 1)

-- Processing:...'ILLIANO GIOVANNI' (1970, gender: 1)
-- aliased with: 'ILLIANO GIANNI' (ID:22455)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (438, '2016-05-16 13:28:40', '2016-05-16 13:28:40', 'ILLIANO GIOVANNI', 22455);


COMMIT;
