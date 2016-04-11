--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Area Nuoto Asd':

-- Processing:...'Asd Club L'Aquila Nu':
-- aliased with: 'ASD CLUB L`AQUILA N' (ID:119)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (633, '2016-04-06 07:12:04', '2016-04-06 07:12:04', 'Asd Club L\'Aquila Nu', 119);


-- Processing:...'Blu&green Sporting Club S':

-- Processing:...'Lumanuoto Ssd - Roma':
-- aliased with: 'LUMANUOTO SSD' (ID:797)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (634, '2016-04-06 07:12:04', '2016-04-06 07:12:04', 'Lumanuoto Ssd - Roma', 797);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ARIGONI SIMONE' (1993, gender: 1)

-- Processing:...'CALO` ALESSANDRO' (1981, gender: 1)
-- aliased with: 'CALO' ALESSANDRO' (ID:22569)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (342, '2016-04-06 07:14:15', '2016-04-06 07:14:15', 'CALO` ALESSANDRO', 22569);


-- Processing:...'DELLA TORRE ENRICO MASSIMO' (1955, gender: 1)
-- aliased with: 'DELLA TORRE ENRICO MASSIM' (ID:22632)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (343, '2016-04-06 07:14:15', '2016-04-06 07:14:15', 'DELLA TORRE ENRICO MASSIMO', 22632);


-- Processing:...'D`ALESSANDRO MARCO MARIA' (1969, gender: 1)
-- aliased with: 'D`ALESSANDRO MARCO' (ID:13529)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (344, '2016-04-06 07:14:15', '2016-04-06 07:14:15', 'D`ALESSANDRO MARCO MARIA', 13529);


-- Processing:...'D`AMBROSIO ALESSIO' (1989, gender: 1)
-- aliased with: 'D'AMBROSIO ALESSIO' (ID:10703)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (345, '2016-04-06 07:14:15', '2016-04-06 07:14:15', 'D`AMBROSIO ALESSIO', 10703);


-- Processing:...'D`AMBROSIO BRUNA' (1944, gender: 2)
-- aliased with: 'D'AMBROSIO BRUNA' (ID:22612)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (346, '2016-04-06 07:14:15', '2016-04-06 07:14:15', 'D`AMBROSIO BRUNA', 22612);


-- Processing:...'D`ARCADIA FRANCO' (1962, gender: 1)
-- aliased with: 'D'ARCADIA FRANCO' (ID:22844)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (347, '2016-04-06 07:14:15', '2016-04-06 07:14:15', 'D`ARCADIA FRANCO', 22844);


-- Processing:...'D`ERAMO SANDRO' (1962, gender: 1)
-- aliased with: 'D'ERAMO SANDRO' (ID:22615)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (348, '2016-04-06 07:14:15', '2016-04-06 07:14:15', 'D`ERAMO SANDRO', 22615);


-- Processing:...'FORTUNA ELSA JOELLE ELVIRE' (1974, gender: 2)
-- aliased with: 'FORTUNA ELSA JOELLE ELVIR' (ID:14469)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (349, '2016-04-06 07:14:15', '2016-04-06 07:14:15', 'FORTUNA ELSA JOELLE ELVIRE', 14469);


-- Processing:...'MANCINO GIULIA' (1994, gender: 2)

-- Processing:...'MARCONI ARIANNA' (1995, gender: 2)

-- Processing:...'MICELI MONICA' (1965, gender: 2)

-- Processing:...'PICCI MARTA' (1992, gender: 2)

-- Processing:...'SPANO` AMEDEO' (1955, gender: 1)
-- aliased with: 'SPANO' AMEDEO' (ID:24169)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (350, '2016-04-06 07:14:15', '2016-04-06 07:14:15', 'SPANO` AMEDEO', 24169);


-- Processing:...'VAN DIJK PETRONELLA PAULINA' (1970, gender: 2)
-- aliased with: 'VAN DIJK PETRONELLA PAULI' (ID:24170)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (351, '2016-04-06 07:14:15', '2016-04-06 07:14:15', 'VAN DIJK PETRONELLA PAULINA', 24170);


COMMIT;
