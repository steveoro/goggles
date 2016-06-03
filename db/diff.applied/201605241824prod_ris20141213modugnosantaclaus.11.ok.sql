--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'GRAVILLI PIETRO GIOVANNI' (1960, gender: 1)
-- aliased with: 'GRAVILI PIETRO GIOVANNI' (ID:20612)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (515, '2016-05-24 18:24:41', '2016-05-24 18:24:41', 'GRAVILLI PIETRO GIOVANNI', 20612);


COMMIT;
