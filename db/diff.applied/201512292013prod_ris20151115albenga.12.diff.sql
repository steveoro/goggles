-- *** SQL Diff file for ris20151115albenga.txt ***
-- Timestamp: 201512292013
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1854, NULL, 'AMATORI N SAVONA SC', 0, 279, 152, 1, '2015-12-29 20:14:23', '2015-12-29 20:14:23', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1855, NULL, 'IDEA SPORT', 0, 718, 152, 1, '2015-12-29 20:14:24', '2015-12-29 20:14:24', 1);

UPDATE `meetings` SET `notes`='S.S.D. IDEA SPORT a R.L.' WHERE (`id`=15247);


-- Last completed phase code: 12
