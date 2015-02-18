-- *** SQL Diff file for ris20140510sanmarino.txt ***
-- Timestamp: 201502172040
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (591, NULL, 'ASD CSI NUOTO PRATO', 0, 34, 132, 1, '2015-02-17 20:45:12', '2015-02-17 20:45:12', 1);

UPDATE `meetings` SET `notes`='AS San Marino Nuoto' WHERE (`id`=13214);

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (4348, 1, 55, 21, 132, 2, 2, 25, 710, '2015-02-17 20:46:30', '2015-02-17 20:46:30');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (4349, 1, 55, 78, 132, 2, 2, 25, 712, '2015-02-17 20:46:30', '2015-02-17 20:46:30');


-- Last completed phase code: 12
