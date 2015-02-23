--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.DILETT. ARIETE':

-- Processing:...'AQAVION ASD - NAPOL':

-- Processing:...'GSA SPORTING BENEVE':

-- Processing:...'NOFI SSD':

-- Processing:...'POL.PEGASO A.S.D.':

-- Processing:...'POLISPORTIVA BALNAE':
-- aliased with: 'Pol Balnaea - Batti' (ID:531)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (163, '2015-02-23 17:47:33', '2015-02-23 17:47:33', 'POLISPORTIVA BALNAE', 531);


-- Processing:...'SWIMMING CLUB QUATT':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ABYS GIOVANNI' (1986, gender: 1)

-- Processing:...'AIELLO GENNARO' (1961, gender: 1)

-- Processing:...'ANDREA VENTURA' (1983, gender: 1)
-- aliased with: 'VENTURA ANDREA' (ID:8393)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (86, '2015-02-23 17:57:51', '2015-02-23 17:57:51', 'ANDREA VENTURA', 8393);


-- Processing:...'DEL MONDO GIANFRANCO' (1961, gender: 1)

-- Processing:...'MENZIONE SERAFINA SARA' (1991, gender: 2)
-- aliased with: 'MENZIONE SARA' (ID:9271)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (87, '2015-02-23 17:57:51', '2015-02-23 17:57:51', 'MENZIONE SERAFINA SARA', 9271);


-- Processing:...'MOSCATELLO MARCO' (1984, gender: 1)
-- aliased with: 'MOSCATIELLO MARCO' (ID:9288)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (88, '2015-02-23 17:57:51', '2015-02-23 17:57:51', 'MOSCATELLO MARCO', 9288);


-- Processing:...'PARISE LUCA' (1976, gender: 1)

-- Processing:...'PECORA LUCA' (1979, gender: 1)

-- Processing:...'PETRUCCIOLI DARIO' (1983, gender: 1)
-- aliased with: 'PETRICCIUOLO DARIO' (ID:9313)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (89, '2015-02-23 17:57:51', '2015-02-23 17:57:51', 'PETRUCCIOLI DARIO', 9313);


-- Processing:...'SARRACINO GIOVANNI' (1986, gender: 1)

-- Processing:...'SOLVINO RAFFAELE' (1972, gender: 1)

-- Processing:...'SPARTANO MASSIMILIANO' (1978, gender: 1)

-- Processing:...'VITALE ANTONIO' (1983, gender: 1)

COMMIT;
