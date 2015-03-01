--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ONDA NUOTO':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'GRADOLFI FAUSTO MARIA' (1973, gender: 1)

-- Processing:...'SANTINI GABRIELE LELIO FRANCO' (1961, gender: 1)
-- aliased with: 'SANTINI GABRIELE LELIO FRANC' (ID:13169)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (171, '2015-02-28 22:02:16', '2015-02-28 22:02:16', 'SANTINI GABRIELE LELIO FRANCO', 13169);


-- Processing:...'TORTORA SARA' (1991, gender: 2)

COMMIT;
