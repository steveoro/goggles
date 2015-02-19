--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.D. NUOTO GIUNONE':
-- aliased with: 'AS L. NUOTO GIUNONE' (ID:99)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (108, '2015-02-18 13:20:56', '2015-02-18 13:20:56', 'A.S.D. NUOTO GIUNONE', 99);


-- Processing:...'AMICI NUOTO RIVA':

-- Processing:...'AS MERANO':

-- Processing:...'BOLZANO NUOTO':

-- Processing:...'DELPHIN 77 HERZOGENAURACH':

-- Processing:...'GCG TRITEAM':

-- Processing:...'GS VIGILI FUOCO RAV':

-- Processing:...'NOTTOLI NUOTO SSD':
-- aliased with: 'NOTTOLI NUOTO s.r.l. s.s.d.' (ID:162)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (109, '2015-02-18 13:20:58', '2015-02-18 13:20:58', 'NOTTOLI NUOTO SSD', 162);


-- Processing:...'PVK BRATISLAVA':

-- Processing:...'S.S.V. BOZEN':

-- Processing:...'SALZBURGER TURNVEREIN':

-- Processing:...'SC DONAU WIEN':

-- Processing:...'SC PRINZ EUGEN MÜNCHEN':

-- Processing:...'SC WASSERFREUNDE MÜNCHEN':

-- Processing:...'SC WÖRGL':

-- Processing:...'SCHWIMMCLUB INNSBRUCK':

-- Processing:...'SG STADTWERKE MÜNCHEN':

-- Processing:...'SPORT & FITNESS SSD':

-- Processing:...'SPORTIVAMENTE BELLU':

-- Processing:...'SS BUONCONSIGLIO N':

-- Processing:...'SSV BRIXEN':

-- Processing:...'SSV ULM 1846':

-- Processing:...'SU CITYNET HALL':

-- Processing:...'TIROLER WASSERSPORTV INNSBRUC':

-- Processing:...'TS DORNBIRN':

-- Processing:...'TSV 1860 ROSENHEIM':

-- Processing:...'TWV BRIXLEGG':

-- Processing:...'VFL 1990 GERA':

-- Processing:...'VSK UK BRATISLAVA':

-- Processing:...'WOLFSBERGER SCHWIMMVEREIN':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BERTANZA STEFANO' (1974, gender: 1)

-- Processing:...'CALIARI STEFANO' (1983, gender: 1)

-- Processing:...'MARINI DIEGO GIUSEPPE' (1965, gender: 1)
-- aliased with: 'MARINI DIEGO' (ID:1986)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (37, '2015-02-18 13:22:35', '2015-02-18 13:22:35', 'MARINI DIEGO GIUSEPPE', 1986);


-- Processing:...'MAZZOLENI CARLO' (1980, gender: 1)

-- Processing:...'NARDON MARZIA' (1978, gender: 2)

-- Processing:...'SPELOZZO DANIELE' (1986, gender: 1)

COMMIT;
