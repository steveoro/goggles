--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Libertas Due Valli':
-- aliased with: 'LIBERTAS DUE VALLI A.S.D' (ID:410)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (760, '2016-05-19 07:39:08', '2016-05-19 07:39:08', 'Libertas Due Valli', 410);


-- Processing:...'Rari Nantes Sempion':

-- Processing:...'Sisport FIAT ssd':
-- aliased with: 'SISPORT FIAT S.P.A.' (ID:226)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (761, '2016-05-19 07:39:08', '2016-05-19 07:39:08', 'Sisport FIAT ssd', 226);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CASTRIGNANO' RICCARDO' (1976, gender: 1)
-- aliased with: 'CASTRIGNANO` RICCARDO' (ID:7454)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (456, '2016-05-19 07:41:36', '2016-05-19 07:41:36', 'CASTRIGNANO\' RICCARDO', 7454);


-- Processing:...'CERINO GIOSUE'' (1980, gender: 1)
-- aliased with: 'CERINO GIOSUE`' (ID:7460)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (457, '2016-05-19 07:41:36', '2016-05-19 07:41:36', 'CERINO GIOSUE\'', 7460);


-- Processing:...'D'ANGELO MARIO' (1986, gender: 1)
-- aliased with: 'D`ANGELO MARIO' (ID:17827)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (458, '2016-05-19 07:41:36', '2016-05-19 07:41:36', 'D\'ANGELO MARIO', 17827);


-- Processing:...'DELL'AMICO EDOARDO MARIA' (1980, gender: 1)
-- aliased with: 'DELL`AMICO EDOARDO MARIA' (ID:9622)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (459, '2016-05-19 07:41:36', '2016-05-19 07:41:36', 'DELL\'AMICO EDOARDO MARIA', 9622);


-- Processing:...'FAMA' ROBERTO' (1977, gender: 1)
-- aliased with: 'FAMA` ROBERTO' (ID:4774)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (460, '2016-05-19 07:41:36', '2016-05-19 07:41:36', 'FAMA\' ROBERTO', 4774);


-- Processing:...'MATTE' ENRICA ROSANNA' (1969, gender: 2)
-- aliased with: 'MATTE` ENRICA ROSANNA' (ID:18358)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (461, '2016-05-19 07:41:36', '2016-05-19 07:41:36', 'MATTE\' ENRICA ROSANNA', 18358);


-- Processing:...'MINO VALERIA' (1985, gender: 2)

-- Processing:...'PULITANO' FEDERICA' (1980, gender: 2)
-- aliased with: 'PULITANO` FEDERICA' (ID:25754)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (462, '2016-05-19 07:41:36', '2016-05-19 07:41:36', 'PULITANO\' FEDERICA', 25754);


-- Processing:...'SACCA' ROSARIO' (1981, gender: 1)
-- aliased with: 'SACCA` ROSARIO' (ID:18178)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (463, '2016-05-19 07:41:36', '2016-05-19 07:41:36', 'SACCA\' ROSARIO', 18178);


-- Processing:...'SAPPEI MELISSA' (1989, gender: 2)

COMMIT;
