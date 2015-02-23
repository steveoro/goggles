--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'NICEFARO BEATRICE' (1994, gender: 2)
-- aliased with: 'NICEFORO BEATRICE' (ID:1568)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (85, '2015-02-23 17:25:54', '2015-02-23 17:25:54', 'NICEFARO BEATRICE', 1568);


-- Processing:...'PIRAZZOLI ELISA' (1984, gender: 2)

COMMIT;
