-- *** SQL Diff file for ris20160206reglazio.txt ***
-- Timestamp: 201602281639
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (2001, NULL, 'CUS CASSINO ASD', 0, 616, 152, 1, '2016-02-28 16:55:25', '2016-02-28 16:55:25', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (2002, NULL, 'S.S.D. G.P. MODUGNO', 0, 724, 152, 1, '2016-02-28 16:55:28', '2016-02-28 16:55:28', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (2003, NULL, 'VILLAGE SSD - CERVETERI', 0, 711, 152, 1, '2016-02-28 16:55:29', '2016-02-28 16:55:29', 1);

UPDATE `meetings` SET `notes`='CR Lazio' WHERE (`id`=15272);

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (6314, 3, 21, 98, 152, 3, 1, 33, 932, '2016-02-28 16:59:32', '2016-02-28 16:59:32');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (6315, 2, 59, 17, 152, 3, 1, 32, 932, '2016-02-28 16:59:44', '2016-02-28 16:59:44');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (6316, 2, 58, 22, 152, 2, 1, 26, 931, '2016-02-28 16:59:49', '2016-02-28 16:59:49');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (6317, 2, 38, 73, 152, 2, 1, 25, 931, '2016-02-28 17:00:05', '2016-02-28 17:00:05');


-- Last completed phase code: 12
