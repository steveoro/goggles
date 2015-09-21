--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'GS VIG.FUOCO G.SALZA - TO':

-- Processing:...'NUOTO CLUB TORINO':

-- Processing:...'SERGIO DE GREGORIO':
-- aliased with: 'SERGIO DEGREGORIO ROMA S.S.DI' (ID:759)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (379, '2015-09-18 14:18:09', '2015-09-18 14:18:09', 'SERGIO DE GREGORIO', 759);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'TAVERNA MICHELE' (1975, gender: 1)

COMMIT;
