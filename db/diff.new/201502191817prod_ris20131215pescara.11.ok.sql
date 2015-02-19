--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'DUE PONTI SRL ROMA':
-- aliased with: 'DUE PONTI SRL' (ID:201)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (150, '2015-02-19 18:18:22', '2015-02-19 18:18:22', 'DUE PONTI SRL ROMA', 201);


-- Processing:...'SIMPLY SPORT PESCARA':
-- aliased with: 'SIMPLY SPORT' (ID:319)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (151, '2015-02-19 18:18:22', '2015-02-19 18:18:22', 'SIMPLY SPORT PESCARA', 319);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'GRASSI MAURO' (1963, gender: 1)

-- Processing:...'IANNETTI ANDREA' (1970, gender: 1)

-- Processing:...'IZZI MASSIMILIANO' (1973, gender: 1)

-- Processing:...'SCASTIGLIA MARCO' (1970, gender: 1)

COMMIT;
