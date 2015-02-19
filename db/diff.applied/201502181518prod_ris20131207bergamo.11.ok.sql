--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CS OLIMPIC VILLONGO':

-- Processing:...'NUOTATORI PADOVANI':
-- aliased with: 'S.NUOTATORI PADOVANI A.S.D.' (ID:171)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (117, '2015-02-18 15:20:37', '2015-02-18 15:20:37', 'NUOTATORI PADOVANI', 171);


-- Processing:...'PARCO LIVENZA SRL S':

-- Processing:...'PROGETTO LAVORO A G':

-- Processing:...'SCHIO NUOTO SSD':

-- Processing:...'STRADIVARI NUOTO AS':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BASSI MARCO' (1969, gender: 1)

-- Processing:...'BENATTI VALENTINA FRANCESCA' (1989, gender: 2)

-- Processing:...'BONDIOLI RICCARDO' (1964, gender: 1)

-- Processing:...'BRUSCHETTI MATTEO' (1981, gender: 1)

-- Processing:...'CIRELLI MAURIZIO' (1958, gender: 1)

-- Processing:...'COLOMBI VALENTINO' (1988, gender: 1)

-- Processing:...'DELLA PIETA` ADRIANO' (1978, gender: 1)
-- aliased with: 'DELLA PIETA' ADRIANO' (ID:2989)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (43, '2015-02-18 15:22:16', '2015-02-18 15:22:16', 'DELLA PIETA` ADRIANO', 2989);


-- Processing:...'MELZI MATTEO TOMMASO' (1981, gender: 1)

-- Processing:...'PAMATO MARCO' (1977, gender: 1)

COMMIT;
