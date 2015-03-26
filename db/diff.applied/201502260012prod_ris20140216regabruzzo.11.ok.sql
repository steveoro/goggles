--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'AS LARUS NUOTO ROMA':
-- aliased with: 'AS LARUS NUOTO' (ID:116)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (201, '2015-02-26 00:15:25', '2015-02-26 00:15:25', 'AS LARUS NUOTO ROMA', 116);


-- Processing:...'ASD BLU SPORT FOSSACESIA':

-- Processing:...'NUOTO GIULIANOVA AS':

-- Processing:...'NUOTO S.EGIDIO V.VIBRATA':

-- Processing:...'S.FRANCESCO HISTONIUM VASTO':
-- aliased with: 'S.FRANCESCO HISTONI' (ID:383)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (202, '2015-02-26 00:15:26', '2015-02-26 00:15:26', 'S.FRANCESCO HISTONIUM VASTO', 383);


COMMIT;
