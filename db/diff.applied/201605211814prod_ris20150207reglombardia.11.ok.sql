--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CAN MILANO':
-- aliased with: 'CANOTTIERI MILANO ASD' (ID:895)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (782, '2016-05-21 18:17:35', '2016-05-21 18:17:35', 'CAN MILANO', 895);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'DUDA KUNTS RAUL' (1981, gender: 1)
-- aliased with: 'DUDA KUNITS RAUL' (ID:19458)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (489, '2016-05-21 18:18:39', '2016-05-21 18:18:39', 'DUDA KUNTS RAUL', 19458);


-- Processing:...'PEREGO LAURA' (1970, gender: 2)

COMMIT;
