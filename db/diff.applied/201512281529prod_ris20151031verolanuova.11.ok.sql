--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'C.C. LAURIA PALERMO':
-- aliased with: 'Circ.Canott. R.Di Lauria' (ID:823)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (485, '2015-12-28 15:37:01', '2015-12-28 15:37:01', 'C.C. LAURIA PALERMO', 823);


-- Processing:...'Carisa Rari Nantes Savona':
-- aliased with: 'Carisa Rari Nantes' (ID:653)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (486, '2015-12-28 15:37:01', '2015-12-28 15:37:01', 'Carisa Rari Nantes Savona', 653);


-- Processing:...'G.A.M. Team ssd - Brescia':
-- aliased with: 'G.A.M. TEAM' (ID:49)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (487, '2015-12-28 15:37:01', '2015-12-28 15:37:01', 'G.A.M. Team ssd - Brescia', 49);


-- Processing:...'NC Castiglione delle Stiv':

-- Processing:...'Rezzato N - ssd arl':
-- aliased with: 'REZZATO N' (ID:60)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (488, '2015-12-28 15:37:03', '2015-12-28 15:37:03', 'Rezzato N - ssd arl', 60);


-- Processing:...'Soncino Sporting Club':
-- aliased with: 'SONCINO SC SRL' (ID:73)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (489, '2015-12-28 15:37:03', '2015-12-28 15:37:03', 'Soncino Sporting Club', 73);


-- Processing:...'SSD TEAM EUGANEO ARL':
-- aliased with: 'S.S.D. TEAM EUGANEO RL' (ID:176)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (490, '2015-12-28 15:37:03', '2015-12-28 15:37:03', 'SSD TEAM EUGANEO ARL', 176);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'COSTA ALBERTO' (1966, gender: 1)

-- Processing:...'LASAGNA CRISTIAN' (1973, gender: 1)
-- aliased with: 'LASAGNA CHRISTIAN' (ID:5731)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (281, '2015-12-28 15:39:58', '2015-12-28 15:39:58', 'LASAGNA CRISTIAN', 5731);


-- Processing:...'PALVARINI ANDREA ERMES' (1972, gender: 1)
-- aliased with: 'PALVARINI ANDREA' (ID:6389)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (282, '2015-12-28 15:39:58', '2015-12-28 15:39:58', 'PALVARINI ANDREA ERMES', 6389);


-- Processing:...'PARACCHINI ANDREA' (1979, gender: 1)

-- Processing:...'SANDRI MASSIMO' (1970, gender: 1)

COMMIT;
