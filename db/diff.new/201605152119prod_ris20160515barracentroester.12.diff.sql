-- *** SQL Diff file for ris20160515barracentroester.txt ***
-- Timestamp: 201605152119
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (2219, NULL, 'RN SAN FRANCESCO -', 0, 680, 152, 1, '2016-05-15 21:19:51', '2016-05-15 21:19:51', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (2220, NULL, 'SPORTING CLUB FLEGR', 0, 195, 152, 1, '2016-05-15 21:19:51', '2016-05-15 21:19:51', 1);

UPDATE `meetings` SET `notes`='Centro Ester' WHERE (`id`=15354);


-- Last completed phase code: 12
