--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Nuotatori Palermo 2000':
-- aliased with: 'Asd Nuotatori Palermo 2000' (ID:928)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (678, '2016-04-20 08:43:58', '2016-04-20 08:43:58', 'Nuotatori Palermo 2000', 928);


COMMIT;
