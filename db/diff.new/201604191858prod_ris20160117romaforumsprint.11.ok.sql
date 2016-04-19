--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ASD PEPPE LAMBERTI NUOTO CLUB':
-- aliased with: 'PEPPE LAMBERTI N.C.' (ID:658)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (659, '2016-04-19 19:07:22', '2016-04-19 19:07:22', 'ASD PEPPE LAMBERTI NUOTO CLUB', 658);


-- Processing:...'PISCINE DELLO STADIO F &W':
-- aliased with: 'PISCINE STADIO FITNESS SS' (ID:842)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (660, '2016-04-19 19:07:22', '2016-04-19 19:07:22', 'PISCINE DELLO STADIO F &W', 842);


-- Processing:...'S.S.D. FREETIME S.C,':
-- aliased with: 'FREE TIME A.S.D.' (ID:421)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (661, '2016-04-19 19:07:22', '2016-04-19 19:07:22', 'S.S.D. FREETIME S.C,', 421);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'D`ALTORIO FEDERICO' (1991, gender: 1)
-- aliased with: 'D'ALTORIO FEDERICO' (ID:22611)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (383, '2016-04-19 19:08:43', '2016-04-19 19:08:43', 'D`ALTORIO FEDERICO', 22611);


-- Processing:...'D`ANDREA GIAMPIERO' (1967, gender: 1)
-- aliased with: 'D'ANDREA GIAMPIERO' (ID:22613)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (384, '2016-04-19 19:08:43', '2016-04-19 19:08:43', 'D`ANDREA GIAMPIERO', 22613);


-- Processing:...'LETTIERI BARBATO MARCO' (1979, gender: 1)

-- Processing:...'ORRU` FABIO' (1970, gender: 1)
-- aliased with: 'ORRU' FABIO' (ID:22739)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (385, '2016-04-19 19:08:43', '2016-04-19 19:08:43', 'ORRU` FABIO', 22739);


-- Processing:...'TORCASIO VELERIO' (1984, gender: 1)
-- aliased with: 'TORCASIO VALERIO' (ID:10933)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (386, '2016-04-19 19:08:43', '2016-04-19 19:08:43', 'TORCASIO VELERIO', 10933);


COMMIT;
