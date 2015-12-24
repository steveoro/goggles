--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Amici Nuoto VVFF Modena':
-- aliased with: 'ASS.NE AMICI DEL NU' (ID:66)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (477, '2015-12-24 11:14:48', '2015-12-24 11:14:48', 'Amici Nuoto VVFF Modena', 66);


-- Processing:...'Rinascita Team Romagna - A':
-- aliased with: 'RINASCITA TEAM ROMA' (ID:260)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (478, '2015-12-24 11:14:48', '2015-12-24 11:14:48', 'Rinascita Team Romagna - A', 260);


-- Processing:...'Rinascita Team Romagna - B':
-- aliased with: 'RINASCITA TEAM ROMA' (ID:260)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (479, '2015-12-24 11:14:48', '2015-12-24 11:14:48', 'Rinascita Team Romagna - B', 260);


-- Processing:...'Zero9 ssd arl':
-- aliased with: 'ZERO9 SSD' (ID:213)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (480, '2015-12-24 11:14:48', '2015-12-24 11:14:48', 'Zero9 ssd arl', 213);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BAVIERI GIULIA' (1991, gender: 2)

COMMIT;
