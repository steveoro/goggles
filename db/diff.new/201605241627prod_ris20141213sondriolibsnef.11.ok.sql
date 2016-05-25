--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CARRAZZO DARIO' (1973, gender: 1)
-- aliased with: 'CARROZZA DARIO' (ID:20167)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (510, '2016-05-24 16:28:43', '2016-05-24 16:28:43', 'CARRAZZO DARIO', 20167);


COMMIT;
