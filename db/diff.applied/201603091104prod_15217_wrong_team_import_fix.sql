-- Leega
-- 09/3/2016
-- Fix wrong swimmer/team import fro Brixia Fidelis 2016

INSERT INTO `teams` (`id`, `name`, `editable_name`, `address`, `zip`, `phone_mobile`, `phone_number`, `fax_number`, `e_mail`, `contact_name`, `notes`, `name_variations`, `city_id`, `user_id`, `created_at`, `updated_at`, `home_page_url`)
  VALUES (895, 'CANOTTIERI MILANO ASD', 'CANOTTIERI MILANO ASD', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'CANOTTIERI MILANO', 62, 2, '2016-03-07 00:10:19', '2016-03-07 00:10:19', NULL);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (2039, NULL, 'CANOTTIERI MILANO ASD', 0, 895, 152, 2, '2016-03-07 00:10:19', '2016-03-07 00:10:19', 0);

UPDATE badges SET team_id = 895, team_affiliation_id = 2039 WHERE id = 41704;
UPDATE meeting_individual_results SET team_id = 895, team_affiliation_id = 2039 WHERE badge_id = 41704;
