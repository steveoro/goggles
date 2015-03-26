--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A. AMICI NUOTO VIGI':
-- aliased with: 'ASS.NE AMICI DEL NU' (ID:66)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (227, '2015-02-26 23:05:29', '2015-02-26 23:05:29', 'A. AMICI NUOTO VIGI', 66);


-- Processing:...'ASD VIADANA NUOTO L':

-- Processing:...'ASS. DILETT. & CULT':

-- Processing:...'REZZATO N SSD ARL':
-- aliased with: 'REZZATO N' (ID:60)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (228, '2015-02-26 23:05:29', '2015-02-26 23:05:29', 'REZZATO N SSD ARL', 60);


COMMIT;
