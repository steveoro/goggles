--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'FANFULLA N PN':

-- Processing:...'L`ACQUA DI PIANETA SPORT':
-- aliased with: 'L`ACQUA DI PIANETA' (ID:411)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (350, '2015-06-03 15:55:08', '2015-06-03 15:55:08', 'L`ACQUA DI PIANETA SPORT', 411);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ARRIGHI PAOLO GIOVANNI' (1969, gender: 1)

-- Processing:...'COSCIA CHRISTIAN' (1976, gender: 1)
-- aliased with: 'COSCIA CRISTIAN' (ID:2189)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (240, '2015-06-03 15:55:33', '2015-06-03 15:55:33', 'COSCIA CHRISTIAN', 2189);


COMMIT;
