-- *** SQL Diff file for ris20160320cataniaetnanuoto.txt ***
-- Timestamp: 201603261523
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (2080, NULL, 'CN SUB VILLA ASD', 0, 506, 152, 1, '2016-03-26 16:05:14', '2016-03-26 16:05:14', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (2081, NULL, 'A.S.D. SYNTHESIS NUOTO', 0, 600, 152, 1, '2016-03-26 16:05:25', '2016-03-26 16:05:25', 1);

UPDATE `meetings` SET `notes`='Etna Nuoto ASD' WHERE (`id`=15302);

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (6322, 4, 27, 29, 152, 3, 2, 35, 928, '2016-03-26 16:17:39', '2016-03-26 16:17:39');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (6323, 3, 48, 68, 152, 3, 2, 34, 926, '2016-03-26 16:17:40', '2016-03-26 16:17:40');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (6324, 3, 56, 35, 152, 3, 2, 34, 927, '2016-03-26 16:17:41', '2016-03-26 16:17:41');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (6325, 4, 17, 76, 152, 2, 2, 27, 928, '2016-03-26 16:17:45', '2016-03-26 16:17:45');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (6326, 3, 30, 77, 152, 1, 2, 27, 926, '2016-03-26 16:17:46', '2016-03-26 16:17:46');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (6327, 3, 25, 46, 152, 1, 2, 27, 927, '2016-03-26 16:17:47', '2016-03-26 16:17:47');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (6328, 3, 38, 60, 152, 1, 2, 27, 928, '2016-03-26 16:17:48', '2016-03-26 16:17:48');


-- Last completed phase code: 12
