--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Asd Vanessa Nuoto Smile':
-- aliased with: 'VANESSA NUOTO SMILE' (ID:795)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (496, '2015-12-29 10:27:41', '2015-12-29 10:27:41', 'Asd Vanessa Nuoto Smile', 795);


-- Processing:...'Centro Nuoto Sulmona':

-- Processing:...'CS SANTA LUCIA FILIPPINI S.S.':
-- aliased with: 'C. S. SANTA LUCIA FILIPPINI' (ID:615)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (497, '2015-12-29 10:27:42', '2015-12-29 10:27:42', 'CS SANTA LUCIA FILIPPINI S.S.', 615);


-- Processing:...'PISCINE STADIO FITNESS SS':

-- Processing:...'Pol Time Out - Formello - C':
-- aliased with: 'POL. TIME OUT SSD' (ID:442)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (498, '2015-12-29 10:27:44', '2015-12-29 10:27:44', 'Pol Time Out - Formello - C', 442);


-- Processing:...'Roman Sport City ssd':

-- Processing:...'SIS - Roma':

-- Processing:...'Swamp Swimming asd':

-- Processing:...'Umbria Nuoto':
-- aliased with: 'UMBRIA NUOTO ASD' (ID:685)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (499, '2015-12-29 10:27:48', '2015-12-29 10:27:48', 'Umbria Nuoto', 685);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ANGELO MARCO' (1983, gender: 1)

-- Processing:...'D'AURIZIO CLAUDIA' (1972, gender: 2)
-- aliased with: 'D`AURIZIO CLAUDIA' (ID:2578)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (284, '2015-12-29 10:29:35', '2015-12-29 10:29:35', 'D\'AURIZIO CLAUDIA', 2578);


-- Processing:...'GALLERANO PAOLA' (1974, gender: 2)

-- Processing:...'SCIULLO GIULIA' (1991, gender: 2)

COMMIT;
