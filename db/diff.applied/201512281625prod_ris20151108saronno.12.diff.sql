-- *** SQL Diff file for ris20151108saronno.txt ***
-- Timestamp: 201512281625
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1779, NULL, 'NEW SWIM', 0, 480, 152, 1, '2015-12-28 16:35:00', '2015-12-28 16:35:00', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1780, NULL, 'RN LEGNANO', 0, 273, 152, 1, '2015-12-28 16:35:02', '2015-12-28 16:35:02', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1781, NULL, 'TEAM NUOTO LOMBARDI', 0, 277, 152, 1, '2015-12-28 16:35:02', '2015-12-28 16:35:02', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1782, NULL, 'VIRIBUS UNITIS', 0, 481, 152, 1, '2015-12-28 16:35:05', '2015-12-28 16:35:05', 1);

UPDATE `meetings` SET `notes`='RN Saronno' WHERE (`id`=15236);

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (5626, 2, 18, 11, 152, 3, 1, 33, 930, '2015-12-28 16:46:11', '2015-12-28 16:46:11');


-- Last completed phase code: 12
