--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Albatros asd - Lumezzane':
-- aliased with: 'ALBATROS ASD LUMEZZ' (ID:345)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (481, '2015-12-28 10:48:15', '2015-12-28 10:48:15', 'Albatros asd - Lumezzane', 345);


-- Processing:...'Effetto Sport ssd':

-- Processing:...'Il Delfino Napoli asd':

-- Processing:...'La Wellness ssd - Milano':
-- aliased with: 'LA WELLNESS' (ID:104)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (482, '2015-12-28 10:48:17', '2015-12-28 10:48:17', 'La Wellness ssd - Milano', 104);


-- Processing:...'Malaspina Sport Club':
-- aliased with: 'MALASPINA SC' (ID:270)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (483, '2015-12-28 10:48:17', '2015-12-28 10:48:17', 'Malaspina Sport Club', 270);


-- Processing:...'Nord Padania Nuoto - Vare':
-- aliased with: 'NORD PADANIA N' (ID:56)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (484, '2015-12-28 10:48:18', '2015-12-28 10:48:18', 'Nord Padania Nuoto - Vare', 56);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'D'ANGELO WALTER' (1962, gender: 1)
-- aliased with: 'D`ANGELO WALTER' (ID:3805)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (280, '2015-12-28 10:50:10', '2015-12-28 10:50:10', 'D\'ANGELO WALTER', 3805);


COMMIT;
