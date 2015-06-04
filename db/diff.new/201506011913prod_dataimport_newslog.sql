-- Post Data-import clean-up & news log update for meetings: [14210, 14223, 14224]
UPDATE app_parameters SET a_bool='0', a_name='4.00.805.20150603 (core-six)', updated_at=NOW() WHERE id = 1;
TRUNCATE sessions;
DELETE FROM articles;
INSERT INTO articles (title, body, is_sticky, user_id, created_at, updated_at)
 VALUES ("Aggiornamento dati!", "<p>L\'applicazione è stata portata alla versione <b>4.00.805</b>.</p>\r\n<u><b>Novità:</b></u>\r\n<ul>\r\n<li>Aggiunti i risultati per il meeting <a href=\"/it/meeting/show_full/14210\">I TROFEO MASTER VITTORINO DA FELTRE (PIACENZA)</a></li>\r\n<li>Aggiunti i risultati per il meeting <a href=\"/it/meeting/show_full/14223\">II TROFEO EUROPA SC (BRESCIA)</a></li>\r\n<li>Aggiunti i risultati per il meeting <a href=\"/it/meeting/show_full/14224\">III TROFEO MY SPORT (GENOVA)</a></li>\r\n<li>Aggiornati la maggior parte dei record di federazione e di squadra.</li>\r\n</ul>\r\n", '0', '1', NOW(), NOW());
