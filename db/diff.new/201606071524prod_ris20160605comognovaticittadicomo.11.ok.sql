--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S. Briantea84':
-- aliased with: 'BRIANTEA 84' (ID:734)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (845, '2016-06-07 15:26:55', '2016-06-07 15:26:55', 'A.S. Briantea84', 734);


-- Processing:...'Ashd Novara':

-- Processing:...'Osha-Asp Como':

-- Processing:...'Polha Varese':

-- Processing:...'Team Trezzo Sport S.S.Dil.':
-- aliased with: 'TEAM TREZZO SPORT S' (ID:58)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (846, '2016-06-07 15:26:56', '2016-06-07 15:26:56', 'Team Trezzo Sport S.S.Dil.', 58);


COMMIT;
