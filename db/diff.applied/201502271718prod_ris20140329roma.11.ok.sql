--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ATHENA SPORTING CLUB':
-- aliased with: 'ATHENA SP.CLUB -BRA' (ID:693)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (231, '2015-02-27 17:23:56', '2015-02-27 17:23:56', 'ATHENA SPORTING CLUB', 693);


-- Processing:...'CENTRO NUOTO FIUGGI':

-- Processing:...'CIRCOLO CANOTTIERI NAPOLI':
-- aliased with: 'CIRCOLO CAN NAPOLI' (ID:232)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (232, '2015-02-27 17:23:56', '2015-02-27 17:23:56', 'CIRCOLO CANOTTIERI NAPOLI', 232);


-- Processing:...'CIRCOLO CASETTA BIANCA':
-- aliased with: 'Casetta Bianca ssd' (ID:522)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (233, '2015-02-27 17:23:56', '2015-02-27 17:23:56', 'CIRCOLO CASETTA BIANCA', 522);


-- Processing:...'DISC. SPORT. BELLE ARTI':
-- aliased with: 'DISC.SPORT.BELLE AR' (ID:692)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (234, '2015-02-27 17:23:56', '2015-02-27 17:23:56', 'DISC. SPORT. BELLE ARTI', 692);


-- Processing:...'G.S. VV. F.  "F. SORGINI"':
-- aliased with: 'G.S. VV. F.  F. SOR' (ID:375)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (235, '2015-02-27 17:23:56', '2015-02-27 17:23:56', 'G.S. VV. F.  \"F. SORGINI\"', 375);


-- Processing:...'NUOTO S.EGIDIO VAL VIBRATA':
-- aliased with: 'NUOTO S.EGIDIO V.VIBRATA' (ID:674)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (236, '2015-02-27 17:23:56', '2015-02-27 17:23:56', 'NUOTO S.EGIDIO VAL VIBRATA', 674);


-- Processing:...'POLISPORTIVA IUSM':

-- Processing:...'POOL NUOTO SAMBENEDETTESE':
-- aliased with: 'POOL N SAMBENEDETTE' (ID:120)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (237, '2015-02-27 17:23:56', '2015-02-27 17:23:56', 'POOL NUOTO SAMBENEDETTESE', 120);


-- Processing:...'SC TUSCOLANO "B"':
-- aliased with: 'SC TUSCOLANO' (ID:212)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (238, '2015-02-27 17:23:56', '2015-02-27 17:23:56', 'SC TUSCOLANO \"B\"', 212);


-- Processing:...'SPORTING CLUB ROMA 70 ASD':
-- aliased with: 'SPORT. C. ROMA ASD' (ID:447)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (239, '2015-02-27 17:23:56', '2015-02-27 17:23:56', 'SPORTING CLUB ROMA 70 ASD', 447);


-- Processing:...'VILLAGE SSD - CERVETERI':

-- Processing:...'VILLAGGIO SPORTIVO ESCHI':
-- aliased with: 'Villaggio Sport. Es' (ID:249)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (240, '2015-02-27 17:23:57', '2015-02-27 17:23:57', 'VILLAGGIO SPORTIVO ESCHI', 249);


-- Processing:...'VILLAGGIO SPORTIVO ESCHILO':
-- aliased with: 'Villaggio Sport. Es' (ID:249)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (241, '2015-02-27 17:23:57', '2015-02-27 17:23:57', 'VILLAGGIO SPORTIVO ESCHILO', 249);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ALLEGRI SERRAGGI NICCOLO` GI' (1975, gender: 1)
-- aliased with: 'ALLEGRI SERRAGGI NICCOLO'' (ID:14322)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (163, '2015-02-27 17:27:03', '2015-02-27 17:27:03', 'ALLEGRI SERRAGGI NICCOLO` GI', 14322);


-- Processing:...'BRUNO ANNA GIORGIA ALESSANDR' (1983, gender: 2)
-- aliased with: 'BRUNO ANNA GIORGIA ALESSA' (ID:10630)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (164, '2015-02-27 17:27:03', '2015-02-27 17:27:03', 'BRUNO ANNA GIORGIA ALESSANDR', 10630);


-- Processing:...'CAVAZZA ANTONIO GIUSEPPE' (1968, gender: 1)

-- Processing:...'DE NEGRI PAOLO' (1963, gender: 1)
-- aliased with: 'DE NEGRI GIORGIO PAOLO' (ID:3600)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (165, '2015-02-27 17:27:03', '2015-02-27 17:27:03', 'DE NEGRI PAOLO', 3600);


-- Processing:...'DE SILVESTRIS FABIO' (1986, gender: 1)

-- Processing:...'D`ERRICO STEFANIA' (1968, gender: 2)
-- aliased with: 'D'ERRICO STEFANIA' (ID:14428)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (166, '2015-02-27 17:27:03', '2015-02-27 17:27:03', 'D`ERRICO STEFANIA', 14428);


-- Processing:...'D`ORAZIO FABIO' (1979, gender: 1)
-- aliased with: 'D'ORAZIO FABIO' (ID:14429)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (167, '2015-02-27 17:27:03', '2015-02-27 17:27:03', 'D`ORAZIO FABIO', 14429);


-- Processing:...'D`URSI EUGENIO' (1982, gender: 1)
-- aliased with: 'D'URSI EUGENIO' (ID:14430)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (168, '2015-02-27 17:27:03', '2015-02-27 17:27:03', 'D`URSI EUGENIO', 14430);


-- Processing:...'MASCARO CHIARA' (1994, gender: 2)

-- Processing:...'ROSSI DANIELE' (1991, gender: 1)

-- Processing:...'SARCIONE PAOLA' (1967, gender: 2)

-- Processing:...'STRIVIERI ALESSANDRO' (1973, gender: 1)

-- Processing:...'VILLO` ILARIA' (1985, gender: 2)
-- aliased with: 'VILLO' ILARIA' (ID:10953)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (169, '2015-02-27 17:27:03', '2015-02-27 17:27:03', 'VILLO` ILARIA', 10953);


-- Processing:...'ZAGAGLIA GIULIA' (1986, gender: 2)

COMMIT;
