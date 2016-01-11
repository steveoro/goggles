-- *** SQL Diff file for ris20151115novara.txt ***
-- Timestamp: 201512300920
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1870, NULL, 'AP PADANA', 0, 405, 152, 1, '2015-12-30 09:30:30', '2015-12-30 09:30:30', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1871, NULL, 'COMO N', 0, 349, 152, 1, '2015-12-30 09:30:32', '2015-12-30 09:30:32', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1872, NULL, 'LIBERTAS SNEF', 0, 354, 152, 1, '2015-12-30 09:30:34', '2015-12-30 09:30:34', 1);

UPDATE `meetings` SET `notes`='Natatio Master Team' WHERE (`id`=15240);


-- Last completed phase code: 12
