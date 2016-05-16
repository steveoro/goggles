-- *** SQL Diff file for ris20150426massalubrenseterredellesirene.txt ***
-- Timestamp: 201605160718
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (2230, NULL, 'Massa Lubrense Nuoto Asd', 0, 892, 142, 1, '2016-05-16 07:19:36', '2016-05-16 07:19:36', 1);

UPDATE `meetings` SET `notes`='Massa Lubrense Nuoto' WHERE (`id`=14323);


-- Last completed phase code: 12
