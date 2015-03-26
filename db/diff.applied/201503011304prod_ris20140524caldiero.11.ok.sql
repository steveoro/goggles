--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.D. TENNIS CLUB':
-- aliased with: 'TENNIS CLUB PESCHIE' (ID:361)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (272, '2015-03-01 13:16:48', '2015-03-01 13:16:48', 'A.S.D. TENNIS CLUB', 361);


-- Processing:...'A.S.DILETT. GRUPPO':
-- aliased with: 'GRUPPO IN FORMA AS' (ID:283)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (273, '2015-03-01 13:16:48', '2015-03-01 13:16:48', 'A.S.DILETT. GRUPPO', 283);


-- Processing:...'ACTIVA NUOTO A.S.DI':
-- aliased with: 'ACTIVA NUOTO - PIAC' (ID:567)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (274, '2015-03-01 13:16:48', '2015-03-01 13:16:48', 'ACTIVA NUOTO A.S.DI', 567);


-- Processing:...'ASS SPORT DILET ALT':
-- aliased with: 'CIVATURS DE AKKER' (ID:255)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (275, '2015-03-01 13:16:48', '2015-03-01 13:16:48', 'ASS SPORT DILET ALT', 255);


-- Processing:...'C.U.S. BOLOGNA A.S.':
-- aliased with: 'C.U.S. BOLOGNA' (ID:253)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (276, '2015-03-01 13:16:48', '2015-03-01 13:16:48', 'C.U.S. BOLOGNA A.S.', 253);


-- Processing:...'CENTRO NUOTO ROSA'':

-- Processing:...'ESC S.S.DILETT. SRL':
-- aliased with: 'ESC SSD - BRESCIA' (ID:59)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (277, '2015-03-01 13:16:48', '2015-03-01 13:16:48', 'ESC S.S.DILETT. SRL', 59);


-- Processing:...'G.A.M.TEAM SRL SSD':
-- aliased with: 'G.A.M. TEAM' (ID:49)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (278, '2015-03-01 13:16:48', '2015-03-01 13:16:48', 'G.A.M.TEAM SRL SSD', 49);


-- Processing:...'SOCIETA' CAN NINO B':
-- aliased with: 'CAN NINO BIXIO' (ID:686)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (279, '2015-03-01 13:16:48', '2015-03-01 13:16:48', 'SOCIETA\' CAN NINO B', 686);


-- Processing:...'SOGEIS SRL SPORTIVA':
-- aliased with: 'AS SOGEIS' (ID:323)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (280, '2015-03-01 13:16:48', '2015-03-01 13:16:48', 'SOGEIS SRL SPORTIVA', 323);


-- Processing:...'SSV BOZEN A.S.V.':
-- aliased with: 'S.S.V. BOZEN' (ID:456)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (281, '2015-03-01 13:16:48', '2015-03-01 13:16:48', 'SSV BOZEN A.S.V.', 456);


-- Processing:...'SSV BRIXEN - AMATEU':
-- aliased with: 'SSV BRIXEN' (ID:467)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (282, '2015-03-01 13:16:48', '2015-03-01 13:16:48', 'SSV BRIXEN - AMATEU', 467);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'DAPRA' DONATO' (1985, gender: 1)
-- aliased with: 'DAPRA` DONATO' (ID:5677)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (192, '2015-03-01 13:16:58', '2015-03-01 13:16:58', 'DAPRA\' DONATO', 5677);


COMMIT;
