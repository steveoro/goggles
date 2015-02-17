-- *** SQL Diff file for ris20140209regemilia.txt ***
-- Timestamp: 201502171741
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (580, NULL, 'N.C. AZZURRA 1991', 0, 9, 132, 1, '2015-02-17 17:44:54', '2015-02-17 17:44:54', 1);

UPDATE `meetings` SET `notes`='CR Emilia' WHERE (`id`=13207);


-- Last completed phase code: 12
