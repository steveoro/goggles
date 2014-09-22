/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

-- Pulisco tutto quello che compete a questo seed
DELETE FROM meeting_sessions where meeting_id > 13220 and meeting_id < 13331;
DELETE FROM meetings where id > 13220 and id < 13331;
DELETE FROM swimming_pools  where id > 61 and id < 144;
DELETE FROM cities where id > 59 and id < 127;

--
-- Dump dei dati per la tabella cities
-- 
insert into cities (id,name,zip,area,country,country_code,lock_version,created_at,updated_at) values 
/* VEROLANUOVA: censito nei seed di startup */
/* ROVIGO: censito nei seed di startup */
(60,'STRIANO','?','NAPOLI','ITALIA','ITA',0,CURDATE(),CURDATE()),
(61,'OSIMO','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(62,'MILANO','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* GENOVA: censito nei seed di startup */
(63,'L''AQUILA','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(64,'NOVARA','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(65,'CIVITAVECCHIA','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(66,'SARONNO','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* BOLOGNA: censito nei seed di startup */
(67,'ALBENGA','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(68,'VICENZA','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(69,'POGGIBONSI','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(70,'VIMERCATE','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(71,'INNSBRUCK','?','?','AUSTRIA','AUT',0,CURDATE(),CURDATE()),
(72,'ROMA','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* FORLI': censito nei seed di startup */
(73,'GIULIANO','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(74,'OLBIA','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* RAPALLO: censito nei seed di startup */
(75,'CASALE MONFERRATO','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(76,'PALERMO','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(77,'MASSAROSA','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(78,'BERGAMO','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* RICCIONE: censito nei seed di startup */
/* ROMA: censito nei seed di startup */
(79,'MODUGNO','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(80,'TORTONA','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* PARMA: censito nei seed di startup */
/* LIVORNO: censito nei seed di startup */
(81,'PESCARA','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(82,'BOLZANO','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(83,'CAGLIARI','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* BRESCIA: censito nei seed di startup */
/* VIAREGGIO: censito nei seed di startup */
/* STRIANO: censito nei seed di startup */
/* MILANO: censito nei seed di startup */
/* RAVENNA: censito nei seed di startup */
(84,'SORI','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* BOLZANO: censito nei seed di startup */
(85,'TAORMINA','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(86,'BUONCONVENTO','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(87,'CORATO','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* ROMA: censito nei seed di startup */
/* GUSSAGO: censito nei seed di startup */
(88,'PORTICI','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(89,'CATANIA','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* LIGNANO SABBIADORO: censito nei seed di startup */
(90,'TORINO','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* BOLZANO: censito nei seed di startup */
/* ROMA: censito nei seed di startup */
(91,'COLLE VAL D''ELSA','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* BRESCIA: censito nei seed di startup */
(92,'NAPOLI','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* RICCIONE: censito nei seed di startup */
(93,'PUTIGNANO','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* PESCARA: censito nei seed di startup */
(94,'CATANZARO','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(95,'SEREGNO','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* GENOVA: censito nei seed di startup */
(96,'BASTIA','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(97,'SENIGALLIA','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* BRESCIA: censito nei seed di startup */
(98,'VITERBO','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* PALERMO: censito nei seed di startup */
/* L'AQUILA: censito nei seed di startup */
(99,'FIRENZE','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(100,'CANTU''','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(101,'TRENTO','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(102,'BASTIA UMBRA','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(103,'BATTIPAGLIA','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(104,'POMEZIA','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(105,'NIBIONNO','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* CATANIA: censito nei seed di startup */
/* SENIGALLIA: censito nei seed di startup */
/* PADOVA: censito nei seed di startup */
/* RAPALLO: censito nei seed di startup */
(106,'FOLLONICA','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(107,'CAMPODIPIETRA','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(108,'BARI','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* CAGLIARI: censito nei seed di startup */
/* ROMA: censito nei seed di startup */
(109,'PAVIA','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* LIGNANO SABBIADORO: censito nei seed di startup */
/* BOLOGNA: censito nei seed di startup */
(110,'LUCCA','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* BRESCIA: censito nei seed di startup */
(111,'BARRA','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(112,'CASTELLANA GROTTE','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* TRENTO: censito nei seed di startup */
/* PALERMO: censito nei seed di startup */
/* MOLINELLA: censito nei seed di startup */
(113,'GUALDO TADINO','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* GENOVA: censito nei seed di startup */
(114,'LEGNANO','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(115,'S.DONA'' DI PIAVE','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* VIAREGGIO: censito nei seed di startup */
/* ROMA: censito nei seed di startup */
/* BARI: censito nei seed di startup */
(116,'MASSA LUBRENSE','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* TRAVAGLIATO: censito nei seed di startup */
(117,'BUSTO GAROLFO','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* GENOVA: censito nei seed di startup */
/* GIULIANO: censito nei seed di startup */
/* SAN MARINO: censito nei seed di startup */
/* VAREDO: censito nei seed di startup */
(118,'MESSINA','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(119,'TREVISO','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* PONTEDERA: censito nei seed di startup */
/* PUTIGNANO: censito nei seed di startup */
(120,'LECCO','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* OLBIA: censito nei seed di startup */
(121,'CALDIERO','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* GENOVA: censito nei seed di startup */
/* CREMONA: censito nei seed di startup */
/* PRATO: censito nei seed di startup */
/* ROMA: censito nei seed di startup */
(122,'PIETRALCINA','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* PALERMO: censito nei seed di startup */
(123,'CANOSA','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(124,'GALLARATE','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
/* NAPOLI: censito nei seed di startup */
/* CATANIA: censito nei seed di startup */
/* PIACENZA: censito nei seed di startup */
(125,'CITTA'' DI CASTELLO','?','?','ITALIA','ITA',0,CURDATE(),CURDATE()),
(126,'COMO','?','?','ITALIA','ITA',0,CURDATE(),CURDATE());

COMMIT;

--
-- Dump dei dati per la tabella swimming_pools
-- 
INSERT INTO swimming_pools (id,name,phone_number,lanes_number,address,nick_name,has_multiple_pools,has_open_area,has_bar,has_restaurant_service,has_gym_area,has_children_area,notes,zip,fax_number,e_mail,contact_name,user_id,city_id,pool_type_id,locker_cabinet_type_id,shower_type_id,hair_dryer_type_id,lock_version,created_at,updated_at) VALUES 
/* VEROLANUOVA caricato nei seed */
/* ROVIGO caricato nei seed */
(62,'?','?',6,'?','strianonp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'STRIANO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(63,'?','?',6,'?','osimonp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'OSIMO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(64,'Samuele','?',8,'Via Trani','milanosamuele',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'MILANO'),(select t.id from pool_types t where t.code = '50'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(65,'?','?',8,'?','genovanp288',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'GENOVA'),(select t.id from pool_types t where t.code = '28'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(66,'?','?',6,'?','laquilanp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'L''AQUILA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(67,'?','?',8,'?','novaranp258',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'NOVARA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(68,'?','?',8,'?','civitavecchianp508',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'CIVITAVECCHIA'),(select t.id from pool_types t where t.code = '50'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(69,'?','?',8,'?','saronnonp258',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'SARONNO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* BOLOGNA caricato nei seed */
(70,'?','?',8,'?','albenganp258',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'ALBENGA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(71,'?','?',10,'?','vicenzanp2510',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'VICENZA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(72,'?','?',6,'?','poggibonsinp266',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'POGGIBONSI'),(select t.id from pool_types t where t.code = '26'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(73,'Comunale','?',5,'Via degli Atleti, 1','vimercatecomunale',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'VIMERCATE'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(74,'?','?',6,'?','innsbrucknp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'INNSBRUCK'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(75,'?','?',10,'?','romanp5010',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'ROMA'),(select t.id from pool_types t where t.code = '50'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(76,'?','?',8,'?','forlinp258',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'FORLI'''),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(77,'?','?',8,'?','giulianonp258',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'GIULIANO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(78,'?','?',8,'?','olbianp258',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'OLBIA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* RAPALLO caricato nei seed */
(79,'?','?',6,'?','casalemonferratonp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'CASALE MONFERRATO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(80,'?','?',8,'?','palermonp508',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'PALERMO'),(select t.id from pool_types t where t.code = '50'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(81,'?','?',6,'?','massarosanp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'MASSAROSA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(82,'Italcementi','035/251171',8,'Via Statuto, 43','bergamoitalcementi',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'BERGAMO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* RICCIONE caricato nei seed */
(83,'?','?',10,'?','romanp2510',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'ROMA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(84,'?','?',8,'?','modugnonp258',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'MODUGNO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(85,'?','?',8,'?','tortonanp258',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'TORTONA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* PARMA caricato nei seed */
/* LIVORNO caricato nei seed */
(86,'?','?',8,'?','pescaranp358',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'PESCARA'),(select t.id from pool_types t where t.code = '35'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(87,'?','?',8,'?','bolzanonp258',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'BOLZANO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(88,'?','?',6,'?','cagliarinp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'CAGLIARI'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(89,'?','?',10,'?','brescianp2510',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'BRESCIA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* VIAREGGIO caricato nei seed */
/* STRIANO caricato nei seed */
(90,'?','?',8,'?','milanonp258',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'MILANO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* RAVENNA caricato nei seed */
(91,'?','?',8,'?','sorinp258',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'SORI'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* BOLZANO caricato nei seed */
(92,'?','?',8,'?','taorminanp258',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'TAORMINA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(93,'?','?',5,'?','buonconventonp255',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'BUONCONVENTO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(94,'?','?',8,'?','coratonp258',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'CORATO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(95,'?','?',8,'?','romanp258',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'ROMA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* GUSSAGO caricato nei seed */
(96,'?','?',8,'?','porticinp258',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'PORTICI'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(97,'?','?',8,'?','catanianp508',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'CATANIA'),(select t.id from pool_types t where t.code = '50'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* LIGNANO SABBIADORO caricato nei seed */
(98,'?','?',8,'?','torinonp508',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'TORINO'),(select t.id from pool_types t where t.code = '50'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* BOLZANO caricato nei seed */
(99,'?','?',0,'?','ostianp250',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'OSTIA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(100,'?','?',6,'?','collevaldelsanp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'COLLE VAL D''ELSA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* BRESCIA caricato nei seed */
(101,'?','?',8,'?','napolinp508',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'NAPOLI'),(select t.id from pool_types t where t.code = '50'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* RICCIONE caricato nei seed */
(102,'?','?',6,'?','putignanonp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'PUTIGNANO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(103,'?','?',8,'?','pescaranp258',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'PESCARA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(104,'?','?',6,'?','catanzaronp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'CATANZARO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(105,'?','?',6,'?','seregnonp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'SEREGNO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(106,'?','?',8,'?','genovanp258',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'GENOVA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(107,'?','?',8,'?','bastianp258',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'BASTIA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(108,'?','?',6,'?','senigallianp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'SENIGALLIA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* BRESCIA caricato nei seed */
(109,'?','?',10,'?','viterbonp2510',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'VITERBO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* PALERMO caricato nei seed */
/* L'AQUILA caricato nei seed */
(110,'?','?',6,'?','firenzenp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'FIRENZE'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(111,'?','?',6,'?','cantunp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'CANTU'''),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(112,'?','?',8,'?','trentonp258',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'TRENTO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(113,'?','?',8,'?','bastiaumbranp258',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'BASTIA UMBRA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(114,'?','?',8,'?','battipaglianp258',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'BATTIPAGLIA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(115,'?','?',10,'?','pomezianp2510',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'POMEZIA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(116,'?','?',7,'?','nibionnonp257',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'NIBIONNO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* CATANIA caricato nei seed */
/* SENIGALLIA caricato nei seed */
(117,'?','?',6,'?','padovanp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'PADOVA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* RAPALLO caricato nei seed */
(118,'?','?',6,'?','follonicanp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'FOLLONICA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(119,'?','?',7,'?','campodipietranp257',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'CAMPODIPIETRA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(120,'?','?',6,'?','barinp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'BARI'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(121,'?','?',0,'?','cagliarinp250',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'CAGLIARI'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* ROMA caricato nei seed */
(122,'?','?',6,'?','pavianp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'PAVIA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* LIGNANO SABBIADORO caricato nei seed */
/* BOLOGNA caricato nei seed */
(123,'?','?',6,'?','luccanp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'LUCCA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* BRESCIA caricato nei seed */
(124,'?','?',8,'?','barranp258',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'BARRA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(125,'?','?',6,'?','castellanagrottenp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'CASTELLANA GROTTE'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* TRENTO caricato nei seed */
(126,'?','?',6,'?','palermonp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'PALERMO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* MOLINELLA caricato nei seed */
(127,'?','?',6,'?','gualdotadinonp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'GUALDO TADINO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* GENOVA caricato nei seed */
(128,'?','?',8,'?','legnanonp258',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'LEGNANO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(129,'?','?',6,'?','sdonadipiavenp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'S.DONA'' DI PIAVE'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* VIAREGGIO caricato nei seed */
/* ROMA caricato nei seed */
(130,'?','?',6,'?','barinp506',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'BARI'),(select t.id from pool_types t where t.code = '50'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(131,'?','?',6,'?','massalubrensenp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'MASSA LUBRENSE'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* TRAVAGLIATO caricato nei seed */
(132,'?','?',8,'?','bustogarolfonp258',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'BUSTO GAROLFO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* GENOVA caricato nei seed */
/* GIULIANO caricato nei seed */
/* SAN MARINO caricato nei seed */
/* VAREDO caricato nei seed */
(133,'?','?',8,'?','messinanp508',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'MESSINA'),(select t.id from pool_types t where t.code = '50'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(134,'?','?',8,'?','trevisonp508',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'TREVISO'),(select t.id from pool_types t where t.code = '50'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* PONTEDERA caricato nei seed */
(135,'?','?',8,'?','putignanonp258',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'PUTIGNANO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(136,'?','?',6,'?','lecconp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'LECCO'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* OLBIA caricato nei seed */
(137,'?','?',8,'?','caldieronp508',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'CALDIERO'),(select t.id from pool_types t where t.code = '50'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(138,'?','?',10,'?','genovanp5010',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'GENOVA'),(select t.id from pool_types t where t.code = '50'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* CREMONA caricato nei seed */
/* PRATO caricato nei seed */
/* ROMA caricato nei seed */
(139,'?','?',6,'?','pietralcinanp256',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'PIETRALCINA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* PALERMO caricato nei seed */
(140,'?','?',5,'?','canosanp255',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'CANOSA'),(select t.id from pool_types t where t.code = '25'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(141,'?','?',8,'?','gallaratenp508',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'GALLARATE'),(select t.id from pool_types t where t.code = '50'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
/* NAPOLI caricato nei seed */
/* CATANIA caricato nei seed */
/* PIACENZA caricato nei seed */
(142,'?','?',8,'?','cittadicastellonp508',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'CITTA'' DI CASTELLO'),(select t.id from pool_types t where t.code = '50'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE()),
(143,'?','?',8,'?','comonp508',0,0,0,0,0,0,'','?','?','?','?',2,(select t.id from cities t where t.name = 'COMO'),(select t.id from pool_types t where t.code = '50'),(select t.id from locker_cabinet_types t where t.code = ''),(select t.id from shower_types t where t.code = ''),(select t.id from hair_dryer_types t where t.code = ''),0,CURDATE(),CURDATE());

COMMIT;

--
-- Dump dei dati per la tabella meetings
-- 
INSERT INTO meetings (id,header_date,season_id,has_warm_up_pool,is_under_25_admitted,code,has_invitation,has_start_list,are_results_acquired,max_individual_events,max_individual_events_per_session,configuration_file,description,edition,header_year,user_id,edition_type_id,timing_type_id,individual_score_computation_type_id,relay_score_computation_type_id,meeting_score_computation_type_id,team_score_computation_type_id,lock_version,created_at,updated_at) VALUES 
/* verolanuova: censito nei seed di startup */
(13221,'2013-10-27',132,0,1,'rovigo',0,0,0,2,0,'?','TROFEO ROVIGO NUOTO',17,'2013',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13222,'2013-11-02',132,0,1,'speccampania',0,0,0,2,0,'?','DISTANZE SPECIALI CAMPANIA',0,'2013',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13223,'2013-11-02',132,0,1,'osimo',0,0,0,2,0,'?','MEETING SENZA TESTA',1,'2013',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13224,'2013-11-03',132,0,1,'speclombardia',0,0,0,2,0,'?','DISTANZE SPECIALI LOMBARDIA',0,'2013',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13225,'2013-11-03',132,0,1,'specliguria',0,0,0,2,0,'?','DISTANZE SPECIALI LIGURIA',0,'2013',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13226,'2013-11-03',132,0,1,'laquila',0,0,0,2,0,'?','MEETING DELLA SOLIDARIETÀ',10,'2013',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13227,'2013-11-03',132,0,1,'novara',0,0,0,2,0,'?','TROFEO CITTA'' DI NOVARA',1,'2013',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13228,'2013-11-09',132,0,1,'speclazio',0,0,0,2,0,'?','DISTANZE SPECIALI LAZIO',0,'2013',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13229,'2013-11-10',132,0,1,'saronno',0,0,0,2,0,'?','TROEO CITTA'' DI SARONNO',5,'2013',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
/* bologna: censito nei seed di startup */
(13230,'2013-11-16',132,0,1,'albenga',0,0,0,2,0,'?','TROFEO CITTA'' DI ALBENGA',4,'2013',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13231,'2013-11-17',132,0,1,'vicenza',0,0,0,2,0,'?','TROFEO MASTER NUOTO VICENZA',6,'2013',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13232,'2013-11-17',132,0,1,'poggibonsi',0,0,0,2,0,'?','TROFEO POGGIBONSI',2,'2013',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13233,'2013-11-23',132,0,1,'vimercate',0,0,0,2,0,'?','TROFEO CITTA'' DI VIMERCATE',31,'2013',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13234,'2013-11-23',132,0,1,'innsbruck',0,0,0,2,0,'?','MEETING MASTER SHARK',8,'2013',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13235,'2013-11-23',132,0,1,'roma',0,0,0,2,0,'?','TROFEO PAOLO COSTOLI',3,'2013',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13236,'2013-11-24',132,0,1,'forli',0,0,0,2,0,'?','TROFEO FANATIK TEAM',1,'2013',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13237,'2013-11-24',132,0,1,'giuliano',0,0,0,2,0,'?','TROFEO BLUE TEAM',5,'2013',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13238,'2013-11-24',132,0,1,'olbia',0,0,0,2,0,'?','MEMORIAL ANDREA CORDA',5,'2013',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13239,'2013-11-24',132,0,1,'rapallo',0,0,0,2,0,'?','PREMIO AZZURRI D''ITALIA',19,'2013',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13240,'2013-12-01',132,0,1,'casalemonferrato',0,0,0,2,0,'?','TROFEO CITTA'' DI CASALE MONFERRATO',2,'2013',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13241,'2013-12-01',132,0,1,'palermo',0,0,0,2,0,'?','DUE GIORNI DI CLORO WATERPOLO',0,'2013',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13242,'2013-12-01',132,0,1,'massarosa',0,0,0,2,0,'?','TROFEO CITTA'' DI MASSAROSA',9,'2013',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13243,'2013-12-07',132,0,1,'bergamo',0,0,0,2,0,'?','MEMORIAL A. GNECCHI',23,'2013',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
/* riccione: censito nei seed di startup */
(13244,'2013-12-07',132,0,1,'roma',0,0,0,2,0,'?','MEMORIAL CELIO BRUNELLESCHI',5,'2013',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13245,'2012-12-14',132,0,1,'modugno',0,0,0,2,0,'?','TROFEO SANTA CLAUS (BA)',7,'2013',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13246,'2012-12-15',132,0,1,'tortona',0,0,0,2,0,'?','TROFEO CITTA DI TORTONA',10,'2013',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
/* parma: censito nei seed di startup */
(13247,'2012-12-15',132,0,1,'livorno',0,0,0,2,0,'?','MEETING DEGLI AUGURI',15,'2013',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13248,'2012-12-15',132,0,1,'pescara',0,0,0,2,0,'?','CERTAME DANNUNZIANO',2,'2013',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13249,'2013-12-21',132,0,1,'bolzano',0,0,0,2,0,'?','TROFEO MERCATINO DI BOLZANO',1,'2013',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13250,'2013-12-21',132,0,1,'cagliari',0,0,0,2,0,'?','BUON NATALE MASTER 2013',0,'2013',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13251,'2013-12-22',132,0,1,'brescia',0,0,0,2,0,'?','TROFEO LEONESSA D''ITALIA',1,'2013',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
/* viareggio: censito nei seed di startup */
(13252,'2014-01-04',132,0,1,'striano',0,0,0,2,0,'?','MEETING CITTA'' DI STRIANO',1,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13253,'2014-01-11',132,0,1,'milano',0,0,0,2,0,'?','TROFEO MASTER DDS',16,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
/* ravenna: censito nei seed di startup */
(13254,'2014-01-12',132,0,1,'sori',0,0,0,2,0,'?','TROFEO RN SORI',3,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13255,'2014-01-12',132,0,1,'bolzano',0,0,0,2,0,'?','TROFEO DELLE DOLOMITI',16,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13256,'2014-01-12',132,0,1,'taormina',0,0,0,2,0,'?','TROFEO MAYDAY ITALIA MASTER',2,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13257,'2014-01-18',132,0,1,'buonconvento',0,0,0,2,0,'?','TROFEO',4,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13258,'2014-01-19',132,0,1,'corato',0,0,0,2,0,'?','MEETING FRAMAROS',3,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13259,'2014-01-19',132,0,1,'roma',0,0,0,2,0,'?','TROFEO FORUM SPRINT.',18,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
/* gussago: censito nei seed di startup */
(13260,'2014-01-25',132,0,1,'portici',0,0,0,2,0,'?','TROFEO NUOTATORI CAMPANI',4,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13261,'2014-01-26',132,0,1,'catania',0,0,0,2,0,'?','TROFEO S. AGATA',10,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13262,'2014-01-31',132,0,1,'regvenetoefriulivg',0,0,0,2,0,'?','REGIONALI VENETO E FRIULI VG',0,'2014',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13263,'2014-02-01',132,0,1,'regpiemonte',0,0,0,2,0,'?','REGIONALI PIEMONTE',0,'2014',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13264,'2014-02-02',132,0,1,'bolzano',0,0,0,2,0,'?','REG. ALTO ADIGE',0,'2014',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13265,'2014-02-01',132,0,1,'reglazio',0,0,0,2,0,'?','REGIONALI LAZIO',0,'2014',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13266,'2014-02-08',132,0,1,'regtoscana',0,0,0,2,0,'?','REGIONALI TOSCANA',0,'2014',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13267,'2014-02-08',132,0,1,'reglombardia',0,0,0,2,0,'?','REGIONALI LOMBARDIA',0,'2014',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13268,'2014-02-08',132,0,1,'regcampania',0,0,0,2,0,'?','REGIONALI CAMPANIA',0,'2014',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
/* regemilia: censito nei seed di startup */
(13269,'2014-02-09',132,0,1,'regpuglia',0,0,0,2,0,'?','REGIONALI PUGLIA',0,'2014',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13270,'2014-02-16',132,0,1,'regabruzzo',0,0,0,2,0,'?','REGIONALI ABRUZZO',0,'2014',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13271,'2014-02-22',132,0,1,'regcalabria',0,0,0,2,0,'?','REGIONALI CALABRIA',0,'2014',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13272,'2014-02-23',132,0,1,'seregno',0,0,0,2,0,'?','TROFEO MASTER',9,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13273,'2014-02-23',132,0,1,'regliguria',0,0,0,2,0,'?','REGIONALI LIGURIA',0,'2014',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13274,'2014-02-23',132,0,1,'regumbria',0,0,0,2,0,'?','REGIONALI UMBRIA',0,'2014',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13275,'2014-02-23',132,0,1,'regmarche',0,0,0,2,0,'?','REGIONALI MARCHE',0,'2014',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
/* brescia: censito nei seed di startup */
(13276,'2014-03-01',132,0,1,'viterbo',0,0,0,2,0,'?','TROFEO LARUS MASTER',12,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13277,'2014-03-01',132,0,1,'regsicilia',0,0,0,2,0,'?','REGIONALI SICILIA',0,'2014',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13278,'2014-03-02',132,0,1,'laquila',0,0,0,2,0,'?','TROFEO IMMOTA MANET',13,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13279,'2014-03-08',132,0,1,'firenze',0,0,0,2,0,'?','TROFEO CITTA'' DI FIRENZE',20,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13280,'2014-03-09',132,0,1,'cantu',0,0,0,2,0,'?','TROFEO MARCO LOTTAROLI',4,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13281,'2014-03-16',132,0,1,'trento',0,0,0,2,0,'?','TROFEO BUONCONSIGLIO NUOTO',4,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13282,'2014-03-16',132,0,1,'bastiaumbra',0,0,0,2,0,'?','TROFEO DELLA CITTA'' DI BASTIA UMBRA',9,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13283,'2014-03-16',132,0,1,'battipaglia',0,0,0,2,0,'?','TORNEO BALNAEA',8,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13284,'2014-03-16',132,0,1,'pomezia',0,0,0,2,0,'?','TROFEO LATINA ACQUATEAM',3,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13285,'2014-03-16',132,0,1,'nibionno',0,0,0,2,0,'?','TROFEO LARIO E BRIANZA',17,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13286,'2014-03-16',132,0,1,'catania',0,0,0,2,0,'?','TROFEO ETNA NUOTO',1,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13287,'2014-03-22',132,0,1,'senigallia',0,0,0,2,0,'?','MEETING ROCCA ROVERESCA',7,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13288,'2014-03-23',132,0,1,'padova',0,0,0,2,0,'?','MEMORIAL MAX ZUIN',1,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13289,'2014-03-23',132,0,1,'rapallo',0,0,0,2,0,'?','TROFEO MASTER DI PRIMAVERA',1,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13290,'2014-03-23',132,0,1,'follonica',0,0,0,2,0,'?','COPPA CITTA'' DI FOLLONICA',3,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13291,'2014-03-23',132,0,1,'campodipietra',0,0,0,2,0,'?','TROFEO OK MASTER 2',2,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13292,'2014-03-23',132,0,1,'bari',0,0,0,2,0,'?','TROFEO DI PRIMAVERA',4,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13293,'2014-03-23',132,0,1,'cagliari',0,0,0,2,0,'?','SARDEGNA NUOTA 2014',0,'2014',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13294,'2014-03-29',132,0,1,'roma',0,0,0,2,0,'?','TROFEO NANTES OSTIENSIS',7,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13295,'2014-03-30',132,0,1,'pavia',0,0,0,2,0,'?','TROFEO DELLA CITTA'' DI PAVIA',4,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13296,'2014-03-30',132,0,1,'lignanosabbiadoro',0,0,0,2,0,'?','MEMORIAL MARCO',9,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
/* bologna: censito nei seed di startup */
(13297,'2014-03-30',132,0,1,'lucca',0,0,0,2,0,'?','TROFEO ILARIA DEL CARRETTO',7,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13298,'2014-04-05',132,0,1,'brescia',0,0,0,2,0,'?','TROFEO EUROPA SC',1,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13299,'2014-04-06',132,0,1,'barra',0,0,0,2,0,'?','MEETING NUOTO NAPOLI',4,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13300,'2014-04-06',132,0,1,'castellanagrotte',0,0,0,2,0,'?','TROFEO SWIM ON THE CAVES',2,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13301,'2014-04-12',132,0,1,'trento',0,0,0,2,0,'?','MEETING TRENTINO MASTER',27,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13302,'2014-04-12',132,0,1,'palermo',0,0,0,2,0,'?','TROFEO POLISPORTIVA PALERMO',10,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
/* molinella: censito nei seed di startup */
(13303,'2014-04-12',132,0,1,'gualdotadino',0,0,0,2,0,'?','TROFEO ROLANDO PINACOLI',7,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13304,'2014-04-13',132,0,1,'genova',0,0,0,2,0,'?','TROFEO NUOTO PONENTE',2,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13305,'2014-04-13',132,0,1,'legnano',0,0,0,2,0,'?','TROFEO CITTA'' DI LEGNANO',8,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13306,'2014-04-25',132,0,1,'sdonadipiave',0,0,0,2,0,'?','TROFEO DEL PIAVE',1,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13307,'2014-04-25',132,0,1,'viareggio',0,0,0,2,0,'?','MEMORIAL GIOVANNI CIUFFRIDA',14,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13308,'2014-04-26',132,0,1,'roma',0,0,0,2,0,'?','TROFEO ACQANIENE',2,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13309,'2014-04-26',132,0,1,'bari',0,0,0,2,0,'?','TROFEO PAOLO PINTO',5,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13310,'2014-04-27',132,0,1,'massalubrense',0,0,0,2,0,'?','MEETING TERRA DELLE SIRENE',1,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
/* travagliato: censito nei seed di startup */
(13311,'2014-05-01',132,0,1,'bustogarolfo',0,0,0,2,0,'?','TROFEO CITTA'' DI BUSTO GAROLFO',1,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13312,'2014-05-03',132,0,1,'genova',0,0,0,2,0,'?','TROFEO MY SPORT',2,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13313,'2014-05-04',132,0,1,'giuliano',0,0,0,2,0,'?','TROFEO SWIM4LIFE',2,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
/* sanmarino: censito nei seed di startup */
/* varedo: censito nei seed di startup */
(13314,'2014-05-11',132,0,1,'messina',0,0,0,2,0,'?','ULYSSE MASTER SPEED',3,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13315,'2014-05-16',132,0,1,'treviso',0,0,0,2,0,'?','MEMORIAL A. BETTIOL',14,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
/* pontedera: censito nei seed di startup */
(13316,'2014-05-17',132,0,1,'putignano',0,0,0,2,0,'?','TROFEO NADIR',7,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13317,'2014-05-18',132,0,1,'lecco',0,0,0,2,0,'?','MEETING CITTA'' DI LECCO',1,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13318,'2014-05-18',132,0,1,'olbia',0,0,0,2,0,'?','TROFEO COSTA SMERALDA',6,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13319,'2014-05-24',132,0,1,'caldiero',0,0,0,2,0,'?','TROFEO DELLE TERME',24,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13320,'2014-05-24',132,0,1,'genova',0,0,0,2,0,'?','TROFEO PISCINE DI ALBARO',3,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13321,'2014-05-24',132,0,1,'cremona',0,0,0,2,0,'?','MEETING CANOTTIERI BALDESIO',1,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
/* prato: censito nei seed di startup */
(13322,'2014-05-25',132,0,1,'roma',0,0,0,2,0,'?','MEETING FLAMINIO SC',14,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13323,'2014-05-25',132,0,1,'pietralcina',0,0,0,2,0,'?','TROFEO JOLLY NUOTO',1,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13324,'2014-05-25',132,0,1,'palermo',0,0,0,2,0,'?','TROFEO PINA CATTARINICH',5,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13325,'2014-05-31',132,0,1,'canosa',0,0,0,2,0,'?','TROFEO SOTTO LE STELLE',7,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13326,'2014-05-31',132,0,1,'gallarate',0,0,0,2,0,'?','MEETING DELLA CITTA'' DI GALLARATE',22,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13327,'2014-05-31',132,0,1,'napoli',0,0,0,2,0,'?','TROFEO IL GABBIANO',6,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13328,'2014-06-01',132,0,1,'catania',0,0,0,2,0,'?','TROFEO DELLA REGIONE',1,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
/* piacenza: censito nei seed di startup */
(13329,'2014-06-07',132,0,1,'cittadicastello',0,0,0,2,0,'?','TROFEO ITALO GALLUZZI',29,'2014',2,(select t.id from edition_types t where t.code = 'R'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate()),
(13330,'2014-06-08',132,0,1,'como',0,0,0,2,0,'?','CITTA'' DI COMO',0,'2014',2,(select t.id from edition_types t where t.code = 'A'),(select t.id from timing_types t where t.code = 'A'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_computation_types t where t.code = 'INRE'),0,curdate(),curdate());


--
-- Dump dei dati per la tabella meeting_sessions per il Sabato mattina (o unico giorno festivo infrasettimanale)
-- 
INSERT INTO meeting_sessions (id,session_order,scheduled_date,meeting_id,swimming_pool_id,warm_up_time,begin_time,notes,description,user_id,day_part_type_id,lock_version,created_at,updated_at) VALUES 











(372,1,'2013-11-16',13230,70,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),


(373,1,'2013-11-23',13233,73,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),













(374,1,'2012-12-15',13246,85,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),

(375,1,'2012-12-15',13247,23,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(376,1,'2012-12-15',13248,86,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(377,1,'2013-12-21',13249,87,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(378,1,'2013-12-21',13250,88,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),


(379,1,'2014-01-04',13252,62,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(380,1,'2014-01-11',13253,90,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),








(381,1,'2014-01-25',13260,96,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),

(382,1,'2014-01-31',13262,13,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),


(383,1,'2014-02-01',13265,99,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(384,1,'2014-02-08',13266,100,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(385,1,'2014-02-08',13267,89,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(386,1,'2014-02-08',13268,101,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),



(387,1,'2014-02-22',13271,104,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),






(388,1,'2014-03-01',13277,80,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
























(389,1,'2014-04-12',13301,112,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(390,1,'2014-04-12',13302,126,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),




(391,1,'2014-04-25',13306,129,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(392,1,'2014-04-25',13307,24,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),




(393,1,'2014-05-01',13311,132,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),







(394,1,'2014-05-17',13316,135,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),


(395,1,'2014-05-24',13319,137,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(396,1,'2014-05-24',13320,138,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),





(397,1,'2014-05-31',13325,140,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(398,1,'2014-05-31',13326,141,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(399,1,'2014-05-31',13327,101,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),


(400,1,'2014-06-07',13329,142,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE());
-- Add last ; manually!!!


COMMIT;


--
-- Dump dei dati per la tabella meeting_sessions per il Sabato pomeriggio (o unico giorno festivo infrasettimanale)
-- 
INSERT INTO meeting_sessions (id,session_order,scheduled_date,meeting_id,swimming_pool_id,warm_up_time,begin_time,notes,description,user_id,day_part_type_id,lock_version,created_at,updated_at) VALUES 


(401,1,'2013-11-02',13222,62,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(402,1,'2013-11-02',13223,63,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),




(403,1,'2013-11-09',13228,68,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),





(404,1,'2013-11-23',13233,73,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(405,1,'2013-11-23',13234,74,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(406,1,'2013-11-23',13235,75,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),







(407,1,'2013-12-07',13243,82,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),

(408,1,'2013-12-07',13244,83,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),

(409,1,'2012-12-15',13246,85,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),

(410,1,'2012-12-15',13247,23,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(411,1,'2012-12-15',13248,86,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(412,1,'2013-12-21',13249,87,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),



(413,1,'2014-01-04',13252,62,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(414,1,'2014-01-11',13253,90,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),




(415,1,'2014-01-18',13257,93,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),



(416,1,'2014-01-25',13260,96,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),

(417,1,'2014-01-31',13262,13,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(418,1,'2014-02-01',13263,98,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),


(419,1,'2014-02-08',13266,100,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(420,1,'2014-02-08',13267,89,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),




(421,1,'2014-02-22',13271,104,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),





(422,1,'2014-03-01',13276,109,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(423,1,'2014-03-01',13277,80,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),

(424,1,'2014-03-08',13279,110,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),







(425,1,'2014-03-22',13287,108,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),






(426,1,'2014-03-29',13294,83,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),




(427,1,'2014-04-05',13298,89,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),


(428,1,'2014-04-12',13301,112,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(429,1,'2014-04-12',13302,126,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),

(430,1,'2014-04-12',13303,127,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),


(431,1,'2014-04-25',13306,129,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(432,1,'2014-04-25',13307,24,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(433,1,'2014-04-26',13308,83,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(434,1,'2014-04-26',13309,130,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),



(435,1,'2014-05-03',13312,54,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),




(436,1,'2014-05-16',13315,134,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),

(437,1,'2014-05-17',13316,135,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),



(438,1,'2014-05-24',13320,138,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(439,1,'2014-05-24',13321,56,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),





(440,1,'2014-05-31',13326,141,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),



(441,1,'2014-06-07',13329,142,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE());
-- Add last ; manually!!!


COMMIT;



--
-- Dump dei dati per la tabella meeting_sessions per la Domenica mattina
-- 
INSERT INTO meeting_sessions (id,session_order,scheduled_date,meeting_id,swimming_pool_id,warm_up_time,begin_time,notes,description,user_id,day_part_type_id,lock_version,created_at,updated_at) VALUES 

(442,1,'2013-10-27',13221,42,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(443,1,'2013-11-03',13222,62,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(444,1,'2013-11-03',13223,63,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(445,1,'2013-11-03',13224,64,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),

(446,1,'2013-11-03',13226,66,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(447,1,'2013-11-03',13227,67,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(448,1,'2013-11-10',13228,68,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(449,1,'2013-11-10',13229,69,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),


(450,1,'2013-11-17',13231,71,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(451,1,'2013-11-17',13232,72,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(452,1,'2013-11-24',13233,73,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(453,1,'2013-11-24',13234,74,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(454,1,'2013-11-24',13235,75,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(455,1,'2013-11-24',13236,76,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(456,1,'2013-11-24',13237,77,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(457,1,'2013-11-24',13238,78,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(458,1,'2013-11-24',13239,50,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(459,1,'2013-12-01',13240,79,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(460,1,'2013-12-01',13241,80,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(461,1,'2013-12-01',13242,81,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(462,1,'2013-12-08',13243,82,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),

(463,1,'2013-12-08',13244,83,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(464,1,'2012-12-15',13245,84,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),






(465,1,'2013-12-22',13251,89,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),

(466,1,'2014-01-05',13252,62,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),


(467,1,'2014-01-12',13254,91,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(468,1,'2014-01-12',13255,87,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(469,1,'2014-01-12',13256,92,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(470,1,'2014-01-19',13257,93,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(471,1,'2014-01-19',13258,94,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(472,1,'2014-01-19',13259,95,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),

(473,1,'2014-01-26',13260,96,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(474,1,'2014-01-26',13261,97,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(475,1,'2014-02-01',13262,13,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(476,1,'2014-02-02',13263,98,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE());

INSERT INTO meeting_sessions (id,session_order,scheduled_date,meeting_id,swimming_pool_id,warm_up_time,begin_time,notes,description,user_id,day_part_type_id,lock_version,created_at,updated_at) VALUES 
(477,1,'2014-02-02',13264,87,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),

(478,1,'2014-02-09',13266,100,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(479,1,'2014-02-09',13267,89,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),


(480,1,'2014-02-10',13269,102,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(481,1,'2014-02-16',13270,103,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),

(482,1,'2014-02-23',13272,105,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(483,1,'2014-02-23',13273,106,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(484,1,'2014-02-23',13274,107,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(485,1,'2014-02-23',13275,108,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),

(486,1,'2014-03-02',13276,109,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(487,1,'2014-03-02',13277,80,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(488,1,'2014-03-02',13278,66,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(489,1,'2014-03-09',13279,110,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(490,1,'2014-03-09',13280,111,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(491,1,'2014-03-16',13281,112,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(492,1,'2014-03-16',13282,113,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(493,1,'2014-03-16',13283,114,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(494,1,'2014-03-16',13284,115,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(495,1,'2014-03-16',13285,116,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(496,1,'2014-03-16',13286,97,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE());

INSERT INTO meeting_sessions (id,session_order,scheduled_date,meeting_id,swimming_pool_id,warm_up_time,begin_time,notes,description,user_id,day_part_type_id,lock_version,created_at,updated_at) VALUES 
(497,1,'2014-03-23',13287,108,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(498,1,'2014-03-23',13288,117,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(499,1,'2014-03-23',13289,50,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(500,1,'2014-03-23',13290,118,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(501,1,'2014-03-23',13291,119,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(502,1,'2014-03-23',13292,120,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(503,1,'2014-03-23',13293,121,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(504,1,'2014-03-30',13294,83,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(505,1,'2014-03-30',13295,122,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(506,1,'2014-03-30',13296,13,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),

(507,1,'2014-03-30',13297,123,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(508,1,'2014-04-06',13298,89,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(509,1,'2014-04-06',13299,124,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(510,1,'2014-04-06',13300,125,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),

(511,1,'2014-04-13',13302,126,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),

(512,1,'2014-04-13',13303,127,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(513,1,'2014-04-13',13304,106,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(514,1,'2014-04-13',13305,128,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),


(515,1,'2014-04-27',13308,83,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(516,1,'2014-04-27',13309,130,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE());

INSERT INTO meeting_sessions (id,session_order,scheduled_date,meeting_id,swimming_pool_id,warm_up_time,begin_time,notes,description,user_id,day_part_type_id,lock_version,created_at,updated_at) VALUES 
(517,1,'2014-04-27',13310,131,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),


(518,1,'2014-05-04',13312,54,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(519,1,'2014-05-04',13313,77,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),


(520,1,'2014-05-11',13314,133,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),


(521,1,'2014-05-18',13316,135,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(522,1,'2014-05-18',13317,136,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(523,1,'2014-05-18',13318,78,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),


(524,1,'2014-05-25',13321,56,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),

(525,1,'2014-05-25',13322,75,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(526,1,'2014-05-25',13323,139,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(527,1,'2014-05-25',13324,80,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),


(528,1,'2014-06-01',13327,101,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(529,1,'2014-06-01',13328,97,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),

(530,1,'2014-06-08',13329,142,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE()),
(531,1,'2014-06-08',13330,143,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'M'),0,CURDATE(),CURDATE());

COMMIT;


--
-- Dump dei dati per la tabella meeting_sessions per la Domenica pomeriggio
-- 
INSERT INTO meeting_sessions (id,session_order,scheduled_date,meeting_id,swimming_pool_id,warm_up_time,begin_time,notes,description,user_id,day_part_type_id,lock_version,created_at,updated_at) VALUES 

(532,1,'2013-10-27',13221,42,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),

(533,1,'2013-11-03',13223,63,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(534,1,'2013-11-03',13224,64,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(535,1,'2013-11-03',13225,65,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(536,1,'2013-11-03',13226,66,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(537,1,'2013-11-03',13227,67,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),

(538,1,'2013-11-10',13229,69,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),


(539,1,'2013-11-17',13231,71,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(540,1,'2013-11-17',13232,72,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(541,1,'2013-11-24',13233,73,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),

(542,1,'2013-11-24',13235,75,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(543,1,'2013-11-24',13236,76,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(544,1,'2013-11-24',13237,77,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),



(545,1,'2013-12-01',13241,80,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(546,1,'2013-12-01',13242,81,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(547,1,'2013-12-08',13243,82,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),


(548,1,'2012-12-15',13245,84,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),






(549,1,'2013-12-22',13251,89,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),





(550,1,'2014-01-12',13255,87,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(551,1,'2014-01-12',13256,92,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),

(552,1,'2014-01-19',13258,94,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(553,1,'2014-01-19',13259,95,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),


(554,1,'2014-01-26',13261,97,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(555,1,'2014-02-01',13262,13,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(556,1,'2014-02-02',13263,98,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE());

INSERT INTO meeting_sessions (id,session_order,scheduled_date,meeting_id,swimming_pool_id,warm_up_time,begin_time,notes,description,user_id,day_part_type_id,lock_version,created_at,updated_at) VALUES 
(557,1,'2014-02-02',13264,87,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),

(558,1,'2014-02-09',13266,100,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(559,1,'2014-02-09',13267,89,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),





(560,1,'2014-02-23',13272,105,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(561,1,'2014-02-23',13273,106,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(562,1,'2014-02-23',13274,107,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(563,1,'2014-02-23',13275,108,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),

(564,1,'2014-03-02',13276,109,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(565,1,'2014-03-02',13277,80,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),


(566,1,'2014-03-09',13280,111,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(567,1,'2014-03-16',13281,112,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(568,1,'2014-03-16',13282,113,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(569,1,'2014-03-16',13283,114,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(570,1,'2014-03-16',13284,115,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(571,1,'2014-03-16',13285,116,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(572,1,'2014-03-16',13286,97,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),

(573,1,'2014-03-23',13288,117,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(574,1,'2014-03-23',13289,50,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(575,1,'2014-03-23',13290,118,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(576,1,'2014-03-23',13291,119,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(577,1,'2014-03-23',13292,120,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(578,1,'2014-03-23',13293,121,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(579,1,'2014-03-30',13294,83,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(580,1,'2014-03-30',13295,122,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(581,1,'2014-03-30',13296,13,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),

(582,1,'2014-03-30',13297,123,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(583,1,'2014-04-06',13298,89,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(584,1,'2014-04-06',13299,124,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(585,1,'2014-04-06',13300,125,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),

(586,1,'2014-04-13',13302,126,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),



(587,1,'2014-04-13',13305,128,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),



(588,1,'2014-04-27',13309,130,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE());

INSERT INTO meeting_sessions (id,session_order,scheduled_date,meeting_id,swimming_pool_id,warm_up_time,begin_time,notes,description,user_id,day_part_type_id,lock_version,created_at,updated_at) VALUES 
(589,1,'2014-04-27',13310,131,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),


(590,1,'2014-05-04',13312,54,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(591,1,'2014-05-04',13313,77,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),


(592,1,'2014-05-11',13314,133,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),


(593,1,'2014-05-18',13316,135,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(594,1,'2014-05-18',13317,136,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),





(595,1,'2014-05-25',13322,75,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(596,1,'2014-05-25',13323,139,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),
(597,1,'2014-05-25',13324,80,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),


(598,1,'2014-06-01',13327,101,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE()),



(599,1,'2014-06-08',13330,143,'00:00:00','00:00:00','','FINALI',2,(select t.id from day_part_types t where t.code = 'P'),0,CURDATE(),CURDATE());

COMMIT;