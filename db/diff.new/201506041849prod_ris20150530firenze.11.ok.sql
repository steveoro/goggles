--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'01 ZEROUNO SSD - FIRENZE':
-- aliased with: 'ZEROUNO SSD ARL' (ID:337)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (352, '2015-06-04 19:13:43', '2015-06-04 19:13:43', '01 ZEROUNO SSD - FIRENZE', 337);


-- Processing:...'AS DILET NUOTO CLUB AZZURRA 91':
-- aliased with: 'N.C. AZZURRA 1991' (ID:9)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (353, '2015-06-04 19:13:43', '2015-06-04 19:13:43', 'AS DILET NUOTO CLUB AZZURRA 91', 9);


-- Processing:...'AVION CENTER A.S.DIL.':

-- Processing:...'AZ&PC AMERSFOORT':

-- Processing:...'CITY OF CANTERBURY SC':

-- Processing:...'COMO NUOTO ASD':
-- aliased with: 'COMO N' (ID:349)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (354, '2015-06-04 19:13:44', '2015-06-04 19:13:44', 'COMO NUOTO ASD', 349);


-- Processing:...'CUERNAVACA':

-- Processing:...'DONAU WIEN':
-- aliased with: 'SC DONAU WIEN' (ID:458)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (355, '2015-06-04 19:13:44', '2015-06-04 19:13:44', 'DONAU WIEN', 458);


-- Processing:...'EURO LVIV MASTER SWIMMING':

-- Processing:...'FLORENCE SPORT SERVICE':

-- Processing:...'FUTURA CLUB I CAVALIERI':

-- Processing:...'GIS MILANO':

-- Processing:...'GS SAMB 87':
-- aliased with: 'G.S. SAMB 87 A.S.D.' (ID:121)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (356, '2015-06-04 19:13:46', '2015-06-04 19:13:46', 'GS SAMB 87', 121);


-- Processing:...'HALL':

-- Processing:...'HOBART ACQUATIC MASTER SWIMMIN':

-- Processing:...'KETTERING AS CLUB':

-- Processing:...'MILNGAVIE & BEARSDEN':

-- Processing:...'NUOTATORI MODENESI':
-- aliased with: 'N MODENESI' (ID:257)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (357, '2015-06-04 19:13:47', '2015-06-04 19:13:47', 'NUOTATORI MODENESI', 257);


-- Processing:...'NUOTO GIOVINAZZO SSD':

-- Processing:...'OLYMPIACOS S.F.PIRAEUS':

-- Processing:...'PUBLIC UNION UKRANIAN':

-- Processing:...'S.S.D. STILELIBERO SRL':
-- aliased with: 'SSD STILE LIBERO SRL' (ID:179)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (358, '2015-06-04 19:13:48', '2015-06-04 19:13:48', 'S.S.D. STILELIBERO SRL', 179);


-- Processing:...'SCHWIMMVEREIN SEMPACHERSEE':

-- Processing:...'STADTWERKE MUENCHEN':

-- Processing:...'SWORD FISH':

-- Processing:...'THE MERMAIDS':

-- Processing:...'TRIBEACH BRASOV':

-- Processing:...'UNIVESITY OF SAN FRANCISCO':

-- Processing:...'VIENNA OLDIES':

-- Processing:...'WASSERFREUNDE MUNCHEN':
-- aliased with: 'SC WASSERFREUNDE MÜNCHEN' (ID:460)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (359, '2015-06-04 19:13:50', '2015-06-04 19:13:50', 'WASSERFREUNDE MUNCHEN', 460);


-- Processing:...'ZHITOMIR AQUA MASTER':

-- Processing:...'ZWS VLAARDINGEN':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ADREANI LORENZO' (1990, gender: 1)

-- Processing:...'APEL ROBERT' (1940, gender: 1)

-- Processing:...'BACHINI LEONARDO' (1970, gender: 1)

-- Processing:...'BALESTRINI ANDREA' (1980, gender: 1)

-- Processing:...'BARACCHI MANUELA' (1950, gender: 2)

-- Processing:...'BARDINI VITTORIO' (1965, gender: 1)

-- Processing:...'BENI NICCOLO'' (1985, gender: 1)

-- Processing:...'BINAZZI LUCA' (1965, gender: 1)

-- Processing:...'BIZZETI FEDERICO' (1990, gender: 1)

-- Processing:...'BIZZI MAURIZIO' (1955, gender: 1)

-- Processing:...'BORTOLOTTO DARIO' (1990, gender: 1)

-- Processing:...'CALOSI MIRCO' (1980, gender: 1)

-- Processing:...'CAMPOLMI PIETRO' (1985, gender: 1)

-- Processing:...'CAPITONI MARCO' (1980, gender: 1)

-- Processing:...'CARRAI JACOPO' (1970, gender: 1)

-- Processing:...'CASATI FABIO' (1960, gender: 1)

-- Processing:...'CASOLCO GLORIA' (1940, gender: 2)

-- Processing:...'CASPRINI VALERIA' (1975, gender: 2)

-- Processing:...'CASTELLANI FRANCESCA' (1965, gender: 2)

-- Processing:...'CERUTTI LUIGI' (1960, gender: 1)

-- Processing:...'CESARI LORENA' (1975, gender: 2)

-- Processing:...'CIANDRI FEDERICA' (1985, gender: 2)

-- Processing:...'CIOLLI LEONARDO' (1975, gender: 1)

-- Processing:...'CIPRIANO LUCA' (1965, gender: 1)

-- Processing:...'COLORA' SILEA' (1970, gender: 2)

-- Processing:...'CONEDERA CARLO' (1930, gender: 1)

-- Processing:...'CORBO' SIMONE' (1980, gender: 1)
-- aliased with: 'CORBÒ SIMONE' (ID:13078)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (244, '2015-06-04 19:34:46', '2015-06-04 19:34:46', 'CORBO\' SIMONE', 13078);


-- Processing:...'COSTANTINO YURI' (1965, gender: 1)

-- Processing:...'DE LISA DANIELE' (1985, gender: 1)

-- Processing:...'DI BENEDETTO GABRIELE' (1960, gender: 1)

-- Processing:...'DI PIERRO DOMENICO' (1975, gender: 1)

-- Processing:...'DI PIERRO VALERIA' (1980, gender: 2)

-- Processing:...'DOMANICO ANDREA' (1980, gender: 1)

-- Processing:...'DONNICI SALVATORE' (1980, gender: 1)

-- Processing:...'FARCI GIOVANNI' (1960, gender: 1)

-- Processing:...'FERRARINI GIANMARIA' (1960, gender: 1)

-- Processing:...'FERRETTI ANGELA' (1965, gender: 2)

-- Processing:...'FORCINA MATTIA' (1985, gender: 1)

-- Processing:...'FREDIANELLI ALESSANDRO' (1970, gender: 1)

-- Processing:...'FUSI MASSIMO' (1960, gender: 1)

-- Processing:...'GALLETLY ALEX' (1940, gender: 1)

-- Processing:...'GANDI FRANCESCA' (1960, gender: 2)

-- Processing:...'GASPARRINI CLAUDIO' (1955, gender: 1)

-- Processing:...'GAVIRAGHI GIANLUCA' (1970, gender: 1)

-- Processing:...'GHILARDI MATTEO' (1985, gender: 1)

-- Processing:...'GIACHETTI GIORGIA' (1990, gender: 2)

-- Processing:...'HIMOVICH PETRO' (1960, gender: 1)

-- Processing:...'HOFFMANN ERICH' (1940, gender: 1)
-- aliased with: 'HOFMANN ERICH' (ID:8542)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (245, '2015-06-04 19:34:48', '2015-06-04 19:34:48', 'HOFFMANN ERICH', 8542);


-- Processing:...'INNOCENTI DANIELE' (1955, gender: 1)

-- Processing:...'KISSLER FABIAN' (1980, gender: 1)

-- Processing:...'KORZELIUS JESSICA' (1990, gender: 2)

-- Processing:...'LELLI MARCO' (1970, gender: 1)

-- Processing:...'LEONARDI BARBARA' (1970, gender: 2)

-- Processing:...'MANCA LUCA' (1975, gender: 1)

-- Processing:...'MARINO ANTONIO' (1970, gender: 1)

-- Processing:...'MARTINELLI GRAZIANO' (1965, gender: 1)

-- Processing:...'MAYER STEFAN' (1955, gender: 1)

-- Processing:...'MAZZANTINI ALESSANDRA' (1970, gender: 2)

-- Processing:...'MAZZOCCHI TOMMASO' (1980, gender: 1)

-- Processing:...'MENICAGLI BARBARA' (1965, gender: 2)

-- Processing:...'MIGLIORINI LEONARDO' (1965, gender: 1)

-- Processing:...'MILITELLO VINCENZO' (1955, gender: 1)

-- Processing:...'MODUGNO ELISABETTA' (1970, gender: 2)

-- Processing:...'MOLINARI LAURA' (1965, gender: 2)

-- Processing:...'MORINI CRISTIANO' (1965, gender: 1)

-- Processing:...'NAPOLETANO VINCENZO' (1985, gender: 1)

-- Processing:...'ORREA STEFANO' (1970, gender: 1)

-- Processing:...'ORSINI ELENA' (1965, gender: 2)

-- Processing:...'PAGLIARULO VITO' (1965, gender: 1)

-- Processing:...'PAPI TIZIANA' (1955, gender: 2)

-- Processing:...'PASTACALDI CINZIA' (1980, gender: 2)

-- Processing:...'PECCHIOLI DANIELE' (1960, gender: 1)

-- Processing:...'PECCIARINI DANIELE ALBER' (1985, gender: 1)

-- Processing:...'PICCIOLI CHIARA' (1980, gender: 2)

-- Processing:...'PIROZZI GIOVANNI' (1990, gender: 1)

-- Processing:...'POCCI SIMONE' (1990, gender: 1)

-- Processing:...'RABIZZI VALENTINO' (1965, gender: 1)

-- Processing:...'RAMAZZOTTI LEONARDO' (1990, gender: 1)

-- Processing:...'ROSSELLI MASSIMO' (1965, gender: 1)

-- Processing:...'SALVIANTI FRANCESCA' (1975, gender: 2)

-- Processing:...'SANTANIELLO ALESSANDRO' (1980, gender: 1)

-- Processing:...'SCAMPOLI EMILIANO' (1975, gender: 1)

-- Processing:...'SCHEGGI FRANCESCA' (1980, gender: 2)

-- Processing:...'SOLAZZI SIMONE' (1985, gender: 1)

-- Processing:...'SOLFANELLI LEONARDO' (1975, gender: 1)

-- Processing:...'STANO MARCO' (1980, gender: 1)

-- Processing:...'STOPPATO FEDERICO' (1945, gender: 1)

-- Processing:...'TADDEI NICCOLO'' (1990, gender: 1)

-- Processing:...'TAME CLARE' (1955, gender: 2)

-- Processing:...'TESI FLAVIO' (1965, gender: 1)

-- Processing:...'TOTI BARBARA' (1965, gender: 2)

-- Processing:...'TOZZI ALESSANDRA' (1965, gender: 2)

-- Processing:...'TURINI DALIA' (1970, gender: 2)

-- Processing:...'VALDRIGHI STEFANIA' (1970, gender: 2)

-- Processing:...'VECCHIARELLI ANDREA' (1985, gender: 1)

-- Processing:...'VENTURI GIOVANNI' (1970, gender: 1)

-- Processing:...'VERDICCHIO MARIO' (1990, gender: 1)

-- Processing:...'VERGANI ILARIA' (1970, gender: 2)

-- Processing:...'VERMIGLI TOMMASO' (1975, gender: 1)

-- Processing:...'VIRZI' ELISA' (1990, gender: 2)
-- aliased with: 'VIRZI` ELISA' (ID:18734)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (246, '2015-06-04 19:34:51', '2015-06-04 19:34:51', 'VIRZI\' ELISA', 18734);


-- Processing:...'WOLFGANG RABER' (1965, gender: 1)
-- aliased with: 'RABER WOLFGANG' (ID:8621)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (247, '2015-06-04 19:34:51', '2015-06-04 19:34:51', 'WOLFGANG RABER', 8621);


-- Processing:...'YASTREBOV IGOR' (1955, gender: 1)

COMMIT;
