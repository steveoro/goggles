--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'AICS PAVIA N - A':
-- aliased with: 'AICS PAVIA N' (ID:227)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (342, '2015-05-15 13:52:53', '2015-05-15 13:52:53', 'AICS PAVIA N - A', 227);


-- Processing:...'AICS PAVIA N - B':
-- aliased with: 'AICS PAVIA N' (ID:227)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (343, '2015-05-15 13:52:53', '2015-05-15 13:52:53', 'AICS PAVIA N - B', 227);


-- Processing:...'ASD 5 TERRE SWIMMIN':

-- Processing:...'CIRC.CAN.NAPOLI ASD':
-- aliased with: 'CIRCOLO CAN NAPOLI' (ID:232)
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
  VALUES (344, '2015-05-15 13:52:54', '2015-05-15 13:52:54', 'CIRC.CAN.NAPOLI ASD', 232);


-- Processing:...'PROSPORT ACQUA SSD':

-- Processing:...'TURRA AQVASPORT SSD':

COMMIT;
--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing:...'D`ANCONA TIZIANA' (1975, gender: 2)
-- aliased with: 'D'ANCONA TIZIANA' (ID:18768)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (230, '2015-05-15 14:08:46', '2015-05-15 14:08:46', 'D`ANCONA TIZIANA', 18768);


-- Processing:...'GIANNOTTI MARGHERITA' (1993, gender: 2)
-- aliased with: 'GIANOTTI MARGHERITA' (ID:19020)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (231, '2015-05-15 14:08:46', '2015-05-15 14:08:46', 'GIANNOTTI MARGHERITA', 19020);


-- Processing:...'LUCATELLO ANDREA' (1979, gender: 1)

-- Processing:...'MAGNI MASSIMILIANO' (1971, gender: 1)

-- Processing:...'PASSERINI MARCO' (1986, gender: 1)

-- Processing:...'PATTINI SERGIO MAURO' (1966, gender: 1)
-- aliased with: 'PATTINI SERGIO' (ID:6396)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (232, '2015-05-15 14:08:46', '2015-05-15 14:08:46', 'PATTINI SERGIO MAURO', 6396);


-- Processing:...'POZZI FRANCO' (1975, gender: 1)

-- Processing:...'RIZZELLO FERNANDO' (1943, gender: 1)
-- aliased with: 'RIZZIELLO FERNANDO' (ID:1793)
INSERT INTO `data_import_swimmer_aliases` (`id`, `created_at`, `updated_at`, `complete_name`, `swimmer_id`)
  VALUES (233, '2015-05-15 14:08:46', '2015-05-15 14:08:46', 'RIZZELLO FERNANDO', 1793);


-- Processing:...'TERNELLI ANDREA' (1974, gender: 1)

-- Processing:...'ZANIN CARLO' (1974, gender: 1)

COMMIT;
