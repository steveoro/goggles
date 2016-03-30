--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Airon Club Bio-Sport Ssd':
-- aliased with: 'AIRONCLUB BIO-SPORT' (ID:570)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (607, '2016-03-27 16:06:28', '2016-03-27 16:06:28', 'Airon Club Bio-Sport Ssd', 570);


-- Processing:...'Albatros S.C. Ssd':
-- aliased with: 'ALBATROS SP. CLUB S' (ID:610)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (608, '2016-03-27 16:06:28', '2016-03-27 16:06:28', 'Albatros S.C. Ssd', 610);


-- Processing:...'Aquatika Ssd Arl':
-- aliased with: 'AQUATIKA ASD - CRIS' (ID:296)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (609, '2016-03-27 16:06:28', '2016-03-27 16:06:28', 'Aquatika Ssd Arl', 296);


-- Processing:...'Asd Sottosopra - Brindisi':
-- aliased with: 'AS SOTTOSOPRA' (ID:563)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (610, '2016-03-27 16:06:28', '2016-03-27 16:06:28', 'Asd Sottosopra - Brindisi', 563);


-- Processing:...'Blue & Isola Verde Ssd':

-- Processing:...'Cus Bari Asd':
-- aliased with: 'CUS BARI' (ID:804)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (611, '2016-03-27 16:06:30', '2016-03-27 16:06:30', 'Cus Bari Asd', 804);


-- Processing:...'Dna Nadir Asd':
-- aliased with: 'NADIR SSD - PUTIGNA' (ID:564)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (612, '2016-03-27 16:06:31', '2016-03-27 16:06:31', 'Dna Nadir Asd', 564);


-- Processing:...'Fimco Sport Ssd':
-- aliased with: 'FIMCO SPORT S.S. DI' (ID:577)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (613, '2016-03-27 16:06:31', '2016-03-27 16:06:31', 'Fimco Sport Ssd', 577);


-- Processing:...'Mediterraneo Sp.- Taranto':
-- aliased with: 'MEDITERRANEO SPORT' (ID:311)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (614, '2016-03-27 16:06:31', '2016-03-27 16:06:31', 'Mediterraneo Sp.- Taranto', 311);


-- Processing:...'Pol Delfinia - S.Vito D.N':
-- aliased with: 'POL. DELFINIA ASD' (ID:590)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (615, '2016-03-27 16:06:31', '2016-03-27 16:06:31', 'Pol Delfinia - S.Vito D.N', 590);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'DONATO VALENTINA' (1982, gender: 2)

-- Processing:...'FIORE MARIATERESA' (1987, gender: 2)
-- aliased with: 'FIORE MARIA TERESA' (ID:11987)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (325, '2016-03-27 16:11:42', '2016-03-27 16:11:42', 'FIORE MARIATERESA', 11987);


-- Processing:...'GIARDINO FRANCESCO' (1986, gender: 1)

-- Processing:...'IGNAZIO CINZIA' (1986, gender: 2)
-- aliased with: 'IGNAZZI CINZIA' (ID:10779)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (326, '2016-03-27 16:11:42', '2016-03-27 16:11:42', 'IGNAZIO CINZIA', 10779);


-- Processing:...'LEGROTTAGLIE GRAZIA' (1977, gender: 2)
-- aliased with: 'LE GROTTAGLIE GRAZIA' (ID:20839)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (327, '2016-03-27 16:11:43', '2016-03-27 16:11:43', 'LEGROTTAGLIE GRAZIA', 20839);


-- Processing:...'LOIACONO ELEONORA' (1986, gender: 2)

-- Processing:...'LORUSSO ANTONIO' (1988, gender: 1)

-- Processing:...'SANTESE CASTELLO' (1973, gender: 1)

COMMIT;
