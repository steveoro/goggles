--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Albatros A.S.Dilett.':
-- aliased with: 'ALBATROS ASD LUMEZZ' (ID:345)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (655, '2016-04-19 16:24:23', '2016-04-19 16:24:23', 'Albatros A.S.Dilett.', 345);


COMMIT;
