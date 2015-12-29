-- *** SQL Diff file for ris20151114palermopolisportivapalermo.txt ***
-- Timestamp: 201512291910
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1830, NULL, 'CC ORTIGIA ASD', 0, 603, 152, 1, '2015-12-29 19:12:57', '2015-12-29 19:12:57', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1831, NULL, 'AQUARIUS AS', 0, 503, 152, 1, '2015-12-29 19:12:57', '2015-12-29 19:12:57', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1832, NULL, 'ETNA NUOTO ASD', 0, 508, 152, 1, '2015-12-29 19:12:57', '2015-12-29 19:12:57', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1833, NULL, 'CITTÀ DELLO SPORT SSD', 0, 800, 152, 1, '2015-12-29 19:12:57', '2015-12-29 19:12:57', 1);

UPDATE `meetings` SET `notes`='Polisportiva Mimmo Ferrito' WHERE (`id`=15316);

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (5627, 2, 7, 7, 152, 2, 1, 26, 928, '2015-12-29 19:18:02', '2015-12-29 19:18:02');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (5628, 2, 5, 67, 152, 1, 1, 26, 930, '2015-12-29 19:18:08', '2015-12-29 19:18:08');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (5629, 2, 21, 94, 152, 1, 1, 26, 931, '2015-12-29 19:18:09', '2015-12-29 19:18:09');


-- Last completed phase code: 12
