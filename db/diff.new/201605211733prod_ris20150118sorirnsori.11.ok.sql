--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'C.N.SESTRI':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'GEZZI EDOARDO' (1994, gender: 1)
-- aliased with: 'GHEZZI EDOARDO' (ID:19398)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (487, '2016-05-21 17:34:28', '2016-05-21 17:34:28', 'GEZZI EDOARDO', 19398);


-- Processing:...'MARZOLA MICHELE' (1966, gender: 1)
-- aliased with: 'MARZOLLA MICHELE' (ID:19410)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (488, '2016-05-21 17:34:28', '2016-05-21 17:34:28', 'MARZOLA MICHELE', 19410);


COMMIT;
