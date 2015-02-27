--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ASD ACQUACHIARA ATI':
-- aliased with: 'A.S.D. ACQUACHIARA ATI 2000' (ID:656)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (221, '2015-02-26 22:11:24', '2015-02-26 22:11:24', 'ASD ACQUACHIARA ATI', 656);


-- Processing:...'LA MASSERIA AQUA AS':

-- Processing:...'POL. BALNAEA A.S.D.':
-- aliased with: 'Pol Balnaea - Batti' (ID:531)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (222, '2015-02-26 22:11:24', '2015-02-26 22:11:24', 'POL. BALNAEA A.S.D.', 531);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BEATO PAOLA' (1962, gender: 2)

-- Processing:...'DE MAIO BRUNO' (1948, gender: 1)

-- Processing:...'D`ALO` AMBROGIO' (1970, gender: 1)
-- aliased with: 'D'ALO' AMBROGIO' (ID:14916)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (153, '2015-02-26 22:14:35', '2015-02-26 22:14:35', 'D`ALO` AMBROGIO', 14916);


-- Processing:...'MEO VINCENZO ANDREA' (1989, gender: 1)
-- aliased with: 'MEO VINCENZO' (ID:15012)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (154, '2015-02-26 22:14:35', '2015-02-26 22:14:35', 'MEO VINCENZO ANDREA', 15012);


-- Processing:...'MOCCIA SALVATORE' (1973, gender: 1)

-- Processing:...'TUCCILLO ROSARIA' (1986, gender: 2)
-- aliased with: 'TUCCILLO MARIAROSARIA' (ID:15083)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (155, '2015-02-26 22:14:36', '2015-02-26 22:14:36', 'TUCCILLO ROSARIA', 15083);


COMMIT;
