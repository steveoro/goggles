-- *** SQL Diff file for ris20160221regumbria.txt ***
-- Timestamp: 201602281631
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1978, NULL, 'AREZZO NUOTO ASD', 0, 297, 152, 1, '2016-02-28 16:32:47', '2016-02-28 16:32:47', 1);

UPDATE `meetings` SET `notes`='CR Umbria' WHERE (`id`=15284);


-- Last completed phase code: 12
