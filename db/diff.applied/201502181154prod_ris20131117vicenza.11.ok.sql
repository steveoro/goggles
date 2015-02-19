--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.POL.DILETT. RARI':

-- Processing:...'A.R.C.A.  S.S.D. a':
-- aliased with: 'A.R.C.A. S.S.D. a RL' (ID:138)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (94, '2015-02-18 12:06:26', '2015-02-18 12:06:26', 'A.R.C.A.  S.S.D. a', 138);


-- Processing:...'A.S.D. PISCINE DI S':
-- aliased with: 'A.S.D PISCINE DI STRA E VIGONZA' (ID:141)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (95, '2015-02-18 12:06:26', '2015-02-18 12:06:26', 'A.S.D. PISCINE DI S', 141);


-- Processing:...'A.S.D.R.N.ADRIA MON':

-- Processing:...'A.S.DILETT. BERGAMO':

-- Processing:...'A.S.DILETT. IL GABB':
-- aliased with: 'IL GABBIANO NAPOLI' (ID:188)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (96, '2015-02-18 12:06:26', '2015-02-18 12:06:26', 'A.S.DILETT. IL GABB', 188);


-- Processing:...'ACQUA AZZURRA ATRI':
-- aliased with: 'AS ACQUAZZURRA ATR' (ID:115)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (97, '2015-02-18 12:06:26', '2015-02-18 12:06:26', 'ACQUA AZZURRA ATRI', 115);


-- Processing:...'AQUAPOLIS S.S.D. AR':

-- Processing:...'C. N. VALDAGNO LIBE':
-- aliased with: 'VALDAGNO LIBERTAS A' (ID:114)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (98, '2015-02-18 12:06:26', '2015-02-18 12:06:26', 'C. N. VALDAGNO LIBE', 114);


-- Processing:...'CITTA' SPORT VICENZ':
-- aliased with: 'CITTA'' SPORT VICENZA S.S.D. RL' (ID:155)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (99, '2015-02-18 12:06:26', '2015-02-18 12:06:26', 'CITTA\' SPORT VICENZ', 155);


-- Processing:...'COOPERNUOTO SOC.COO':
-- aliased with: 'COOPERNUOTO' (ID:42)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (100, '2015-02-18 12:06:26', '2015-02-18 12:06:26', 'COOPERNUOTO SOC.COO', 42);


-- Processing:...'CSS COORD SERV. SPO':
-- aliased with: 'CSS -SD COOP SPORTIVA DIL' (ID:68)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (101, '2015-02-18 12:06:26', '2015-02-18 12:06:26', 'CSS COORD SERV. SPO', 68);


-- Processing:...'FREE TIME A.S.D.':

-- Processing:...'R.N. U.O.E.I. CANDI':
-- aliased with: 'RN U.O.E.I. CANDIDO CABBIA ASD' (ID:170)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (102, '2015-02-18 12:06:26', '2015-02-18 12:06:26', 'R.N. U.O.E.I. CANDI', 170);


-- Processing:...'S.S.D. NATATORIUM T':
-- aliased with: 'NATATORIUM TREVISO' (ID:44)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (103, '2015-02-18 12:06:26', '2015-02-18 12:06:26', 'S.S.D. NATATORIUM T', 44);


-- Processing:...'STELLA MARINA S.S.D':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BECCARO MARCO' (1983, gender: 1)

-- Processing:...'CARNIO UMBERTO' (1967, gender: 1)

-- Processing:...'CORO' GIADA' (1989, gender: 2)
-- aliased with: 'CORO` GIADA' (ID:5046)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (31, '2015-02-18 12:09:32', '2015-02-18 12:09:32', 'CORO\' GIADA', 5046);


-- Processing:...'D'ELIA FRANCESCO' (1958, gender: 1)
-- aliased with: 'D`ELIA FRANCESCO' (ID:2156)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (32, '2015-02-18 12:09:32', '2015-02-18 12:09:32', 'D\'ELIA FRANCESCO', 2156);


-- Processing:...'DAZZI ALBERTO' (1988, gender: 1)

-- Processing:...'FRANCO FLAVIO' (1964, gender: 1)

-- Processing:...'PERETTI ANDREA' (1979, gender: 1)

-- Processing:...'TENZE GIORGIO' (1964, gender: 1)

-- Processing:...'TODESCATO MONICA' (1971, gender: 2)

-- Processing:...'ZANE CLAUDIA' (1987, gender: 2)

COMMIT;
