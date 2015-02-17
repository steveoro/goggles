--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ACQUADREAM FRANCIAC':

-- Processing:...'ALBATROS ASD LUMEZZ':

-- Processing:...'ASD SERENISSIMA NUOTO CLU':

-- Processing:...'ASS.NUOTO LUCCA CAP':
-- aliased with: 'A.N. LUCCA CAPANNORI' (ID:101)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (69, '2015-02-17 16:17:53', '2015-02-17 16:17:53', 'ASS.NUOTO LUCCA CAP', 101);


-- Processing:...'CANOTTIERI GARDA SA':

-- Processing:...'CHIARI NUOTO':

-- Processing:...'CITTÀ SPORT VICENZA':
-- aliased with: 'CITTA'' SPORT VICENZA S.S.D. RL' (ID:155)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (70, '2015-02-17 16:17:54', '2015-02-17 16:17:54', 'CITTÀ SPORT VICENZA', 155);


-- Processing:...'COMO N':

-- Processing:...'CSN MONFALCONE ASD':

-- Processing:...'ENJOY SSD':

-- Processing:...'GESTIONI NUOTO SSD':

-- Processing:...'GRUPPO PESCE':

-- Processing:...'JESOLONUOTO ASD':
-- aliased with: 'A.S.DILETT. JESOLONUOTO' (ID:149)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (71, '2015-02-17 16:17:55', '2015-02-17 16:17:55', 'JESOLONUOTO ASD', 149);


-- Processing:...'LIBERTAS SNEF':

-- Processing:...'NUOTO MASTER CREMA':

-- Processing:...'OLIMPIC SWIM PRO':

-- Processing:...'RARI NANTES GERBIDO':

-- Processing:...'RNTORINO S.C.S.D.':

-- Processing:...'SOC. 2001 SRL - PAD':
-- aliased with: 'SOC. S. D. 2001 SRL - PADOVA' (ID:177)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (72, '2015-02-17 16:17:57', '2015-02-17 16:17:57', 'SOC. 2001 SRL - PAD', 177);


-- Processing:...'SPORT VILLAGE SSD -':

-- Processing:...'SPORTING CLUB ARBIZ':

-- Processing:...'STILELIBERO SRL SSD':
-- aliased with: 'SSD STILE LIBERO SRL' (ID:179)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (73, '2015-02-17 16:17:58', '2015-02-17 16:17:58', 'STILELIBERO SRL SSD', 179);


-- Processing:...'TENNIS CLUB PESCHIE':

-- Processing:...'UISP NUOTO CORDENON':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ALCIATI MATTEO' (1990, gender: 1)

-- Processing:...'ANGIUS MARONGIU ANTONIO COST' (1980, gender: 1)
-- aliased with: 'ANGIUS MARONGIU ANTONIO' (ID:2095)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (18, '2015-02-17 16:21:37', '2015-02-17 16:21:37', 'ANGIUS MARONGIU ANTONIO COST', 2095);


-- Processing:...'ARESI NICOLA' (1979, gender: 1)

-- Processing:...'BENEVENIA LAURA' (1981, gender: 2)

-- Processing:...'BISOGNIN MARCO' (1970, gender: 1)

-- Processing:...'CHERCHI FABIO' (1972, gender: 1)

-- Processing:...'CORO` MONICA' (1962, gender: 2)
-- aliased with: 'CORO' MONICA' (ID:2665)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (19, '2015-02-17 16:21:38', '2015-02-17 16:21:38', 'CORO` MONICA', 2665);


-- Processing:...'FILIPPINI MATTEO' (1990, gender: 1)

-- Processing:...'FILIPPINI MONICA' (1989, gender: 2)

-- Processing:...'GIORGIO MASSIMO' (1964, gender: 1)

-- Processing:...'GRIGOLATO MICHELE' (1975, gender: 1)

-- Processing:...'GROSSI MIRKO' (1970, gender: 1)

-- Processing:...'MARCHI MATTEO' (1980, gender: 1)

-- Processing:...'MASSONI MAURIZIO' (1951, gender: 1)

-- Processing:...'SACCHETTI ANDREA' (1979, gender: 1)

-- Processing:...'SPATOLA MARIACRISTINA' (1968, gender: 2)
-- aliased with: 'SPATOLA CRISTINA' (ID:2059)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (20, '2015-02-17 16:21:39', '2015-02-17 16:21:39', 'SPATOLA MARIACRISTINA', 2059);


-- Processing:...'ZANCHI ALICE' (1984, gender: 2)

COMMIT;
