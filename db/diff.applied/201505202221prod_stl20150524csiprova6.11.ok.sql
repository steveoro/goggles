--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'MAGGIORANO ANNA' (1991, gender: 2)

-- Processing:...'PATIMO FEDERICA' (1996, gender: 2)
-- aliased with: 'PATINO FEDERICA' (ID:4869)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (238, '2015-05-20 22:22:43', '2015-05-20 22:22:43', 'PATIMO FEDERICA', 4869);


COMMIT;
