--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ASD GRUPPO POL.CZ':
-- aliased with: 'GRUPPO POL.CATANZAR' (ID:489)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (736, '2016-05-16 13:03:56', '2016-05-16 13:03:56', 'ASD GRUPPO POL.CZ', 489);


-- Processing:...'NUOTO ATLANTIS - SIRACUSA':

-- Processing:...'POL. ODYSSEUS MESSINA':
-- aliased with: 'ODYSSEUS MESSINA ASD' (ID:803)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (737, '2016-05-16 13:03:57', '2016-05-16 13:03:57', 'POL. ODYSSEUS MESSINA', 803);


-- Processing:...'SICILIA NUOTO ASD':
-- aliased with: 'SICILIA NUOTO SSD ARL' (ID:715)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (738, '2016-05-16 13:03:57', '2016-05-16 13:03:57', 'SICILIA NUOTO ASD', 715);


-- Processing:...'TENNIS CLUB MATCH BALL - B':
-- aliased with: 'TENNIS CLUB MATCH B' (ID:371)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (739, '2016-05-16 13:03:57', '2016-05-16 13:03:57', 'TENNIS CLUB MATCH BALL - B', 371);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CARTAMELI MASSIMO' (1967, gender: 1)
-- aliased with: 'CARTALEMI MASSIMO SALVATORE' (ID:12803)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (433, '2016-05-16 13:06:40', '2016-05-16 13:06:40', 'CARTAMELI MASSIMO', 12803);


-- Processing:...'D'ANNA FABRIZIO UGO' (1984, gender: 1)
-- aliased with: 'D`ANNA FABRIZIO UGO' (ID:20051)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (434, '2016-05-16 13:06:40', '2016-05-16 13:06:40', 'D\'ANNA FABRIZIO UGO', 20051);


-- Processing:...'FARINATO FRANCESCO ANTONIO' (1965, gender: 1)
-- aliased with: 'FARINATO FRANCESCO' (ID:16445)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (435, '2016-05-16 13:06:40', '2016-05-16 13:06:40', 'FARINATO FRANCESCO ANTONIO', 16445);


-- Processing:...'FUCILE ANGELO' (1979, gender: 1)

-- Processing:...'SPATOLA ALESSANDRO' (1990, gender: 1)

-- Processing:...'TREDEZ GUILLAME THOMAS' (1989, gender: 1)
-- aliased with: 'TREDEZ GUILLAUME THOMAS' (ID:20147)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (436, '2016-05-16 13:06:40', '2016-05-16 13:06:40', 'TREDEZ GUILLAME THOMAS', 20147);


COMMIT;
