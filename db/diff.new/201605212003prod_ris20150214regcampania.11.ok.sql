--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.D. MASSA LUBRENSE NUOTO':
-- aliased with: 'Massa Lubrense Nuoto Asd' (ID:892)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (783, '2016-05-21 20:07:15', '2016-05-21 20:07:15', 'A.S.D. MASSA LUBRENSE NUOTO', 892);


-- Processing:...'ASD S.C.FLEGREO':
-- aliased with: 'SPORTING CLUB FLEGR' (ID:195)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (784, '2016-05-21 20:07:15', '2016-05-21 20:07:15', 'ASD S.C.FLEGREO', 195);


-- Processing:...'CARAVAGGIO SP.VILLAGE':
-- aliased with: 'CARAVAGGIO SPORTING VILLAGE' (ID:731)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (785, '2016-05-21 20:07:15', '2016-05-21 20:07:15', 'CARAVAGGIO SP.VILLAGE', 731);


-- Processing:...'RHYFEL S.S.D.':
-- aliased with: 'RHYFLEL SSD' (ID:816)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (786, '2016-05-21 20:07:15', '2016-05-21 20:07:15', 'RHYFEL S.S.D.', 816);


-- Processing:...'SSD NOFI':
-- aliased with: 'NOFI SSD' (ID:625)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (787, '2016-05-21 20:07:15', '2016-05-21 20:07:15', 'SSD NOFI', 625);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ANDINOLFI ARCANGELO' (1994, gender: 1)
-- aliased with: 'ANDOLFI ARCANGELO' (ID:26198)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (490, '2016-05-21 20:08:58', '2016-05-21 20:08:58', 'ANDINOLFI ARCANGELO', 26198);


-- Processing:...'CANNATA BARTOLI GIUSEPPE' (1965, gender: 1)
-- aliased with: 'CANNADA BARTOLI GIUSEPPE' (ID:25622)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (491, '2016-05-21 20:08:58', '2016-05-21 20:08:58', 'CANNATA BARTOLI GIUSEPPE', 25622);


-- Processing:...'CONTURSO MASSIMO' (1967, gender: 1)
-- aliased with: 'CONTURSO MASSIMILIANO' (ID:13593)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (492, '2016-05-21 20:08:58', '2016-05-21 20:08:58', 'CONTURSO MASSIMO', 13593);


-- Processing:...'CRO' ANTONELLA' (1975, gender: 2)
-- aliased with: 'CRO` ANTONELLA' (ID:26665)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (493, '2016-05-21 20:08:58', '2016-05-21 20:08:58', 'CRO\' ANTONELLA', 26665);


-- Processing:...'LIGNANO NANDO' (1948, gender: 1)
-- aliased with: 'LIGNANO FERDINANDO' (ID:13673)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (494, '2016-05-21 20:08:58', '2016-05-21 20:08:58', 'LIGNANO NANDO', 13673);


-- Processing:...'SARPONE ROSARIO' (1978, gender: 1)
-- aliased with: 'SARPORE ROSARIO' (ID:20918)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (495, '2016-05-21 20:08:58', '2016-05-21 20:08:58', 'SARPONE ROSARIO', 20918);


-- Processing:...'VALLONE MARIA ROSARIA' (1954, gender: 2)
-- aliased with: 'VALLONE MARIAROSARIA' (ID:9382)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (496, '2016-05-21 20:08:59', '2016-05-21 20:08:59', 'VALLONE MARIA ROSARIA', 9382);


COMMIT;
