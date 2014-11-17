--
-- *** Suggested SQL actions: ***
--

SET AUTOCOMMIT = 0;
START TRANSACTION;


-- Processing 'AICS PAVIA N':

-- Processing 'AQVASPORT LARIO SSD':
INSERT INTO `data_import_team_aliases` (`id`, `created_at`, `updated_at`, `name`, `team_id`)
VALUES (10, '2014-11-17 18:34:40', '2014-11-17 18:34:40', 'AQVASPORT LARIO SSD', 91);


-- Processing 'BUSTO NUOTO AS':

-- Processing 'CAN LECCO':

-- Processing 'CARONNO P N':

-- Processing 'CILO SRL SSD':

-- Processing 'CIRCOLO CAN NAPOLI':

-- Processing 'CN UISP BOLOGNA':

-- Processing 'CSS VERONA':

-- Processing 'GEAS':

-- Processing 'MILANO NUOTO MASTER':

-- Processing 'MOZZATE SPORT SSD':

-- Processing 'NC SEREGNO':

-- Processing 'NUOTATORI MILANESI':

COMMIT;
