--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BUONCONSIGLIO N.':
-- aliased with: 'SS BUONCONSIGLIO N' (ID:466)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (249, '2015-02-28 23:58:53', '2015-02-28 23:58:53', 'BUONCONSIGLIO N.', 466);


-- Processing:...'IDEA SPORT':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CARTASEGNA FABIO' (1974, gender: 1)

-- Processing:...'GUAGLIARDO MARCO' (1986, gender: 1)

-- Processing:...'SALVATORE ANTONIO RAFFAELE' (1972, gender: 1)
-- aliased with: 'RAFFAELE SALVATORE ANTONIO' (ID:7622)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (180, '2015-03-01 00:01:12', '2015-03-01 00:01:12', 'SALVATORE ANTONIO RAFFAELE', 7622);


COMMIT;
