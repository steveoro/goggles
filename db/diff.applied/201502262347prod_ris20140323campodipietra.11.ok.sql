--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ASTERMOLI NUOTO':

-- Processing:...'NUOTO MEDITERRANEO':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'PAOLO DANIELE' (1988, gender: 1)

-- Processing:...'SORRENTINO PIETRO ANTONIO' (1981, gender: 1)
-- aliased with: 'SORRENTINO ANTONIO' (ID:16979)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (161, '2015-02-26 23:50:13', '2015-02-26 23:50:13', 'SORRENTINO PIETRO ANTONIO', 16979);


COMMIT;
