--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ACQUAVILLAGE SSD':
-- aliased with: 'ACQUA1VILLAGE ASD' (ID:265)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (368, '2015-09-13 10:21:08', '2015-09-13 10:21:08', 'ACQUAVILLAGE SSD', 265);


-- Processing:...'ATHLON SSD - ROMA':

-- Processing:...'ATLANTIDE SC  SSD':
-- aliased with: 'Atlantide ssd - Cia' (ID:520)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (369, '2015-09-13 10:21:08', '2015-09-13 10:21:08', 'ATLANTIDE SC  SSD', 520);


-- Processing:...'LUMANUOTO SSD':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'GRECI SARA' (1994, gender: 2)

-- Processing:...'LOMBARDI DARIO' (1983, gender: 1)

-- Processing:...'MATANO FRANCESCA' (1989, gender: 2)

-- Processing:...'PUZZUOLI MARCO' (1962, gender: 1)

-- Processing:...'STRATI PAOLO' (1988, gender: 1)

COMMIT;
