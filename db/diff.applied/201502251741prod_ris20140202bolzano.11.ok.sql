--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'BRESSANONE NUOTO':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'DANIELE DOMINICI' (1978, gender: 1)
-- aliased with: 'DOMINICI DANIELE' (ID:8496)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (119, '2015-02-25 17:44:15', '2015-02-25 17:44:15', 'DANIELE DOMINICI', 8496);


-- Processing:...'ROSSARO MASSIMO' (1969, gender: 1)

COMMIT;
