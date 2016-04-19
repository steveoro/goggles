--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Aquafit Ssd A Rl':

-- Processing:...'Firenze Nuoto Extremo':
-- aliased with: 'FIRENZE NUOTA EXTRE' (ID:741)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (657, '2016-04-19 18:27:07', '2016-04-19 18:27:07', 'Firenze Nuoto Extremo', 741);


-- Processing:...'Uisp Vivisport Fossano':
-- aliased with: 'VIVISPORT POL.UISP' (ID:289)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (658, '2016-04-19 18:27:07', '2016-04-19 18:27:07', 'Uisp Vivisport Fossano', 289);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ALABISIO MIRKO' (1992, gender: 1)
-- aliased with: 'ALABISO MIRKO' (ID:23154)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (379, '2016-04-19 18:31:37', '2016-04-19 18:31:37', 'ALABISIO MIRKO', 23154);


-- Processing:...'COICA NICOLETTA' (1982, gender: 2)
-- aliased with: 'COICA NICOLETA' (ID:5038)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (380, '2016-04-19 18:31:37', '2016-04-19 18:31:37', 'COICA NICOLETTA', 5038);


-- Processing:...'D`ARIA ANTONIO' (1971, gender: 1)
-- aliased with: 'D'ARIA ANTONIO' (ID:22433)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (381, '2016-04-19 18:31:37', '2016-04-19 18:31:37', 'D`ARIA ANTONIO', 22433);


-- Processing:...'MELIADO` MASSIMILIANO' (1974, gender: 1)

-- Processing:...'MIHA KEIDA' (1996, gender: 2)
-- aliased with: 'MIHA KIDA' (ID:23177)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (382, '2016-04-19 18:31:37', '2016-04-19 18:31:37', 'MIHA KEIDA', 23177);


COMMIT;
