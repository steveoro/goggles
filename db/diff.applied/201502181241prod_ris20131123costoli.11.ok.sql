--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.D.ALL ROUND':

-- Processing:...'ACCADEMIA DI SALVAM':

-- Processing:...'AQUATIC FORUM':
-- aliased with: 'FORUM SPORT CENTER S' (ID:203)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (106, '2015-02-18 12:49:31', '2015-02-18 12:49:31', 'AQUATIC FORUM', 203);


-- Processing:...'ARVALIA SWIMMING FI':

-- Processing:...'ASD MILLENNIUM':

-- Processing:...'CLUB NUOTO RIETI AS':

-- Processing:...'COSERNUOTO ASD':

-- Processing:...'EDOARDO ANTONELLI 2':

-- Processing:...'EUROPA SPORTING ASS':

-- Processing:...'FERRATELLA SPORT SR':

-- Processing:...'FLY ON THE WATER ASD':

-- Processing:...'FONTE ROMA EUR NUOTO':

-- Processing:...'FUTURA SOC. COOP.':

-- Processing:...'H2O NUOTO ASD':

-- Processing:...'H2O SPORT - CAMPOBA':

-- Processing:...'HEAVEN 2 SSD':

-- Processing:...'MANZIANA ACQUATICA':

-- Processing:...'POL. TIME OUT SSD':

-- Processing:...'RARI NANTES APRILIA':

-- Processing:...'RARI NANTES BEL POG':

-- Processing:...'RARI NANTES CAGLIAR':

-- Processing:...'ROMA 2000 SSD':

-- Processing:...'SINTESI SSD':
-- aliased with: 'SINTESI S.S.D.' (ID:194)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (107, '2015-02-18 12:49:33', '2015-02-18 12:49:33', 'SINTESI SSD', 194);


-- Processing:...'SPORT. C. ROMA ASD':

-- Processing:...'US VIS NOVA':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BELLINI STEFANO' (1982, gender: 1)

-- Processing:...'BRUNI GIUSEPPE' (1966, gender: 1)

-- Processing:...'CANNARELLA ROBERTO' (1962, gender: 1)

-- Processing:...'FEDUZI ALESSANDRA' (1987, gender: 2)
-- aliased with: 'FEDUZZI ALESSANDRA' (ID:3535)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (35, '2015-02-18 12:54:27', '2015-02-18 12:54:27', 'FEDUZI ALESSANDRA', 3535);


-- Processing:...'GIOVANNA MARTELLATO' (1965, gender: 2)

-- Processing:...'LANCELLOTTI MARINA' (1963, gender: 2)

-- Processing:...'MAZZONE FRANCESCO' (1978, gender: 1)

-- Processing:...'PARISI CHRISTIAN' (1978, gender: 1)

-- Processing:...'SIRLETO GIUSEPPE' (1970, gender: 1)
-- aliased with: 'SIRLETTO GIUSEPPE' (ID:3627)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (36, '2015-02-18 12:54:27', '2015-02-18 12:54:27', 'SIRLETO GIUSEPPE', 3627);


-- Processing:...'SPAGNOLI MARIO' (1984, gender: 1)

-- Processing:...'STRAZICIC EMANUELA' (1964, gender: 2)

COMMIT;
