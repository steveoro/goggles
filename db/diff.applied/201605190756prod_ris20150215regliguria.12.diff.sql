-- *** SQL Diff file for ris20150215regliguria.txt ***
-- Timestamp: 201605190756
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (2313, NULL, 'AQUARIUM VALLESCRIV', 0, 682, 142, 1, '2016-05-19 07:56:55', '2016-05-19 07:56:55', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (2314, NULL, 'IDEA SPORT', 0, 718, 142, 1, '2016-05-19 07:56:55', '2016-05-19 07:56:55', 1);

UPDATE `meetings` SET `notes`='FIN CR Liguria' WHERE (`id`=14279);


-- Last completed phase code: 12
