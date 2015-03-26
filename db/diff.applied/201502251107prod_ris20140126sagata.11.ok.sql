--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ASD ONDA AZZURRA':
-- aliased with: 'A.S.D. ONDA AZZURRA' (ID:599)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (164, '2015-02-25 11:10:08', '2015-02-25 11:10:08', 'ASD ONDA AZZURRA', 599);


-- Processing:...'ASD SYNTHESIS NUOTO':
-- aliased with: 'A.S.D. SYNTHESIS NUOTO' (ID:600)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (165, '2015-02-25 11:10:08', '2015-02-25 11:10:08', 'ASD SYNTHESIS NUOTO', 600);


-- Processing:...'CENTRO FIN MELILLI':

-- Processing:...'CLUBUL SPORTIV DE INOT RESITA':

-- Processing:...'GRUPPO ATLETICO SPO':

-- Processing:...'POL. DIL. MURI ANTICHI':

-- Processing:...'POL. MIMMO FERRITO PALERMO':
-- aliased with: 'POL.MIMMO FERRITO S' (ID:330)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (166, '2015-02-25 11:10:09', '2015-02-25 11:10:09', 'POL. MIMMO FERRITO PALERMO', 330);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'D'AGOSTA ALESSANDRA' (1989, gender: 2)
-- aliased with: 'D'AGOSTA ALSSANDRA' (ID:12835)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (90, '2015-02-25 11:13:35', '2015-02-25 11:13:35', 'D\'AGOSTA ALESSANDRA', 12835);


-- Processing:...'MARINO GIOVANNA' (1979, gender: 2)
-- aliased with: 'MARINO GOVANNA' (ID:12924)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (91, '2015-02-25 11:13:35', '2015-02-25 11:13:35', 'MARINO GIOVANNA', 12924);


-- Processing:...'MARLETTA ELEONORA ENZA' (1988, gender: 2)
-- aliased with: 'MARLETTA ELEONORA' (ID:12925)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (92, '2015-02-25 11:13:35', '2015-02-25 11:13:35', 'MARLETTA ELEONORA ENZA', 12925);


-- Processing:...'MARTINI MARCO' (1969, gender: 1)

-- Processing:...'MORELLI ANDREA' (1979, gender: 1)

-- Processing:...'MUSARRA FEDERICO' (1977, gender: 1)

-- Processing:...'PISTONE FAUSTO FRANCESCO' (1985, gender: 1)
-- aliased with: 'PISTONE FAUSTO' (ID:12956)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (93, '2015-02-25 11:13:35', '2015-02-25 11:13:35', 'PISTONE FAUSTO FRANCESCO', 12956);


-- Processing:...'SARCIA' CARMELO' (1980, gender: 1)
-- aliased with: 'SARCIA` CARMELO' (ID:12981)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (94, '2015-02-25 11:13:35', '2015-02-25 11:13:35', 'SARCIA\' CARMELO', 12981);


-- Processing:...'ZAPPALA` ALFIO' (1992, gender: 1)
-- aliased with: 'ZAPPALA' ALFIO' (ID:13021)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (95, '2015-02-25 11:13:35', '2015-02-25 11:13:35', 'ZAPPALA` ALFIO', 13021);


COMMIT;
