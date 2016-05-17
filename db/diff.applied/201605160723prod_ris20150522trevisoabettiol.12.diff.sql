-- *** SQL Diff file for ris20150522trevisoabettiol.txt ***
-- Timestamp: 201605160723
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (2234, NULL, 'GS VIGILI FUOCO RAV', 0, 454, 142, 1, '2016-05-16 07:35:45', '2016-05-16 07:35:45', 1);

UPDATE `meetings` SET `notes`='Natatorium Treviso' WHERE (`id`=14330);


-- Last completed phase code: 12
