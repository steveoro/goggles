--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Antares Nuoto - Castelfra':
-- aliased with: 'ANTARES N CASTELFRA' (ID:373)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (617, '2016-03-30 07:34:17', '2016-03-30 07:34:17', 'Antares Nuoto - Castelfra', 373);


-- Processing:...'Ssd 2001 Srl - Padova':
-- aliased with: 'SOC. S. D. 2001 SRL - PADOVA' (ID:177)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (618, '2016-03-30 07:34:17', '2016-03-30 07:34:17', 'Ssd 2001 Srl - Padova', 177);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ALEXANDER PLACHETA' (1967, gender: 1)
-- aliased with: 'PLACHETA ALEXANDER' (ID:8617)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (329, '2016-03-30 07:34:42', '2016-03-30 07:34:42', 'ALEXANDER PLACHETA', 8617);


-- Processing:...'BONETTI TOMMASO' (1988, gender: 1)

COMMIT;
