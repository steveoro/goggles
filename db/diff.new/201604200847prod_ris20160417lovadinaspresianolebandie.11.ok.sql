--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.D. IL DELFINO N':
-- aliased with: 'Il Delfino Napoli asd' (ID:837)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (679, '2016-04-20 08:50:48', '2016-04-20 08:50:48', 'A.S.D. IL DELFINO N', 837);


-- Processing:...'CENTRO SPORTIVO HOF S.S.D.':
-- aliased with: 'CENTRO SPORTIVO HOF' (ID:810)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (680, '2016-04-20 08:50:48', '2016-04-20 08:50:48', 'CENTRO SPORTIVO HOF S.S.D.', 810);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BAZZO ALBERTO' (1990, gender: 1)

-- Processing:...'SANSON GIULIA' (1991, gender: 2)

COMMIT;
