-- *** SQL Diff file for ris20150510varedo.txt ***
-- Timestamp: 201506101129
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1325, NULL, 'GRUPPO PESCE', 0, 353, 142, 1, '2015-06-10 11:43:31', '2015-06-10 11:43:31', 1);

UPDATE `meetings` SET `notes`='Nord Padania Nuoto' WHERE (`id`=14218);


-- Last completed phase code: 12
