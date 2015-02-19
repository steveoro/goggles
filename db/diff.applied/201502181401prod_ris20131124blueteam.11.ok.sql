--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ASD ATLANTIDE NUOTO':

-- Processing:...'CAVASPORTS ASD':

-- Processing:...'COUNTRY SPORT AVELL':

-- Processing:...'CUS SALERNO ASD':

-- Processing:...'DELPHINIA SP.CLUB N':

-- Processing:...'GRUPPO POL.CATANZAR':

-- Processing:...'JOLLY NUOTO CL. BEN':

-- Processing:...'POMIGLIANO S.C.':

-- Processing:...'RARI NANTES NUOTO S':

-- Processing:...'REAL CASERTA NUOTO':

-- Processing:...'SAN MAURO NUOTO ASD':

-- Processing:...'SP.NUOTO PEN.SORREN':

-- Processing:...'SPORTING CLUB NUOTO':

-- Processing:...'SPORTING MERCOGLIAN':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CASILLO LORENZO' (1993, gender: 1)

-- Processing:...'DOTSENKO VLADYSLAV' (1994, gender: 1)
-- aliased with: 'DOTSENKO VLADISLAV' (ID:3390)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (39, '2015-02-18 14:08:05', '2015-02-18 14:08:05', 'DOTSENKO VLADYSLAV', 3390);


-- Processing:...'GRIMALDI GIOVANNI' (1993, gender: 1)

-- Processing:...'NARDI GIUSEPPE' (1958, gender: 1)

-- Processing:...'PORTENTE FRANCESCO' (1993, gender: 1)

-- Processing:...'RUSSO CRESCENZO' (1969, gender: 1)

-- Processing:...'SANTORO MARIA' (1990, gender: 2)

-- Processing:...'SUAREZ BRUNO' (1952, gender: 1)

COMMIT;
