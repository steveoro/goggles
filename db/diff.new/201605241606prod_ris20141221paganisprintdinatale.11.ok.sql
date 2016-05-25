--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.D. SWIM ACADEMY':
-- aliased with: 'ASD SWIM ACADEMY' (ID:925)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (792, '2016-05-24 16:06:48', '2016-05-24 16:06:48', 'A.S.D. SWIM ACADEMY', 925);


-- Processing:...'S.S.D. INCONTRO':
-- aliased with: 'INCONTRO SSD ARL' (ID:820)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (793, '2016-05-24 16:06:48', '2016-05-24 16:06:48', 'S.S.D. INCONTRO', 820);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ALFREDO BRUNO' (1950, gender: 1)
-- aliased with: 'BRUNO ALFREDO' (ID:3380)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (503, '2016-05-24 16:10:33', '2016-05-24 16:10:33', 'ALFREDO BRUNO', 3380);


-- Processing:...'CRISCUOLO VITTORIO' (1974, gender: 1)

-- Processing:...'DONATO IANDOLI' (1993, gender: 1)
-- aliased with: 'IANDOLI DONATO' (ID:20905)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (504, '2016-05-24 16:10:33', '2016-05-24 16:10:33', 'DONATO IANDOLI', 20905);


-- Processing:...'GUGLIEMELLI FRANCO' (1969, gender: 1)
-- aliased with: 'GUGLIELMELLI FRANCO' (ID:14980)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (505, '2016-05-24 16:10:33', '2016-05-24 16:10:33', 'GUGLIEMELLI FRANCO', 14980);


-- Processing:...'PELUSO MARIANNA' (1983, gender: 2)
-- aliased with: 'PELUSO MARINA' (ID:15032)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (506, '2016-05-24 16:10:33', '2016-05-24 16:10:33', 'PELUSO MARIANNA', 15032);


-- Processing:...'SCIANCALEPORE GIANNI' (1967, gender: 1)
-- aliased with: 'SCIANCALEPORE GIOVANNI' (ID:23795)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (507, '2016-05-24 16:10:33', '2016-05-24 16:10:33', 'SCIANCALEPORE GIANNI', 23795);


COMMIT;
