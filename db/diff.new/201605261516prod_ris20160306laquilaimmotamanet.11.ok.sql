--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Ssd Pinguino Nuoto':
-- aliased with: 'PINGUINO NUOTO - AV' (ID:192)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (826, '2016-05-26 15:17:48', '2016-05-26 15:17:48', 'Ssd Pinguino Nuoto', 192);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'GUIDUCCI GIULIA' (1992, gender: 2)

-- Processing:...'LUPACCHINI GIANLUCA' (1970, gender: 1)

-- Processing:...'RAPISARDA RECINE MATEO FRANC' (1986, gender: 1)
-- aliased with: 'RAPISARDA RECINE MATEO FR' (ID:22769)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (528, '2016-05-26 15:20:03', '2016-05-26 15:20:03', 'RAPISARDA RECINE MATEO FRANC', 22769);


-- Processing:...'STEFANINI ANNA ANTONIA' (1941, gender: 2)
-- aliased with: 'STEFANINI ANNA' (ID:15685)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (529, '2016-05-26 15:20:03', '2016-05-26 15:20:03', 'STEFANINI ANNA ANTONIA', 15685);


COMMIT;
