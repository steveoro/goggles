--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ASD VERDEAZZURRO':
-- aliased with: 'VERDEAZZURRO ASD' (ID:385)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (728, '2016-05-16 11:12:28', '2016-05-16 11:12:28', 'ASD VERDEAZZURRO', 385);


-- Processing:...'NUOTO CLUB CHIARAVALLE':
-- aliased with: 'Chiaravalle Nuoto asd' (ID:848)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (729, '2016-05-16 11:12:28', '2016-05-16 11:12:28', 'NUOTO CLUB CHIARAVALLE', 848);


-- Processing:...'PRIMA S.S.DILETT. ARL':
-- aliased with: 'PRIMA SSD ARL' (ID:849)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (730, '2016-05-16 11:12:28', '2016-05-16 11:12:28', 'PRIMA S.S.DILETT. ARL', 849);


COMMIT;
