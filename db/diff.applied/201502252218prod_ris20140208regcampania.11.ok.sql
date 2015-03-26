--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.D. ACQUACHIARA ATI 2000':

-- Processing:...'LIBERTAS LINEA AZZU':

-- Processing:...'PEPPE LAMBERTI N.C.':

-- Processing:...'QUADRIFOGLIO SPORT.':
-- aliased with: 'ASD QUADRIFOGLIO SPORTING' (ID:181)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (199, '2015-02-25 22:24:41', '2015-02-25 22:24:41', 'QUADRIFOGLIO SPORT.', 181);


-- Processing:...'SESTIUS NUOTO CASER':

-- Processing:...'SSD GYMNASIUM':
-- aliased with: 'GYMNASIUM SSD' (ID:187)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (200, '2015-02-25 22:24:41', '2015-02-25 22:24:41', 'SSD GYMNASIUM', 187);


-- Processing:...'SWIMMING SORRENTO A':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CAMPANILE LUISA VITTORIA' (1986, gender: 2)
-- aliased with: 'CAMPANILE LUISA' (ID:13568)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (120, '2015-02-25 22:32:29', '2015-02-25 22:32:29', 'CAMPANILE LUISA VITTORIA', 13568);


-- Processing:...'CAPORALE ALESSANDRO' (1985, gender: 1)
-- aliased with: 'CAMPOREALE ALESSANDRO' (ID:13569)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (121, '2015-02-25 22:32:29', '2015-02-25 22:32:29', 'CAPORALE ALESSANDRO', 13569);


-- Processing:...'CRISUOLO SALVATORE' (1991, gender: 1)
-- aliased with: 'CRISCUOLO SALVATORE' (ID:13601)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (122, '2015-02-25 22:32:29', '2015-02-25 22:32:29', 'CRISUOLO SALVATORE', 13601);


-- Processing:...'D'AMBROSIO ENRICO' (1990, gender: 1)
-- aliased with: 'D`AMBROSIO ENRICO' (ID:9177)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (123, '2015-02-25 22:32:29', '2015-02-25 22:32:29', 'D\'AMBROSIO ENRICO', 9177);


-- Processing:...'DORIA ALFONSO' (1972, gender: 1)

-- Processing:...'FIORENTINO ANTONIO' (1965, gender: 1)
-- aliased with: 'FIORENTINI ANTONIO' (ID:13642)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (124, '2015-02-25 22:32:29', '2015-02-25 22:32:29', 'FIORENTINO ANTONIO', 13642);


-- Processing:...'GANGALE LUCIA' (1968, gender: 2)

-- Processing:...'ROMANO FRANCESCO' (1984, gender: 1)

-- Processing:...'ROSA FRANCESCO' (1981, gender: 1)

-- Processing:...'TARALLO GENNARO' (1993, gender: 1)
-- aliased with: 'TARALLO GNNARO' (ID:13780)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (125, '2015-02-25 22:32:29', '2015-02-25 22:32:29', 'TARALLO GENNARO', 13780);


-- Processing:...'VINCIOLI ROBERTO' (1975, gender: 1)

COMMIT;
