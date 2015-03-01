--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ASD ONDA NUOTO':
-- aliased with: 'ONDA NUOTO' (ID:714)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (302, '2015-03-01 19:02:58', '2015-03-01 19:02:58', 'ASD ONDA NUOTO', 714);


-- Processing:...'GABBIANO NAPOLI':
-- aliased with: 'IL GABBIANO NAPOLI' (ID:188)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (303, '2015-03-01 19:02:58', '2015-03-01 19:02:58', 'GABBIANO NAPOLI', 188);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'AUTULY VALÏ¿½RIE' (1962, gender: 2)
-- aliased with: 'AUTULY VALÉRIE' (ID:2474)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (213, '2015-03-01 19:03:28', '2015-03-01 19:03:28', 'AUTULY VALÏ¿½RIE', 2474);


-- Processing:...'ROMANTINI SERENA' (1987, gender: 2)

-- Processing:...'SGRO` MARCO' (1969, gender: 1)

COMMIT;
