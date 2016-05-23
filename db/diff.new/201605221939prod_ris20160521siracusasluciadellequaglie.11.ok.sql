--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Circolo Canottieri 7 Scogli':
-- aliased with: 'Circ.Canottieri 7 Scogli' (ID:904)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (788, '2016-05-22 19:43:48', '2016-05-22 19:43:48', 'Circolo Canottieri 7 Scogli', 904);


-- Processing:...'Circolo Canottieri Lauria':
-- aliased with: 'Circ.Canott. R.Di Lauria' (ID:823)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (789, '2016-05-22 19:43:48', '2016-05-22 19:43:48', 'Circolo Canottieri Lauria', 823);


-- Processing:...'Ondablu Ragusa':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'MAGNANO MARCO' (1995, gender: 1)

-- Processing:...'PATANE' MARIA' (1976, gender: 2)
-- aliased with: 'PATANE` MARIA' (ID:23520)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (497, '2016-05-22 19:45:55', '2016-05-22 19:45:55', 'PATANE\' MARIA', 23520);


-- Processing:...'VIRZI' DAMIANO' (1994, gender: 1)
-- aliased with: 'VIRZI` DAMIANO' (ID:20832)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (498, '2016-05-22 19:45:55', '2016-05-22 19:45:55', 'VIRZI\' DAMIANO', 20832);


COMMIT;
