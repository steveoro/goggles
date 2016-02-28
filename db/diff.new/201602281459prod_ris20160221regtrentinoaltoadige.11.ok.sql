--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'SC VINSCHGAU RAFFEEISEN':
-- aliased with: 'SCHWIMMCLUB VINSCHGAU' (ID:867)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (558, '2016-02-28 15:29:49', '2016-02-28 15:29:49', 'SC VINSCHGAU RAFFEEISEN', 867);


-- Processing:...'Sport Management Pergine':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'TROJER SIEGMAR' (1941, gender: 1)
-- aliased with: 'SIEGMAR TROJER' (ID:22048)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (300, '2016-02-28 15:30:08', '2016-02-28 15:30:08', 'TROJER SIEGMAR', 22048);


COMMIT;
