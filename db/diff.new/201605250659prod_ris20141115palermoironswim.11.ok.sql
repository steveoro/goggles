--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'IANNELLO NICOLO'' (1985, gender: 1)
-- aliased with: 'IANNELLO NICOLO` MARIA' (ID:26135)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (521, '2016-05-25 07:01:13', '2016-05-25 07:01:13', 'IANNELLO NICOLO\'', 26135);


-- Processing:...'MULE' PELLEGRINO' (1966, gender: 1)
-- aliased with: 'MULE` PELLEGRINO' (ID:20555)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (522, '2016-05-25 07:01:13', '2016-05-25 07:01:13', 'MULE\' PELLEGRINO', 20555);


-- Processing:...'ROMANO PABLO SEBASTIAN' (1972, gender: 1)

-- Processing:...'TUMBIOLO VIVIANA' (1989, gender: 2)
-- aliased with: 'TUBIOLO VIVIANA' (ID:10345)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (523, '2016-05-25 07:01:13', '2016-05-25 07:01:13', 'TUMBIOLO VIVIANA', 10345);


COMMIT;
