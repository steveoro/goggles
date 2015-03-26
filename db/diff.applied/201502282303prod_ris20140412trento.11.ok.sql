--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'AMICI DEL NUOTO FIRENZE SSD':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ARGENTO DIANA' (1987, gender: 2)

-- Processing:...'GECCELE GABRIELE' (1986, gender: 1)
-- aliased with: 'GEZZELE GABRIELE' (ID:8528)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (175, '2015-02-28 23:05:15', '2015-02-28 23:05:15', 'GECCELE GABRIELE', 8528);


-- Processing:...'JANA PETRIS' (1977, gender: 2)
-- aliased with: 'PETRIS JANA' (ID:12659)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (176, '2015-02-28 23:05:15', '2015-02-28 23:05:15', 'JANA PETRIS', 12659);


-- Processing:...'NADJA KURZ' (1969, gender: 2)
-- aliased with: 'KURZ NADJA' (ID:8563)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (177, '2015-02-28 23:05:15', '2015-02-28 23:05:15', 'NADJA KURZ', 8563);


-- Processing:...'SCHILIRO` MARCO' (1984, gender: 1)
-- aliased with: 'SCHILIRO' MARCO' (ID:7873)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (178, '2015-02-28 23:05:15', '2015-02-28 23:05:15', 'SCHILIRO` MARCO', 7873);


COMMIT;
