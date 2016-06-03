--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'FORCIGNANO` ANDREA' (1993, gender: 1)
-- aliased with: 'FORCIGNANO' ANDREA' (ID:26369)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (509, '2016-05-24 16:23:00', '2016-05-24 16:23:00', 'FORCIGNANO` ANDREA', 26369);


COMMIT;
