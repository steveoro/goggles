-- *** SQL Diff file for ris20160313trentobuonconsiglionuoto.txt ***
-- Timestamp: 201603300732
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (2150, NULL, 'ANTARES N CASTELFRA', 0, 373, 152, 1, '2016-03-30 07:34:43', '2016-03-30 07:34:43', 1);

UPDATE `meetings` SET `notes`='Buonconsiglio Nuoto' WHERE (`id`=15294);


-- Last completed phase code: 12
