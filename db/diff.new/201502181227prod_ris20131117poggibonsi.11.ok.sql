--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.R. CECINA':

-- Processing:...'A.S. DIL. POL. OLIMPIA':

-- Processing:...'HIDRON SPORT':

-- Processing:...'LAZIO NUOTO':
-- aliased with: 'S.S. LAZIO NUOTO' (ID:211)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (104, '2015-02-18 12:28:52', '2015-02-18 12:28:52', 'LAZIO NUOTO', 211);


-- Processing:...'POLISPORTIVA GARDEN SRL S.S. D':
-- aliased with: 'POLISPORTIVA GARDEN' (ID:259)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (105, '2015-02-18 12:28:52', '2015-02-18 12:28:52', 'POLISPORTIVA GARDEN SRL S.S. D', 259);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ARMINI PIETRO' (1989, gender: 1)

-- Processing:...'ATTORI LORENZO' (1979, gender: 1)

-- Processing:...'BALDI IDALGO' (1974, gender: 1)

-- Processing:...'BARONI PIERANGELO' (1949, gender: 1)

-- Processing:...'BATAZZI MARCO' (1984, gender: 1)

-- Processing:...'BELLUCCI FRANCESCO' (1989, gender: 1)

-- Processing:...'BERNI MARCO' (1974, gender: 1)

-- Processing:...'BIANCO MARCO' (1984, gender: 1)

-- Processing:...'BIZZETI CLAUDIO' (1964, gender: 1)

-- Processing:...'BONIFAZI DANIELE' (1969, gender: 1)

-- Processing:...'BORTOLOTTI SIMONE' (1989, gender: 1)

-- Processing:...'BOSI ALESSANDRA' (1984, gender: 2)

-- Processing:...'BROGI ANDREA' (1989, gender: 1)

-- Processing:...'CAROTTI MAURIZIO' (1969, gender: 1)

-- Processing:...'CARRAI LAPO' (1974, gender: 1)

-- Processing:...'CASTIGLIA PIETRO' (1984, gender: 1)

-- Processing:...'CIANI LORENZO' (1989, gender: 1)

-- Processing:...'CIAPPINA LORENZO' (1974, gender: 1)

-- Processing:...'CINCI ELENA' (1979, gender: 2)

-- Processing:...'CINTELLI FABRIZIO' (1979, gender: 1)

-- Processing:...'COLOMBINI ALESSIA' (1989, gender: 2)

-- Processing:...'CONEDERA CARLO' (1929, gender: 1)

-- Processing:...'CORADESCHI GIACOMO' (1969, gender: 1)

-- Processing:...'D'AMBROSI CECILIA' (1989, gender: 2)

-- Processing:...'D'IPPOLITO CARLO' (1944, gender: 1)
-- aliased with: 'D`IPPOLITO CARLO' (ID:6883)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (33, '2015-02-18 12:36:03', '2015-02-18 12:36:03', 'D\'IPPOLITO CARLO', 6883);


-- Processing:...'D'OPPIDO ALESSANDRO' (1974, gender: 1)

-- Processing:...'D'ORAZIO STEFANO' (1984, gender: 1)

-- Processing:...'DADDI STEFANO' (1969, gender: 1)

-- Processing:...'DE RENSIS FRANCESCO' (1964, gender: 1)

-- Processing:...'DEL TORTO ANDREA' (1979, gender: 1)

-- Processing:...'DI MARIO ANDREA' (1974, gender: 1)

-- Processing:...'DI SALVO NICCOLO'' (1989, gender: 1)

-- Processing:...'FALLANI ANDREA' (1989, gender: 1)

-- Processing:...'FARNETANI RICCARDO' (1959, gender: 1)

-- Processing:...'FAVUZZA DANIELE' (1979, gender: 1)

-- Processing:...'FOGLIA FRANCESCO' (1989, gender: 1)

-- Processing:...'FONTANELLI ANNALISA' (1979, gender: 2)

-- Processing:...'FUCINI CHIARA' (1989, gender: 2)

-- Processing:...'FUCINI GIULIA' (1984, gender: 2)

-- Processing:...'GHINI YURI' (1989, gender: 1)

-- Processing:...'GIANNELLI MATTEO' (1979, gender: 1)

-- Processing:...'GIANNELLI NICCOLO'' (1979, gender: 1)

-- Processing:...'GILIBERTI CHIARA' (1989, gender: 2)

-- Processing:...'GOGGIOLI FRANCO' (1954, gender: 1)

-- Processing:...'GONFIOTTI EDOARDO' (1984, gender: 1)

-- Processing:...'LANINI LEONARDO' (1984, gender: 1)

-- Processing:...'MAGGI FRANCESCO' (1989, gender: 1)

-- Processing:...'MAGI FRANCESCO' (1979, gender: 1)

-- Processing:...'MARIOTTI MONICA' (1959, gender: 2)

-- Processing:...'MASELLI GIULIA' (1989, gender: 2)

-- Processing:...'MATERASSI MASSIMO' (1964, gender: 1)

-- Processing:...'MAZZUOLI FABRIZIO' (1969, gender: 1)

-- Processing:...'MEONI LUCA' (1969, gender: 1)

-- Processing:...'MICHELI MIRKO' (1974, gender: 1)

-- Processing:...'MOSI AGNESE' (1984, gender: 2)

-- Processing:...'MOSI FRANCESCO' (1989, gender: 1)

-- Processing:...'NANNINI ALESSANDRO' (1959, gender: 1)

-- Processing:...'NENCINI GIANLUCA' (1964, gender: 1)

-- Processing:...'PACE MASSIMILIANO' (1969, gender: 1)

-- Processing:...'PAOLINI MATTEO' (1974, gender: 1)

-- Processing:...'PASQUI GIULIA' (1979, gender: 2)

-- Processing:...'PECCI SAMUELE' (1979, gender: 1)

-- Processing:...'PELA RICCARDO' (1979, gender: 1)

-- Processing:...'PERI JACOPO' (1974, gender: 1)

-- Processing:...'PIRRONE MARCO' (1984, gender: 1)

-- Processing:...'POLENDONI ENRICO' (1984, gender: 1)

-- Processing:...'PORQUIER STEFANO' (1969, gender: 1)

-- Processing:...'PORTUS LORENZO' (1984, gender: 1)

-- Processing:...'PRATESI GIOVANNI' (1984, gender: 1)

-- Processing:...'PUCCI ETTORE' (1974, gender: 1)

-- Processing:...'RIGHI ANDREA' (1974, gender: 1)

-- Processing:...'ROMANINI GIOVANNI' (1964, gender: 1)

-- Processing:...'ROMI MATTEO' (1969, gender: 1)

-- Processing:...'RONCOLINI STEFANIA' (1979, gender: 2)

-- Processing:...'ROSELLI ELENA' (1979, gender: 2)

-- Processing:...'ROSSI RICCARDO' (1984, gender: 1)

-- Processing:...'SALVIANTI FRANCESCA' (1974, gender: 2)

-- Processing:...'SANASI MARCO VINICIO' (1964, gender: 1)
-- aliased with: 'SANASI MARCO' (ID:3588)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (34, '2015-02-18 12:36:05', '2015-02-18 12:36:05', 'SANASI MARCO VINICIO', 3588);


-- Processing:...'SARTI ELEONORA' (1984, gender: 2)

-- Processing:...'SARTI MASSIMILIANO' (1969, gender: 1)

-- Processing:...'SOLFANELLI JONATHAN' (1979, gender: 1)

-- Processing:...'STANGANINI NICOLA' (1974, gender: 1)

-- Processing:...'STEFANELLI UMBERTO CESARE' (1949, gender: 1)

-- Processing:...'TOFANI ILARIA' (1984, gender: 2)

-- Processing:...'ULIVELLI ANDREA' (1969, gender: 1)

-- Processing:...'VALIANI FRANCESCO' (1989, gender: 1)

-- Processing:...'VILLANI ALESSANDRO' (1979, gender: 1)

-- Processing:...'ZAMPINI ENRICO' (1959, gender: 1)

COMMIT;
