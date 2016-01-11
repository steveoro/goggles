--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Chiaravalle Nuoto asd':

-- Processing:...'PRIMA SSD ARL':

-- Processing:...'USD MONTEFELTRO NUOTO':
-- aliased with: 'NUOTO MONTEFELTRO' (ID:136)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (506, '2015-12-30 08:02:43', '2015-12-30 08:02:43', 'USD MONTEFELTRO NUOTO', 136);


COMMIT;
