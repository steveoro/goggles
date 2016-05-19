--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Mille Sport San Sal':
-- aliased with: 'M.SPORT SAN SALVO S' (ID:370)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (750, '2016-05-19 06:34:12', '2016-05-19 06:34:12', 'Mille Sport San Sal', 370);


-- Processing:...'N Mediterraneo - Te':
-- aliased with: 'NUOTO MEDITERRANEO' (ID:704)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (751, '2016-05-19 06:34:12', '2016-05-19 06:34:12', 'N Mediterraneo - Te', 704);


COMMIT;
