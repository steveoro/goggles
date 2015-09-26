--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S.D. NUOTO '95 -SR':

-- Processing:...'A.S.D. TAPSOS NUOTO':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CRISAFULLI TOMMASO' (1994, gender: 1)

-- Processing:...'MUSUNSARRA SALVATORE' (1988, gender: 1)
-- aliased with: 'MUSUNSERRA SALVATORE' (ID:20102)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (266, '2015-09-26 07:09:04', '2015-09-26 07:09:04', 'MUSUNSARRA SALVATORE', 20102);


COMMIT;
