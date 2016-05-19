--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'AQAVION A.S.D.':
-- aliased with: 'AQAVION ASD - NAPOL' (ID:623)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (745, '2016-05-18 06:07:27', '2016-05-18 06:07:27', 'AQAVION A.S.D.', 623);


-- Processing:...'ASD ALBA ORIENS - CASANDR':
-- aliased with: 'ASD ALBA ORIENS' (ID:180)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (746, '2016-05-18 06:07:27', '2016-05-18 06:07:27', 'ASD ALBA ORIENS - CASANDR', 180);


-- Processing:...'POL.UISP RIVERB. ASD':

-- Processing:...'RHYFEL SSD ARL':
-- aliased with: 'RHYFLEL SSD' (ID:816)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (747, '2016-05-18 06:07:27', '2016-05-18 06:07:27', 'RHYFEL SSD ARL', 816);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CREA VINCENZO' (1991, gender: 1)
-- aliased with: 'CREA VIMCENZO' (ID:20892)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (445, '2016-05-18 06:11:23', '2016-05-18 06:11:23', 'CREA VINCENZO', 20892);


-- Processing:...'MONTI LESSANDRO' (1981, gender: 1)
-- aliased with: 'MONTI ALESSANDRO' (ID:13692)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (446, '2016-05-18 06:11:23', '2016-05-18 06:11:23', 'MONTI LESSANDRO', 13692);


-- Processing:...'PREZIOSO ANDREA' (1975, gender: 1)

-- Processing:...'VEROLA MAURO' (1989, gender: 1)

COMMIT;
