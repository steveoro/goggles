--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'C.S.MARINA MILITARE':

-- Processing:...'R.N.SORI':
-- aliased with: 'RARI NANTES SORI' (ID:285)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (154, '2015-02-19 20:54:17', '2015-02-19 20:54:17', 'R.N.SORI', 285);


-- Processing:...'UISP NUOTO VALDIMAG':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BATTAGLINI MATTEO' (1990, gender: 1)

-- Processing:...'BOUROVA OLESSIA' (1979, gender: 2)
-- aliased with: 'BOUROVA OLESYA' (ID:4725)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (71, '2015-02-19 20:54:54', '2015-02-19 20:54:54', 'BOUROVA OLESSIA', 4725);


-- Processing:...'DI CRISTINA DEBORA' (1990, gender: 2)

-- Processing:...'GUELFO STEFANIA' (1972, gender: 2)

-- Processing:...'PODESTA` MARTINA' (1984, gender: 2)
-- aliased with: 'PODESTA' MARTINA' (ID:9546)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (72, '2015-02-19 20:54:54', '2015-02-19 20:54:54', 'PODESTA` MARTINA', 9546);


-- Processing:...'POZZO EMMANUELE MARIA' (1962, gender: 1)
-- aliased with: 'POZZI EMANUELE MARIA' (ID:12578)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (73, '2015-02-19 20:54:54', '2015-02-19 20:54:54', 'POZZO EMMANUELE MARIA', 12578);


COMMIT;
