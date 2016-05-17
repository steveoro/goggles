--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ACQUAMANIA':
-- aliased with: 'ACQUAMANIA ASD - CA' (ID:538)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (716, '2016-05-16 08:24:17', '2016-05-16 08:24:17', 'ACQUAMANIA', 538);


-- Processing:...'ALL TOGETHER':
-- aliased with: 'ALL TOGETHER COOP.S' (ID:540)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (717, '2016-05-16 08:24:17', '2016-05-16 08:24:17', 'ALL TOGETHER', 540);


-- Processing:...'ASD FROG SWIMMING':
-- aliased with: 'FROG SWIMMING LIB.C' (ID:544)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (718, '2016-05-16 08:24:17', '2016-05-16 08:24:17', 'ASD FROG SWIMMING', 544);


-- Processing:...'ASD OLBIA NUOTO':
-- aliased with: 'OLBIA NUOTO ASD' (ID:546)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (719, '2016-05-16 08:24:17', '2016-05-16 08:24:17', 'ASD OLBIA NUOTO', 546);


-- Processing:...'ASD SPORTING SAN GAVINO':

-- Processing:...'ASD ULIVI E PALME':
-- aliased with: 'ULIVI E PALME' (ID:554)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (720, '2016-05-16 08:24:17', '2016-05-16 08:24:17', 'ASD ULIVI E PALME', 554);


-- Processing:...'ASDSPORT FULL TIMESS':
-- aliased with: 'SPORT FULL TIME' (ID:402)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (721, '2016-05-16 08:24:17', '2016-05-16 08:24:17', 'ASDSPORT FULL TIMESS', 402);


-- Processing:...'LUNA ASD':
-- aliased with: 'Luna Socio Culturale Asd' (ID:909)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (722, '2016-05-16 08:24:17', '2016-05-16 08:24:17', 'LUNA ASD', 909);


-- Processing:...'PROMOGEST':
-- aliased with: 'PROMOGEST S.C. A R.' (ID:549)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (723, '2016-05-16 08:24:17', '2016-05-16 08:24:17', 'PROMOGEST', 549);


-- Processing:...'RN ACQUATICA NU - A':
-- aliased with: 'RN ACQUATICA NUORO' (ID:551)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (724, '2016-05-16 08:24:17', '2016-05-16 08:24:17', 'RN ACQUATICA NU - A', 551);


-- Processing:...'RN ACQUATICA NU - B':
-- aliased with: 'RN ACQUATICA NUORO' (ID:551)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (725, '2016-05-16 08:24:17', '2016-05-16 08:24:17', 'RN ACQUATICA NU - B', 551);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BERLUCCHI RICCARDO' (1973, gender: 1)
-- aliased with: 'BARLUCCHI RICCARDO' (ID:11000)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (418, '2016-05-16 08:27:45', '2016-05-16 08:27:45', 'BERLUCCHI RICCARDO', 11000);


-- Processing:...'DESSI SILVIA GIOVANNA' (1982, gender: 2)
-- aliased with: 'DESSI` SILVIA GIOVANNA' (ID:17273)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (419, '2016-05-16 08:27:45', '2016-05-16 08:27:45', 'DESSI SILVIA GIOVANNA', 17273);


-- Processing:...'MELIS SERGIO GIOVANNI RAFFAEL' (1952, gender: 1)
-- aliased with: 'MELIS SERGIO GIOVANNI RAFFAE' (ID:17319)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (420, '2016-05-16 08:27:45', '2016-05-16 08:27:45', 'MELIS SERGIO GIOVANNI RAFFAEL', 17319);


-- Processing:...'PERRA PIERO' (1967, gender: 1)
-- aliased with: 'PERRA PIERPAOLO' (ID:17338)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (421, '2016-05-16 08:27:45', '2016-05-16 08:27:45', 'PERRA PIERO', 17338);


-- Processing:...'SOLLA DANIELE' (1991, gender: 1)

-- Processing:...'USAI GIOVANNI ANDREA' (1991, gender: 1)
-- aliased with: 'USAI GIOVANNI' (ID:11285)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (422, '2016-05-16 08:27:45', '2016-05-16 08:27:45', 'USAI GIOVANNI ANDREA', 11285);


COMMIT;
