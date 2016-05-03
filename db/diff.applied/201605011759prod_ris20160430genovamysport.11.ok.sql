--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BERNADINELLO RAFFAELE' (1965, gender: 1)
-- aliased with: 'BERNARDINELLO RAFFAELE' (ID:14704)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (407, '2016-05-01 18:07:44', '2016-05-01 18:07:44', 'BERNADINELLO RAFFAELE', 14704);


-- Processing:...'CASSARA' PATRIZIA' (1975, gender: 2)
-- aliased with: 'CASSARA` PATRIZIA' (ID:21814)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (408, '2016-05-01 18:07:44', '2016-05-01 18:07:44', 'CASSARA\' PATRIZIA', 21814);


-- Processing:...'DIETERICH STAEFANO' (1952, gender: 1)
-- aliased with: 'DIETERICH STEFANO' (ID:6879)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (409, '2016-05-01 18:07:44', '2016-05-01 18:07:44', 'DIETERICH STAEFANO', 6879);


-- Processing:...'MIHA KEJDA' (1996, gender: 2)
-- aliased with: 'MIHA KIDA' (ID:23177)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (410, '2016-05-01 18:07:44', '2016-05-01 18:07:44', 'MIHA KEJDA', 23177);


COMMIT;
