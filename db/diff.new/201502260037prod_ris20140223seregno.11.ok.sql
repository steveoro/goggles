--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'AICS PAVIA NUOTO':
-- aliased with: 'AICS PAVIA N' (ID:227)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (203, '2015-02-26 00:40:22', '2015-02-26 00:40:22', 'AICS PAVIA NUOTO', 227);


-- Processing:...'CARONNO PERTUSELLA NUOTO':
-- aliased with: 'CARONNO P N' (ID:230)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (204, '2015-02-26 00:40:22', '2015-02-26 00:40:22', 'CARONNO PERTUSELLA NUOTO', 230);


-- Processing:...'WOLF`S SWIMMER ASD':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'COCOLO ALESSANDRO' (1983, gender: 1)

-- Processing:...'POLASTRI FRANCESCO' (1973, gender: 1)

COMMIT;
