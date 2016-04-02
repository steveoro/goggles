-- *** SQL Diff file for ris20151212modugnosantaclaus.txt ***
-- Timestamp: 201604011329
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (2156, NULL, 'PAYTON BARI', 0, 813, 152, 1, '2016-04-01 13:35:00', '2016-04-01 13:35:00', 1);

UPDATE `meetings` SET `notes`='G.P. MODUGNO' WHERE (`id`=15253);


-- Last completed phase code: 12
