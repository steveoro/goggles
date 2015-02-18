--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.D.FPX NUOTO':

-- Processing:...'AS.DIL. R.N. VENEZIA':
-- aliased with: 'A.S.D. RARI NANTES VENEZIA' (ID:143)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (78, '2015-02-17 20:30:52', '2015-02-17 20:30:52', 'AS.DIL. R.N. VENEZIA', 143);


-- Processing:...'ESSECI NUOTO':

-- Processing:...'KGO KLAB GEST.OPERA':

-- Processing:...'M.SPORT SAN SALVO S':

-- Processing:...'TEAM PADOVA ASD':
-- aliased with: 'A.S. DIL. TEAM PADO' (ID:139)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (79, '2015-02-17 20:30:52', '2015-02-17 20:30:52', 'TEAM PADOVA ASD', 139);


-- Processing:...'TENNIS CLUB MATCH B':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BANDINI MARCO' (1971, gender: 1)

-- Processing:...'DAVI' ELISABETTA' (1967, gender: 2)
-- aliased with: 'DAVI` ELISABETTA' (ID:6703)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (24, '2015-02-17 20:32:37', '2015-02-17 20:32:37', 'DAVI\' ELISABETTA', 6703);


-- Processing:...'D`ALBA FEDERICO' (1962, gender: 1)
-- aliased with: 'D'ALBA FEDERICO' (ID:2792)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (25, '2015-02-17 20:32:37', '2015-02-17 20:32:37', 'D`ALBA FEDERICO', 2792);


-- Processing:...'MOCCIARO EMANUELE' (1987, gender: 1)

-- Processing:...'PLAZZI MASSIMILIANO' (1965, gender: 1)
-- aliased with: 'PLAZZI MASSIMO' (ID:4026)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (26, '2015-02-17 20:32:38', '2015-02-17 20:32:38', 'PLAZZI MASSIMILIANO', 4026);


-- Processing:...'SCIRE' RISICHELLA ANDREA' (1974, gender: 1)
-- aliased with: 'SCIRE` RISICHELLA ANDREA' (ID:6460)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (27, '2015-02-17 20:32:38', '2015-02-17 20:32:38', 'SCIRE\' RISICHELLA ANDREA', 6460);


COMMIT;
