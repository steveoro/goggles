--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'TORINO NUOTO SSD A.R.L.':
-- aliased with: 'TORINO NUOTO' (ID:687)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (714, '2016-05-16 08:11:27', '2016-05-16 08:11:27', 'TORINO NUOTO SSD A.R.L.', 687);


-- Processing:...'VIVISPORT POL.UISP FOSSANO':
-- aliased with: 'VIVISPORT POL.UISP' (ID:289)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (715, '2016-05-16 08:11:27', '2016-05-16 08:11:27', 'VIVISPORT POL.UISP FOSSANO', 289);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'D`AMICO NICOLA' (1979, gender: 1)
-- aliased with: 'D'AMICO NICOLA' (ID:13825)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (417, '2016-05-16 08:13:59', '2016-05-16 08:13:59', 'D`AMICO NICOLA', 13825);


-- Processing:...'LUCARELLI LUCA' (1979, gender: 1)

COMMIT;
