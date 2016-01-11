--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.P.Padana ssd':
-- aliased with: 'AP PADANA' (ID:405)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (507, '2015-12-30 09:27:52', '2015-12-30 09:27:52', 'A.P.Padana ssd', 405);


-- Processing:...'CANTÙ NUOTO E SALVAMENTO':

-- Processing:...'Como Nuoto':
-- aliased with: 'COMO N' (ID:349)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (508, '2015-12-30 09:27:53', '2015-12-30 09:27:53', 'Como Nuoto', 349);


-- Processing:...'Libertas SNEF - Erba':
-- aliased with: 'LIBERTAS SNEF' (ID:354)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (509, '2015-12-30 09:27:53', '2015-12-30 09:27:53', 'Libertas SNEF - Erba', 354);


-- Processing:...'Natatio Master Team asd':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ANFOSSI IOLANDA MARIA' (1984, gender: 2)

-- Processing:...'BERNARDIELLO RAFFAELE' (1965, gender: 1)

-- Processing:...'KARL MATTHEWS' (1966, gender: 1)
-- aliased with: 'MATTHEWS KARL' (ID:7575)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (286, '2015-12-30 09:30:20', '2015-12-30 09:30:20', 'KARL MATTHEWS', 7575);


-- Processing:...'ZAVATTARO GIOVANNI' (1986, gender: 1)

COMMIT;
