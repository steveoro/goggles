--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'FOLTZER S.S.DILETT.':
-- aliased with: 'FOLTZER N.' (ID:326)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (365, '2015-09-13 09:28:48', '2015-09-13 09:28:48', 'FOLTZER S.S.DILETT.', 326);


-- Processing:...'S.S.D. G.P. NUOTO M':
-- aliased with: 'S.S.D. G.P. NUOTO MIRA a r.l.' (ID:172)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (366, '2015-09-13 09:28:48', '2015-09-13 09:28:48', 'S.S.D. G.P. NUOTO M', 172);


-- Processing:...'SOC. CANOTTIERI MIN':
-- aliased with: 'CAN MINCIO' (ID:108)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (367, '2015-09-13 09:28:48', '2015-09-13 09:28:48', 'SOC. CANOTTIERI MIN', 108);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'DAMINATO ELENA' (1980, gender: 2)

-- Processing:...'GALLO NICOLA' (1978, gender: 1)

-- Processing:...'PAULETTO JESSICA' (1990, gender: 2)

-- Processing:...'ZILLI PAOLO' (1977, gender: 1)

COMMIT;
