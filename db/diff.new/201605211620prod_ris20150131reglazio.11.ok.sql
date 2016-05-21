--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'D'AMBROSIO ALICE' (1990, gender: 2)
-- aliased with: 'D`AMBROSIO ALICE' (ID:25963)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (474, '2016-05-21 16:23:59', '2016-05-21 16:23:59', 'D\'AMBROSIO ALICE', 25963);


-- Processing:...'DE NARDI VALENTINA' (1983, gender: 2)

-- Processing:...'FRANZESE VITTORIO' (1970, gender: 1)

COMMIT;
