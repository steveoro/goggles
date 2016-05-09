--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Sogisport Ssd - Nibionno':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'FARINA GIULIA' (1991, gender: 2)

-- Processing:...'RAINA ENRICO COLOMBO' (1958, gender: 1)
-- aliased with: 'RAINA ENRICO' (ID:17984)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (413, '2016-05-08 21:12:43', '2016-05-08 21:12:43', 'RAINA ENRICO COLOMBO', 17984);


COMMIT;
