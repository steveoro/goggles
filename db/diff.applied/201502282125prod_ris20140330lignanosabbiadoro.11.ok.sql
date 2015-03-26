--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'GORIZIA NUOTO':
-- aliased with: 'A.S.DILETT. GORIZIA' (ID:633)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (242, '2015-02-28 21:28:00', '2015-02-28 21:28:00', 'GORIZIA NUOTO', 633);


-- Processing:...'SAN VITO NUOTO':
-- aliased with: 'A.S. DILETT. SAN VITO' (ID:140)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (243, '2015-02-28 21:28:00', '2015-02-28 21:28:00', 'SAN VITO NUOTO', 140);


-- Processing:...'TAVAGNACCO NUOTO':

-- Processing:...'UNIONE NUOTO FRIULI':
-- aliased with: 'U.N.FRIULI A.S.DILE' (ID:639)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (244, '2015-02-28 21:28:00', '2015-02-28 21:28:00', 'UNIONE NUOTO FRIULI', 639);


COMMIT;
