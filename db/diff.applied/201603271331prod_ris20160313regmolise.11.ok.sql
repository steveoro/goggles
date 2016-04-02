--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Emmedue ssd - A':
-- aliased with: 'EMMEDUE SSD' (ID:185)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (606, '2016-03-27 14:07:37', '2016-03-27 14:07:37', 'Emmedue ssd - A', 185);


-- Processing:...'Hidro Sport ssd arl':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'D'ALESSANDRO VINCENZO' (1955, gender: 1)
-- aliased with: 'D`ALESSANDRO VINCENZO' (ID:12425)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (322, '2016-03-27 14:10:04', '2016-03-27 14:10:04', 'D\'ALESSANDRO VINCENZO', 12425);


-- Processing:...'D'ANCONA BERNARDO' (1991, gender: 1)
-- aliased with: 'D`ANCONA BERNARDO' (ID:12427)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (323, '2016-03-27 14:10:04', '2016-03-27 14:10:04', 'D\'ANCONA BERNARDO', 12427);


-- Processing:...'D'ANOLFO PIERO' (1986, gender: 1)
-- aliased with: 'D`ANOLFO PIERO' (ID:17156)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (324, '2016-03-27 14:10:04', '2016-03-27 14:10:04', 'D\'ANOLFO PIERO', 17156);


COMMIT;
