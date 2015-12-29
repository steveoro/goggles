--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Pol. Univ. Foro Ita':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'LEONARDI MARIA' (1970, gender: 2)

-- Processing:...'URZI' EMANUELE ORAZIO FER' (1985, gender: 1)
-- aliased with: 'URZI` EMANUELE ORAZIO FERDIN' (ID:20416)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (285, '2015-12-29 20:07:44', '2015-12-29 20:07:44', 'URZI\' EMANUELE ORAZIO FER', 20416);


COMMIT;
