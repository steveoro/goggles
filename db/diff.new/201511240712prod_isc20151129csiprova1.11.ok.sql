--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Acc. Militare Modena':
-- aliased with: 'GS ACCADEMIA MILITARE MO' (ID:21)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (420, '2015-11-24 07:17:33', '2015-11-24 07:17:33', 'Acc. Militare Modena', 21);


-- Processing:...'Calypso Team Nuoto':
-- aliased with: 'CALYPSO' (ID:32)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (421, '2015-11-24 07:17:33', '2015-11-24 07:17:33', 'Calypso Team Nuoto', 32);


-- Processing:...'CSInuoto OberFerrari':
-- aliased with: 'CSI NUOTO OBER FERRARI ASD' (ID:1)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (422, '2015-11-24 07:17:33', '2015-11-24 07:17:33', 'CSInuoto OberFerrari', 1);


-- Processing:...'Eden Sport':

-- Processing:...'Imolanuoto Asd':
-- aliased with: 'IMOLANUOTO' (ID:17)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (423, '2015-11-24 07:17:33', '2015-11-24 07:17:33', 'Imolanuoto Asd', 17);


-- Processing:...'NAL Asd':

-- Processing:...'Podium Nuoto':
-- aliased with: 'PODIUM PARMA' (ID:18)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (424, '2015-11-24 07:17:34', '2015-11-24 07:17:34', 'Podium Nuoto', 18);


-- Processing:...'ScuolaNuoto CsiCarpi':
-- aliased with: 'SCUOLA NUOTO CARPI' (ID:5)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (425, '2015-11-24 07:17:34', '2015-11-24 07:17:34', 'ScuolaNuoto CsiCarpi', 5);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'DEGLIESPOSTI ALESSIO' (1978, gender: 1)
-- aliased with: 'DEGLI ESPOSTI ALESSIO' (ID:95)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (272, '2015-11-24 07:20:31', '2015-11-24 07:20:31', 'DEGLIESPOSTI ALESSIO', 95);


-- Processing:...'FAVERO ILARIA VITTORIA' (1989, gender: 2)
-- aliased with: 'FAVERO ILARIA' (ID:1135)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (273, '2015-11-24 07:20:31', '2015-11-24 07:20:31', 'FAVERO ILARIA VITTORIA', 1135);


-- Processing:...'FERRI FRANCESCA' (1966, gender: 2)

-- Processing:...'SODANO SILVIO ANTONIO' (1982, gender: 1)
-- aliased with: 'SODANO SILVIO' (ID:1686)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (274, '2015-11-24 07:20:31', '2015-11-24 07:20:31', 'SODANO SILVIO ANTONIO', 1686);


COMMIT;
