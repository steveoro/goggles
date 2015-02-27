--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ASD LACINIA NUOTO':
-- aliased with: 'LACINIA NUOTO' (ID:678)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (217, '2015-02-26 21:28:31', '2015-02-26 21:28:31', 'ASD LACINIA NUOTO', 678);


-- Processing:...'ASD SWIMBLU MILAZZO':
-- aliased with: 'NUOTO MILAZZO ASD' (ID:690)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (218, '2015-02-26 21:28:31', '2015-02-26 21:28:31', 'ASD SWIMBLU MILAZZO', 690);


-- Processing:...'POL.GIFA CITTA' DI P':
-- aliased with: 'POLISPORTIVA GIFA' (ID:510)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (219, '2015-02-26 21:28:31', '2015-02-26 21:28:31', 'POL.GIFA CITTA\' DI P', 510);


-- Processing:...'POLISPORTIVA DIL MURI ANTICHI':
-- aliased with: 'POL. DIL. MURI ANTICHI' (ID:631)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (220, '2015-02-26 21:28:31', '2015-02-26 21:28:31', 'POLISPORTIVA DIL MURI ANTICHI', 631);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CALO' CLAUDIA' (1973, gender: 2)
-- aliased with: 'CALO` CLAUDIA' (ID:9972)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (146, '2015-02-26 21:33:38', '2015-02-26 21:33:38', 'CALO\' CLAUDIA', 9972);


-- Processing:...'CICERO NICOLO` CLAUDIO DONAT' (1985, gender: 1)
-- aliased with: 'CICERO NICOLO' CLAUDIO DONATO' (ID:12815)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (147, '2015-02-26 21:33:38', '2015-02-26 21:33:38', 'CICERO NICOLO` CLAUDIO DONAT', 12815);


-- Processing:...'COCO GIUSEPPE' (1994, gender: 1)

-- Processing:...'FERRANTI NICCOLO'' (1985, gender: 1)
-- aliased with: 'FERRANTI NICOLO'' (ID:12857)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (148, '2015-02-26 21:33:38', '2015-02-26 21:33:38', 'FERRANTI NICCOLO\'', 12857);


-- Processing:...'IMPELLIZZERI LUCA' (1981, gender: 1)
-- aliased with: 'IMELLIZZERI LUCA' (ID:13847)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (149, '2015-02-26 21:33:38', '2015-02-26 21:33:38', 'IMPELLIZZERI LUCA', 13847);


-- Processing:...'LOMBARDO SERGIO' (1969, gender: 1)

-- Processing:...'NICOLOSI SONIA MARIA' (1991, gender: 2)

-- Processing:...'ROCCA ROBERTO' (1976, gender: 1)

COMMIT;
