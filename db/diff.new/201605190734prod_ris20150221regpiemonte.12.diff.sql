-- *** SQL Diff file for ris20150221regpiemonte.txt ***
-- Timestamp: 201605190734
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (2311, NULL, 'LIBERTAS DUE VALLI A.S.D', 0, 410, 142, 1, '2016-05-19 07:41:39', '2016-05-19 07:41:39', 1);

UPDATE `meetings` SET `notes`='CR Piemonte' WHERE (`id`=14281);


-- Last completed phase code: 12
