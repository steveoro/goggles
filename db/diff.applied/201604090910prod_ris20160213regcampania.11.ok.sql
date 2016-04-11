--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Aquila Nuoto Napoli':
-- aliased with: 'ASD CLUB L`AQUILA N' (ID:119)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (642, '2016-04-09 09:13:17', '2016-04-09 09:13:17', 'Aquila Nuoto Napoli', 119);


-- Processing:...'Circ.Villani Ssd Arl':

-- Processing:...'Dream Team Salerno':

-- Processing:...'Nantes Club Masters - Na':
-- aliased with: 'NANTES CLUB MASTER' (ID:82)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (643, '2016-04-09 09:13:18', '2016-04-09 09:13:18', 'Nantes Club Masters - Na', 82);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BORRELLI MARA' (1993, gender: 2)
-- aliased with: 'BORRELLI MARIA' (ID:16942)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (363, '2016-04-09 09:15:25', '2016-04-09 09:15:25', 'BORRELLI MARA', 16942);


-- Processing:...'CORLIANO` DONATO' (1960, gender: 1)
-- aliased with: 'CORLIANO DONATO' (ID:23721)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (364, '2016-04-09 09:15:25', '2016-04-09 09:15:25', 'CORLIANO` DONATO', 23721);


-- Processing:...'D'AMBROSIO ANTONIO' (1967, gender: 1)
-- aliased with: 'D`AMBROSIO ANTONIO' (ID:11572)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (365, '2016-04-09 09:15:25', '2016-04-09 09:15:25', 'D\'AMBROSIO ANTONIO', 11572);


-- Processing:...'DANIELA ROSA' (1982, gender: 2)
-- aliased with: 'DANIELE ROSA' (ID:20752)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (366, '2016-04-09 09:15:25', '2016-04-09 09:15:25', 'DANIELA ROSA', 20752);


-- Processing:...'DE LUCA GIOCONDA' (1972, gender: 2)
-- aliased with: 'DI LUCA GIOCONDA' (ID:18327)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (367, '2016-04-09 09:15:25', '2016-04-09 09:15:25', 'DE LUCA GIOCONDA', 18327);


-- Processing:...'IORIO SALVATORE' (1964, gender: 1)

-- Processing:...'PARENTE MARIA' (1996, gender: 2)

-- Processing:...'TROPEA ILARIA' (1985, gender: 2)

COMMIT;
