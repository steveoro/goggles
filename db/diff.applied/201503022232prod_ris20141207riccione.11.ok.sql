--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ACCADEMIA SPORTIVA OLBIA':

-- Processing:...'AMAT.NUOTO CASALE S':
-- aliased with: 'AM.NUOTO CASALE SCO' (ID:293)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (309, '2015-03-02 22:52:29', '2015-03-02 22:52:29', 'AMAT.NUOTO CASALE S', 293);


-- Processing:...'AQUATIK TEAM ASD':

-- Processing:...'CENTRO NUOTO MACERA':

-- Processing:...'DELPHINIA TEAM PICENO':

-- Processing:...'FIRENZE NUOTA EXTRE':

-- Processing:...'Q-BO SPORTING CLUB':

-- Processing:...'UNIQUE POOL SSD':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CICCHETTI ENZO PASQUALE' (1969, gender: 1)

-- Processing:...'DA VILLI DAVIDE' (1975, gender: 1)
-- aliased with: 'DAVILLI DAVIDE' (ID:17063)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (218, '2015-03-02 22:57:27', '2015-03-02 22:57:27', 'DA VILLI DAVIDE', 17063);


-- Processing:...'MANCINELLI DEGLI ESP LUCA' (1971, gender: 1)
-- aliased with: 'MANCINELLI DEGLI ESPOSTI LUC' (ID:5243)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (219, '2015-03-02 22:57:28', '2015-03-02 22:57:28', 'MANCINELLI DEGLI ESP LUCA', 5243);


-- Processing:...'SERVO MASSIMILIANO' (1967, gender: 1)

-- Processing:...'YOUNG LEANNE MCKINNON' (1964, gender: 2)
-- aliased with: 'YOUNG LEANNE' (ID:16136)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (220, '2015-03-02 22:57:28', '2015-03-02 22:57:28', 'YOUNG LEANNE MCKINNON', 16136);


COMMIT;
