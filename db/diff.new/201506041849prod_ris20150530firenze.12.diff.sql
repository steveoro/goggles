-- *** SQL Diff file for ris20150530firenze.txt ***
-- Timestamp: 201506041849
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1293, NULL, 'COMO N', 0, 349, 142, 1, '2015-06-04 19:34:53', '2015-06-04 19:34:53', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1294, NULL, 'SC DONAU WIEN', 0, 458, 142, 1, '2015-06-04 19:34:53', '2015-06-04 19:34:53', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1295, NULL, 'SC WASSERFREUNDE MÜNCHEN', 0, 460, 142, 1, '2015-06-04 19:34:55', '2015-06-04 19:34:55', 1);

UPDATE `meetings` SET `notes`='Firenze Nuota Master' WHERE (`id`=14222);


-- Last completed phase code: 12
