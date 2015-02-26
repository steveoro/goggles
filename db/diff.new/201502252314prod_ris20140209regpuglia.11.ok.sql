--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'AEMME ASD - LECCE':

-- Processing:...'CENTRO NUOTO BRINDI':

-- Processing:...'FLIPPER NUOTO - MOL':

-- Processing:...'ISOLA VERDE SSD':

-- Processing:...'OUTLINE NUOTO ASD':

-- Processing:...'VIGOR NUOTO BRINDIS':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CAMBO` STEFANO' (1982, gender: 1)

-- Processing:...'CARELLI ITALO' (1976, gender: 1)

-- Processing:...'CASCELLA ANGELA' (1982, gender: 2)

-- Processing:...'DE SIENA GIOVANNI' (1966, gender: 1)

-- Processing:...'D`AMBROSI GIUSEPPE' (1983, gender: 1)
-- aliased with: 'D'AMBROSI GIUSEPPE' (ID:11912)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (126, '2015-02-25 23:25:14', '2015-02-25 23:25:14', 'D`AMBROSI GIUSEPPE', 11912);


-- Processing:...'D`ONGHIA GRAZIANO' (1979, gender: 1)
-- aliased with: 'D'ONGHIA GRAZIANO' (ID:11913)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (127, '2015-02-25 23:25:14', '2015-02-25 23:25:14', 'D`ONGHIA GRAZIANO', 11913);


-- Processing:...'FIORE NICOLA' (1974, gender: 1)

-- Processing:...'GIANNOCCARO GIOVANNI' (1986, gender: 1)

-- Processing:...'RIZZO VINCENZO' (1990, gender: 1)

-- Processing:...'SGARAMELLA PASQUALE' (1985, gender: 1)

COMMIT;
