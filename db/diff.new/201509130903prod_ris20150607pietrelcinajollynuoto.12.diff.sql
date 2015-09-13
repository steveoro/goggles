-- *** SQL Diff file for ris20150607pietrelcinajollynuoto.txt ***
-- Timestamp: 201509130903
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1363, NULL, 'ASD ALBA ORIENS', 0, 180, 142, 1, '2015-09-13 09:05:47', '2015-09-13 09:05:47', 1);

UPDATE `meetings` SET `notes`='Jolly Nuoto Club' WHERE (`id`=14348);

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (4443, 2, 22, 42, 142, 1, 1, 26, 855, '2015-09-13 09:06:54', '2015-09-13 09:06:54');


-- Last completed phase code: 12
