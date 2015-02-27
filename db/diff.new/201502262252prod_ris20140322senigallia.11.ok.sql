--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.D.VERDEAZZURRO':
-- aliased with: 'VERDEAZZURRO ASD' (ID:385)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (225, '2015-02-26 22:54:53', '2015-02-26 22:54:53', 'A.S.D.VERDEAZZURRO', 385);


-- Processing:...'ENERGY SPLASH ASD':

-- Processing:...'FANO+SPORT ASD':
-- aliased with: 'FANO +SPORT ASD POL' (ID:306)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (226, '2015-02-26 22:54:53', '2015-02-26 22:54:53', 'FANO+SPORT ASD', 306);


COMMIT;
