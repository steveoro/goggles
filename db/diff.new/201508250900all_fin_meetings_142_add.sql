-- Leega
-- Based on Mino Forlani "Specchietto supermaster 2015"
-- Create season 2014-2015 FIN meetings with related swimming pools and cities
-- Updates existing swimming pools with more appropriate datas
-- Begin script
/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

--
-- Dump dei dati per la tabella cities
-- 
/* FIRENZE: censito nei seed di startup */
/* ROVIGO: censito nei seed di startup */
/* MILANO: censito nei seed di startup */
/* CIVITAVECCHIA: censito nei seed di startup */
/* NAPOLI: censito nei seed di startup */
/* GENOVA: censito nei seed di startup */
/* SARONNO: censito nei seed di startup */
/* L'AQUILA: censito nei seed di startup */
/* PALERMO: censito nei seed di startup */
/* VICENZA: censito nei seed di startup */
/* NOVARA: censito nei seed di startup */
/* ANDRIA: censito nei seed di startup */
/* OSIMO: censito nei seed di startup */
insert into cities (name,zip,area,country,country_code,lock_version,created_at,updated_at) values ('GORGONZOLA','?','MILANO','ITALIA','ITA',0,CURDATE(),CURDATE());
/* ROMA: censito nei seed di startup */
/* POGGIBONSI: censito nei seed di startup */
insert into cities (name,zip,area,country,country_code,lock_version,created_at,updated_at) values ('MUGNANO','?','NAPOLI','ITALIA','ITA',0,CURDATE(),CURDATE());
/* ALBENGA: censito nei seed di startup */
/* RAPALLO: censito nei seed di startup */
/* CASALE MONFERRATO: censito nei seed di startup */
/* BERGAMO: censito nei seed di startup */
/* MASSAROSA: censito nei seed di startup */
/* BOLZANO: censito nei seed di startup */
/* MODUGNO: censito nei seed di startup */
/* OSTIA: censito nei seed di startup */
/* SONDRIO: censito nei seed di startup */
/* TORTONA: censito nei seed di startup */
/* CAGLIARI: censito nei seed di startup */
/* BRESCIA: censito nei seed di startup */
/* PAGANI: censito nei seed di startup */
/* PALERMO: censito nei seed di startup */
/* AREZZO: censito nei seed di startup */
/* MILANO: censito nei seed di startup */
/* CONVERSANO: censito nei seed di startup */
/* BUONCONVENTO: censito nei seed di startup */
/* SORI: censito nei seed di startup */
/* BOLZANO: censito nei seed di startup */
/* ROMA: censito nei seed di startup */
/* TAORMINA: censito nei seed di startup */
/* PORTICI: censito nei seed di startup */
/* VITERBO: censito nei seed di startup */
/* CERTALDO: censito nei seed di startup */
/* OSTIA: censito nei seed di startup */
/* CATANIA: censito nei seed di startup */
/* PUTIGNANO: censito nei seed di startup */
insert into cities (name,zip,area,country,country_code,lock_version,created_at,updated_at) values ('LODI','?','LODI','ITALIA','ITA',0,CURDATE(),CURDATE());
/* VICENZA: censito nei seed di startup */
insert into cities (name,zip,area,country,country_code,lock_version,created_at,updated_at) values ('PATERNO''','?','CATANIA','ITALIA','ITA',0,CURDATE(),CURDATE());
/* NAPOLI: censito nei seed di startup */
/* GENOVA: censito nei seed di startup */
insert into cities (name,zip,area,country,country_code,lock_version,created_at,updated_at) values ('AVEZZANO','?','L''AQUILA','ITALIA','ITA',0,CURDATE(),CURDATE());
/* TORINO: censito nei seed di startup */
/* COLLE VAL D'ELSA: censito nei seed di startup */
insert into cities (name,zip,area,country,country_code,lock_version,created_at,updated_at) values ('ROVERETO','?','TRENTO','ITALIA','ITA',0,CURDATE(),CURDATE());
insert into cities (name,zip,area,country,country_code,lock_version,created_at,updated_at) values ('UMBERTIDE','?','PERUGIA','ITALIA','ITA',0,CURDATE(),CURDATE());
insert into cities (name,zip,area,country,country_code,lock_version,created_at,updated_at) values ('FABRIANO','?','ANCONA','ITALIA','ITA',0,CURDATE(),CURDATE());
/* CAGLIARI: censito nei seed di startup */
/* CAMPODIPIETRA: censito nei seed di startup */
/* SEREGNO: censito nei seed di startup */
/* LIGNANO SABBIADORO: censito nei seed di startup */
/* LIVORNO: censito nei seed di startup */
/* L'AQUILA: censito nei seed di startup */
insert into cities (name,zip,area,country,country_code,lock_version,created_at,updated_at) values ('MOLFETTA','?','BARI','ITALIA','ITA',0,CURDATE(),CURDATE());
/* NIBIONNO: censito nei seed di startup */
/* TRENTO: censito nei seed di startup */
/* BATTIPAGLIA: censito nei seed di startup */
/* POMEZIA: censito nei seed di startup */
insert into cities (name,zip,area,country,country_code,lock_version,created_at,updated_at) values ('LAMEZIA TERME','?','CATANZARO','ITALIA','ITA',0,CURDATE(),CURDATE());
/* PADOVA: censito nei seed di startup */
/* RAPALLO: censito nei seed di startup */
/* LUMEZZANE: censito nei seed di startup */
/* BARI: censito nei seed di startup */
/* CATANIA: censito nei seed di startup */
/* CAGLIARI: censito nei seed di startup */
/* ROMA: censito nei seed di startup */
/* PAVIA: censito nei seed di startup */
/* LUCCA: censito nei seed di startup */
insert into cities (name,zip,area,country,country_code,lock_version,created_at,updated_at) values ('CALIMERA','?','LECCE','ITALIA','ITA',0,CURDATE(),CURDATE());
/* LEGNANO: censito nei seed di startup */
/* FOLLONICA: censito nei seed di startup */
/* STRIANO: censito nei seed di startup */
/* CASTELLANA GROTTE: censito nei seed di startup */
/* CAMPODIPIETRA: censito nei seed di startup */
/* TRENTO: censito nei seed di startup */
/* GUALDO TADINO: censito nei seed di startup */
/* BARI: censito nei seed di startup */
/* PALERMO: censito nei seed di startup */
/* GENOVA: censito nei seed di startup */
/* CAGLIARI: censito nei seed di startup */
insert into cities (name,zip,area,country,country_code,lock_version,created_at,updated_at) values ('SAN DONA'' DEL PIAVE','?','VENEZIA','ITALIA','ITA',0,CURDATE(),CURDATE());
/* ROMA: censito nei seed di startup */
/* CIVITANOVA MARCHE: censito nei seed di startup */
/* MASSAROSA: censito nei seed di startup */
/* MASSA LUBRENSE: censito nei seed di startup */
/* BUSTO GAROLFO: censito nei seed di startup */
/* GENOVA: censito nei seed di startup */
/* BASTIA UMBRA: censito nei seed di startup */
/* GIULIANO: censito nei seed di startup */
insert into cities (name,zip,area,country,country_code,lock_version,created_at,updated_at) values ('SIRACUSA','?','SIRACUSA','ITALIA','ITA',0,CURDATE(),CURDATE());
insert into cities (name,zip,area,country,country_code,lock_version,created_at,updated_at) values ('TARANTO','?','TARANTO','ITALIA','ITA',0,CURDATE(),CURDATE());
/* SIRACUSA: censito nei seed di startup */
/* TREVISO: censito nei seed di startup */
/* GENOVA: censito nei seed di startup */
/* CREMONA: censito nei seed di startup */
/* PUTIGNANO: censito nei seed di startup */
/* NAPOLI: censito nei seed di startup */
/* PALERMO: censito nei seed di startup */
/* CALDIERO: censito nei seed di startup */
/* GALLARATE: censito nei seed di startup */
insert into cities (name,zip,area,country,country_code,lock_version,created_at,updated_at) values ('CANOSA DI PUGLIA','?','BARI','ITALIA','ITA',0,CURDATE(),CURDATE());
/* ROMA: censito nei seed di startup */
insert into cities (name,zip,area,country,country_code,lock_version,created_at,updated_at) values ('NOCI','?','BARI','ITALIA','ITA',0,CURDATE(),CURDATE());
insert into cities (name,zip,area,country,country_code,lock_version,created_at,updated_at) values ('SPOLETO','?','PERUGIA','ITALIA','ITA',0,CURDATE(),CURDATE());
/* TRENTO: censito nei seed di startup */
/* PADOVA: censito nei seed di startup */
/* CITTA' DI CASTELLO: censito nei seed di startup */
/* COMO: censito nei seed di startup */
/* ROMA: censito nei seed di startup */
/* CATANIA: censito nei seed di startup */
insert into cities (name,zip,area,country,country_code,lock_version,created_at,updated_at) values ('PIETRELCINA','?','BENEVENTO','ITALIA','ITA',0,CURDATE(),CURDATE());

--
-- Fix for duplicate swimming pool
--
update meeting_sessions ms set ms.swimming_pool_id = 54 where ms.swimming_pool_id = 65;
delete from swimming_pools where id = 65;

--
-- Dump dei dati per la tabella swimming_pools
-- 
/* FIRENZE Nannini caricato nei seed */
/* ROVIGO Polo acquatico caricato nei seed */
/* MILANO Samuele caricato nei seed */
/* CIVITAVECCHIA Stadio del nuoto caricato nei seed */
/* NAPOLI Scandone caricato nei seed */
/* GENOVA Sciorba caricato nei seed */
/* SARONNO Comunale caricato nei seed */
/* L'AQUILA Comunale caricato nei seed */
/* PALERMO Comunale caricato nei seed */
/* VICENZA Comunale caricato nei seed */
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Comunale','?',10,'Corso Trieste','novaracomunale25',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'NOVARA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
/* ANDRIA Comunale caricato nei seed */
/* OSIMO Comunale caricato nei seed */
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Seven Infinity','?',8,'Via Toscana, 7','gorgonzolaseveninfinity25',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'GORGONZOLA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
/* ROMA Sociale caricato nei seed */
/* POGGIBONSI Comunale caricato nei seed */
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Rhyfel Village','?',10,'Via Eugenio Montale, 100','mugnanorhyfelvillage25',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'MUGNANO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
/* ALBENGA Stadio del nuoto caricato nei seed */
/* RAPALLO Comunale caricato nei seed */
/* CASALE MONFERRATO Comunale caricato nei seed */
/* BERGAMO Italcementi caricato nei seed */
/* MASSAROSA Comunale caricato nei seed */
/* BOLZANO Pircher caricato nei seed */
/* MODUGNO Comunale caricato nei seed */
/* OSTIA Polo Natatorio caricato nei seed */
/* SONDRIO Comunale caricato nei seed */
/* TORTONA Dellepiane caricato nei seed */
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Terramaini','?',8,'?','cagliariterramaini25',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'CAGLIARI'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
/* BRESCIA Lamarmora caricato nei seed */
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Diver''s Drive','?',8,'Via Corallo, 214','paganidiversdrive25',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'PAGANI'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
/* PALERMO Comunale caricato nei seed */
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Chimera','?',8,'Viale Gramsci, 7','arezzochimera25',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'AREZZO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
/* MILANO Samuele caricato nei seed */
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Airon Club','?',8,'Traversa Via Boschetto','conversanoaironclub25',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'CONVERSANO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
/* BUONCONVENTO Comunale caricato nei seed */
/* SORI Comunale caricato nei seed */
/* BOLZANO Pircher caricato nei seed */
/* ROMA Forum caricato nei seed */
/* TAORMINA Comunale caricato nei seed */
/* PORTICI Comunale caricato nei seed */
/* VITERBO Comunale caricato nei seed */
/* CERTALDO Fiammetta caricato nei seed */
/* OSTIA Polo Natatorio caricato nei seed */
/* CATANIA Nesima caricato nei seed */
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Nadir','?',8,'Via Pietro Mascagni','putignanonadir25',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'PUTIGNANO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Comunale','?',10,'Piazzale degli Sport','lodicomunale25',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'LODI'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Comunale','?',8,'Viale Ferrarin, 71','vicenzacomunale50',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'VICENZA'),(select t.id from pool_types t where t.code = '50'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Giovanni Paolo II','?',8,'Corso Italia','paternogiovannipaoloii25',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'PATERNO'''),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
/* NAPOLI Scandone caricato nei seed */
/* GENOVA Sciorba caricato nei seed */
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Pinguino Nuoto','?',6,'Via Massa D''Albe','avezzanopinguinonuoto25',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'AVEZZANO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Palazzo del nuoto','?',8,'Via Filadelfia, 89','torinopalazzodelnuoto25',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'TORINO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
/* COLLE VAL D'ELSA Comunale caricato nei seed */
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('?','?',6,'?','roveretonp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'ROVERETO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Comunale','?',8,'Via Rodolfo Morandi, 6','umbertidecomunale25',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'UMBERTIDE'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Comunale','?',8,'Viale B. Gigli, 6','fabrianocomunale25',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'FABRIANO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
/* CAGLIARI Terramaini caricato nei seed */
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('?','?',8,'?','campodipietranp258',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'CAMPODIPIETRA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
/* SEREGNO Trabattoni caricato nei seed */
/* LIGNANO SABBIADORO Villaggio GeTur caricato nei seed */
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('La Bastia','?',8,'Via Mastacchi, 188','livornolabastia25',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'LIVORNO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
/* L'AQUILA Comunale caricato nei seed */
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Comunale','?',6,'Contrada Longone della Spina','molfettacomunale25',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'MOLFETTA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
/* NIBIONNO Wetlife caricato nei seed */
/* TRENTO Centro Sportivo Trento Nord caricato nei seed */
/* BATTIPAGLIA Balnea caricato nei seed */
/* POMEZIA Roman Sport City caricato nei seed */
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Comunale','?',6,'?','lameziatermecomunale25',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'LAMEZIA TERME'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
/* PADOVA Plebisicito caricato nei seed */
/* RAPALLO Comunale caricato nei seed */
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Comunale','?',6,'Piazzale Piscina, 6','lumezzanecomunale25',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'LUMEZZANE'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
/* BARI Sport club caricato nei seed */
/* CATANIA Nesima caricato nei seed */
/* CAGLIARI Terramaini caricato nei seed */
/* ROMA Babel caricato nei seed */
/* PAVIA Comunale caricato nei seed */
/* LUCCA ITI E. Fermi caricato nei seed */
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Calimera','?',8,'Via Armando Picchi','calimeracalimera25',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'CALIMERA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
/* LEGNANO Villa caricato nei seed */
/* FOLLONICA Comunale caricato nei seed */
/* STRIANO Falco Sport Village caricato nei seed */
/* CASTELLANA GROTTE Comunale caricato nei seed */
/* CAMPODIPIETRA Punto Com caricato nei seed */
/* TRENTO Madonna Bianca caricato nei seed */
/* GUALDO TADINO Comunale caricato nei seed */
/* BARI Tinto caricato nei seed */
/* PALERMO Polisportiva Palermo caricato nei seed */
/* GENOVA Lago Figoi caricato nei seed */
/* CAGLIARI Terramaini caricato nei seed */
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Comunale','?',6,'Via Vittorio Veneto, 22','sandonadelpiavecomunale25',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'SAN DONA'' DEL PIAVE'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
/* ROMA Aquaniene caricato nei seed */
/* CIVITANOVA MARCHE Il grillo caricato nei seed */
/* MASSAROSA Comunale caricato nei seed */
/* MASSA LUBRENSE Atlantis caricato nei seed */
/* BUSTO GAROLFO Comunale caricato nei seed */
/* GENOVA Sciorba caricato nei seed */
/* BASTIA UMBRA Comunale caricato nei seed */
/* GIULIANO Comunale caricato nei seed */
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Cittadella dello Sport','?',8,'Via Paolo Caldarella, 2','siracusacittadelladellosport50',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'SIRACUSA'),(select t.id from pool_types t where t.code = '50'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Meridiana','?',8,'Via Rigliaco, 3','tarantomeridiana25',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'TARANTO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
/* SIRACUSA Cittadella dello Sport caricato nei seed */
/* TREVISO Centro Natatorium caricato nei seed */
/* GENOVA Albaro caricato nei seed */
/* CREMONA Canottieri Baldesio caricato nei seed */
/* PUTIGNANO Nadir caricato nei seed */
/* NAPOLI Scandone caricato nei seed */
/* PALERMO Comunale caricato nei seed */
/* CALDIERO Terme di Giunone caricato nei seed */
/* GALLARATE Comunale caricato nei seed */
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Aquarius','?',5,'Via Montescupolo, 61','canosadipugliaaquarius25',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'CANOSA DI PUGLIA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Pietralata','?',8,'Via del Tufo','romapietralata50',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'ROMA'),(select t.id from pool_types t where t.code = '50'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('OtrÃ¨','?',8,'Via Zona, B39/F C.da Montedoro','nociotrÃ¨25',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'NOCI'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Comunale','?',8,'Piazza d''armi','spoletocomunale50',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'SPOLETO'),(select t.id from pool_types t where t.code = '50'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Manazzon','?',8,'Via Fogazzaro, 4','trentomanazzon50',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'TRENTO'),(select t.id from pool_types t where t.code = '50'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Comunale','?',8,'Via Decorati al Valore Civile, 2','padovacomunale50',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'PADOVA'),(select t.id from pool_types t where t.code = '50'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());
/* CITTA' DI CASTELLO Belvedere caricato nei seed */
/* COMO Comunale caricato nei seed */
/* ROMA Happy Village caricato nei seed */
/* CATANIA Plaia caricato nei seed */
INSERT INTO swimming_pools (name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES ('Aquacenter','?',6,'Via Nazionale','pietrelcinaaquacenter25',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'PIETRELCINA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella meetings
-- 
INSERT INTO meetings (id,header_date,season_id,has_warm_up_pool,is_under_25_admitted,code,has_invitation,has_start_list,are_results_acquired,max_individual_events,max_individual_events_per_session,configuration_file,description,edition,header_year,user_id,edition_type_id,timing_type_id,individual_score_computation_type_id,relay_score_computation_type_id,meeting_score_computation_type_id,team_score_computation_type_id,lock_version,created_at,updated_at) VALUES 
(14230,'2014-10-26',142,0,1,'firenzeamicidelnuoto',0,0,0,2,0,'?','TROFEO AMICI DEL NUOTO',0,'2014',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14231,'2014-10-26',142,0,1,'rovigo',0,0,0,2,0,'?','TROFEO CITTÀ DI ROVIGO',18,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14232,'2014-11-02',142,0,1,'speclombardia',0,0,0,2,0,'?','DISTANZE SPECIALI LOMBARDIA',0,'2014',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14233,'2014-11-08',142,0,1,'speclazio',0,0,0,2,0,'?','DISTANZE SPECIALI LAZIO',0,'2014',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14234,'2014-11-08',142,0,1,'speccampania',0,0,0,2,0,'?','DISTANZE SPECIALI CAMPANIA',0,'2014',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14235,'2014-11-09',142,0,1,'specliguria',0,0,0,2,0,'?','DISTANZE SPECIALI LIGURIA',0,'2014',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14236,'2014-11-09',142,0,1,'saronno',0,0,0,2,0,'?','TROFEO CITTÀ DI SARONNO',6,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14237,'2014-11-09',142,0,1,'laquiladisolidarieta',0,0,0,2,0,'?','MEETING DI SOLIDARIETA''',11,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14238,'2014-11-15',142,0,1,'palermoironswim',0,0,0,2,0,'?','TROFEO IRONSWIM',1,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14239,'2014-11-15',142,0,1,'vicenzamastervicenza',0,0,0,2,0,'?','TROFEO MASTER VICENZA',7,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14240,'2014-11-16',142,0,1,'novara',0,0,0,2,0,'?','TROFEO CITTÀ DI NOVARA',2,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14241,'2014-11-16',142,0,1,'andria',0,0,0,2,0,'?','TROFEO CITTÀ DI ANDRIA',6,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14242,'2014-11-16',142,0,1,'osimosenzatesta',0,0,0,2,0,'?','MEETING SENZA TESTA',2,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14243,'2014-11-22',142,0,1,'gorgonzola',0,0,0,2,0,'?','TROFEO CITTÀ DI VIMERCATE',32,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14244,'2014-11-23',142,0,1,'romapaolocostoli',0,0,0,2,0,'?','TROFEO PAOLO COSTOLI',4,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14245,'2014-11-23',142,0,1,'poggibonsipoggibonsi',0,0,0,2,0,'?','TROFEO POGGIBONSI',3,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14246,'2014-11-23',142,0,1,'mugnanoblueteam',0,0,0,2,0,'?','TROFEO BLUE TEAM',6,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14247,'2014-11-23',142,0,1,'albenga',0,0,0,2,0,'?','TROFEO CITTÀ DI ALBENGA',5,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14248,'2014-11-30',142,0,1,'rapallo',0,0,0,2,0,'?','TROFEO CITTÀ DI RAPALLO',20,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14249,'2014-11-30',142,0,1,'casalemonferrato',0,0,0,2,0,'?','TROFEO CITTÀ DI CASALE MONFERRATO',3,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14250,'2014-12-06',142,0,1,'bergamognecchi',0,0,0,2,0,'?','MEMORIAL GNECCHI',24,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14251,'2014-12-07',142,0,1,'massarosa',0,0,0,2,0,'?','TROFEO CITTÀ DI MASSAROSA',10,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14252,'2014-12-07',142,0,1,'bolzanomercatinodibolzano',0,0,0,2,0,'?','TROFEO MERCATINO DI BOLZANO',2,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14253,'2014-12-13',142,0,1,'modugnosantaclaus',0,0,0,2,0,'?','TROFEO SANTA CLAUS',8,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14254,'2014-12-13',142,0,1,'ostiaceliobrunelleschi',0,0,0,2,0,'?','MEMORIAL CELIO BRUNELLESCHI',6,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14255,'2015-12-13',142,0,1,'sondriolibsnef',0,0,0,2,0,'?','MEETING LIB SNEF',8,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14256,'2015-12-14',142,0,1,'tortona',0,0,0,2,0,'?','TROFEO CITTÀ DI TORTONA',11,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14257,'2015-12-20',142,0,1,'cagliaribuonnatalemaster',0,0,0,2,0,'?','BUON NATALE MASTER',0,'2015',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14258,'2015-12-21',142,0,1,'brescialeonessaditalia',0,0,0,2,0,'?','TROFEO LEONESSA D''ITALIA',2,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14259,'2015-12-21',142,0,1,'paganisprintdinatale',0,0,0,2,0,'?','SPRINT DI NATALE',1,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14260,'2014-12-21',142,0,1,'palermoduegiornidicloro',0,0,0,2,0,'?','DUE GIORNI DI CLORO',0,'2014',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14261,'2015-01-06',142,0,1,'arezzodelsaracinomaster',0,0,0,2,0,'?','MEETING DEL SARACINO MASTER',0,'2015',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14262,'2015-01-10',142,0,1,'milanomasterdds',0,0,0,2,0,'?','TROFEO MASTER DDS',17,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14263,'2015-01-11',142,0,1,'conversanoaironclub',0,0,0,2,0,'?','TROFEO AIRON CLUB',1,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14264,'2015-01-17',142,0,1,'buonconvento',0,0,0,2,0,'?','TROFEO CITTÀ DI BUONCONVENTO',5,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14265,'2015-01-18',142,0,1,'sorirnsori',0,0,0,2,0,'?','TROFEO RN SORI',4,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14266,'2014-01-18',142,0,1,'bolzanodelledolomiti',0,0,0,2,0,'?','TROFEO DELLE DOLOMITI',17,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14267,'2015-01-18',142,0,1,'romaforumsprint',0,0,0,2,0,'?','TROFEO FORUM SPRINT.',19,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14268,'2015-01-18',142,0,1,'taorminamaydayitaliamaster',0,0,0,2,0,'?','TROFEO MAYDAY ITALIA MASTER',3,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14269,'2015-01-24',142,0,1,'portici',0,0,0,2,0,'?','TROFEO DELLA CITTÀ',6,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14270,'2015-01-24',142,0,1,'viterbolarusmaster',0,0,0,2,0,'?','TROFEO LARUS MASTER',13,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14271,'2015-01-25',142,0,1,'certaldodelboccaccio',0,0,0,2,0,'?','MEETING DEL BOCCACCIO',1,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14272,'2015-01-31',142,0,1,'reglazio',0,0,0,2,0,'?','REGIONALI LAZIO',0,'2015',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14273,'2015-02-01',142,0,1,'cataniasagata',0,0,0,2,0,'?','TROFEO S. AGATA',11,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14274,'2015-02-01',142,0,1,'regpuglia',0,0,0,2,0,'?','REGIONALI PUGLIA',0,'2015',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14275,'2015-02-07',142,0,1,'reglombardia',0,0,0,2,0,'?','REGIONALI LOMBARDIA',0,'2015',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14276,'2015-02-08',142,0,1,'regvenetoefriuli',0,0,0,2,0,'?','REGIONALI VENETO E FRIULI',0,'2015',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14277,'2015-02-13',142,0,1,'regsicilia',0,0,0,2,0,'?','REGIONALI SICILIA',0,'2015',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14278,'2015-02-14',142,0,1,'regcampania',0,0,0,2,0,'?','REGIONALI CAMPANIA',0,'2015',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14279,'2015-02-15',142,0,1,'regliguria',0,0,0,2,0,'?','REGIONALI LIGURIA',0,'2015',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14280,'2015-02-21',142,0,1,'regabruzzo',0,0,0,2,0,'?','REGIONALI ABRUZZO',0,'2015',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14281,'2015-02-21',142,0,1,'regdelpiemonte',0,0,0,2,0,'?','REGIONALI DEL PIEMONTE',0,'2015',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14282,'2015-02-21',142,0,1,'regtoscana',0,0,0,2,0,'?','REGIONALI TOSCANA',0,'2015',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14283,'2015-02-22',142,0,1,'regtrentinoaltoadige',0,0,0,2,0,'?','REGIONALI TRENTINO-ALTO ADIGE',0,'2015',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14284,'2015-02-22',142,0,1,'regumbria',0,0,0,2,0,'?','REGIONALI UMBRIA',0,'2015',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14285,'2015-02-22',142,0,1,'regmarche',0,0,0,2,0,'?','REGIONALI MARCHE',0,'2015',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14286,'2015-02-28',142,0,1,'regsardegna',0,0,0,2,0,'?','REGIONALI SARDEGNA',0,'2015',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14287,'2015-03-01',142,0,1,'regmolise',0,0,0,2,0,'?','REGIONALI MOLISE',0,'2015',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14288,'2015-03-01',142,0,1,'seregnomaster',0,0,0,2,0,'?','TROFEO MASTER',10,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14289,'2015-03-01',142,0,1,'lignanosabbiadoromarco',0,0,0,2,0,'?','MEMORIAL MARCO',10,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14290,'2015-03-08',142,0,1,'livornonuotopiuswimfestival',0,0,0,2,0,'?','NUOTOPIÙ SWIM FESTIVAL',1,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14291,'2015-03-08',142,0,1,'laquilaimmotamanet',0,0,0,2,0,'?','TROFEO IMMOTA MANET',14,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14292,'2015-03-08',142,0,1,'molfettaframaros',0,0,0,2,0,'?','MEETING FRAMAROS',4,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14293,'2015-03-15',142,0,1,'nibionnolarioebrianza',0,0,0,2,0,'?','TROFEO LARIO E BRIANZA',18,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14294,'2015-03-15',142,0,1,'trentobuonconsiglionuoto',0,0,0,2,0,'?','TROFEO BUONCONSIGLIO NUOTO',5,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14295,'2015-03-15',142,0,1,'battipagliatorneomasterbalnaea',0,0,0,2,0,'?','TORNEO MASTER BALNAEA',9,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14296,'2015-03-15',142,0,1,'pomezialatinaacquateam',0,0,0,2,0,'?','TROFEO LATINA ACQUATEAM',4,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14297,'2015-03-15',142,0,1,'regcalabri',0,0,0,2,0,'?','REGIONALI CALABRI',0,'2015',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14298,'2015-03-22',142,0,1,'padovamaxzuin',0,0,0,2,0,'?','MEMORIAL MAX ZUIN',2,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14299,'2015-03-22',142,0,1,'rapallomasterdiprimavera',0,0,0,2,0,'?','TROFEO MASTER DI PRIMAVERA',2,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14300,'2015-03-22',142,0,1,'lumezzanesprintalbatros',0,0,0,2,0,'?','TROFEO SPRINT ALBATROS',1,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14301,'2015-03-22',142,0,1,'baridiprimavera',0,0,0,2,0,'?','TROFEO DI PRIMAVERA',3,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14302,'2015-03-22',142,0,1,'cataniaetnanuoto',0,0,0,2,0,'?','TROFEO ETNA NUOTO',2,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14303,'2015-03-22',142,0,1,'cagliarisardegnanuota',0,0,0,2,0,'?','SARDEGNA NUOTA',0,'2015',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14304,'2015-03-28',142,0,1,'romanantesostiensis',0,0,0,2,0,'?','TROFEO NANTES OSTIENSIS',8,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14305,'2015-03-29',142,0,1,'pavia',0,0,0,2,0,'?','TROFEO CITTÀ DI PAVIA',5,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14306,'2015-03-29',142,0,1,'luccailariadelcarretto',0,0,0,2,0,'?','TROFEO ILARIA DEL CARRETTO',8,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14307,'2015-03-29',142,0,1,'calimeraaquapool',0,0,0,2,0,'?','TROFEO AQUAPOOL',2,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14308,'2015-04-12',142,0,1,'legnano',0,0,0,2,0,'?','TROFEO CITTÀ DI LEGNANO',9,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14309,'2015-04-12',142,0,1,'follonica',0,0,0,2,0,'?','COPPA CITTÀ DI FOLLONICA',4,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14310,'2015-04-12',142,0,1,'strianocittadistriano',0,0,0,2,0,'?','MEETING CITTA'' DI STRIANO',2,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14311,'2015-04-12',142,0,1,'castellanagrotteswimonthecaves',0,0,0,2,0,'?','TROFEO SWIM ON THE CAVES',1,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14312,'2015-04-12',142,0,1,'campodipietraokmasterm2',0,0,0,2,0,'?','TROFEO OK MASTER M2',3,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14313,'2015-04-18',142,0,1,'trentotrentinomaster',0,0,0,2,0,'?','MEETING TRENTINO MASTER',28,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14314,'2015-03-18',142,0,1,'gualdotadinorolandopinacoli',0,0,0,2,0,'?','TROFEO ROLANDO PINACOLI',8,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14315,'2015-03-18',142,0,1,'baripaolopinto',0,0,0,2,0,'?','TROFEO PAOLO PINTO',6,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14316,'2015-03-18',142,0,1,'palermopolisportivapalermo',0,0,0,2,0,'?','TROFEO POLISPORTIVA PALERMO',11,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14317,'2015-04-19',142,0,1,'genovanuotoponente',0,0,0,2,0,'?','TROFEO NUOTO PONENTE',3,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14318,'2015-04-19',142,0,1,'cagliarikikkomontisci',0,0,0,2,0,'?','MEMORIAL KIKKO MONTISCI',3,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14319,'2015-04-19',142,0,1,'sandonadelpiavedelpiave',0,0,0,2,0,'?','TROFEO DEL PIAVE',2,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14320,'2015-03-25',142,0,1,'romaacqaniene',0,0,0,2,0,'?','TROFEO ACQANIENE',3,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14321,'2015-03-25',142,0,1,'civitanovamarche',0,0,0,2,0,'?','TROFEO CITTÀ DI CIVITANOVA MARCHE',2,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14322,'2015-04-26',142,0,1,'massarosagiovanniciuffrida',0,0,0,2,0,'?','MEMORIAL GIOVANNI CIUFFRIDA',15,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14323,'2015-04-26',142,0,1,'massalubrenseterredellesirene',0,0,0,2,0,'?','MEETING TERRE DELLE SIRENE',2,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14324,'2015-05-01',142,0,1,'bustogarolfo',0,0,0,2,0,'?','TROFEO DELLA CITTÀ',2,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
/* genovamysport: censito nei seed di startup */
(14325,'2015-05-02',142,0,1,'bastiaumbra',0,0,0,2,0,'?','TROFEO DELLA CITTÀ',10,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14326,'2015-05-03',142,0,1,'giulianoswim4life',0,0,0,2,0,'?','TROFEO SWIM4LIFE',3,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14327,'2015-05-03',142,0,1,'siracusasluciadellequaglie',0,0,0,2,0,'?','S.LUCIA DELLE QUAGLIE',13,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14328,'2015-05-10',142,0,1,'tarantomeridianamastercup',0,0,0,2,0,'?','MERIDIANA MASTER CUP',0,'2015',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14329,'2015-05-17',142,0,1,'siracusa',0,0,0,2,0,'?','TROFEO DELLA CITTÀ',19,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14330,'2015-04-22',142,0,1,'trevisoabettiol',0,0,0,2,0,'?','MEMORIAL A. BETTIOL',15,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14331,'2015-05-23',142,0,1,'genovapiscinedialbaro',0,0,0,2,0,'?','TROFEO PISCINE DI ALBARO',4,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14332,'2015-05-23',142,0,1,'cremonacanottieribaldesio',0,0,0,2,0,'?','MEETING CANOTTIERI BALDESIO',2,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14333,'2015-05-23',142,0,1,'putignanospeedonadir',0,0,0,2,0,'?','TROFEO SPEEDO NADIR',8,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14334,'2015-05-23',142,0,1,'napoliilgabbiano',0,0,0,2,0,'?','TROFEO IL GABBIANO',7,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14335,'2015-05-24',142,0,1,'palermopinacattarinich',0,0,0,2,0,'?','TROFEO PINA CATTARINICH',6,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14336,'2015-05-30',142,0,1,'caldierodelleterme',0,0,0,2,0,'?','TROFEO DELLE TERME',25,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14337,'2015-05-30',142,0,1,'gallarate',0,0,0,2,0,'?','MEETING DELLA CITTÀ',23,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14338,'2014-05-30',142,0,1,'canosadipugliasottolestelle',0,0,0,2,0,'?','TROFEO SOTTO LE STELLE',8,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14339,'2015-05-31',142,0,1,'romaflaminiosg',0,0,0,2,0,'?','MEETING FLAMINIO SG',15,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14340,'2015-05-31',142,0,1,'nocioltre',0,0,0,2,0,'?','TROFEO OLTRE''',1,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14341,'2015-06-02',142,0,1,'spoletodeiduemondi',0,0,0,2,0,'?','TROFEO DEI DUE MONDI',1,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14342,'2015-06-06',142,0,1,'trentonuotatoritrentini',0,0,0,2,0,'?','TROFEO NUOTATORI TRENTINI',1,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14343,'2015-06-06',142,0,1,'padova',0,0,0,2,0,'?','CITTÀ DELLA SPERANZA',1,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14344,'2015-06-06',142,0,1,'cittadicastelloitalogalluzzi',0,0,0,2,0,'?','TROFEO ITALO GALLUZZI',30,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14345,'2015-06-07',142,0,1,'comognovaticittadicomo',0,0,0,2,0,'?','MEMORIAL G NOVATI CITTA'' DI COMO',7,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14346,'2015-06-07',142,0,1,'romaromanuotomaster',0,0,0,2,0,'?','TROFEO ROMA NUOTO MASTER',1,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14347,'2015-06-07',142,0,1,'cataniadellaregione',0,0,0,2,0,'?','TROFEO DELLA REGIONE',2,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(14348,'2015-06-07',142,0,1,'pietrelcinajollynuoto',0,0,0,2,0,'?','TROFEO JOLLY NUOTO',2,'2015',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate());

--
-- Dump dei dati per la tabella meeting_sessions per Sabato mattina (o unico giorno infrasettimanale)
-- 
INSERT INTO meeting_sessions (session_order,scheduled_date,meeting_id,swimming_pool_id,warm_up_time,begin_time,notes,description,user_id,day_part_type_id,lock_version,created_at,updated_at) VALUES 
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14230 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14231 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14232 */
(1,'2014-11-08',14233,(select t.id from swimming_pools t where t.nick_name = 'civitavecchiastadiodelnuoto50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2014-11-08',14234,(select t.id from swimming_pools t where t.nick_name = 'napoliscandone50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14235 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14236 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14237 */
(1,'2014-11-15',14238,(select t.id from swimming_pools t where t.nick_name = 'palermocomunale50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2014-11-15',14239,(select t.id from swimming_pools t where t.nick_name = 'vicenzacomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14240 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14241 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14242 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14243 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14244 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14245 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14246 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14247 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14248 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14249 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14250 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14251 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14252 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14253 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14254 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14255 */
(1,'2015-12-14',14256,(select t.id from swimming_pools t where t.nick_name = 'tortonadellepiane25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14257 */
(1,'2015-12-21',14258,(select t.id from swimming_pools t where t.nick_name = 'brescialamarmora25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-12-21',14259,(select t.id from swimming_pools t where t.nick_name = 'paganidiversdrive25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14260 */
(1,'2015-01-06',14261,(select t.id from swimming_pools t where t.nick_name = 'arezzochimera25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-01-10',14262,(select t.id from swimming_pools t where t.nick_name = 'milanosamuele25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14263 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14264 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14265 */
(1,'2014-01-18',14266,(select t.id from swimming_pools t where t.nick_name = 'bolzanopircher25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14267 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14268 */
(1,'2015-01-24',14269,(select t.id from swimming_pools t where t.nick_name = 'porticicomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14270 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14271 */
(1,'2015-01-31',14272,(select t.id from swimming_pools t where t.nick_name = 'ostiapolonatatorio25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14273 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14274 */
(1,'2015-02-07',14275,(select t.id from swimming_pools t where t.nick_name = 'lodicomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14276 */
(1,'2015-02-13',14277,(select t.id from swimming_pools t where t.nick_name = 'paternogiovannipaoloii25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-02-14',14278,(select t.id from swimming_pools t where t.nick_name = 'napoliscandone50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14279 */
(1,'2015-02-21',14280,(select t.id from swimming_pools t where t.nick_name = 'avezzanopinguinonuoto25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-02-21',14281,(select t.id from swimming_pools t where t.nick_name = 'torinopalazzodelnuoto25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-02-21',14282,(select t.id from swimming_pools t where t.nick_name = 'collevaldelsacomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14283 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14284 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14285 */
(1,'2015-02-28',14286,(select t.id from swimming_pools t where t.nick_name = 'cagliariterramaini25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14287 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14288 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14289 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14290 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14291 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14292 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14293 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14294 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14295 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14296 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14297 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14298 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14299 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14300 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14301 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14302 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14303 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14304 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14305 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14306 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14307 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14308 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14309 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14310 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14311 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14312 */
(1,'2015-04-18',14313,(select t.id from swimming_pools t where t.nick_name = 'trentomadonnabianca25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14314 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14315 */
(1,'2015-03-18',14316,(select t.id from swimming_pools t where t.nick_name = 'palermopolisportivapalermo25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14317 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14318 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14319 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14320 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14321 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14322 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14323 */
(1,'2015-05-01',14324,(select t.id from swimming_pools t where t.nick_name = 'bustogarolfocomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 0 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14325 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14326 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14327 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14328 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14329 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14330 */
(1,'2015-05-23',14331,(select t.id from swimming_pools t where t.nick_name = 'genovaalbaro50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14332 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14333 */
(1,'2015-05-23',14334,(select t.id from swimming_pools t where t.nick_name = 'napoliscandone50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14335 */
(1,'2015-05-30',14336,(select t.id from swimming_pools t where t.nick_name = 'caldierotermedigiunone50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-05-30',14337,(select t.id from swimming_pools t where t.nick_name = 'gallaratecomunale50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2014-05-30',14338,(select t.id from swimming_pools t where t.nick_name = 'canosadipugliaaquarius25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14339 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14340 */
(1,'2015-06-02',14341,(select t.id from swimming_pools t where t.nick_name = 'spoletocomunale50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-06-06',14342,(select t.id from swimming_pools t where t.nick_name = 'trentomanazzon50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-06-06',14343,(select t.id from swimming_pools t where t.nick_name = 'padovacomunale50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-06-06',14344,(select t.id from swimming_pools t where t.nick_name = 'cittadicastellobelvedere50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE());
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14345 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14346 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14347 */
/* Sessione Sabato mattina (o unico giorno infrasettimanale) non presente per il meeting 14348 */

--
-- Dump dei dati per la tabella meeting_sessions per Sabato pomeriggio (o unico giorno infrasettimanale)
-- 
INSERT INTO meeting_sessions (session_order,scheduled_date,meeting_id,swimming_pool_id,warm_up_time,begin_time,notes,description,user_id,day_part_type_id,lock_version,created_at,updated_at) VALUES 
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14230 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14231 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14232 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14233 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14234 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14235 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14236 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14237 */
(2,'2014-11-15',14238,(select t.id from swimming_pools t where t.nick_name = 'palermocomunale50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2014-11-15',14239,(select t.id from swimming_pools t where t.nick_name = 'vicenzacomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14240 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14241 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14242 */
(1,'2014-11-22',14243,(select t.id from swimming_pools t where t.nick_name = 'gorgonzolaseveninfinity25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14244 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14245 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14246 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14247 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14248 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14249 */
(1,'2014-12-06',14250,(select t.id from swimming_pools t where t.nick_name = 'bergamoitalcementi25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14251 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14252 */
(1,'2014-12-13',14253,(select t.id from swimming_pools t where t.nick_name = 'modugnocomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(1,'2014-12-13',14254,(select t.id from swimming_pools t where t.nick_name = 'ostiapolonatatorio25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14255 */
(2,'2015-12-14',14256,(select t.id from swimming_pools t where t.nick_name = 'tortonadellepiane25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14257 */
(2,'2015-12-21',14258,(select t.id from swimming_pools t where t.nick_name = 'brescialamarmora25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-12-21',14259,(select t.id from swimming_pools t where t.nick_name = 'paganidiversdrive25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14260 */
(2,'2015-01-06',14261,(select t.id from swimming_pools t where t.nick_name = 'arezzochimera25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-01-10',14262,(select t.id from swimming_pools t where t.nick_name = 'milanosamuele25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14263 */
(1,'2015-01-17',14264,(select t.id from swimming_pools t where t.nick_name = 'buonconventocomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14265 */
(2,'2014-01-18',14266,(select t.id from swimming_pools t where t.nick_name = 'bolzanopircher25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14267 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14268 */
(2,'2015-01-24',14269,(select t.id from swimming_pools t where t.nick_name = 'porticicomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(1,'2015-01-24',14270,(select t.id from swimming_pools t where t.nick_name = 'viterbocomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14271 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14272 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14273 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14274 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14275 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14276 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14277 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14278 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14279 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14280 */
(2,'2015-02-21',14281,(select t.id from swimming_pools t where t.nick_name = 'torinopalazzodelnuoto25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-02-21',14282,(select t.id from swimming_pools t where t.nick_name = 'collevaldelsacomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14283 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14284 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14285 */
(2,'2015-02-28',14286,(select t.id from swimming_pools t where t.nick_name = 'cagliariterramaini25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14287 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14288 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14289 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14290 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14291 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14292 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14293 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14294 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14295 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14296 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14297 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14298 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14299 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14300 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14301 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14302 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14303 */
(1,'2015-03-28',14304,(select t.id from swimming_pools t where t.nick_name = 'romababel25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14305 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14306 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14307 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14308 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14309 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14310 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14311 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14312 */
(2,'2015-04-18',14313,(select t.id from swimming_pools t where t.nick_name = 'trentomadonnabianca25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(1,'2015-03-18',14314,(select t.id from swimming_pools t where t.nick_name = 'gualdotadinocomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(1,'2015-03-18',14315,(select t.id from swimming_pools t where t.nick_name = 'baritinto50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-03-18',14316,(select t.id from swimming_pools t where t.nick_name = 'palermopolisportivapalermo25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14317 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14318 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14319 */
(1,'2015-03-25',14320,(select t.id from swimming_pools t where t.nick_name = 'romaaquaniene25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(1,'2015-03-25',14321,(select t.id from swimming_pools t where t.nick_name = 'civitanovamarcheilgrillo25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14322 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14323 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14324 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 0 */
(1,'2015-05-02',14325,(select t.id from swimming_pools t where t.nick_name = 'bastiaumbracomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14326 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14327 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14328 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14329 */
(1,'2015-04-22',14330,(select t.id from swimming_pools t where t.nick_name = 'trevisocentronatatorium50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-05-23',14331,(select t.id from swimming_pools t where t.nick_name = 'genovaalbaro50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(1,'2015-05-23',14332,(select t.id from swimming_pools t where t.nick_name = 'cremonacanottieribaldesio50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(1,'2015-05-23',14333,(select t.id from swimming_pools t where t.nick_name = 'putignanonadir25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-05-23',14334,(select t.id from swimming_pools t where t.nick_name = 'napoliscandone50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14335 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14336 */
(2,'2015-05-30',14337,(select t.id from swimming_pools t where t.nick_name = 'gallaratecomunale50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14338 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14339 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14340 */
(2,'2015-06-02',14341,(select t.id from swimming_pools t where t.nick_name = 'spoletocomunale50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14342 */
(2,'2015-06-06',14343,(select t.id from swimming_pools t where t.nick_name = 'padovacomunale50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-06-06',14344,(select t.id from swimming_pools t where t.nick_name = 'cittadicastellobelvedere50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE());
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14345 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14346 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14347 */
/* Sessione Sabato pomeriggio (o unico giorno infrasettimanale) non presente per il meeting 14348 */

--
-- Dump dei dati per la tabella meeting_sessions per Domenica mattina
-- 
INSERT INTO meeting_sessions (session_order,scheduled_date,meeting_id,swimming_pool_id,warm_up_time,begin_time,notes,description,user_id,day_part_type_id,lock_version,created_at,updated_at) VALUES 
(1,'2014-10-26',14230,(select t.id from swimming_pools t where t.nick_name = 'firenzenannini50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2014-10-26',14231,(select t.id from swimming_pools t where t.nick_name = 'rovigopoloacquatico25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2014-11-02',14232,(select t.id from swimming_pools t where t.nick_name = 'milanosamuele50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(2,'2014-11-09',14233,(select t.id from swimming_pools t where t.nick_name = 'civitavecchiastadiodelnuoto50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(2,'2014-11-09',14234,(select t.id from swimming_pools t where t.nick_name = 'napoliscandone50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14235 */
(1,'2014-11-09',14236,(select t.id from swimming_pools t where t.nick_name = 'saronnocomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2014-11-09',14237,(select t.id from swimming_pools t where t.nick_name = 'laquilacomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(3,'2014-11-16',14238,(select t.id from swimming_pools t where t.nick_name = 'palermocomunale50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(3,'2014-11-16',14239,(select t.id from swimming_pools t where t.nick_name = 'vicenzacomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2014-11-16',14240,(select t.id from swimming_pools t where t.nick_name = 'novaracomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2014-11-16',14241,(select t.id from swimming_pools t where t.nick_name = 'andriacomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2014-11-16',14242,(select t.id from swimming_pools t where t.nick_name = 'osimocomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(2,'2014-11-23',14243,(select t.id from swimming_pools t where t.nick_name = 'gorgonzolaseveninfinity25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2014-11-23',14244,(select t.id from swimming_pools t where t.nick_name = 'romasociale50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2014-11-23',14245,(select t.id from swimming_pools t where t.nick_name = 'poggibonsicomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2014-11-23',14246,(select t.id from swimming_pools t where t.nick_name = 'mugnanorhyfelvillage25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2014-11-23',14247,(select t.id from swimming_pools t where t.nick_name = 'albengastadiodelnuoto25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2014-11-30',14248,(select t.id from swimming_pools t where t.nick_name = 'rapallocomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2014-11-30',14249,(select t.id from swimming_pools t where t.nick_name = 'casalemonferratocomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(2,'2014-12-07',14250,(select t.id from swimming_pools t where t.nick_name = 'bergamoitalcementi25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2014-12-07',14251,(select t.id from swimming_pools t where t.nick_name = 'massarosacomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2014-12-07',14252,(select t.id from swimming_pools t where t.nick_name = 'bolzanopircher25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(2,'2014-12-14',14253,(select t.id from swimming_pools t where t.nick_name = 'modugnocomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(2,'2014-12-14',14254,(select t.id from swimming_pools t where t.nick_name = 'ostiapolonatatorio25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-12-13',14255,(select t.id from swimming_pools t where t.nick_name = 'sondriocomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14256 */
(1,'2015-12-20',14257,(select t.id from swimming_pools t where t.nick_name = 'cagliariterramaini25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14258 */
/* Sessione Domenica mattina non presente per il meeting 14259 */
(1,'2014-12-21',14260,(select t.id from swimming_pools t where t.nick_name = 'palermocomunale50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14261 */
/* Sessione Domenica mattina non presente per il meeting 14262 */
(1,'2015-01-11',14263,(select t.id from swimming_pools t where t.nick_name = 'conversanoaironclub25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(2,'2015-01-18',14264,(select t.id from swimming_pools t where t.nick_name = 'buonconventocomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-01-18',14265,(select t.id from swimming_pools t where t.nick_name = 'soricomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14266 */
(1,'2015-01-18',14267,(select t.id from swimming_pools t where t.nick_name = 'romaforum25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-01-18',14268,(select t.id from swimming_pools t where t.nick_name = 'taorminacomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(3,'2015-01-25',14269,(select t.id from swimming_pools t where t.nick_name = 'porticicomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(2,'2015-01-25',14270,(select t.id from swimming_pools t where t.nick_name = 'viterbocomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-01-25',14271,(select t.id from swimming_pools t where t.nick_name = 'certaldofiammetta25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14272 */
(1,'2015-02-01',14273,(select t.id from swimming_pools t where t.nick_name = 'catanianesima50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-02-22',14274,(select t.id from swimming_pools t where t.nick_name = 'putignanonadir25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14275 */
(1,'2015-02-09',14276,(select t.id from swimming_pools t where t.nick_name = 'vicenzacomunale50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14277 */
/* Sessione Domenica mattina non presente per il meeting 14278 */
(1,'2015-02-15',14279,(select t.id from swimming_pools t where t.nick_name = 'genovasciorba25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14280 */
(3,'2015-02-22',14281,(select t.id from swimming_pools t where t.nick_name = 'torinopalazzodelnuoto25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(3,'2015-02-22',14282,(select t.id from swimming_pools t where t.nick_name = 'collevaldelsacomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-02-22',14283,(select t.id from swimming_pools t where t.nick_name = 'roveretonp256'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-02-22',14284,(select t.id from swimming_pools t where t.nick_name = 'umbertidecomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-02-22',14285,(select t.id from swimming_pools t where t.nick_name = 'fabrianocomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14286 */
(1,'2015-03-01',14287,(select t.id from swimming_pools t where t.nick_name = 'campodipietranp258'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-03-01',14288,(select t.id from swimming_pools t where t.nick_name = 'seregnotrabattoni25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-03-01',14289,(select t.id from swimming_pools t where t.nick_name = 'lignanosabbiadorovillaggiogetur50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-03-08',14290,(select t.id from swimming_pools t where t.nick_name = 'livornolabastia25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-03-08',14291,(select t.id from swimming_pools t where t.nick_name = 'laquilacomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-03-08',14292,(select t.id from swimming_pools t where t.nick_name = 'molfettacomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-03-15',14293,(select t.id from swimming_pools t where t.nick_name = 'nibionnowetlife25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-03-15',14294,(select t.id from swimming_pools t where t.nick_name = 'trentocentrosportivotrentonord25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-03-15',14295,(select t.id from swimming_pools t where t.nick_name = 'battipagliabalnea25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-03-15',14296,(select t.id from swimming_pools t where t.nick_name = 'pomeziaromansportcity25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-03-15',14297,(select t.id from swimming_pools t where t.nick_name = 'lameziatermecomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-03-22',14298,(select t.id from swimming_pools t where t.nick_name = 'padovaplebisicito25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-03-22',14299,(select t.id from swimming_pools t where t.nick_name = 'rapallocomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-03-22',14300,(select t.id from swimming_pools t where t.nick_name = 'lumezzanecomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-03-22',14301,(select t.id from swimming_pools t where t.nick_name = 'barisportclub25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-03-22',14302,(select t.id from swimming_pools t where t.nick_name = 'catanianesima50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-03-22',14303,(select t.id from swimming_pools t where t.nick_name = 'cagliariterramaini25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(2,'2015-03-29',14304,(select t.id from swimming_pools t where t.nick_name = 'romababel25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-03-29',14305,(select t.id from swimming_pools t where t.nick_name = 'paviacomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-03-29',14306,(select t.id from swimming_pools t where t.nick_name = 'luccaitiefermi25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-03-29',14307,(select t.id from swimming_pools t where t.nick_name = 'calimeracalimera25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-04-12',14308,(select t.id from swimming_pools t where t.nick_name = 'legnanovilla25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-04-12',14309,(select t.id from swimming_pools t where t.nick_name = 'follonicacomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-04-12',14310,(select t.id from swimming_pools t where t.nick_name = 'strianofalcosportvillage25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-04-12',14311,(select t.id from swimming_pools t where t.nick_name = 'castellanagrottecomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-04-12',14312,(select t.id from swimming_pools t where t.nick_name = 'campodipietrapuntocom25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14313 */
(2,'2015-03-19',14314,(select t.id from swimming_pools t where t.nick_name = 'gualdotadinocomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(2,'2015-03-19',14315,(select t.id from swimming_pools t where t.nick_name = 'baritinto50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(3,'2015-03-19',14316,(select t.id from swimming_pools t where t.nick_name = 'palermopolisportivapalermo25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-04-19',14317,(select t.id from swimming_pools t where t.nick_name = 'genovalagofigoi25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-04-19',14318,(select t.id from swimming_pools t where t.nick_name = 'cagliariterramaini25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-04-19',14319,(select t.id from swimming_pools t where t.nick_name = 'sandonadelpiavecomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(2,'2015-03-26',14320,(select t.id from swimming_pools t where t.nick_name = 'romaaquaniene25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(2,'2015-03-26',14321,(select t.id from swimming_pools t where t.nick_name = 'civitanovamarcheilgrillo25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-04-26',14322,(select t.id from swimming_pools t where t.nick_name = 'massarosacomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-04-26',14323,(select t.id from swimming_pools t where t.nick_name = 'massalubrenseatlantis25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14324 */
/* Sessione Domenica mattina non presente per il meeting 0 */
(2,'2015-05-02',14325,(select t.id from swimming_pools t where t.nick_name = 'bastiaumbracomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-05-03',14326,(select t.id from swimming_pools t where t.nick_name = 'giulianocomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-05-03',14327,(select t.id from swimming_pools t where t.nick_name = 'siracusacittadelladellosport50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-05-10',14328,(select t.id from swimming_pools t where t.nick_name = 'tarantomeridiana25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-05-17',14329,(select t.id from swimming_pools t where t.nick_name = 'siracusacittadelladellosport50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14330 */
/* Sessione Domenica mattina non presente per il meeting 14331 */
(2,'2015-05-24',14332,(select t.id from swimming_pools t where t.nick_name = 'cremonacanottieribaldesio50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(2,'2015-05-24',14333,(select t.id from swimming_pools t where t.nick_name = 'putignanonadir25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(3,'2015-05-24',14334,(select t.id from swimming_pools t where t.nick_name = 'napoliscandone50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-05-24',14335,(select t.id from swimming_pools t where t.nick_name = 'palermocomunale50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14336 */
/* Sessione Domenica mattina non presente per il meeting 14337 */
/* Sessione Domenica mattina non presente per il meeting 14338 */
(1,'2015-05-31',14339,(select t.id from swimming_pools t where t.nick_name = 'romapietralata50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-05-31',14340,(select t.id from swimming_pools t where t.nick_name = 'nociotrè25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14341 */
/* Sessione Domenica mattina non presente per il meeting 14342 */
/* Sessione Domenica mattina non presente per il meeting 14343 */
(3,'2015-06-06',14344,(select t.id from swimming_pools t where t.nick_name = 'cittadicastellobelvedere50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-06-07',14345,(select t.id from swimming_pools t where t.nick_name = 'comohappyvillage50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-06-07',14346,(select t.id from swimming_pools t where t.nick_name = 'romahappyvillage50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-06-07',14347,(select t.id from swimming_pools t where t.nick_name = 'cataniaplaia50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(1,'2015-06-07',14348,(select t.id from swimming_pools t where t.nick_name = 'pietrelcinaaquacenter25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella meeting_sessions per Domenica mattina
-- 
INSERT INTO meeting_sessions (session_order,scheduled_date,meeting_id,swimming_pool_id,warm_up_time,begin_time,notes,description,user_id,day_part_type_id,lock_version,created_at,updated_at) VALUES 
(2,'2014-10-26',14230,(select t.id from swimming_pools t where t.nick_name = 'firenzenannini50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2014-10-26',14231,(select t.id from swimming_pools t where t.nick_name = 'rovigopoloacquatico25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14232 */
/* Sessione Domenica mattina non presente per il meeting 14233 */
/* Sessione Domenica mattina non presente per il meeting 14234 */
(1,'2014-11-09',14235,(select t.id from swimming_pools t where t.nick_name = 'genovasciorba25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2014-11-09',14236,(select t.id from swimming_pools t where t.nick_name = 'saronnocomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2014-11-09',14237,(select t.id from swimming_pools t where t.nick_name = 'laquilacomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14238 */
(4,'2014-11-16',14239,(select t.id from swimming_pools t where t.nick_name = 'vicenzacomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2014-11-16',14240,(select t.id from swimming_pools t where t.nick_name = 'novaracomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2014-11-16',14241,(select t.id from swimming_pools t where t.nick_name = 'andriacomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2014-11-16',14242,(select t.id from swimming_pools t where t.nick_name = 'osimocomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(3,'2014-11-23',14243,(select t.id from swimming_pools t where t.nick_name = 'gorgonzolaseveninfinity25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2014-11-23',14244,(select t.id from swimming_pools t where t.nick_name = 'romasociale50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14245 */
(2,'2014-11-23',14246,(select t.id from swimming_pools t where t.nick_name = 'mugnanorhyfelvillage25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14247 */
/* Sessione Domenica mattina non presente per il meeting 14248 */
(2,'2014-11-30',14249,(select t.id from swimming_pools t where t.nick_name = 'casalemonferratocomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(3,'2014-12-07',14250,(select t.id from swimming_pools t where t.nick_name = 'bergamoitalcementi25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2014-12-07',14251,(select t.id from swimming_pools t where t.nick_name = 'massarosacomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2014-12-07',14252,(select t.id from swimming_pools t where t.nick_name = 'bolzanopircher25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14253 */
/* Sessione Domenica mattina non presente per il meeting 14254 */
(2,'2015-12-13',14255,(select t.id from swimming_pools t where t.nick_name = 'sondriocomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14256 */
/* Sessione Domenica mattina non presente per il meeting 14257 */
/* Sessione Domenica mattina non presente per il meeting 14258 */
/* Sessione Domenica mattina non presente per il meeting 14259 */
(2,'2014-12-21',14260,(select t.id from swimming_pools t where t.nick_name = 'palermocomunale50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14261 */
/* Sessione Domenica mattina non presente per il meeting 14262 */
(2,'2015-01-11',14263,(select t.id from swimming_pools t where t.nick_name = 'conversanoaironclub25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14264 */
/* Sessione Domenica mattina non presente per il meeting 14265 */
/* Sessione Domenica mattina non presente per il meeting 14266 */
(2,'2015-01-18',14267,(select t.id from swimming_pools t where t.nick_name = 'romaforum25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-01-18',14268,(select t.id from swimming_pools t where t.nick_name = 'taorminacomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14269 */
/* Sessione Domenica mattina non presente per il meeting 14270 */
(2,'2015-01-25',14271,(select t.id from swimming_pools t where t.nick_name = 'certaldofiammetta25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14272 */
(2,'2015-02-01',14273,(select t.id from swimming_pools t where t.nick_name = 'catanianesima50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14274 */
/* Sessione Domenica mattina non presente per il meeting 14275 */
/* Sessione Domenica mattina non presente per il meeting 14276 */
/* Sessione Domenica mattina non presente per il meeting 14277 */
/* Sessione Domenica mattina non presente per il meeting 14278 */
(2,'2015-02-15',14279,(select t.id from swimming_pools t where t.nick_name = 'genovasciorba25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14280 */
(4,'2015-02-22',14281,(select t.id from swimming_pools t where t.nick_name = 'torinopalazzodelnuoto25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(4,'2015-02-22',14282,(select t.id from swimming_pools t where t.nick_name = 'collevaldelsacomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14283 */
(2,'2015-02-22',14284,(select t.id from swimming_pools t where t.nick_name = 'umbertidecomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-02-22',14285,(select t.id from swimming_pools t where t.nick_name = 'fabrianocomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14286 */
(2,'2015-03-01',14287,(select t.id from swimming_pools t where t.nick_name = 'campodipietranp258'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-03-01',14288,(select t.id from swimming_pools t where t.nick_name = 'seregnotrabattoni25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-03-01',14289,(select t.id from swimming_pools t where t.nick_name = 'lignanosabbiadorovillaggiogetur50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-03-08',14290,(select t.id from swimming_pools t where t.nick_name = 'livornolabastia25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14291 */
(2,'2015-03-08',14292,(select t.id from swimming_pools t where t.nick_name = 'molfettacomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-03-15',14293,(select t.id from swimming_pools t where t.nick_name = 'nibionnowetlife25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-03-15',14294,(select t.id from swimming_pools t where t.nick_name = 'trentocentrosportivotrentonord25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-03-15',14295,(select t.id from swimming_pools t where t.nick_name = 'battipagliabalnea25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-03-15',14296,(select t.id from swimming_pools t where t.nick_name = 'pomeziaromansportcity25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-03-15',14297,(select t.id from swimming_pools t where t.nick_name = 'lameziatermecomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-03-22',14298,(select t.id from swimming_pools t where t.nick_name = 'padovaplebisicito25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-03-22',14299,(select t.id from swimming_pools t where t.nick_name = 'rapallocomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-03-22',14300,(select t.id from swimming_pools t where t.nick_name = 'lumezzanecomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-03-22',14301,(select t.id from swimming_pools t where t.nick_name = 'barisportclub25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-03-22',14302,(select t.id from swimming_pools t where t.nick_name = 'catanianesima50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-03-22',14303,(select t.id from swimming_pools t where t.nick_name = 'cagliariterramaini25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(3,'2015-03-29',14304,(select t.id from swimming_pools t where t.nick_name = 'romababel25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-03-29',14305,(select t.id from swimming_pools t where t.nick_name = 'paviacomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-03-29',14306,(select t.id from swimming_pools t where t.nick_name = 'luccaitiefermi25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-03-29',14307,(select t.id from swimming_pools t where t.nick_name = 'calimeracalimera25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-04-12',14308,(select t.id from swimming_pools t where t.nick_name = 'legnanovilla25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-04-12',14309,(select t.id from swimming_pools t where t.nick_name = 'follonicacomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-04-12',14310,(select t.id from swimming_pools t where t.nick_name = 'strianofalcosportvillage25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-04-12',14311,(select t.id from swimming_pools t where t.nick_name = 'castellanagrottecomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-04-12',14312,(select t.id from swimming_pools t where t.nick_name = 'campodipietrapuntocom25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14313 */
/* Sessione Domenica mattina non presente per il meeting 14314 */
(3,'2015-03-19',14315,(select t.id from swimming_pools t where t.nick_name = 'baritinto50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(4,'2015-03-19',14316,(select t.id from swimming_pools t where t.nick_name = 'palermopolisportivapalermo25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14317 */
/* Sessione Domenica mattina non presente per il meeting 14318 */
(2,'2015-04-19',14319,(select t.id from swimming_pools t where t.nick_name = 'sandonadelpiavecomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14320 */
/* Sessione Domenica mattina non presente per il meeting 14321 */
(2,'2015-04-26',14322,(select t.id from swimming_pools t where t.nick_name = 'massarosacomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-04-26',14323,(select t.id from swimming_pools t where t.nick_name = 'massalubrenseatlantis25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14324 */
/* Sessione Domenica mattina non presente per il meeting 0 */
/* Sessione Domenica mattina non presente per il meeting 14325 */
(2,'2015-05-03',14326,(select t.id from swimming_pools t where t.nick_name = 'giulianocomunale25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-05-03',14327,(select t.id from swimming_pools t where t.nick_name = 'siracusacittadelladellosport50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-05-10',14328,(select t.id from swimming_pools t where t.nick_name = 'tarantomeridiana25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-05-17',14329,(select t.id from swimming_pools t where t.nick_name = 'siracusacittadelladellosport50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14330 */
/* Sessione Domenica mattina non presente per il meeting 14331 */
/* Sessione Domenica mattina non presente per il meeting 14332 */
(3,'2015-05-24',14333,(select t.id from swimming_pools t where t.nick_name = 'putignanonadir25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(4,'2015-05-24',14334,(select t.id from swimming_pools t where t.nick_name = 'napoliscandone50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-05-24',14335,(select t.id from swimming_pools t where t.nick_name = 'palermocomunale50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14336 */
/* Sessione Domenica mattina non presente per il meeting 14337 */
/* Sessione Domenica mattina non presente per il meeting 14338 */
(2,'2015-05-31',14339,(select t.id from swimming_pools t where t.nick_name = 'romapietralata50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-05-31',14340,(select t.id from swimming_pools t where t.nick_name = 'nociotrè25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
/* Sessione Domenica mattina non presente per il meeting 14341 */
/* Sessione Domenica mattina non presente per il meeting 14342 */
/* Sessione Domenica mattina non presente per il meeting 14343 */
/* Sessione Domenica mattina non presente per il meeting 14344 */
(2,'2015-06-07',14345,(select t.id from swimming_pools t where t.nick_name = 'comohappyvillage50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-06-07',14346,(select t.id from swimming_pools t where t.nick_name = 'romahappyvillage50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-06-07',14347,(select t.id from swimming_pools t where t.nick_name = 'cataniaplaia50'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(2,'2015-06-07',14348,(select t.id from swimming_pools t where t.nick_name = 'pietrelcinaaquacenter25'),'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE());

COMMIT;
-- End script

/*
-- Elenco meeting stagione
select m.id, m.header_date, ms.scheduled_date, m.description, m.code
from meetings m
	join meeting_sessions ms on ms.meeting_id = m.id and ms.session_order = 1
where m.season_id = 142;

-- Elenco meeting incompleti stagione
select m.id, m.header_date, m.description, m.code
from meetings m
where m.season_id = 142
	and not exists (select 1 from meeting_sessions ms where ms.meeting_id = m.id and ms.session_order = 1);
*/