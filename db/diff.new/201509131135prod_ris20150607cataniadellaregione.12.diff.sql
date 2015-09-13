-- *** SQL Diff file for ris20150607cataniadellaregione.txt ***
-- Timestamp: 201509131135
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1431, NULL, 'ALTAIR VULCANIA NUO', 0, 322, 142, 1, '2015-09-13 11:53:12', '2015-09-13 11:53:12', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1432, NULL, 'POL. DIL. MURI ANTICHI', 0, 631, 142, 1, '2015-09-13 11:53:13', '2015-09-13 11:53:13', 1);

UPDATE `meetings` SET `notes`='Sicilia Nuoto' WHERE (`id`=14347);


-- Last completed phase code: 12
