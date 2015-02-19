--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ACLI NUOTO BRINDISI':

-- Processing:...'AIRONCLUB BIO-SPORT':

-- Processing:...'AQUARIUS PISCINA CA':

-- Processing:...'ASD PISCINA IMPERO':

-- Processing:...'ATLANTIDE NUOTO ASD':
-- aliased with: 'ASD ATLANTIDE NUOTO' (ID:484)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (149, '2015-02-19 18:03:15', '2015-02-19 18:03:15', 'ATLANTIDE NUOTO ASD', 484);


-- Processing:...'BARLETTA NUOTO':

-- Processing:...'CS IL GABBIANO PAOL':

-- Processing:...'DHARMHA SSD':

-- Processing:...'FEEL GOOD SSD':

-- Processing:...'FIMCO SPORT S.S. DI':

-- Processing:...'FRAMAROSSPORT SSD':

-- Processing:...'GESTIONE POLIV.  MO':

-- Processing:...'HYDROPOLIS NUOTO AS':

-- Processing:...'ICOS SPORTING CLUB':

-- Processing:...'MERIDIANA NUOTO TAR':

-- Processing:...'MOLFETTA NUOTO':

-- Processing:...'MS VALENZANO ASD':

-- Processing:...'MUOVI LECCE SSD':

-- Processing:...'NETIUM SSD':

-- Processing:...'NUOVA PIANETA BENESSERE':

-- Processing:...'OLTREMARE ASD - LEC':

-- Processing:...'PLANET ANDRIA SSD':

-- Processing:...'POL. DELFINIA ASD':

-- Processing:...'SPORT CLUB SSD - BA':

-- Processing:...'WATERPOLO BARI ASD':

-- Processing:...'XSPORTING SSD':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'AMBROSINO ANTONIO' (1986, gender: 1)
-- aliased with: 'AMROSINO ANTONIO' (ID:9060)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (67, '2015-02-19 18:04:21', '2015-02-19 18:04:21', 'AMBROSINO ANTONIO', 9060);


-- Processing:...'ARBORE ANTONIO' (1976, gender: 1)

-- Processing:...'AZZOLINI IGNAZIO' (1972, gender: 1)

-- Processing:...'BELLAFRONTE FRANCESCO' (1972, gender: 1)

-- Processing:...'CITARELLA MICHELE' (1984, gender: 1)

-- Processing:...'DE LEO COSIMO' (1980, gender: 1)

-- Processing:...'DIMOLA DAVIDE' (1991, gender: 1)

-- Processing:...'FERRARA PASQUALE' (1973, gender: 1)

-- Processing:...'GUIDO STEFANO' (1963, gender: 1)

-- Processing:...'LOCAFARO SIMONA' (1987, gender: 2)

-- Processing:...'MINOSA ROBERTO' (1977, gender: 1)

-- Processing:...'MOLA FILIPPO' (1980, gender: 1)

-- Processing:...'OLIVA NICOLA' (1974, gender: 1)

-- Processing:...'RIBATTI GIUSEPPE' (1972, gender: 1)

-- Processing:...'ROMANO SIMONA' (1978, gender: 2)

-- Processing:...'RUSCIANO FRANCESCO' (1966, gender: 1)

-- Processing:...'VERRI ANTONIO' (1986, gender: 1)

COMMIT;
