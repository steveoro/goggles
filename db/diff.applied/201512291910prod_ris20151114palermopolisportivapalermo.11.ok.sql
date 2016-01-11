--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.D. C.C.ORTIGIA':
-- aliased with: 'CC ORTIGIA ASD' (ID:603)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (500, '2015-12-29 19:12:41', '2015-12-29 19:12:41', 'A.S.D. C.C.ORTIGIA', 603);


-- Processing:...'AQUARIUS ASD - TP':
-- aliased with: 'AQUARIUS AS' (ID:503)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (501, '2015-12-29 19:12:41', '2015-12-29 19:12:41', 'AQUARIUS ASD - TP', 503);


-- Processing:...'ASD ETNA NUOTO':
-- aliased with: 'ETNA NUOTO ASD' (ID:508)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (502, '2015-12-29 19:12:41', '2015-12-29 19:12:41', 'ASD ETNA NUOTO', 508);


-- Processing:...'Città dello Sport SSD':
-- aliased with: 'CITTÀ DELLO SPORT SSD' (ID:800)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (503, '2015-12-29 19:12:41', '2015-12-29 19:12:41', 'Città dello Sport SSD', 800);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'PULEO FABIO' (1975, gender: 1)

COMMIT;
