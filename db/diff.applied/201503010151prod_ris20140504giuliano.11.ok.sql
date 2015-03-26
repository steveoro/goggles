--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A. S. ARIETE':
-- aliased with: 'A.S.DILETT. ARIETE' (ID:622)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (257, '2015-03-01 01:52:24', '2015-03-01 01:52:24', 'A. S. ARIETE', 622);


-- Processing:...'COUNTRYPARK - LA MASSERIA AQU':
-- aliased with: 'LA MASSERIA AQUA AS' (ID:698)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (258, '2015-03-01 01:52:24', '2015-03-01 01:52:24', 'COUNTRYPARK - LA MASSERIA AQU', 698);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CERQUA KATYA' (1992, gender: 2)
-- aliased with: 'CERQUA KATJA' (ID:9109)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (185, '2015-03-01 01:52:35', '2015-03-01 01:52:35', 'CERQUA KATYA', 9109);


COMMIT;
