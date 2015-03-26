--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'PALVELLO EDOARDO' (1997, gender: 1)
-- aliased with: 'PALUELLO EDOARDO' (ID:4824)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (226, '2015-03-25 23:27:39', '2015-03-25 23:27:39', 'PALVELLO EDOARDO', 4824);


-- Processing:...'POPOVICH GIAMPAOLO' (1974, gender: 1)
-- aliased with: 'POPOVICH GIANPAOLO' (ID:1475)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (227, '2015-03-25 23:27:39', '2015-03-25 23:27:39', 'POPOVICH GIAMPAOLO', 1475);


COMMIT;
