--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'AS.SO.RI.AS PROM. SOC. C.S.DI':
-- aliased with: 'AS.SO.RI ASD - FOGGIA' (ID:812)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (791, '2016-05-22 20:45:57', '2016-05-22 20:45:57', 'AS.SO.RI.AS PROM. SOC. C.S.DI', 812);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CHIARAZZO EMENUELE' (1995, gender: 1)
-- aliased with: 'CHIARAZZO EMANUELE' (ID:20573)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (502, '2016-05-22 20:48:40', '2016-05-22 20:48:40', 'CHIARAZZO EMENUELE', 20573);


COMMIT;
