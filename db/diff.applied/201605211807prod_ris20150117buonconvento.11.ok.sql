--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'GHIBELLINA NUOTO SIENA AS':

-- Processing:...'POL OLIMPIA COLLE VD`ELSA':
-- aliased with: 'A.S. DIL. POL. OLIMPIA' (ID:424)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (780, '2016-05-21 18:08:49', '2016-05-21 18:08:49', 'POL OLIMPIA COLLE VD`ELSA', 424);


-- Processing:...'POL. AMATORI PRATO A.S.D.':
-- aliased with: 'POL. AMATORI PRATO' (ID:343)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (781, '2016-05-21 18:08:49', '2016-05-21 18:08:49', 'POL. AMATORI PRATO A.S.D.', 343);


COMMIT;
