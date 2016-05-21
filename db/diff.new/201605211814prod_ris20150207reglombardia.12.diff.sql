-- *** SQL Diff file for ris20150207reglombardia.txt ***
-- Timestamp: 201605211814
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (2329, NULL, 'CANOTTIERI MILANO ASD', 0, 895, 142, 1, '2016-05-21 18:18:44', '2016-05-21 18:18:44', 1);

UPDATE `meetings` SET `notes`='FIN Comitato Reg. Lombardo' WHERE (`id`=14275);


-- Last completed phase code: 12
