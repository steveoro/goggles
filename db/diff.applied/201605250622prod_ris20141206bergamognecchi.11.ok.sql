--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CANDELU` ROBERTO' (1986, gender: 1)
-- aliased with: 'CANDELU' ROBERTO' (ID:2858)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (516, '2016-05-25 06:23:30', '2016-05-25 06:23:30', 'CANDELU` ROBERTO', 2858);


-- Processing:...'SCRIVANI MARIATERESA' (1980, gender: 2)
-- aliased with: 'SCRIVANI MARIA TERESA' (ID:1169)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (517, '2016-05-25 06:23:30', '2016-05-25 06:23:30', 'SCRIVANI MARIATERESA', 1169);


COMMIT;
