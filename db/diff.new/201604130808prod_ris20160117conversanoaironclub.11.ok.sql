--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'SPORT CLUB S.S.D. ARL':
-- aliased with: 'SPORT CLUB SSD - BA' (ID:591)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (653, '2016-04-13 08:10:07', '2016-04-13 08:10:07', 'SPORT CLUB S.S.D. ARL', 591);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'D'IPPOLITO ALESSIO' (1981, gender: 1)

-- Processing:...'TARANTINI NICOLA' (1986, gender: 1)
-- aliased with: 'TARANTINO NICOLA' (ID:12339)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (376, '2016-04-13 08:14:36', '2016-04-13 08:14:36', 'TARANTINI NICOLA', 12339);


COMMIT;
