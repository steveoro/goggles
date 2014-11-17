--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing 'Acqua In Bocca asd':

-- Processing 'CSI Roma Flaminio':

-- Processing 'Circolo Canottieri':

-- Processing 'Empire Roma ssd':

-- Processing 'Helios Village Nuot':

-- Processing 'La Piscina Crawl 20':

-- Processing 'Latina Aquateam':

-- Processing 'Rari Nantes Nomenta':

-- Processing 'SS Lazio Nuoto':
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
VALUES (11, '2014-11-17 18:54:24', '2014-11-17 18:54:24', 'SS Lazio Nuoto', 211);


-- Processing 'Sporting Club Tusco':

-- Processing 'Villaggio Sport. Es':

-- Processing 'Zero9 asd - Roma':
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
VALUES (12, '2014-11-17 18:54:24', '2014-11-17 18:54:24', 'Zero9 asd - Roma', 213);


COMMIT;
