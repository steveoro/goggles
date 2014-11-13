-- Inizio script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

--
-- Dump dei dati per la tabella cities
-- 

insert into cities (name,zip,area,country,country_code,lock_version,created_at,updated_at) values ('ANDRIA','?','BARI','ITALIA','ITA',0,CURDATE(),CURDATE());
insert into cities (name,zip,area,country,country_code,lock_version,created_at,updated_at) values ('VERONA','?','VERONA','ITALIA','ITA',0,CURDATE(),CURDATE());
insert into cities (name,zip,area,country,country_code,lock_version,created_at,updated_at) values ('PAGANI','?','SALERNO','ITALIA','ITA',0,CURDATE(),CURDATE());
insert into cities (name,zip,area,country,country_code,lock_version,created_at,updated_at) values ('CONVERSANO','?','BARI','ITALIA','ITA',0,CURDATE(),CURDATE());
insert into cities (name,zip,area,country,country_code,lock_version,created_at,updated_at) values ('CERTALDO','?','FIRENZE','ITALIA','ITA',0,CURDATE(),CURDATE());
insert into cities (name,zip,area,country,country_code,lock_version,created_at,updated_at) values ('LUMEZZANE','?','?','ITALIA','ITA',0,CURDATE(),CURDATE());
insert into cities (name,zip,area,country,country_code,lock_version,created_at,updated_at) values ('CIVITANOVA MARCHE','?','?','ITALIA','ITA',0,CURDATE(),CURDATE());

COMMIT;
-- Fine script