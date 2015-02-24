--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'NICEFARO BEATRICE' (1994, gender: 2)
-- aliased with: 'NICEFORO BEATRICE' (ID:1568)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (85, '2015-02-24 12:56:06', '2015-02-24 12:56:06', 'NICEFARO BEATRICE', 1568);


-- Processing:...'PIRAZZOLI ELISA' (1984, gender: 2)
-- aliased with: 'PIRAZZOLI FEDERICA' (ID:993)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (86, '2015-02-24 12:56:06', '2015-02-24 12:56:06', 'PIRAZZOLI ELISA', 993);


COMMIT;
