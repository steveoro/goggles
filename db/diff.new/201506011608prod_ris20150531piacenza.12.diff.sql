-- *** SQL Diff file for ris20150531piacenza.txt ***
-- Timestamp: 201506011608
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1262, NULL, 'L`ACQUA DI PIANETA', 0, 411, 142, 1, '2015-06-01 16:11:10', '2015-06-01 16:11:10', 1);

UPDATE `meetings` SET `notes`='CAN Vittorino da Feltre' WHERE (`id`=14210);

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (4429, 4, 37, 21, 142, 2, 2, 28, 851, '2015-06-01 16:14:08', '2015-06-01 16:14:08');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (4430, 4, 47, 3, 142, 2, 2, 28, 852, '2015-06-01 16:14:09', '2015-06-01 16:14:09');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (4431, 4, 4, 18, 142, 1, 2, 28, 850, '2015-06-01 16:14:10', '2015-06-01 16:14:10');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (4432, 4, 0, 94, 142, 1, 2, 28, 851, '2015-06-01 16:14:10', '2015-06-01 16:14:10');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (4433, 4, 10, 25, 142, 1, 2, 28, 852, '2015-06-01 16:14:11', '2015-06-01 16:14:11');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (4434, 4, 46, 32, 142, 1, 2, 28, 854, '2015-06-01 16:14:12', '2015-06-01 16:14:12');


-- Last completed phase code: 12
