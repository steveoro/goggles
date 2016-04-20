--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'AVEZZU' EDOARDO' (1990, gender: 1)
-- aliased with: 'AVEZZU` EDOARDO' (ID:16267)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (400, '2016-04-20 11:22:17', '2016-04-20 11:22:17', 'AVEZZU\' EDOARDO', 16267);


COMMIT;
