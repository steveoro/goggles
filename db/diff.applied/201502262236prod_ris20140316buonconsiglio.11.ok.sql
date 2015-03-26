--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'AQUAPOLIS SSD':
-- aliased with: 'AQUAPOLIS S.S.D. AR' (ID:420)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (223, '2015-02-26 22:40:13', '2015-02-26 22:40:13', 'AQUAPOLIS SSD', 420);


-- Processing:...'S.S. GABBIANO S.R.L':
-- aliased with: 'S.S.D. GABBIANO S.R.L.' (ID:173)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (224, '2015-02-26 22:40:13', '2015-02-26 22:40:13', 'S.S. GABBIANO S.R.L', 173);


-- Processing:...'TWV INNSBRUCK':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'DECCHINO LORENZO' (1980, gender: 1)

-- Processing:...'MARCO FAVALLI' (1984, gender: 1)
-- aliased with: 'FAVALLI MARCO' (ID:5693)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (158, '2015-02-26 22:42:49', '2015-02-26 22:42:49', 'MARCO FAVALLI', 5693);


-- Processing:...'TESTA DESIREE`' (1983, gender: 2)
-- aliased with: 'TESTA DESIREE'' (ID:14254)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (159, '2015-02-26 22:42:49', '2015-02-26 22:42:49', 'TESTA DESIREE`', 14254);


COMMIT;
