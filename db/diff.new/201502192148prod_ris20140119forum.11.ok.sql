--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.GE.P.I. A.S. DIL.':

-- Processing:...'A.S. DIL NUOVA CAMPUS PRIMAVE':
-- aliased with: 'Nuova Campus Primav' (ID:530)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (157, '2015-02-19 22:03:54', '2015-02-19 22:03:54', 'A.S. DIL NUOVA CAMPUS PRIMAVE', 530);


-- Processing:...'ACCADEMIA NUOTO MAR':

-- Processing:...'ASD SPORT PALACE ROMA':
-- aliased with: 'Sport Palace Roma a' (ID:534)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (158, '2015-02-19 22:03:54', '2015-02-19 22:03:54', 'ASD SPORT PALACE ROMA', 534);


-- Processing:...'ATLANTIDE S.S.D.':
-- aliased with: 'Atlantide ssd - Cia' (ID:520)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (159, '2015-02-19 22:03:54', '2015-02-19 22:03:54', 'ATLANTIDE S.S.D.', 520);


-- Processing:...'ATLETI PER CASO ASD':

-- Processing:...'C. S. SANTA LUCIA FILIPPINI':

-- Processing:...'CUS CASSINO ASD':

-- Processing:...'DIMENSIONE N VITORC':

-- Processing:...'FIN PLUS ARL SSD':
-- aliased with: 'Ssd Fin Plus - Roma' (ID:535)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (160, '2015-02-19 22:03:55', '2015-02-19 22:03:55', 'FIN PLUS ARL SSD', 535);


-- Processing:...'FREETIME S.C. SRL':
-- aliased with: 'FREE TIME A.S.D.' (ID:421)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (161, '2015-02-19 22:03:55', '2015-02-19 22:03:55', 'FREETIME S.C. SRL', 421);


-- Processing:...'IFIT SPORT CENTER A':

-- Processing:...'MILLENNIUM ASD':
-- aliased with: 'ASD MILLENNIUM' (ID:429)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (162, '2015-02-19 22:03:55', '2015-02-19 22:03:55', 'MILLENNIUM ASD', 429);


-- Processing:...'NUOTO CLUB VITERBO':

-- Processing:...'RARI NANTES ALBANO':

-- Processing:...'SPORT SHUTTLE - SEL':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ANTONICELLI LUCIANO' (1968, gender: 1)

-- Processing:...'CENTRONE CORRADO' (1966, gender: 1)

-- Processing:...'D`AGOSTINO SILVIA' (1973, gender: 2)
-- aliased with: 'D'AGOSTINO SILVIA' (ID:10701)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (81, '2015-02-19 22:05:09', '2015-02-19 22:05:09', 'D`AGOSTINO SILVIA', 10701);


-- Processing:...'D`ALESSANDRO MARCO' (1969, gender: 1)

-- Processing:...'D`AMBROSIO SARA' (1987, gender: 2)
-- aliased with: 'D'AMBROSIO SARA' (ID:10704)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (82, '2015-02-19 22:05:09', '2015-02-19 22:05:09', 'D`AMBROSIO SARA', 10704);


-- Processing:...'D`ANGELO SILVIA' (1957, gender: 2)
-- aliased with: 'D'ANGELO SILVIA' (ID:10706)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (83, '2015-02-19 22:05:09', '2015-02-19 22:05:09', 'D`ANGELO SILVIA', 10706);


-- Processing:...'FRACCALVIERI FRANCESCO' (1972, gender: 1)

-- Processing:...'FRANTI MARCELLO' (1982, gender: 1)

-- Processing:...'GALDINI ERIKA' (1974, gender: 2)

-- Processing:...'NARDI GIANCARLO' (1962, gender: 1)

-- Processing:...'RICCI CRISTIANO' (1982, gender: 1)

-- Processing:...'SANE` SCHEPISI MONICA' (1970, gender: 2)
-- aliased with: 'SANE' SCHEPISI MONICA' (ID:10900)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (84, '2015-02-19 22:05:09', '2015-02-19 22:05:09', 'SANE` SCHEPISI MONICA', 10900);


COMMIT;
