--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'asd Aquademia':
-- aliased with: 'AQUADEMIA ASD' (ID:501)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (289, '2015-03-01 15:11:33', '2015-03-01 15:11:33', 'asd Aquademia', 501);


-- Processing:...'asd Futura - Morbeg':
-- aliased with: 'FUTURA TIRANO' (ID:220)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (290, '2015-03-01 15:11:33', '2015-03-01 15:11:33', 'asd Futura - Morbeg', 220);


-- Processing:...'Asd Ulysse - Messin':
-- aliased with: 'ULYSSE ASD' (ID:335)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (291, '2015-03-01 15:11:33', '2015-03-01 15:11:33', 'Asd Ulysse - Messin', 335);


-- Processing:...'Circ.Canottieri Ort':
-- aliased with: 'CC ORTIGIA ASD' (ID:603)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (292, '2015-03-01 15:11:33', '2015-03-01 15:11:33', 'Circ.Canottieri Ort', 603);


-- Processing:...'CUS Unime asd':
-- aliased with: 'CUSUNIME' (ID:721)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (293, '2015-03-01 15:11:33', '2015-03-01 15:11:33', 'CUS Unime asd', 721);


-- Processing:...'Onda Azzurra asd -S':
-- aliased with: 'A.S.D. ONDA AZZURRA' (ID:599)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (294, '2015-03-01 15:11:33', '2015-03-01 15:11:33', 'Onda Azzurra asd -S', 599);


-- Processing:...'Pol Nadir - Palermo':
-- aliased with: 'POLISPORTIVA NADIR' (ID:511)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (295, '2015-03-01 15:11:33', '2015-03-01 15:11:33', 'Pol Nadir - Palermo', 511);


-- Processing:...'Pol SC Catania':
-- aliased with: 'P.S.C. CATANIA' (ID:606)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (296, '2015-03-01 15:11:33', '2015-03-01 15:11:33', 'Pol SC Catania', 606);


-- Processing:...'Pol.Muri Antichi -':
-- aliased with: 'POL. DIL. MURI ANTICHI' (ID:631)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (297, '2015-03-01 15:11:33', '2015-03-01 15:11:33', 'Pol.Muri Antichi -', 631);


-- Processing:...'Pol.va Zenion CRAI':

-- Processing:...'Rari Nantes Palermo':
-- aliased with: 'POL. RN PALERMO 89' (ID:509)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (298, '2015-03-01 15:11:33', '2015-03-01 15:11:33', 'Rari Nantes Palermo', 509);


-- Processing:...'Swimming Caltanisse':

-- Processing:...'Tennis Cl. Match Ba':
-- aliased with: 'TENNIS CLUB MATCH B' (ID:371)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (299, '2015-03-01 15:11:34', '2015-03-01 15:11:34', 'Tennis Cl. Match Ba', 371);


-- Processing:...'US Triestina Nuoto':
-- aliased with: 'TRIESTINA NUOTO US' (ID:132)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (300, '2015-03-01 15:11:34', '2015-03-01 15:11:34', 'US Triestina Nuoto', 132);


-- Processing:...'Waterpolo Despar Me':
-- aliased with: 'WATERPOLO MESSINA' (ID:608)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (301, '2015-03-01 15:11:34', '2015-03-01 15:11:34', 'Waterpolo Despar Me', 608);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BUSA' MARIO' (1985, gender: 1)
-- aliased with: 'BUSA` MARIO' (ID:13808)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (197, '2015-03-01 15:17:42', '2015-03-01 15:17:42', 'BUSA\' MARIO', 13808);


-- Processing:...'CAPRI' GIUSEPPE' (1972, gender: 1)
-- aliased with: 'CAPRI` GIUSEPPE' (ID:9984)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (198, '2015-03-01 15:17:42', '2015-03-01 15:17:42', 'CAPRI\' GIUSEPPE', 9984);


-- Processing:...'D'ARRIGO MASSIMILIANO NAT' (1984, gender: 1)
-- aliased with: 'D`ARRIGO MASSIMILIANO NATALE' (ID:12847)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (199, '2015-03-01 15:17:42', '2015-03-01 15:17:42', 'D\'ARRIGO MASSIMILIANO NAT', 12847);


-- Processing:...'GENTILE ANTONINO' (1987, gender: 1)
-- aliased with: 'GENTILE ANTONIO' (ID:18006)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (200, '2015-03-01 15:17:42', '2015-03-01 15:17:42', 'GENTILE ANTONINO', 18006);


-- Processing:...'GRANATA GIULIANA MARIA GI' (1973, gender: 2)
-- aliased with: 'GRANATA GIULIANA' (ID:18010)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (201, '2015-03-01 15:17:42', '2015-03-01 15:17:42', 'GRANATA GIULIANA MARIA GI', 18010);


-- Processing:...'IANNO' CRISTIAN' (1981, gender: 1)
-- aliased with: 'IANNO` CRISTIAN' (ID:16481)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (202, '2015-03-01 15:17:42', '2015-03-01 15:17:42', 'IANNO\' CRISTIAN', 16481);


-- Processing:...'ISGRO' SILVIA' (1981, gender: 2)
-- aliased with: 'ISGRO` SILVIA' (ID:18014)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (203, '2015-03-01 15:17:42', '2015-03-01 15:17:42', 'ISGRO\' SILVIA', 18014);


-- Processing:...'LA MANTIA IGNAZIO' (1958, gender: 1)
-- aliased with: 'LA MANTIA IGO' (ID:16492)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (204, '2015-03-01 15:17:42', '2015-03-01 15:17:42', 'LA MANTIA IGNAZIO', 16492);


-- Processing:...'LOMBARDO CLAUDIO SEBASTIA' (1970, gender: 1)
-- aliased with: 'LOMBARDO CLAUDIO' (ID:18019)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (205, '2015-03-01 15:17:42', '2015-03-01 15:17:42', 'LOMBARDO CLAUDIO SEBASTIA', 18019);


-- Processing:...'MAGAZZU' ALESSANDRO' (1982, gender: 1)
-- aliased with: 'MAGAZZU` ALESSANDRO' (ID:12918)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (206, '2015-03-01 15:17:42', '2015-03-01 15:17:42', 'MAGAZZU\' ALESSANDRO', 12918);


-- Processing:...'MANAGO' ALVARO MARIA' (1963, gender: 1)
-- aliased with: 'MANAGO` ALVARO MARIA' (ID:13855)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (207, '2015-03-01 15:17:42', '2015-03-01 15:17:42', 'MANAGO\' ALVARO MARIA', 13855);


-- Processing:...'PELLEGRINO GIOVANNI' (1986, gender: 1)

-- Processing:...'PIAZZA SALVATORE' (1985, gender: 1)
-- aliased with: 'PIAZZA SALVO' (ID:13879)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (208, '2015-03-01 15:17:42', '2015-03-01 15:17:42', 'PIAZZA SALVATORE', 13879);


-- Processing:...'RAGNO FURIO GIUSEPPE' (1966, gender: 1)
-- aliased with: 'RAGNO FURIO CAMILLO' (ID:16586)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (209, '2015-03-01 15:17:42', '2015-03-01 15:17:42', 'RAGNO FURIO GIUSEPPE', 16586);


-- Processing:...'RANDAZZO ORAZIO' (1964, gender: 1)

-- Processing:...'SINITO' DIEGO CARMINE' (1989, gender: 1)
-- aliased with: 'SINITO` DIEGO CARMINE' (ID:12996)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (210, '2015-03-01 15:17:42', '2015-03-01 15:17:42', 'SINITO\' DIEGO CARMINE', 12996);


-- Processing:...'URZI' MASSIMO ANDREA' (1968, gender: 1)
-- aliased with: 'URZI` MASSIMO ANDREA' (ID:13012)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (211, '2015-03-01 15:17:42', '2015-03-01 15:17:42', 'URZI\' MASSIMO ANDREA', 13012);


COMMIT;
