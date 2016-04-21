--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'MASSIMO VARRIALE' (1968, gender: 1)
-- aliased with: 'VARRIALE MASSIMO' (ID:9386)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (401, '2016-04-21 15:17:57', '2016-04-21 15:17:57', 'MASSIMO VARRIALE', 9386);


-- Processing:...'PALMERI GIUSEPPE' (1968, gender: 1)
-- aliased with: 'PALMIERI GIUSEPPE' (ID:24731)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (402, '2016-04-21 15:17:57', '2016-04-21 15:17:57', 'PALMERI GIUSEPPE', 24731);


COMMIT;
