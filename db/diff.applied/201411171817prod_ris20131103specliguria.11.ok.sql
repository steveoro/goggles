--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing 'ADRIAKOS NUOTO ASD':
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
VALUES (8, '2014-11-17 18:21:08', '2014-11-17 18:21:08', 'ADRIAKOS NUOTO ASD', 130);


-- Processing 'AMICI DEL NUOTO FIR':

-- Processing 'AQUATICA TORINO SSD':

-- Processing 'ASD SANTA CLARA - G':

-- Processing 'BERGAMO SWIM TEAM':

-- Processing 'CIRCOLO NUOTO LUCCA':

-- Processing 'D.L.F. LIVORNO':

-- Processing 'FUTURA TIRANO':

-- Processing 'NUOTATORI GENOVESI':

-- Processing 'R.N.CAMOGLI':

-- Processing 'RAPALLO N.':

-- Processing 'REGGIANA NUOTO':

-- Processing 'RHODIGIUM NUOTO 200':
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
VALUES (9, '2014-11-17 18:21:10', '2014-11-17 18:21:10', 'RHODIGIUM NUOTO 200', 169);


-- Processing 'S.STURLA':

-- Processing 'SISPORT FIAT S.P.A.':

COMMIT;
