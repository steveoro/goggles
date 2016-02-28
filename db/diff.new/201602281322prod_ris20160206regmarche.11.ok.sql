--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'A.S. NANDI ARS LORET':

-- Processing:...'SALUS NUOTO - MATELICA':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'CICCARELLI PAOLA' (1974, gender: 2)

-- Processing:...'TISE` MATTEO' (1978, gender: 1)
-- aliased with: 'TISE' MATTEO' (ID:21181)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (298, '2016-02-28 13:25:15', '2016-02-28 13:25:15', 'TISE` MATTEO', 21181);


COMMIT;
