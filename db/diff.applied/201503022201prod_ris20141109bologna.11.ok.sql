--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'DE BELLIS GIULIO' (1958, gender: 1)

-- Processing:...'MENOZZI NICOLO`' (1993, gender: 1)
-- aliased with: 'MENOZZI NICOLO'' (ID:1654)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (217, '2015-03-02 22:04:57', '2015-03-02 22:04:57', 'MENOZZI NICOLO`', 1654);


COMMIT;
