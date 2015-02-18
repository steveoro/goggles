--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CENTRO SPORT. OLIMP':
-- aliased with: 'CENTRO SPORTIVO LE OLIMPIADI' (ID:505)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (138, '2015-02-18 17:08:22', '2015-02-18 17:08:22', 'CENTRO SPORT. OLIMP', 505);


-- Processing:...'CLUB WASKEN BOYS':

-- Processing:...'FUMANE NUOTO ASD':

-- Processing:...'LAVAGNA 90':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'COLOMBINI ENRICO' (1974, gender: 1)

-- Processing:...'PIVA FRANCESCO' (1978, gender: 1)

COMMIT;
