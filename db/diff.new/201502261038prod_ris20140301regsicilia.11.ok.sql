--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ASD T.L. PALERMO 90':

-- Processing:...'ATHON ASD - AUGUSTA':
-- aliased with: 'ASD ATHON AUGUSTA' (ID:601)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (214, '2015-02-26 10:44:43', '2015-02-26 10:44:43', 'ATHON ASD - AUGUSTA', 601);


-- Processing:...'KAS NUOTO COMISO':

-- Processing:...'NUOTO MILAZZO ASD':

-- Processing:...'SWIMMING CL SRL S.D.':

-- Processing:...'SYNTHESIS NUOTO ASD':
-- aliased with: 'A.S.D. SYNTHESIS NUOTO' (ID:600)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (215, '2015-02-26 10:44:44', '2015-02-26 10:44:44', 'SYNTHESIS NUOTO ASD', 600);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'AGUGLIA MARCO' (1968, gender: 1)

-- Processing:...'ALBO FRANCESCO' (1972, gender: 1)

-- Processing:...'BADAGLIACCO FRANCESCO' (1972, gender: 1)

-- Processing:...'BALISTRERI MARIANO' (1972, gender: 1)

-- Processing:...'BUONCUORE GIOVANNI ALBERTO' (1970, gender: 1)
-- aliased with: 'BUONOCORE GIOVANNI ALBERTO' (ID:9962)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (131, '2015-02-26 10:52:20', '2015-02-26 10:52:20', 'BUONCUORE GIOVANNI ALBERTO', 9962);


-- Processing:...'CANNAVA` FEDERICO' (1978, gender: 1)
-- aliased with: 'CANNAVA' FEDERICO' (ID:12801)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (132, '2015-02-26 10:52:20', '2015-02-26 10:52:20', 'CANNAVA` FEDERICO', 12801);


-- Processing:...'CARINZIO LUCA' (1979, gender: 1)

-- Processing:...'CASSATA MARIA' (1991, gender: 2)

-- Processing:...'CIMO` GIOVANNA' (1970, gender: 2)
-- aliased with: 'CIMO' GIOVANNA' (ID:12817)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (133, '2015-02-26 10:52:20', '2015-02-26 10:52:20', 'CIMO` GIOVANNA', 12817);


-- Processing:...'DE FELICI FEDERICA' (1988, gender: 2)

-- Processing:...'D`ANGELO GIOACCHINO' (1981, gender: 1)
-- aliased with: 'D'ANGELO GIOACCHINO' (ID:13826)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (134, '2015-02-26 10:52:20', '2015-02-26 10:52:20', 'D`ANGELO GIOACCHINO', 13826);


-- Processing:...'GAGLIANO ANTONIO' (1988, gender: 1)

-- Processing:...'GRIPPALDI ANTONINO' (1968, gender: 1)
-- aliased with: 'GRIPPALDI ANTONIO' (ID:13843)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (135, '2015-02-26 10:52:20', '2015-02-26 10:52:20', 'GRIPPALDI ANTONINO', 13843);


-- Processing:...'LO CURTO MASSIMILIANO' (1967, gender: 1)

-- Processing:...'MARRONE NICOLO`' (1988, gender: 1)
-- aliased with: 'MARRONE NICOLO'' (ID:10176)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (136, '2015-02-26 10:52:20', '2015-02-26 10:52:20', 'MARRONE NICOLO`', 10176);


-- Processing:...'NICOTRA SALVATORE ANTONIO' (1964, gender: 1)
-- aliased with: 'NICOTRA SALVATORE' (ID:13872)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (137, '2015-02-26 10:52:20', '2015-02-26 10:52:20', 'NICOTRA SALVATORE ANTONIO', 13872);


-- Processing:...'PENNISI GOVANNI' (1978, gender: 1)
-- aliased with: 'PENNISI GIOVANNI' (ID:13876)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (138, '2015-02-26 10:52:20', '2015-02-26 10:52:20', 'PENNISI GOVANNI', 13876);


-- Processing:...'PERNA SERGIO' (1961, gender: 1)

-- Processing:...'SCAMMACCA FILIPPO' (1983, gender: 1)

-- Processing:...'TORTORICI ALICE MARIA' (1988, gender: 2)
-- aliased with: 'TORTORICI ALICE' (ID:10337)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (139, '2015-02-26 10:52:20', '2015-02-26 10:52:20', 'TORTORICI ALICE MARIA', 10337);


-- Processing:...'VIRZI` GIULIO' (1982, gender: 1)
-- aliased with: 'VIRZI' GIULIO' (ID:10367)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (140, '2015-02-26 10:52:20', '2015-02-26 10:52:20', 'VIRZI` GIULIO', 10367);


-- Processing:...'ZAVATTERI GABRIELLA' (1963, gender: 2)

COMMIT;
