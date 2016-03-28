--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'As.Dil. C.N. Savigi':

-- Processing:...'Asd Ariete - Napoli':
-- aliased with: 'A.S.DILETT. ARIETE' (ID:622)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (601, '2016-03-27 10:00:53', '2016-03-27 10:00:53', 'Asd Ariete - Napoli', 622);


-- Processing:...'Asd Cavasports':
-- aliased with: 'CAVASPORTS ASD' (ID:485)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (602, '2016-03-27 10:00:53', '2016-03-27 10:00:53', 'Asd Cavasports', 485);


-- Processing:...'Calabria Swim Race Asd':

-- Processing:...'Campolongo Hospital Rn Sa':

-- Processing:...'Centro Sportivo Play Off':

-- Processing:...'Cosenza Nuoto Asd':
-- aliased with: 'AS COSENZA NUOTO' (ID:675)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (603, '2016-03-27 10:00:59', '2016-03-27 10:00:59', 'Cosenza Nuoto Asd', 675);


-- Processing:...'Gym Sport Mania Ssd':

-- Processing:...'Pallanuoto Salerno':
-- aliased with: 'ASD PN SALERNO' (ID:859)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (604, '2016-03-27 10:01:01', '2016-03-27 10:01:01', 'Pallanuoto Salerno', 859);


-- Processing:...'Scorpion Nuoto Asd':

-- Processing:...'Villa Delle Giade Ssd':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'COZZOLINO PAOLO' (1984, gender: 1)

-- Processing:...'ESPOSITO ROSA' (1983, gender: 2)

-- Processing:...'FERRO DESIREE' (1987, gender: 2)

-- Processing:...'MIRANTE SERGIO' (1989, gender: 1)

-- Processing:...'OLIVA CLAUDIO' (1986, gender: 1)

-- Processing:...'PAPPALARDO ANTONIO' (1969, gender: 1)

-- Processing:...'PASTORE ALESSANDRO' (1966, gender: 1)

-- Processing:...'SOMMA MARCO' (1970, gender: 1)

-- Processing:...'TORTORA FRANCESCA' (1991, gender: 2)

COMMIT;
