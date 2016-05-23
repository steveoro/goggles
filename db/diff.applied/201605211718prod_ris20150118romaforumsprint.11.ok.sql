--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CINOTTI NICOLO`' (1984, gender: 1)
-- aliased with: 'CINOTTI NICOLO'' (ID:26586)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (485, '2016-05-21 17:20:37', '2016-05-21 17:20:37', 'CINOTTI NICOLO`', 26586);


-- Processing:...'DE NIGRIS ALESSANDRO' (1984, gender: 1)

-- Processing:...'PELLE WALTER' (1963, gender: 1)
-- aliased with: 'PELLA WALTER' (ID:8282)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (486, '2016-05-21 17:20:37', '2016-05-21 17:20:37', 'PELLE WALTER', 8282);


COMMIT;
