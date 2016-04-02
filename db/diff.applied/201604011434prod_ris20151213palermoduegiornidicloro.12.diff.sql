-- *** SQL Diff file for ris20151213palermoduegiornidicloro.txt ***
-- Timestamp: 201604011434
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (2160, NULL, 'SWIM POWER ASD', 0, 513, 152, 1, '2016-04-01 14:39:34', '2016-04-01 14:39:34', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (2161, NULL, 'POLISPORTIVA GIFA', 0, 510, 152, 1, '2016-04-01 14:39:34', '2016-04-01 14:39:34', 1);

UPDATE `meetings` SET `notes`='Waterpolo Palermo' WHERE (`id`=15260);


-- Last completed phase code: 12
