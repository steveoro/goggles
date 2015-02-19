--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.R. SSD A.R.L.':
-- aliased with: 'A.R. CECINA' (ID:423)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (139, '2015-02-18 17:20:29', '2015-02-18 17:20:29', 'A.R. SSD A.R.L.', 423);


-- Processing:...'A.S.D NUOTO O.PUTINATI':

-- Processing:...'AQUATEMPRA SOC.CONS':
-- aliased with: 'AQUATEMPRA' (ID:387)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (140, '2015-02-18 17:20:29', '2015-02-18 17:20:29', 'AQUATEMPRA SOC.CONS', 387);


-- Processing:...'AQUATICA SRL':
-- aliased with: 'AQUATICA S.CASCIANO' (ID:388)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (141, '2015-02-18 17:20:29', '2015-02-18 17:20:29', 'AQUATICA SRL', 388);


-- Processing:...'ASD FORUM JANI':

-- Processing:...'DUE PONTI S.S. DIL.':
-- aliased with: 'DUE PONTI SRL' (ID:201)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (142, '2015-02-18 17:20:30', '2015-02-18 17:20:30', 'DUE PONTI S.S. DIL.', 201);


-- Processing:...'POL. SANGIULIANESE':
-- aliased with: 'POLISPORTIVA SANGIULIANESE' (ID:400)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (143, '2015-02-18 17:20:30', '2015-02-18 17:20:30', 'POL. SANGIULIANESE', 400);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CIARDI FRANCESCO' (1978, gender: 1)

-- Processing:...'DELLA CASA MONGIARDINO ANTON' (1967, gender: 2)
-- aliased with: 'DELLA CASA MONGIARDI ANTONEL' (ID:9473)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (60, '2015-02-18 17:21:02', '2015-02-18 17:21:02', 'DELLA CASA MONGIARDINO ANTON', 9473);


-- Processing:...'FAVALLI MASSIMILIANO' (1967, gender: 1)

-- Processing:...'PIERUCCI BARBARA' (1972, gender: 2)

COMMIT;
