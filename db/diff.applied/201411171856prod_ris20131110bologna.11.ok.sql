--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing 'ABANO NUOTO':
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
VALUES (13, '2014-11-17 18:59:34', '2014-11-17 18:59:34', 'ABANO NUOTO', 142);


-- Processing 'ADRIA NUOTO SSD  AR':
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
VALUES (14, '2014-11-17 18:59:34', '2014-11-17 18:59:34', 'ADRIA NUOTO SSD  AR', 152);


-- Processing 'AICS NUOTO MASTER':

-- Processing 'AQUATIC TEAM RAVENN':

-- Processing 'BRINDISI NUOTO ASD':

-- Processing 'C.U.S. BOLOGNA':

-- Processing 'CENTRO NUOTO COPPAR':

-- Processing 'CIVATURS DE AKKER':

-- Processing 'FANATIK TEAM FORLI':

-- Processing 'N MODENESI':

-- Processing 'NUOTO CENTER FORLI`':

-- Processing 'POLISPORTIVA GARDEN':

-- Processing 'RINASCITA TEAM ROMA':

-- Processing 'RN FRIULIA':

-- Processing 'SAN MARINO MASTER':

-- Processing 'SEA SUB MODENA':

-- Processing 'TRICOLORE MASTER AS':

COMMIT;
