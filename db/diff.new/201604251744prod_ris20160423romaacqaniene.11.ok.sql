--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'S.S. Dilett.Nuoto Club Viterb':
-- aliased with: 'NUOTO CLUB VITERBO' (ID:619)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (681, '2016-04-25 17:55:15', '2016-04-25 17:55:15', 'S.S. Dilett.Nuoto Club Viterb', 619);


-- Processing:...'San Paolo Ostiense Nuoto':
-- aliased with: 'San Paolo Ostiense' (ID:886)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (682, '2016-04-25 17:55:16', '2016-04-25 17:55:16', 'San Paolo Ostiense Nuoto', 886);


COMMIT;
