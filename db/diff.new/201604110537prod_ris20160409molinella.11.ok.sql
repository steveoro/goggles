--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Arca Ssd - Oderzo':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CHIROLLI SILVIO' (1982, gender: 1)
-- aliased with: 'SILVIO CHIROLLI' (ID:24360)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (368, '2016-04-11 05:39:12', '2016-04-11 05:39:12', 'CHIROLLI SILVIO', 24360);


-- Processing:...'DELUCCA DAVIDE' (1989, gender: 1)
-- aliased with: 'DE LUCA DAVIDE' (ID:5072)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (369, '2016-04-11 05:39:12', '2016-04-11 05:39:12', 'DELUCCA DAVIDE', 5072);


-- Processing:...'PELÀ LEONARDO' (1967, gender: 1)
-- aliased with: 'PELA` LEONARDO' (ID:20978)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (370, '2016-04-11 05:39:12', '2016-04-11 05:39:12', 'PELÀ LEONARDO', 20978);


COMMIT;
