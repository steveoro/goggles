-- Post Data-import clean-up & news log update for meetings: [14208, 14218]
UPDATE app_parameters SET a_bool='0', a_name='4.00.811.20150623 (core-six)', updated_at=NOW() WHERE id = 1;
TRUNCATE sessions;
DELETE FROM articles;
INSERT INTO articles (title, body, is_sticky, user_id, created_at, updated_at)
 VALUES ("Aggiornamento dati!", "<p>L\'applicazione è stata portata alla versione <b>4.00.811</b>.</p>\r\n<u><b>Novità:</b></u>\r\n<ul>\r\n<li>Aggiunti i risultati per il meeting <a href=\"/it/meeting/show_full/14208\">XV TROFEO NUOVO NUOTO (BOLOGNA)</a></li>\r\n<li>Aggiunti i risultati per il meeting <a href=\"/it/meeting/show_full/14218\">XXIV TROFEO NORD PADANIA (VAREDO)</a></li>\r\n</ul>\r\n", '0', '1', NOW(), NOW());
