--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Pol. Eschilo 1  S.S.Dil.':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'GIAMPE GIORDANO' (1986, gender: 1)
-- aliased with: 'GIAMPE` GIORDANO' (ID:5168)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (411, '2016-05-01 18:26:04', '2016-05-01 18:26:04', 'GIAMPE GIORDANO', 5168);


-- Processing:...'SANATI MARCO' (1968, gender: 1)
-- aliased with: 'SANASI MARCO' (ID:3588)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (412, '2016-05-01 18:26:04', '2016-05-01 18:26:04', 'SANATI MARCO', 3588);


COMMIT;
