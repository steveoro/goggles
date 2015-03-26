--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'UISP VALDIMAGRA':
-- aliased with: 'UISP NUOTO VALDIMAG' (ID:598)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (229, '2015-02-26 23:39:52', '2015-02-26 23:39:52', 'UISP VALDIMAGRA', 598);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ARMENTO MASSIMILIANO' (1975, gender: 1)
-- aliased with: 'ARMENDO MASSIMILIANO' (ID:12688)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (160, '2015-02-26 23:40:01', '2015-02-26 23:40:01', 'ARMENTO MASSIMILIANO', 12688);


COMMIT;
