-- *** SQL Diff file for ris20150606padova.txt ***
-- Timestamp: 201509130917
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1370, NULL, 'FOLTZER N.', 0, 326, 142, 1, '2015-09-13 09:44:55', '2015-09-13 09:44:55', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1371, NULL, 'S.S.D. G.P. NUOTO MIRA a r.l.', 0, 172, 142, 1, '2015-09-13 09:44:55', '2015-09-13 09:44:55', 1);

UPDATE `meetings` SET `notes`='Nuotatori Padovani' WHERE (`id`=14343);


-- Last completed phase code: 12
