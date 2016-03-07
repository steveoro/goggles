--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'AQUARIUM NUOTO':

-- Processing:...'ASD NUOTO CLUB MONTECARLO':
-- aliased with: 'NUOTO CLUB MONTECAR' (ID:272)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (575, '2016-03-05 20:25:10', '2016-03-05 20:25:10', 'ASD NUOTO CLUB MONTECARLO', 272);


-- Processing:...'N CANAVESANI AS DIL':
-- aliased with: 'NUOTATORI CANAVESAN' (ID:414)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (576, '2016-03-05 20:25:10', '2016-03-05 20:25:10', 'N CANAVESANI AS DIL', 414);


-- Processing:...'S.C. ALESSANDRIA ASD':
-- aliased with: 'SWIMMING CLUB ALESS' (ID:94)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (577, '2016-03-05 20:25:10', '2016-03-05 20:25:10', 'S.C. ALESSANDRIA ASD', 94);


-- Processing:...'SAN GIUSEPPE ASD':
-- aliased with: 'SAN GIUSEPPE SSD -' (ID:275)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (578, '2016-03-05 20:25:10', '2016-03-05 20:25:10', 'SAN GIUSEPPE ASD', 275);


-- Processing:...'VIVISPORT FOSSANO':
-- aliased with: 'VIVISPORT POL.UISP' (ID:289)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (579, '2016-03-05 20:25:10', '2016-03-05 20:25:10', 'VIVISPORT FOSSANO', 289);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'DAMARCO ALESSANDRO' (1972, gender: 1)

-- Processing:...'DEMATTI DELIA ANGELA CARLA' (1969, gender: 2)
-- aliased with: 'DEMATTI DELIA' (ID:12514)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (309, '2016-03-05 20:25:52', '2016-03-05 20:25:52', 'DEMATTI DELIA ANGELA CARLA', 12514);


-- Processing:...'MORRA MARCELLO' (1988, gender: 1)

-- Processing:...'PENEDO MELISA SOFIA' (1991, gender: 2)
-- aliased with: 'PENEDO MELISSA SOFIA' (ID:7610)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (310, '2016-03-05 20:25:52', '2016-03-05 20:25:52', 'PENEDO MELISA SOFIA', 7610);


COMMIT;
