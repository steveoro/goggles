--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Agepi Sport 97 ssd':
-- aliased with: 'A.GE.P.I. A.S. DIL.' (ID:612)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (175, '2015-02-25 16:21:06', '2015-02-25 16:21:06', 'Agepi Sport 97 ssd', 612);


-- Processing:...'Aquarea Water Proje':

-- Processing:...'Circolo Ambranuoto':

-- Processing:...'Circolo Canottieri Aniene':
-- aliased with: 'C.C. ANIENE ASD' (ID:89)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (176, '2015-02-25 16:21:06', '2015-02-25 16:21:06', 'Circolo Canottieri Aniene', 89);


-- Processing:...'Coser Nuoto asd':
-- aliased with: 'COSERNUOTO ASD' (ID:431)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (177, '2015-02-25 16:21:06', '2015-02-25 16:21:06', 'Coser Nuoto asd', 431);


-- Processing:...'CSI Roma Est ssd':

-- Processing:...'Green Hill asd':

-- Processing:...'Juventus Nuoto - Ro':

-- Processing:...'Marina Militare  -':

-- Processing:...'Olimpia Fitness ssd':

-- Processing:...'Pol N.Salvetti - Ro':

-- Processing:...'Poseidon ssd':

-- Processing:...'Sport 2000 ssd - Ro':

-- Processing:...'Sport Shuttle ssd':
-- aliased with: 'SPORT SHUTTLE - SEL' (ID:621)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (178, '2015-02-25 16:21:09', '2015-02-25 16:21:09', 'Sport Shuttle ssd', 621);


-- Processing:...'Sport Team 2000 Col':

-- Processing:...'Stelle Marine ssd':

-- Processing:...'Tyrsenia Sporting C':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BRANDI FRANCESCA' (1989, gender: 2)

-- Processing:...'CHIUSOLO FABRIZIO' (1973, gender: 1)

-- Processing:...'D'ABBENIGNO ALESSIO' (1983, gender: 1)
-- aliased with: 'D`ABBENIGNO ALESSIO' (ID:8136)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (98, '2015-02-25 16:23:23', '2015-02-25 16:23:23', 'D\'ABBENIGNO ALESSIO', 8136);


-- Processing:...'D'ALBENZO RICCARDO' (1978, gender: 1)
-- aliased with: 'D`ALBENZO RICCARDO' (ID:13377)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (99, '2015-02-25 16:23:23', '2015-02-25 16:23:23', 'D\'ALBENZO RICCARDO', 13377);


-- Processing:...'D'ALESSANDRO MARCO' (1969, gender: 1)
-- aliased with: 'D`ALESSANDRO MARCO' (ID:13529)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (100, '2015-02-25 16:23:23', '2015-02-25 16:23:23', 'D\'ALESSANDRO MARCO', 13529);


-- Processing:...'D'AMICO IVAN WALTER' (1971, gender: 1)
-- aliased with: 'D`AMICO IVAN WALTER' (ID:13378)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (101, '2015-02-25 16:23:23', '2015-02-25 16:23:23', 'D\'AMICO IVAN WALTER', 13378);


-- Processing:...'D'AMICO MICHELA' (1972, gender: 2)
-- aliased with: 'D`AMICO MICHELA' (ID:6882)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (102, '2015-02-25 16:23:23', '2015-02-25 16:23:23', 'D\'AMICO MICHELA', 6882);


-- Processing:...'D'ANGELO ROBERTA' (1985, gender: 2)

-- Processing:...'D'ETTORRE ANDREA' (1972, gender: 1)
-- aliased with: 'D`ETTORRE ANDREA' (ID:13084)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (103, '2015-02-25 16:23:23', '2015-02-25 16:23:23', 'D\'ETTORRE ANDREA', 13084);


-- Processing:...'D'OPPIDO ANTONIO' (1944, gender: 1)
-- aliased with: 'D`OPPIDO ANTONIO' (ID:13379)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (104, '2015-02-25 16:23:23', '2015-02-25 16:23:23', 'D\'OPPIDO ANTONIO', 13379);


-- Processing:...'D'OPPIDO MANUELE' (1979, gender: 1)
-- aliased with: 'D`OPPIDO MANUELE' (ID:8143)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (105, '2015-02-25 16:23:23', '2015-02-25 16:23:23', 'D\'OPPIDO MANUELE', 8143);


-- Processing:...'DE VITA MARCO' (1972, gender: 1)

-- Processing:...'DELL'OTTI MICHELA' (1964, gender: 2)
-- aliased with: 'DELL`OTTI MICHELA' (ID:13368)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (106, '2015-02-25 16:23:23', '2015-02-25 16:23:23', 'DELL\'OTTI MICHELA', 13368);


-- Processing:...'FARAONE MARCO' (1969, gender: 1)

-- Processing:...'FIORAVANTI ELEONORA' (1988, gender: 2)

-- Processing:...'GAROFALO RAFFAELLA' (1961, gender: 2)
-- aliased with: 'GAROFALO FAFFAELLA' (ID:13401)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (107, '2015-02-25 16:23:23', '2015-02-25 16:23:23', 'GAROFALO RAFFAELLA', 13401);


-- Processing:...'MACRI' LUCA' (1968, gender: 1)
-- aliased with: 'MACRI` LUCA' (ID:8215)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (108, '2015-02-25 16:23:23', '2015-02-25 16:23:23', 'MACRI\' LUCA', 8215);


-- Processing:...'MANDOLESI FABRIZIO' (1979, gender: 1)

-- Processing:...'PERSIA ALESSANDRO' (1977, gender: 1)

-- Processing:...'SANTINI GIULIO' (1982, gender: 1)

-- Processing:...'SERAFINI BERARDO WALTER' (1965, gender: 1)

COMMIT;
