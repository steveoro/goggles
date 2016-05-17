--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'NOVARA NUOTO 2000 ASD':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'DEL CARRO GIANLUCA' (1985, gender: 1)
-- aliased with: 'DELCARRO GIANLUCA' (ID:10444)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (424, '2016-05-16 10:45:47', '2016-05-16 10:45:47', 'DEL CARRO GIANLUCA', 10444);


-- Processing:...'PELLIZZENI SILVIA' (1985, gender: 2)
-- aliased with: 'PELIZZENI SILVIA' (ID:10518)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (425, '2016-05-16 10:45:47', '2016-05-16 10:45:47', 'PELLIZZENI SILVIA', 10518);


-- Processing:...'SALVI MASSIMO' (1971, gender: 1)

-- Processing:...'TALLINI SARA' (1988, gender: 2)

COMMIT;
