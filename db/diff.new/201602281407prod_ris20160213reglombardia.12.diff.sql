-- *** SQL Diff file for ris20160213reglombardia.txt ***
-- Timestamp: 201602281407
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1958, NULL, 'FANFULLA N PN', 0, 758, 152, 1, '2016-02-28 14:13:19', '2016-02-28 14:13:19', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1959, NULL, 'SPM SPORT - PAULLO', 0, 334, 152, 1, '2016-02-28 14:13:20', '2016-02-28 14:13:20', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1960, NULL, 'SPORT CLUB 12 SRL S', 0, 276, 152, 1, '2016-02-28 14:13:20', '2016-02-28 14:13:20', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1961, NULL, 'WOLF`S SWIMMER ASD', 0, 681, 152, 1, '2016-02-28 14:13:21', '2016-02-28 14:13:21', 1);

UPDATE `meetings` SET `notes`='CR Lombardia' WHERE (`id`=15275);

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (6312, 2, 32, 20, 152, 2, 1, 26, 930, '2016-02-28 14:17:19', '2016-02-28 14:17:19');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (6313, 2, 3, 77, 152, 1, 1, 25, 931, '2016-02-28 14:17:34', '2016-02-28 14:17:34');


-- Last completed phase code: 12
