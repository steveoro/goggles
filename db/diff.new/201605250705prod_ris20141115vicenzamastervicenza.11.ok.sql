--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.D. C.S.I. NUOTO':
-- aliased with: 'ASD CSI NUOTO PRATO' (ID:34)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (807, '2016-05-25 07:20:48', '2016-05-25 07:20:48', 'A.S.D. C.S.I. NUOTO', 34);


-- Processing:...'A.S.DILETT. B2K SWI':
-- aliased with: 'B2K SWIM TEAM ASD' (ID:391)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (808, '2016-05-25 07:20:48', '2016-05-25 07:20:48', 'A.S.DILETT. B2K SWI', 391);


-- Processing:...'A.S.DILETT. FLY ON':
-- aliased with: 'FLY ON THE WATER ASD' (ID:435)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (809, '2016-05-25 07:20:48', '2016-05-25 07:20:48', 'A.S.DILETT. FLY ON', 435);


-- Processing:...'A.S.DILETT. UISP NU':
-- aliased with: 'UISP NUOTO VALDIMAG' (ID:598)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (810, '2016-05-25 07:20:48', '2016-05-25 07:20:48', 'A.S.DILETT. UISP NU', 598);


-- Processing:...'DIMENSIONE NUOTO PO':
-- aliased with: 'D.N. PONTEDERA' (ID:111)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (811, '2016-05-25 07:20:48', '2016-05-25 07:20:48', 'DIMENSIONE NUOTO PO', 111);


-- Processing:...'H. SPORT S.S.DILETT':
-- aliased with: 'HAPPY SPORT' (ID:16)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (812, '2016-05-25 07:20:48', '2016-05-25 07:20:48', 'H. SPORT S.S.DILETT', 16);


-- Processing:...'S.S.DILETT. BARZANO':
-- aliased with: 'BARZANÒ ACQUACLUB S' (ID:86)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (813, '2016-05-25 07:20:48', '2016-05-25 07:20:48', 'S.S.DILETT. BARZANO', 86);


-- Processing:...'S.S.DILETT. NC CAST':
-- aliased with: 'NUOTO CLUB CASTIGLI' (ID:93)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (814, '2016-05-25 07:20:48', '2016-05-25 07:20:48', 'S.S.DILETT. NC CAST', 93);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'GHIORZI NICOLO'' (1988, gender: 1)
-- aliased with: 'GHIORZI NICOLO`' (ID:2457)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (524, '2016-05-25 07:22:51', '2016-05-25 07:22:51', 'GHIORZI NICOLO\'', 2457);


-- Processing:...'TESSARO KRISTIAN' (1982, gender: 1)

COMMIT;
