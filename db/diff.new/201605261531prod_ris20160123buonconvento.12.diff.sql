-- *** SQL Diff file for ris20160123buonconvento.txt ***
-- Timestamp: 201605261531
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (2397, NULL, 'ASD CSI NUOTO PRATO', 0, 34, 152, 1, '2016-05-26 15:31:38', '2016-05-26 15:31:38', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (2398, NULL, 'CENTRO NUOTO CORTON', 0, 302, 152, 1, '2016-05-26 15:31:39', '2016-05-26 15:31:39', 1);

UPDATE `meetings` SET `notes`='Virtus Buonconvento' WHERE (`id`=15264);


-- Last completed phase code: 12
