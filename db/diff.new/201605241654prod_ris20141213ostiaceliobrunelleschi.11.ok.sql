--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'Club L'Aquila Nuoto':
-- aliased with: 'ASD CLUB L`AQUILA N' (ID:119)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (803, '2016-05-24 16:55:13', '2016-05-24 16:55:13', 'Club L\'Aquila Nuoto', 119);


-- Processing:...'Nuoto Sant'Egidio V':
-- aliased with: 'NUOTO S.EGIDIO V.VIBRATA' (ID:674)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (804, '2016-05-24 16:55:13', '2016-05-24 16:55:13', 'Nuoto Sant\'Egidio V', 674);


COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'D'ERRICO EMANUELE' (1984, gender: 1)
-- aliased with: 'D`ERRICO EMANUELE' (ID:8142)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (512, '2016-05-24 16:55:41', '2016-05-24 16:55:41', 'D\'ERRICO EMANUELE', 8142);


COMMIT;
