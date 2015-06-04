-- *** SQL Diff file for ris20150531piacenza.txt ***
-- Timestamp: 201506031553
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1262, NULL, 'L`ACQUA DI PIANETA', 0, 411, 142, 1, '2015-06-03 15:55:37', '2015-06-03 15:55:37', 1);

UPDATE `meetings` SET `notes`='CAN Vittorino da Feltre' WHERE (`id`=14210);

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (4429, 4, 37, 21, 142, 2, 2, 28, 851, '2015-06-03 15:58:22', '2015-06-03 15:58:22');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (4430, 4, 47, 3, 142, 2, 2, 28, 852, '2015-06-03 15:58:23', '2015-06-03 15:58:23');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (4431, 4, 4, 18, 142, 1, 2, 28, 850, '2015-06-03 15:58:23', '2015-06-03 15:58:23');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (4432, 4, 0, 94, 142, 1, 2, 28, 851, '2015-06-03 15:58:24', '2015-06-03 15:58:24');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (4433, 4, 10, 25, 142, 1, 2, 28, 852, '2015-06-03 15:58:24', '2015-06-03 15:58:24');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (4434, 4, 46, 32, 142, 1, 2, 28, 854, '2015-06-03 15:58:25', '2015-06-03 15:58:25');


-- Last completed phase code: 12
