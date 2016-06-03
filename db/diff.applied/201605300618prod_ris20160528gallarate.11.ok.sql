--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'SACCHETTO MARCO GIUSEPPE MAR' (1948, gender: 1)
-- aliased with: 'SACCHETTO MARCO GIUSEPPE' (ID:24623)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (530, '2016-05-30 06:19:39', '2016-05-30 06:19:39', 'SACCHETTO MARCO GIUSEPPE MAR', 24623);


COMMIT;
