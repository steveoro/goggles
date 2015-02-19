--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ASD SAN GIUSEPPE':
-- aliased with: 'SAN GIUSEPPE SSD -' (ID:275)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (113, '2015-02-18 14:31:28', '2015-02-18 14:31:28', 'ASD SAN GIUSEPPE', 275);


-- Processing:...'CASALE NUOTO MASTER':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BOTTINI ANDREA' (1983, gender: 1)

-- Processing:...'MOLASCHI ANNA' (1973, gender: 2)
-- aliased with: 'MOLASCHI MARIA ANNA' (ID:4275)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (40, '2015-02-18 14:33:23', '2015-02-18 14:33:23', 'MOLASCHI ANNA', 4275);


-- Processing:...'SOLARE GIAN LUCA' (1989, gender: 1)
-- aliased with: 'SOLARE GIANLUCA' (ID:7664)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (41, '2015-02-18 14:33:23', '2015-02-18 14:33:23', 'SOLARE GIAN LUCA', 7664);


COMMIT;
