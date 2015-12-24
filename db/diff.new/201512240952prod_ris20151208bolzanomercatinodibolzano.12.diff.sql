-- *** SQL Diff file for ris20151208bolzanomercatinodibolzano.txt ***
-- Timestamp: 201512240952
INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1726, NULL, 'ACQUA1VILLAGE ASD', 0, 265, 152, 1, '2015-12-24 10:08:02', '2015-12-24 10:08:02', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1727, NULL, 'CSS -SD COOP SPORTIVA DIL', 0, 68, 152, 1, '2015-12-24 10:08:02', '2015-12-24 10:08:02', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1728, NULL, 'ASD 2001 TEAM', 0, 557, 152, 1, '2015-12-24 10:08:03', '2015-12-24 10:08:03', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1729, NULL, 'MONTENUOTO S.S.D. A R.L.', 0, 161, 152, 1, '2015-12-24 10:08:03', '2015-12-24 10:08:03', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1730, NULL, 'AS L. NUOTO GIUNONE', 0, 99, 152, 1, '2015-12-24 10:08:03', '2015-12-24 10:08:03', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1731, NULL, 'ONDABLU Soc. Coop. Sportiva Dil', 0, 164, 152, 1, '2015-12-24 10:08:03', '2015-12-24 10:08:03', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1732, NULL, 'POL. R.N. TRENTO', 0, 102, 152, 1, '2015-12-24 10:08:04', '2015-12-24 10:08:04', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1733, NULL, 'S.S.V. BOZEN', 0, 456, 152, 1, '2015-12-24 10:08:04', '2015-12-24 10:08:04', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1734, NULL, 'TENNIS CLUB PESCHIE', 0, 361, 152, 1, '2015-12-24 10:08:05', '2015-12-24 10:08:05', 1);

INSERT INTO `team_affiliations` (`id`, `number`, `name`, `must_calculate_goggle_cup`, `team_id`, `season_id`, `user_id`, `created_at`, `updated_at`, `is_autofilled`)
  VALUES (1735, NULL, 'NATATORIUM TREVISO', 0, 44, 152, 1, '2015-12-24 10:08:05', '2015-12-24 10:08:05', 1);

UPDATE `meetings` SET `notes`='Bozen Masters' WHERE (`id`=15252);

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (5613, 2, 2, 28, 152, 2, 1, 26, 926, '2015-12-24 10:10:04', '2015-12-24 10:10:04');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (5614, 2, 3, 10, 152, 2, 1, 26, 927, '2015-12-24 10:10:04', '2015-12-24 10:10:04');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (5615, 2, 15, 81, 152, 2, 1, 26, 929, '2015-12-24 10:10:05', '2015-12-24 10:10:05');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (5616, 1, 44, 59, 152, 1, 1, 26, 926, '2015-12-24 10:10:05', '2015-12-24 10:10:05');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (5617, 1, 44, 17, 152, 1, 1, 26, 927, '2015-12-24 10:10:06', '2015-12-24 10:10:06');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (5618, 1, 48, 20, 152, 1, 1, 26, 928, '2015-12-24 10:10:07', '2015-12-24 10:10:07');

INSERT INTO `time_standards` (`id`, `minutes`, `seconds`, `hundreds`, `season_id`, `gender_type_id`, `pool_type_id`, `event_type_id`, `category_type_id`, `created_at`, `updated_at`)
  VALUES (5619, 1, 54, 45, 152, 1, 1, 26, 929, '2015-12-24 10:10:08', '2015-12-24 10:10:08');


-- Last completed phase code: 12
