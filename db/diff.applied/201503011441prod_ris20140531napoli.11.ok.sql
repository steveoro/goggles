--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CARAVAGGIO SPORTING VILLAGE':

-- Processing:...'CIRCOLO NAUTICO POSILLIPO':
-- aliased with: 'C NAUTICO POSILLIPO' (ID:183)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (284, '2015-03-01 14:43:07', '2015-03-01 14:43:07', 'CIRCOLO NAUTICO POSILLIPO', 183);


-- Processing:...'DELPHINIA SPORTING CLUB':
-- aliased with: 'DELPHINIA SP.CLUB N' (ID:488)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (285, '2015-03-01 14:43:07', '2015-03-01 14:43:07', 'DELPHINIA SPORTING CLUB', 488);


-- Processing:...'QUADRIFOGLIO':
-- aliased with: 'ASD QUADRIFOGLIO SPORTING' (ID:181)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (286, '2015-03-01 14:43:07', '2015-03-01 14:43:07', 'QUADRIFOGLIO', 181);


-- Processing:...'SPORTING CLUB NUOTO NAPOLI':
-- aliased with: 'SPORTING CLUB NUOTO' (ID:496)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (287, '2015-03-01 14:43:07', '2015-03-01 14:43:07', 'SPORTING CLUB NUOTO NAPOLI', 496);


-- Processing:...'SWIMMING CLUB QUATTROVENTI':
-- aliased with: 'SWIMMING CLUB QUATT' (ID:627)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (288, '2015-03-01 14:43:07', '2015-03-01 14:43:07', 'SWIMMING CLUB QUATTROVENTI', 627);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'D'AVINO ANTONELLA' (1965, gender: 2)
-- aliased with: 'D`AVINO ANTONELLA' (ID:3356)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (193, '2015-03-01 14:43:43', '2015-03-01 14:43:43', 'D\'AVINO ANTONELLA', 3356);


-- Processing:...'DELL'ABATE DONATO' (1940, gender: 1)
-- aliased with: 'DELL`ABATE DONATO' (ID:3343)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (194, '2015-03-01 14:43:43', '2015-03-01 14:43:43', 'DELL\'ABATE DONATO', 3343);


-- Processing:...'PATERNO' PIETRO' (1952, gender: 1)
-- aliased with: 'PATERNO` PIETRO' (ID:13713)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (195, '2015-03-01 14:43:43', '2015-03-01 14:43:43', 'PATERNO\' PIETRO', 13713);


COMMIT;
