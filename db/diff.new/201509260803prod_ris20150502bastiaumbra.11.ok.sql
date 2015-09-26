--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'ASD LA PISCINA CRAWL':
-- aliased with: 'La Piscina Crawl 20' (ID:245)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (402, '2015-09-26 08:09:57', '2015-09-26 08:09:57', 'ASD LA PISCINA CRAWL', 245);


-- Processing:...'GRYPHUS SPORTING CLUB':

COMMIT;
