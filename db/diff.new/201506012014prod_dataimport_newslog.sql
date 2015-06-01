-- Data-import for meetings: [14210]
DELETE FROM articles;
INSERT INTO articles (title, body, is_sticky, user_id, created_at, updated_at)
 VALUES ("Aggiornamento dati!", "<p>L\'applicazione è stata portata alla versione <b>4.00.801</b>.</p>\r\n<u><b>Novità:</b></u>\r\n<ul>\r\n<li>Aggiunti i risultati per il meeting <a href=\"/it/meeting/show_full/14210\">I TROFEO MASTER VITTORINO DA FELTRE (PIACENZA)</a></li>\r\n</ul>\r\n", '0', '1', NOW(), NOW());
