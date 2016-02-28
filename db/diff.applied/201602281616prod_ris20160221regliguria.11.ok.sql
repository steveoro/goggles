--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Albaro Nervi asd':

-- Processing:...'Aqua Planet ssd - Broni':

-- Processing:...'Centro Nuoto Montecatini':
-- aliased with: 'C.N. MONTECATINI' (ID:857)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (559, '2016-02-28 16:19:35', '2016-02-28 16:19:35', 'Centro Nuoto Montecatini', 857);


-- Processing:...'CERTALDO NUOTO':

-- Processing:...'Masterlab Rosignano asd':

-- Processing:...'N.RIVAROLESI':
-- aliased with: 'NUOTATORI RIVAROLES' (ID:109)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (560, '2016-02-28 16:19:36', '2016-02-28 16:19:36', 'N.RIVAROLESI', 109);


-- Processing:...'R.N.SPEZIA ASDIL':
-- aliased with: 'R.N.SPEZIA 86' (ID:684)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (561, '2016-02-28 16:19:36', '2016-02-28 16:19:36', 'R.N.SPEZIA ASDIL', 684);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CANANZI RAFFAELLA' (1971, gender: 2)

-- Processing:...'DE PASQUALI GIANLUCA' (1988, gender: 1)

-- Processing:...'MALANDRA MICHELE' (1973, gender: 1)

COMMIT;
