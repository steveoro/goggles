--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.Dilett. Olbia Nuoto':
-- aliased with: 'OLBIA NUOTO ASD' (ID:546)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (694, '2016-05-09 19:15:05', '2016-05-09 19:15:05', 'A.S.Dilett. Olbia Nuoto', 546);


-- Processing:...'Athena Bracciano':
-- aliased with: 'ATHENA SP.CLUB -BRA' (ID:693)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (695, '2016-05-09 19:15:05', '2016-05-09 19:15:05', 'Athena Bracciano', 693);


-- Processing:...'Circolo Villani Ssd':
-- aliased with: 'Circ.Villani Ssd Arl' (ID:931)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (696, '2016-05-09 19:15:05', '2016-05-09 19:15:05', 'Circolo Villani Ssd', 931);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CORVIETTO FRANCESCO' (1986, gender: 1)

-- Processing:...'LA SALA GENNARO' (1961, gender: 1)

COMMIT;
