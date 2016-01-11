--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'C.N. MONTECATINI':

-- Processing:...'Foltzer ssd - Genova':
-- aliased with: 'FOLTZER N.' (ID:326)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (517, '2016-01-07 16:07:07', '2016-01-07 16:07:07', 'Foltzer ssd - Genova', 326);


-- Processing:...'Genova Nuoto - A':
-- aliased with: 'GENOVA NUOTO' (ID:394)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (518, '2016-01-07 16:07:07', '2016-01-07 16:07:07', 'Genova Nuoto - A', 394);


-- Processing:...'Genova Nuoto - B':
-- aliased with: 'GENOVA NUOTO' (ID:394)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (519, '2016-01-07 16:07:07', '2016-01-07 16:07:07', 'Genova Nuoto - B', 394);


-- Processing:...'Marina Militare  - Spezia':
-- aliased with: 'Marina Militare  -' (ID:645)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (520, '2016-01-07 16:07:07', '2016-01-07 16:07:07', 'Marina Militare  - Spezia', 645);


-- Processing:...'Nuoto UISP 2003 - Cascina':
-- aliased with: 'NUOTO UISP 2003' (ID:314)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (521, '2016-01-07 16:07:07', '2016-01-07 16:07:07', 'Nuoto UISP 2003 - Cascina', 314);


-- Processing:...'Rari Nantes Spezia':
-- aliased with: 'R.N.SPEZIA 86' (ID:684)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (522, '2016-01-07 16:07:07', '2016-01-07 16:07:07', 'Rari Nantes Spezia', 684);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BRUNI FRANCESCA' (1987, gender: 2)

-- Processing:...'FABBRI FRANCESCO' (1972, gender: 1)

-- Processing:...'FORINO ALESSANDRO' (1978, gender: 1)

-- Processing:...'MONGIARDINO NICOLETTA' (1965, gender: 2)

-- Processing:...'PASSONI ENRICO' (1978, gender: 1)

-- Processing:...'PESLE GABRIELE' (1972, gender: 1)

COMMIT;
