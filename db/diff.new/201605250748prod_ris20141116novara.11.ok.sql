--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'SPORTIVA NUOTO GROS':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'APRUZZESE CIRA ANTONELLA' (1961, gender: 2)
-- aliased with: 'APRUZZESE CIRA ANTONIA CLARA' (ID:8709)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (525, '2016-05-25 07:49:11', '2016-05-25 07:49:11', 'APRUZZESE CIRA ANTONELLA', 8709);


COMMIT;
