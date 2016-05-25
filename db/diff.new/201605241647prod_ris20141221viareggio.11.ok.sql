--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'FRASSINETTI ELENA' (1978, gender: 2)
-- aliased with: 'FRASSINETI ELENA' (ID:9758)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (511, '2016-05-24 16:49:37', '2016-05-24 16:49:37', 'FRASSINETTI ELENA', 9758);


-- Processing:...'IACOMINI ELENA' (1974, gender: 2)

-- Processing:...'MARRUCCI GABRIELE' (1972, gender: 1)

COMMIT;
