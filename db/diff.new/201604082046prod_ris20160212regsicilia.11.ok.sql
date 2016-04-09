--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Aquagym Asd - Trapani':
-- aliased with: 'AQUAGYM ASD' (ID:502)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (641, '2016-04-08 20:52:22', '2016-04-08 20:52:22', 'Aquagym Asd - Trapani', 502);


-- Processing:...'Asd Nuotatori Palermo 2000':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'DIBELLA SARA CLARISSA' (1994, gender: 2)
-- aliased with: 'DI BELLA SARA CLARISSA' (ID:20044)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (357, '2016-04-08 20:53:36', '2016-04-08 20:53:36', 'DIBELLA SARA CLARISSA', 20044);


-- Processing:...'D`AMICO DOMENICO' (1967, gender: 1)
-- aliased with: 'D'AMICO DOMENICO' (ID:18368)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (358, '2016-04-08 20:53:36', '2016-04-08 20:53:36', 'D`AMICO DOMENICO', 18368);


-- Processing:...'PALAZZETTI GUGLIELMO' (1984, gender: 1)

-- Processing:...'PARRINELLO MARCO' (1986, gender: 1)

-- Processing:...'RUSSO ADRIANO' (1986, gender: 1)

-- Processing:...'RUSSO ELIANA' (1986, gender: 2)

-- Processing:...'VILLARI ALESSANDRO' (1984, gender: 1)

COMMIT;
