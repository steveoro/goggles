--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CUS BARI AS DILETT.':

-- Processing:...'IN SPORT SRL':

-- Processing:...'LAMBRO NUOTO':

-- Processing:...'LIB NUOTO RIVOLI ASD':
-- aliased with: 'LIB. NUOTO RIVOLI' (ID:409)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (110, '2015-02-18 13:33:26', '2015-02-18 13:33:26', 'LIB NUOTO RIVOLI ASD', 409);


-- Processing:...'NEW SWIM':

-- Processing:...'VIRIBUS UNITIS':

-- Processing:...'YELLOW SPORT TEAM A':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BERETTA STEFANO' (1982, gender: 1)

-- Processing:...'BUFFONE EDOARDO' (1982, gender: 1)

-- Processing:...'CARPANI JESSICA' (1984, gender: 2)

-- Processing:...'COLOMBO ROBERTO' (1980, gender: 1)

-- Processing:...'DONATI DAVIDE' (1987, gender: 1)

-- Processing:...'GALLI RICCARDO' (1984, gender: 1)

-- Processing:...'GIUDICI ALESSANDRO' (1981, gender: 1)

-- Processing:...'KILDANI MIRKO' (1982, gender: 1)
-- aliased with: 'KILDANI MIRCO' (ID:6311)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (38, '2015-02-18 13:34:55', '2015-02-18 13:34:55', 'KILDANI MIRKO', 6311);


-- Processing:...'MAZZOLENI MARA' (1974, gender: 2)

-- Processing:...'NUZZO MARTA' (1993, gender: 2)

-- Processing:...'ROSSI LUCA' (1979, gender: 1)

-- Processing:...'ZANCHI CLARA' (1984, gender: 2)

COMMIT;
