--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CERA GIULIA' (2002, gender: 2)
-- aliased with: 'CERA JULIA' (ID:4817)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (239, '2015-05-24 16:01:18', '2015-05-24 16:01:18', 'CERA GIULIA', 4817);


COMMIT;
