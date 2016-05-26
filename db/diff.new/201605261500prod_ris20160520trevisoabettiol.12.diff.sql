-- *** SQL Diff file for ris20160520trevisoabettiol.txt ***
-- Timestamp: 201605261500
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (2391, NULL, 'ASD FORUM JANI', 0, 562, 152, 1, '2016-05-26 15:08:28', '2016-05-26 15:08:28', 1);

UPDATE `meetings` SET `notes`='Natatorium Treviso' WHERE (`id`=15330);

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (6870, 3, 58, 83, 152, 3, 2, 34, 928, '2016-05-26 15:10:36', '2016-05-26 15:10:36');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (6871, 4, 3, 96, 152, 3, 2, 34, 929, '2016-05-26 15:10:38', '2016-05-26 15:10:38');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (6872, 4, 24, 45, 152, 3, 2, 34, 930, '2016-05-26 15:10:38', '2016-05-26 15:10:38');


-- Last completed phase code: 12
