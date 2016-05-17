-- *** SQL Diff file for ris20150322cataniaetnanuoto.txt ***
-- Timestamp: 201605161302
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (2284, NULL, 'GRUPPO POL.CATANZAR', 0, 489, 142, 1, '2016-05-16 13:06:42', '2016-05-16 13:06:42', 1);

UPDATE `meetings` SET `notes`='Etna Nuoto ASD' WHERE (`id`=14302);

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (6852, 3, 48, 68, 142, 3, 2, 34, 850, '2016-05-16 13:08:45', '2016-05-16 13:08:45');


-- Last completed phase code: 12
