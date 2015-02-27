--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'NEW SEVEN SPORT SRL':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CALIA EGIDIO' (1983, gender: 1)

-- Processing:...'DE IUDICIBUS GIUSTINA' (1970, gender: 2)
-- aliased with: 'DEIUDICIBUS GIUSTINA' (ID:15421)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (162, '2015-02-27 00:05:53', '2015-02-27 00:05:53', 'DE IUDICIBUS GIUSTINA', 15421);


COMMIT;
