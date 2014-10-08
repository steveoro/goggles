/*!40101 SET character_set_client = latin1 */;
/*!40103 SET TIME_ZONE='+00:00' */;

SET AUTOCOMMIT=0;
START TRANSACTION;

--
-- Dump dei dati per la tabella day_types
-- 
INSERT INTO day_types (id,code,week_order,lock_version,created_at,updated_at) VALUES 
(1,'LU',1,0,CURDATE(),CURDATE()),
(2,'MA',2,0,CURDATE(),CURDATE()),
(3,'ME',3,0,CURDATE(),CURDATE()),
(4,'GI',4,0,CURDATE(),CURDATE()),
(5,'VE',5,0,CURDATE(),CURDATE()),
(6,'SA',6,0,CURDATE(),CURDATE()),
(7,'DO',7,0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella gender_types
-- 
INSERT INTO gender_types (id,code,lock_version,created_at,updated_at) VALUES 
(1,'M',0,CURDATE(),CURDATE()),
(2,'F',0,CURDATE(),CURDATE()),
(3,'X',0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella stroke_types
-- 
INSERT INTO stroke_types (id,code,is_eventable,lock_version,created_at,updated_at) VALUES 
(1,'SL',1,0,CURDATE(),CURDATE()),
(2,'FA',1,0,CURDATE(),CURDATE()),
(3,'DO',1,0,CURDATE(),CURDATE()),
(4,'RA',1,0,CURDATE(),CURDATE()),
(5,'MI',1,0,CURDATE(),CURDATE()),
(6,'PA',0,0,CURDATE(),CURDATE()),
(7,'VI',0,0,CURDATE(),CURDATE()),
(8,'PO',0,0,CURDATE(),CURDATE()),
(9,'GE',0,0,CURDATE(),CURDATE()),
(10,'MX',1,0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella presence_types
-- 
INSERT INTO presence_types (id,code,value,lock_version,created_at,updated_at) VALUES 
(1,'P',100,0,CURDATE(),CURDATE()),
(2,'R',75,0,CURDATE(),CURDATE()),
(3,'U',75,0,CURDATE(),CURDATE()),
(4,'A',0,0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella entry_time_types
-- 
INSERT INTO entry_time_types (id,code,lock_version,created_at,updated_at) VALUES 
(1,'M',0,CURDATE(),CURDATE()),
(2,'P',0,CURDATE(),CURDATE()),
(3,'G',0,CURDATE(),CURDATE()),
(4,'A',0,CURDATE(),CURDATE()),
(5,'U',0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella passage_types
-- 
INSERT INTO passage_types (id,code,length_in_meters,lock_version,created_at,updated_at) VALUES 
(1,'P0025',25,0,CURDATE(),CURDATE()),
(2,'P0050',50,0,CURDATE(),CURDATE()),
(3,'P0075',75,0,CURDATE(),CURDATE()),
(4,'P0100',100,0,CURDATE(),CURDATE()),
(5,'P0125',125,0,CURDATE(),CURDATE()),
(6,'P0150',150,0,CURDATE(),CURDATE()),
(7,'P0175',175,0,CURDATE(),CURDATE()),
(8,'P0200',200,0,CURDATE(),CURDATE()),
(9,'P0225',225,0,CURDATE(),CURDATE()),
(10,'P0250',250,0,CURDATE(),CURDATE()),
(11,'P0275',275,0,CURDATE(),CURDATE()),
(12,'P0300',300,0,CURDATE(),CURDATE()),
(13,'P0325',325,0,CURDATE(),CURDATE()),
(14,'P0350',350,0,CURDATE(),CURDATE()),
(15,'P0375',375,0,CURDATE(),CURDATE()),
(16,'P0400',400,0,CURDATE(),CURDATE()),
(17,'P0425',425,0,CURDATE(),CURDATE()),
(18,'P0450',450,0,CURDATE(),CURDATE()),
(19,'P0475',475,0,CURDATE(),CURDATE()),
(20,'P0500',500,0,CURDATE(),CURDATE()),
(21,'P0525',525,0,CURDATE(),CURDATE()),
(22,'P0550',550,0,CURDATE(),CURDATE()),
(23,'P0575',575,0,CURDATE(),CURDATE()),
(24,'P0600',600,0,CURDATE(),CURDATE()),
(25,'P0625',625,0,CURDATE(),CURDATE()),
(26,'P0650',650,0,CURDATE(),CURDATE()),
(27,'P0675',675,0,CURDATE(),CURDATE()),
(28,'P0700',700,0,CURDATE(),CURDATE()),
(29,'P0725',725,0,CURDATE(),CURDATE()),
(30,'P0750',750,0,CURDATE(),CURDATE()),
(31,'P0775',775,0,CURDATE(),CURDATE()),
(32,'P0800',800,0,CURDATE(),CURDATE()),
(33,'P0825',825,0,CURDATE(),CURDATE()),
(34,'P0850',850,0,CURDATE(),CURDATE()),
(35,'P0875',875,0,CURDATE(),CURDATE()),
(36,'P0900',900,0,CURDATE(),CURDATE()),
(37,'P0925',925,0,CURDATE(),CURDATE()),
(38,'P0950',950,0,CURDATE(),CURDATE()),
(39,'P0975',975,0,CURDATE(),CURDATE()),
(40,'P1000',1000,0,CURDATE(),CURDATE()),
(41,'P1025',1025,0,CURDATE(),CURDATE()),
(42,'P1050',1050,0,CURDATE(),CURDATE()),
(43,'P1075',1075,0,CURDATE(),CURDATE()),
(44,'P1100',1100,0,CURDATE(),CURDATE()),
(45,'P1125',1125,0,CURDATE(),CURDATE()),
(46,'P1150',1150,0,CURDATE(),CURDATE()),
(47,'P1175',1175,0,CURDATE(),CURDATE()),
(48,'P1200',1200,0,CURDATE(),CURDATE()),
(49,'P1225',1225,0,CURDATE(),CURDATE()),
(50,'P1250',1250,0,CURDATE(),CURDATE()),
(51,'P1275',1275,0,CURDATE(),CURDATE()),
(52,'P1300',1300,0,CURDATE(),CURDATE()),
(53,'P1325',1325,0,CURDATE(),CURDATE()),
(54,'P1350',1350,0,CURDATE(),CURDATE()),
(55,'P1375',1375,0,CURDATE(),CURDATE()),
(56,'P1400',1400,0,CURDATE(),CURDATE()),
(57,'P1425',1425,0,CURDATE(),CURDATE()),
(58,'P1450',1450,0,CURDATE(),CURDATE()),
(59,'P1475',1475,0,CURDATE(),CURDATE()),
(60,'P1500',1500,0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella pool_types
-- 
INSERT INTO pool_types (id,code,length_in_meters,is_suitable_for_meetings,lock_version,created_at,updated_at) VALUES 
(1,'25',25,1,0,CURDATE(),CURDATE()),
(2,'50',50,1,0,CURDATE(),CURDATE()),
(3,'33',33,0,0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella achievement_types
-- 
INSERT INTO achievement_types (id,code,lock_version,created_at,updated_at) VALUES 
(1,'AAMG',0,CURDATE(),CURDATE()),
(2,'ADNG',0,CURDATE(),CURDATE()),
(3,'AMPF',0,CURDATE(),CURDATE()),
(4,'ANGD',0,CURDATE(),CURDATE()),
(5,'ATNG',0,CURDATE(),CURDATE()),
(6,'ATSV',0,CURDATE(),CURDATE()),
(7,'ASTA',0,CURDATE(),CURDATE()),
(8,'ASQU',0,CURDATE(),CURDATE()),
(9,'AORO',0,CURDATE(),CURDATE()),
(10,'AMED',0,CURDATE(),CURDATE()),
(11,'AKMA',0,CURDATE(),CURDATE()),
(12,'AKMF',0,CURDATE(),CURDATE()),
(13,'AKMG',0,CURDATE(),CURDATE()),
(14,'SIRN',0,CURDATE(),CURDATE()),
(15,'SKMA',0,CURDATE(),CURDATE()),
(16,'SKMF',0,CURDATE(),CURDATE()),
(17,'SKMG',0,CURDATE(),CURDATE()),
(18,'SMDF',0,CURDATE(),CURDATE()),
(19,'SPBS',0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella day_part_types
-- 
INSERT INTO day_part_types (id,code,lock_version,created_at,updated_at) VALUES 
(1,'M',0,CURDATE(),CURDATE()),
(2,'P',0,CURDATE(),CURDATE()),
(3,'S',0,CURDATE(),CURDATE()),
(4,'N',0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella heat_types
-- 
INSERT INTO heat_types (id,code,lock_version,created_at,updated_at) VALUES 
(1,'B',0,CURDATE(),CURDATE()),
(2,'S',0,CURDATE(),CURDATE()),
(3,'F',0,CURDATE(),CURDATE()),
(4,'C',0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella shower_types
-- 
INSERT INTO shower_types (id,code,lock_version,created_at,updated_at) VALUES 
(1,'G',0,CURDATE(),CURDATE()),
(2,'2',0,CURDATE(),CURDATE()),
(3,'C',0,CURDATE(),CURDATE()),
(4,'B',0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella hair_dryer_types
-- 
INSERT INTO hair_dryer_types (id,code,lock_version,created_at,updated_at) VALUES 
(1,'G',0,CURDATE(),CURDATE()),
(2,'2',0,CURDATE(),CURDATE()),
(3,'C',0,CURDATE(),CURDATE()),
(4,'B',0,CURDATE(),CURDATE()),
(5,'T',0,CURDATE(),CURDATE()),
(6,'P',0,CURDATE(),CURDATE()),
(7,'E',0,CURDATE(),CURDATE()),
(8,'U',0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella locker_cabinet_types
-- 
INSERT INTO locker_cabinet_types (id,code,lock_version,created_at,updated_at) VALUES 
(1,'G',0,CURDATE(),CURDATE()),
(2,'P',0,CURDATE(),CURDATE()),
(3,'C',0,CURDATE(),CURDATE()),
(4,'N',0,CURDATE(),CURDATE()),
(5,'2',0,CURDATE(),CURDATE()),
(6,'B',0,CURDATE(),CURDATE()),
(7,'0',0,CURDATE(),CURDATE()),
(8,'5',0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella edition_types
-- 
INSERT INTO edition_types (id,code,lock_version,created_at,updated_at) VALUES 
(1,'O',0,CURDATE(),CURDATE()),
(2,'R',0,CURDATE(),CURDATE()),
(3,'N',0,CURDATE(),CURDATE()),
(4,'A',0,CURDATE(),CURDATE()),
(5,'S',0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella timing_types
-- 
INSERT INTO timing_types (id,code,lock_version,created_at,updated_at) VALUES 
(1,'M',0,CURDATE(),CURDATE()),
(2,'S',0,CURDATE(),CURDATE()),
(3,'A',0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella training_mode_types
-- 
INSERT INTO training_mode_types (id,code,lock_version,created_at,updated_at) VALUES 
(1,'A1',0,CURDATE(),CURDATE()),
(2,'A2',0,CURDATE(),CURDATE()),
(3,'B1',0,CURDATE(),CURDATE()),
(4,'B2',0,CURDATE(),CURDATE()),
(5,'C1',0,CURDATE(),CURDATE()),
(6,'C2',0,CURDATE(),CURDATE()),
(7,'C3',0,CURDATE(),CURDATE()),
(8,'A1/C3',0,CURDATE(),CURDATE()),
(9,'C3/A1',0,CURDATE(),CURDATE()),
(10,'D',0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella training_step_types
-- 
INSERT INTO training_step_types (id,code,step_order,lock_version,created_at,updated_at) VALUES 
(1,'R',1,0,CURDATE(),CURDATE()),
(2,'T',2,0,CURDATE(),CURDATE()),
(3,'A',3,0,CURDATE(),CURDATE()),
(4,'C',4,0,CURDATE(),CURDATE()),
(5,'D',5,0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella movement_types
-- 
INSERT INTO movement_types (id,code,lock_version,created_at,updated_at) VALUES 
(1,'C',0,CURDATE(),CURDATE()),
(2,'G',0,CURDATE(),CURDATE()),
(3,'B',0,CURDATE(),CURDATE()),
(4,'T',0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella movement_scope_types
-- 
INSERT INTO movement_scope_types (id,code,lock_version,created_at,updated_at) VALUES 
(1,'I',0,CURDATE(),CURDATE()),
(2,'E',0,CURDATE(),CURDATE()),
(3,'N',0,CURDATE(),CURDATE()),
(4,'C',0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella arm_aux_types
-- 
INSERT INTO arm_aux_types (id,code,lock_version,created_at,updated_at) VALUES 
(1,'P',0,CURDATE(),CURDATE()),
(2,'H',0,CURDATE(),CURDATE()),
(3,'G',0,CURDATE(),CURDATE()),
(4,'8',0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella kick_aux_types
-- 
INSERT INTO kick_aux_types (id,code,lock_version,created_at,updated_at) VALUES 
(1,'L',0,CURDATE(),CURDATE()),
(2,'C',0,CURDATE(),CURDATE()),
(3,'M',0,CURDATE(),CURDATE()),
(4,'P',0,CURDATE(),CURDATE()),
(5,'E',0,CURDATE(),CURDATE()),
(6,'T',0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella breath_aux_types
-- 
INSERT INTO breath_aux_types (id,code,lock_version,created_at,updated_at) VALUES 
(1,'S',0,CURDATE(),CURDATE()),
(2,'B',0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella body_aux_types
-- 
INSERT INTO body_aux_types (id,code,lock_version,created_at,updated_at) VALUES 
(1,'M',0,CURDATE(),CURDATE()),
(2,'C',0,CURDATE(),CURDATE()),
(3,'S',0,CURDATE(),CURDATE()),
(4,'E',0,CURDATE(),CURDATE()),
(5,'P',0,CURDATE(),CURDATE()),
(6,'T',0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella execution_note_types
-- 
INSERT INTO execution_note_types (id,code,lock_version,created_at,updated_at) VALUES 
(1,'CBR',0,CURDATE(),CURDATE()),
(2,'LUN',0,CURDATE(),CURDATE()),
(3,'FMX',0,CURDATE(),CURDATE()),
(4,'VLN',0,CURDATE(),CURDATE()),
(5,'FUO',0,CURDATE(),CURDATE()),
(6,'GAL',0,CURDATE(),CURDATE()),
(7,'VIR',0,CURDATE(),CURDATE()),
(8,'SAL',0,CURDATE(),CURDATE()),
(9,'SCA',0,CURDATE(),CURDATE()),
(10,'R02',0,CURDATE(),CURDATE()),
(11,'R03',0,CURDATE(),CURDATE()),
(12,'R04',0,CURDATE(),CURDATE()),
(13,'R05',0,CURDATE(),CURDATE()),
(14,'R07',0,CURDATE(),CURDATE()),
(15,'R09',0,CURDATE(),CURDATE()),
(16,'C25',0,CURDATE(),CURDATE()),
(17,'C50',0,CURDATE(),CURDATE()),
(18,'C00',0,CURDATE(),CURDATE()),
(19,'MET',0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella coach_level_types
-- 
INSERT INTO coach_level_types (id,code,level,lock_version,created_at,updated_at) VALUES 
(1,'CA',10,0,CURDATE(),CURDATE()),
(2,'IS',100,0,CURDATE(),CURDATE()),
(3,'F1',200,0,CURDATE(),CURDATE()),
(4,'F2',250,0,CURDATE(),CURDATE()),
(5,'A1',300,0,CURDATE(),CURDATE()),
(6,'A2',350,0,CURDATE(),CURDATE()),
(7,'AC',400,0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella medal_types
-- 
INSERT INTO medal_types (id,code,rank,weigth,image_uri,lock_version,created_at,updated_at) VALUES 
(1,'O',1,10000,'medal_gold_3.png',0,CURDATE(),CURDATE()),
(2,'A',2,100,'medal_silver_3.png',0,CURDATE(),CURDATE()),
(3,'B',3,1,'medal_bronze_3.png',0,CURDATE(),CURDATE()),
(4,'L',4,0,'',0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella 
-- 
INSERT INTO record_types (id,code,is_for_swimmers,is_for_teams,is_for_seasons,lock_version,created_at,updated_at) VALUES 
(1,'SPB',1,0,0,0,CURDATE(),CURDATE()),
(2,'SSB',1,0,0,0,CURDATE(),CURDATE()),
(3,'SLP',1,0,0,0,CURDATE(),CURDATE()),
(4,'TTB',0,1,0,0,CURDATE(),CURDATE()),
(5,'TSB',0,1,0,0,CURDATE(),CURDATE()),
(6,'SOR',0,0,1,0,CURDATE(),CURDATE()),
(7,'FOR',0,0,0,0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella event_types
-- 
INSERT INTO event_types (id,code,length_in_meters,style_order,is_a_relay,is_mixed_gender,partecipants,phases,phase_length_in_meters,stroke_type_id,lock_version,created_at,updated_at) VALUES 
(1,'25SL',25,1,0,0,1,1,25,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(2,'50SL',50,2,0,0,1,1,50,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(3,'100SL',100,3,0,0,1,1,100,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(4,'200SL',200,4,0,0,1,1,200,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(5,'400SL',400,5,0,0,1,1,400,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(6,'800SL',800,6,0,0,1,1,800,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(7,'1500SL',1500,7,0,0,1,1,1500,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(8,'3000SL',3000,8,0,0,1,1,3000,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(9,'5000SL',5000,9,0,0,1,1,5000,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(10,'25FA',25,10,0,0,1,1,25,(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
(11,'50FA',50,11,0,0,1,1,50,(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
(12,'100FA',100,12,0,0,1,1,100,(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
(13,'200FA',200,13,0,0,1,1,200,(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
(14,'25DO',25,14,0,0,1,1,25,(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
(15,'50DO',50,15,0,0,1,1,50,(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
(16,'100DO',100,16,0,0,1,1,100,(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
(17,'200DO',200,17,0,0,1,1,200,(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
(18,'25RA',25,18,0,0,1,1,25,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
(19,'50RA',50,19,0,0,1,1,50,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
(20,'100RA',100,20,0,0,1,1,100,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
(21,'200RA',200,21,0,0,1,1,200,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
(22,'100MI',100,22,0,0,1,1,100,(select t.id from stroke_types t where t.code = 'MI'),0,CURDATE(),CURDATE()),
(23,'200MI',200,23,0,0,1,1,200,(select t.id from stroke_types t where t.code = 'MI'),0,CURDATE(),CURDATE()),
(24,'400MI',400,24,0,0,1,1,400,(select t.id from stroke_types t where t.code = 'MI'),0,CURDATE(),CURDATE()),
(25,'S4X50SL',200,25,1,0,4,4,50,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(26,'S4X50MI',200,26,1,0,4,4,50,(select t.id from stroke_types t where t.code = 'MI'),0,CURDATE(),CURDATE()),
(27,'S4X100SL',400,27,1,0,4,4,100,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(28,'S4X100MI',400,28,1,0,4,4,100,(select t.id from stroke_types t where t.code = 'MI'),0,CURDATE(),CURDATE()),
(29,'S4X200SL',800,29,1,0,4,4,200,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(30,'S8X25SL',200,30,1,0,4,8,25,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(31,'S8X25MI',200,31,1,0,4,8,25,(select t.id from stroke_types t where t.code = 'MI'),0,CURDATE(),CURDATE()),
(32,'M4X50SL',200,32,1,1,4,4,50,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(33,'M4X50MI',200,33,1,1,4,4,50,(select t.id from stroke_types t where t.code = 'MI'),0,CURDATE(),CURDATE()),
(34,'M4X100SL',400,34,1,1,4,4,100,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(35,'M4X100MI',400,35,1,1,4,4,100,(select t.id from stroke_types t where t.code = 'MI'),0,CURDATE(),CURDATE()),
(36,'M4X200SL',800,36,1,1,4,4,200,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(37,'M8X25SL',200,37,1,1,4,8,25,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(38,'M8X25MI',200,38,1,1,4,8,25,(select t.id from stroke_types t where t.code = 'MI'),0,CURDATE(),CURDATE()),
(39,'A8X25MI',200,39,1,1,8,8,25,(select t.id from stroke_types t where t.code = 'MI'),0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella events_by_pool_types
-- 
INSERT INTO events_by_pool_types (id,event_type_id,pool_type_id,lock_version,created_at,updated_at) VALUES 
(1,(select t.id from event_types t where t.code = '25SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(2,(select t.id from event_types t where t.code = '50SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(3,(select t.id from event_types t where t.code = '100SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(4,(select t.id from event_types t where t.code = '200SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(5,(select t.id from event_types t where t.code = '400SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(6,(select t.id from event_types t where t.code = '800SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(7,(select t.id from event_types t where t.code = '1500SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(8,(select t.id from event_types t where t.code = '3000SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(9,(select t.id from event_types t where t.code = '5000SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(10,(select t.id from event_types t where t.code = '25FA'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(11,(select t.id from event_types t where t.code = '50FA'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(12,(select t.id from event_types t where t.code = '100FA'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(13,(select t.id from event_types t where t.code = '200FA'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(14,(select t.id from event_types t where t.code = '25DO'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(15,(select t.id from event_types t where t.code = '50DO'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(16,(select t.id from event_types t where t.code = '100DO'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(17,(select t.id from event_types t where t.code = '200DO'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(18,(select t.id from event_types t where t.code = '25RA'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(19,(select t.id from event_types t where t.code = '50RA'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(20,(select t.id from event_types t where t.code = '100RA'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(21,(select t.id from event_types t where t.code = '200RA'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(22,(select t.id from event_types t where t.code = '100MI'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(23,(select t.id from event_types t where t.code = '200MI'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(24,(select t.id from event_types t where t.code = '400MI'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(25,(select t.id from event_types t where t.code = 'S4X50SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(26,(select t.id from event_types t where t.code = 'S4X50MI'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(27,(select t.id from event_types t where t.code = 'S4X100SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(28,(select t.id from event_types t where t.code = 'S4X100MI'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(29,(select t.id from event_types t where t.code = 'S4X200SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(30,(select t.id from event_types t where t.code = 'S8X25SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(31,(select t.id from event_types t where t.code = 'S8X25MI'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(32,(select t.id from event_types t where t.code = 'M4X50SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(33,(select t.id from event_types t where t.code = 'M4X50MI'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(34,(select t.id from event_types t where t.code = 'M4X100SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(35,(select t.id from event_types t where t.code = 'M4X100MI'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(36,(select t.id from event_types t where t.code = 'M4X200SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(37,(select t.id from event_types t where t.code = 'M8X25SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(38,(select t.id from event_types t where t.code = 'M8X25MI'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(39,(select t.id from event_types t where t.code = '50SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(40,(select t.id from event_types t where t.code = '100SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(41,(select t.id from event_types t where t.code = '200SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(42,(select t.id from event_types t where t.code = '400SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(43,(select t.id from event_types t where t.code = '800SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(44,(select t.id from event_types t where t.code = '1500SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(45,(select t.id from event_types t where t.code = '3000SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(46,(select t.id from event_types t where t.code = '5000SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(47,(select t.id from event_types t where t.code = '50FA'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(48,(select t.id from event_types t where t.code = '100FA'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(49,(select t.id from event_types t where t.code = '200FA'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(50,(select t.id from event_types t where t.code = '50DO'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(51,(select t.id from event_types t where t.code = '100DO'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(52,(select t.id from event_types t where t.code = '200DO'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(53,(select t.id from event_types t where t.code = '50RA'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(54,(select t.id from event_types t where t.code = '100RA'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(55,(select t.id from event_types t where t.code = '200RA'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(56,(select t.id from event_types t where t.code = '200MI'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(57,(select t.id from event_types t where t.code = '400MI'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(58,(select t.id from event_types t where t.code = 'S4X50SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(59,(select t.id from event_types t where t.code = 'S4X50MI'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(60,(select t.id from event_types t where t.code = 'S4X100SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(61,(select t.id from event_types t where t.code = 'S4X100MI'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(62,(select t.id from event_types t where t.code = 'S4X200SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(63,(select t.id from event_types t where t.code = 'M4X50SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(64,(select t.id from event_types t where t.code = 'M4X50MI'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(65,(select t.id from event_types t where t.code = 'M4X100SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(66,(select t.id from event_types t where t.code = 'M4X100MI'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(67,(select t.id from event_types t where t.code = 'M4X200SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella disqualification_code_types
-- 
INSERT INTO disqualification_code_types (id,code,is_a_relay,stroke_type_id,lock_version,created_at,updated_at) VALUES 
(1,'GA',0,(select t.id from stroke_types t where t.code = ''),0,CURDATE(),CURDATE()),
(2,'GB',0,(select t.id from stroke_types t where t.code = ''),0,CURDATE(),CURDATE()),
(3,'GC',0,(select t.id from stroke_types t where t.code = ''),0,CURDATE(),CURDATE()),
(4,'GD',0,(select t.id from stroke_types t where t.code = ''),0,CURDATE(),CURDATE()),
(5,'GE',0,(select t.id from stroke_types t where t.code = ''),0,CURDATE(),CURDATE()),
(6,'GF',0,(select t.id from stroke_types t where t.code = ''),0,CURDATE(),CURDATE()),
(7,'GG',0,(select t.id from stroke_types t where t.code = ''),0,CURDATE(),CURDATE()),
(8,'GH',0,(select t.id from stroke_types t where t.code = ''),0,CURDATE(),CURDATE()),
(9,'GI',0,(select t.id from stroke_types t where t.code = ''),0,CURDATE(),CURDATE()),
(10,'GJ',0,(select t.id from stroke_types t where t.code = ''),0,CURDATE(),CURDATE()),
(11,'GK',0,(select t.id from stroke_types t where t.code = ''),0,CURDATE(),CURDATE()),
(12,'GL',0,(select t.id from stroke_types t where t.code = ''),0,CURDATE(),CURDATE()),
(13,'GM',0,(select t.id from stroke_types t where t.code = ''),0,CURDATE(),CURDATE()),
(14,'BaA',0,(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
(15,'BaB',0,(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
(16,'BaC',0,(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
(17,'BaD',0,(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
(18,'BaE',0,(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
(19,'BaF',0,(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
(20,'BaG',0,(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
(21,'BaH',0,(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
(22,'BaI',0,(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
(23,'BfA',0,(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
(24,'BfB',0,(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
(25,'BfC',0,(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
(26,'BfD',0,(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
(27,'BfE',0,(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
(28,'BfF',0,(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
(29,'BfG',0,(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
(30,'BfH',0,(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
(31,'BfI',0,(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
(32,'BrA',0,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
(33,'BrB',0,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
(34,'BrC',0,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
(35,'BrD',0,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
(36,'BrE',0,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
(37,'BrF',0,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
(38,'BrG',0,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
(39,'BrH',0,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
(40,'BrI',0,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
(41,'BrJ',0,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
(42,'BrK',0,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
(43,'BrL',0,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
(44,'FrA',0,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(45,'FrB',0,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(46,'FrC',0,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(47,'IMA',0,(select t.id from stroke_types t where t.code = 'MI'),0,CURDATE(),CURDATE()),
(48,'IMB',0,(select t.id from stroke_types t where t.code = 'MI'),0,CURDATE(),CURDATE()),
(49,'IMC',0,(select t.id from stroke_types t where t.code = 'MI'),0,CURDATE(),CURDATE()),
(50,'RA2',1,(select t.id from stroke_types t where t.code = ''),0,CURDATE(),CURDATE()),
(51,'RA3',1,(select t.id from stroke_types t where t.code = ''),0,CURDATE(),CURDATE()),
(52,'RA4',1,(select t.id from stroke_types t where t.code = ''),0,CURDATE(),CURDATE()),
(53,'RB',1,(select t.id from stroke_types t where t.code = ''),0,CURDATE(),CURDATE()),
(54,'RC',1,(select t.id from stroke_types t where t.code = ''),0,CURDATE(),CURDATE()),
(55,'RD',1,(select t.id from stroke_types t where t.code = ''),0,CURDATE(),CURDATE()),
(56,'RE1',1,(select t.id from stroke_types t where t.code = ''),0,CURDATE(),CURDATE()),
(57,'RE2',1,(select t.id from stroke_types t where t.code = ''),0,CURDATE(),CURDATE()),
(58,'RE3',1,(select t.id from stroke_types t where t.code = ''),0,CURDATE(),CURDATE()),
(59,'RE4',1,(select t.id from stroke_types t where t.code = ''),0,CURDATE(),CURDATE()),
(60,'RF',1,(select t.id from stroke_types t where t.code = ''),0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella score_mapping_types
-- 
INSERT INTO score_mapping_types (id,code,lock_version,created_at,updated_at) VALUES 
(1,'10',0,CURDATE(),CURDATE()),
(2,'20',0,CURDATE(),CURDATE()),
(3,'16',0,CURDATE(),CURDATE()),
(4,'100',0,CURDATE(),CURDATE()),
(5,'30',0,CURDATE(),CURDATE()),
(6,'10F',0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella score_computation_types
-- 
INSERT INTO score_computation_types (id,code,lock_version,created_at,updated_at) VALUES 
(1,'T',0,CURDATE(),CURDATE()),
(2,'N',0,CURDATE(),CURDATE()),
(3,'P100-1',0,CURDATE(),CURDATE()),
(4,'P30-1',0,CURDATE(),CURDATE()),
(5,'P20-1',0,CURDATE(),CURDATE()),
(6,'P16-1',0,CURDATE(),CURDATE()),
(7,'P10-1',0,CURDATE(),CURDATE()),
(8,'P10F-0',0,CURDATE(),CURDATE()),
(9,'C15',0,CURDATE(),CURDATE()),
(10,'META',0,CURDATE(),CURDATE()),
(11,'CSI-S',0,CURDATE(),CURDATE()),
(12,'INRE',0,CURDATE(),CURDATE()),
(13,'4150',0,CURDATE(),CURDATE()),
(14,'BIRE',0,CURDATE(),CURDATE()),
(15,'P20-2',0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella score_mapping_type_rows
-- 
INSERT INTO score_mapping_type_rows (id,position,score,score_mapping_type_id,lock_version,created_at,updated_at) VALUES 
(1,1,10,(select t.id from score_mapping_types t where t.code = '10'),0,CURDATE(),CURDATE()),
(2,2,8,(select t.id from score_mapping_types t where t.code = '10'),0,CURDATE(),CURDATE()),
(3,3,6,(select t.id from score_mapping_types t where t.code = '10'),0,CURDATE(),CURDATE()),
(4,4,4,(select t.id from score_mapping_types t where t.code = '10'),0,CURDATE(),CURDATE()),
(5,5,3,(select t.id from score_mapping_types t where t.code = '10'),0,CURDATE(),CURDATE()),
(6,6,2,(select t.id from score_mapping_types t where t.code = '10'),0,CURDATE(),CURDATE()),
(7,7,1,(select t.id from score_mapping_types t where t.code = '10'),0,CURDATE(),CURDATE());

INSERT INTO score_mapping_type_rows (id,position,score,score_mapping_type_id,lock_version,created_at,updated_at) VALUES 
(8,1,20,(select t.id from score_mapping_types t where t.code = '20'),0,CURDATE(),CURDATE()),
(9,2,16,(select t.id from score_mapping_types t where t.code = '20'),0,CURDATE(),CURDATE()),
(10,3,12,(select t.id from score_mapping_types t where t.code = '20'),0,CURDATE(),CURDATE()),
(11,4,8,(select t.id from score_mapping_types t where t.code = '20'),0,CURDATE(),CURDATE()),
(12,5,6,(select t.id from score_mapping_types t where t.code = '20'),0,CURDATE(),CURDATE()),
(13,6,4,(select t.id from score_mapping_types t where t.code = '20'),0,CURDATE(),CURDATE()),
(14,7,3,(select t.id from score_mapping_types t where t.code = '20'),0,CURDATE(),CURDATE()),
(15,8,2,(select t.id from score_mapping_types t where t.code = '20'),0,CURDATE(),CURDATE()),
(16,9,1,(select t.id from score_mapping_types t where t.code = '20'),0,CURDATE(),CURDATE());

INSERT INTO score_mapping_type_rows (id,position,score,score_mapping_type_id,lock_version,created_at,updated_at) VALUES 
(17,1,16,(select t.id from score_mapping_types t where t.code = '16'),0,CURDATE(),CURDATE()),
(18,2,14,(select t.id from score_mapping_types t where t.code = '16'),0,CURDATE(),CURDATE()),
(19,3,12,(select t.id from score_mapping_types t where t.code = '16'),0,CURDATE(),CURDATE()),
(20,4,10,(select t.id from score_mapping_types t where t.code = '16'),0,CURDATE(),CURDATE()),
(21,5,9,(select t.id from score_mapping_types t where t.code = '16'),0,CURDATE(),CURDATE()),
(22,6,8,(select t.id from score_mapping_types t where t.code = '16'),0,CURDATE(),CURDATE()),
(23,7,7,(select t.id from score_mapping_types t where t.code = '16'),0,CURDATE(),CURDATE()),
(24,8,6,(select t.id from score_mapping_types t where t.code = '16'),0,CURDATE(),CURDATE()),
(25,9,5,(select t.id from score_mapping_types t where t.code = '16'),0,CURDATE(),CURDATE()),
(26,10,4,(select t.id from score_mapping_types t where t.code = '16'),0,CURDATE(),CURDATE()),
(27,11,3,(select t.id from score_mapping_types t where t.code = '16'),0,CURDATE(),CURDATE()),
(28,12,2,(select t.id from score_mapping_types t where t.code = '16'),0,CURDATE(),CURDATE()),
(29,13,1,(select t.id from score_mapping_types t where t.code = '16'),0,CURDATE(),CURDATE());

INSERT INTO score_mapping_type_rows (id,position,score,score_mapping_type_id,lock_version,created_at,updated_at) VALUES 
(30,1,100,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(31,2,90,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(32,3,80,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(33,4,70,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(34,5,60,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(35,6,50,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(36,7,49,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(37,8,48,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(38,9,47,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(39,10,46,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(40,11,45,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(41,12,44,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(42,13,43,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(43,14,42,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(44,15,41,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(45,16,40,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(46,17,39,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(47,18,38,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(48,19,37,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(49,20,36,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(50,21,35,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(51,22,34,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(52,23,33,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(53,24,32,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(54,25,31,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(55,26,30,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(56,27,29,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(57,28,28,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(58,29,27,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(59,30,26,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(60,31,25,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(61,32,24,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(62,33,23,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(63,34,22,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(64,35,21,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(65,36,20,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(66,37,19,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(67,38,18,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(68,39,17,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(69,40,16,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(70,41,15,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(71,42,14,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(72,43,13,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(73,44,12,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(74,45,11,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(75,46,10,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(76,47,9,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(77,48,8,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(78,49,7,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(79,50,6,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(80,51,5,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(81,52,4,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(82,53,3,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(83,54,2,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(84,55,1,(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE());

INSERT INTO score_mapping_type_rows (id,position,score,score_mapping_type_id,lock_version,created_at,updated_at) VALUES 
(85,1,30,(select t.id from score_mapping_types t where t.code = '30'),0,CURDATE(),CURDATE()),
(86,2,24,(select t.id from score_mapping_types t where t.code = '30'),0,CURDATE(),CURDATE()),
(87,3,18,(select t.id from score_mapping_types t where t.code = '30'),0,CURDATE(),CURDATE()),
(88,4,12,(select t.id from score_mapping_types t where t.code = '30'),0,CURDATE(),CURDATE()),
(89,5,9,(select t.id from score_mapping_types t where t.code = '30'),0,CURDATE(),CURDATE()),
(90,6,6,(select t.id from score_mapping_types t where t.code = '30'),0,CURDATE(),CURDATE()),
(91,7,4,(select t.id from score_mapping_types t where t.code = '30'),0,CURDATE(),CURDATE()),
(92,8,3,(select t.id from score_mapping_types t where t.code = '30'),0,CURDATE(),CURDATE()),
(93,9,1,(select t.id from score_mapping_types t where t.code = '30'),0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella score_computation_type_rows
-- 
INSERT INTO score_computation_type_rows (id,computation_order,default_score,position_limit,class_name,method_name,score_mapping_type_id,score_computation_type_id,lock_version,created_at,updated_at) VALUES 
(1,1,1000,0,'','by_time_standard',(select t.id from score_computation_types t where t.code = 'T'),(select t.id from score_mapping_types t where t.code = ''),0,CURDATE(),CURDATE()),
(2,1,0,0,'','always_zero',(select t.id from score_computation_types t where t.code = 'N'),(select t.id from score_mapping_types t where t.code = ''),0,CURDATE(),CURDATE()),
(3,1,1,0,'','by_mapping',(select t.id from score_computation_types t where t.code = 'P100-1'),(select t.id from score_mapping_types t where t.code = '100'),0,CURDATE(),CURDATE()),
(4,1,1,0,'','',(select t.id from score_computation_types t where t.code = 'P30-1'),(select t.id from score_mapping_types t where t.code = '30'),0,CURDATE(),CURDATE()),
(5,1,1,0,'','',(select t.id from score_computation_types t where t.code = 'P20-1'),(select t.id from score_mapping_types t where t.code = '20'),0,CURDATE(),CURDATE()),
(6,1,1,0,'','',(select t.id from score_computation_types t where t.code = 'P16-1'),(select t.id from score_mapping_types t where t.code = '16'),0,CURDATE(),CURDATE()),
(7,1,1,0,'','',(select t.id from score_computation_types t where t.code = 'P10-1'),(select t.id from score_mapping_types t where t.code = '10'),0,CURDATE(),CURDATE()),
(8,1,1,0,'','',(select t.id from score_computation_types t where t.code = 'P10F-0'),(select t.id from score_mapping_types t where t.code = '10F'),0,CURDATE(),CURDATE()),
(9,1,0,15,'','',(select t.id from score_computation_types t where t.code = 'C15'),(select t.id from score_mapping_types t where t.code = ''),0,CURDATE(),CURDATE()),
(10,1,0,0,'','',(select t.id from score_computation_types t where t.code = 'META'),(select t.id from score_mapping_types t where t.code = ''),0,CURDATE(),CURDATE()),
(11,1,0,0,'','',(select t.id from score_computation_types t where t.code = 'CSI-S'),(select t.id from score_mapping_types t where t.code = ''),0,CURDATE(),CURDATE()),
(12,2,1,0,'','',(select t.id from score_computation_types t where t.code = 'CSI-S'),(select t.id from score_mapping_types t where t.code = '30'),0,CURDATE(),CURDATE()),
(13,3,0,0,'','',(select t.id from score_computation_types t where t.code = 'CSI-S'),(select t.id from score_mapping_types t where t.code = ''),0,CURDATE(),CURDATE()),
(14,1,0,0,'','',(select t.id from score_computation_types t where t.code = 'INRE'),(select t.id from score_mapping_types t where t.code = ''),0,CURDATE(),CURDATE()),
(15,1,1,0,'','',(select t.id from score_computation_types t where t.code = '4150'),(select t.id from score_mapping_types t where t.code = '30'),0,CURDATE(),CURDATE()),
(16,1,1,0,'','',(select t.id from score_computation_types t where t.code = 'BIRE'),(select t.id from score_mapping_types t where t.code = '20'),0,CURDATE(),CURDATE()),
(17,2,1,0,'','',(select t.id from score_computation_types t where t.code = 'BIRE'),(select t.id from score_mapping_types t where t.code = '30'),0,CURDATE(),CURDATE()),
(18,1,2,0,'','',(select t.id from score_computation_types t where t.code = 'P20-2'),(select t.id from score_mapping_types t where t.code = '20'),0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella achievements
-- 
INSERT INTO achievements (id,code,user_id,lock_version,created_at,updated_at) VALUES 
(1,'NEWENTRY',2,0,CURDATE(),CURDATE()),
(2,'YUPPIES',2,0,CURDATE(),CURDATE()),
(3,'SECURE',2,0,CURDATE(),CURDATE()),
(4,'ADVANCED',2,0,CURDATE(),CURDATE()),
(5,'EXPERT',2,0,CURDATE(),CURDATE()),
(6,'VETERAN',2,0,CURDATE(),CURDATE()),
(7,'SENIOR',2,0,CURDATE(),CURDATE()),
(8,'SENVET',2,0,CURDATE(),CURDATE()),
(9,'ELITE',2,0,CURDATE(),CURDATE()),
(10,'ELIVET',2,0,CURDATE(),CURDATE()),
(11,'TOP',2,0,CURDATE(),CURDATE()),
(12,'TOPVET',2,0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella achievement_rows
-- 
INSERT INTO achievement_rows (id,part_order,achievement_value,is_bracket_open,is_or_operator,is_not_operator,is_bracket_closed,achievement_id,achievement_type_id,lock_version,created_at,updated_at) VALUES 
(1,1,'3',0,0,0,0,(select t.id from achievements t where t.code = 'NEWENTRY'),(select t.id from achievement_types t where t.code = 'ANGD'),0,CURDATE(),CURDATE()),
(2,2,'500',0,0,0,0,(select t.id from achievements t where t.code = 'NEWENTRY'),(select t.id from achievement_types t where t.code = 'AMPF'),0,CURDATE(),CURDATE()),
(3,1,'25',0,0,0,0,(select t.id from achievements t where t.code = 'YUPPIES'),(select t.id from achievement_types t where t.code = 'ANGD'),0,CURDATE(),CURDATE()),
(4,2,'650',0,0,0,0,(select t.id from achievements t where t.code = 'YUPPIES'),(select t.id from achievement_types t where t.code = 'AMPF'),0,CURDATE(),CURDATE()),
(5,3,'1',1,0,0,0,(select t.id from achievements t where t.code = 'YUPPIES'),(select t.id from achievement_types t where t.code = 'SIRN'),0,CURDATE(),CURDATE()),
(6,4,'300',0,1,0,0,(select t.id from achievements t where t.code = 'YUPPIES'),(select t.id from achievement_types t where t.code = 'SKMA'),0,CURDATE(),CURDATE()),
(7,5,'5',0,1,0,1,(select t.id from achievements t where t.code = 'YUPPIES'),(select t.id from achievement_types t where t.code = 'SPBS'),0,CURDATE(),CURDATE()),
(8,1,'50',0,0,0,0,(select t.id from achievements t where t.code = 'SECURE'),(select t.id from achievement_types t where t.code = 'ANGD'),0,CURDATE(),CURDATE()),
(9,2,'700',0,0,0,0,(select t.id from achievements t where t.code = 'SECURE'),(select t.id from achievement_types t where t.code = 'AMPF'),0,CURDATE(),CURDATE()),
(10,3,'2',1,0,0,0,(select t.id from achievements t where t.code = 'SECURE'),(select t.id from achievement_types t where t.code = 'SIRN'),0,CURDATE(),CURDATE()),
(11,4,'400',0,1,0,0,(select t.id from achievements t where t.code = 'SECURE'),(select t.id from achievement_types t where t.code = 'SKMA'),0,CURDATE(),CURDATE()),
(12,5,'100',0,1,0,0,(select t.id from achievements t where t.code = 'SECURE'),(select t.id from achievement_types t where t.code = 'AAMG'),0,CURDATE(),CURDATE()),
(13,6,'5',0,1,0,1,(select t.id from achievements t where t.code = 'SECURE'),(select t.id from achievement_types t where t.code = 'ASTA'),0,CURDATE(),CURDATE()),
(14,1,'75',0,0,0,0,(select t.id from achievements t where t.code = 'ADVANCED'),(select t.id from achievement_types t where t.code = 'ANGD'),0,CURDATE(),CURDATE()),
(15,2,'750',0,0,0,0,(select t.id from achievements t where t.code = 'ADVANCED'),(select t.id from achievement_types t where t.code = 'AMPF'),0,CURDATE(),CURDATE()),
(16,3,'800',1,0,0,0,(select t.id from achievements t where t.code = 'ADVANCED'),(select t.id from achievement_types t where t.code = 'AMPF'),0,CURDATE(),CURDATE()),
(17,4,'500',0,1,0,0,(select t.id from achievements t where t.code = 'ADVANCED'),(select t.id from achievement_types t where t.code = 'SKMA'),0,CURDATE(),CURDATE()),
(18,5,'100',0,1,0,0,(select t.id from achievements t where t.code = 'ADVANCED'),(select t.id from achievement_types t where t.code = 'ANGD'),0,CURDATE(),CURDATE()),
(19,6,'20000',0,1,0,0,(select t.id from achievements t where t.code = 'ADVANCED'),(select t.id from achievement_types t where t.code = 'ADNG'),0,CURDATE(),CURDATE()),
(20,7,'28800',0,1,0,1,(select t.id from achievements t where t.code = 'ADVANCED'),(select t.id from achievement_types t where t.code = 'ATNG'),0,CURDATE(),CURDATE()),
(21,1,'100',0,0,0,0,(select t.id from achievements t where t.code = 'EXPERT'),(select t.id from achievement_types t where t.code = 'ANGD'),0,CURDATE(),CURDATE()),
(22,2,'750',0,0,0,0,(select t.id from achievements t where t.code = 'EXPERT'),(select t.id from achievement_types t where t.code = 'AMPF'),0,CURDATE(),CURDATE()),
(23,3,'800',1,0,0,0,(select t.id from achievements t where t.code = 'EXPERT'),(select t.id from achievement_types t where t.code = 'AMPF'),0,CURDATE(),CURDATE()),
(24,4,'600',0,1,0,0,(select t.id from achievements t where t.code = 'EXPERT'),(select t.id from achievement_types t where t.code = 'SKMA'),0,CURDATE(),CURDATE()),
(25,5,'125',0,1,0,0,(select t.id from achievements t where t.code = 'EXPERT'),(select t.id from achievement_types t where t.code = 'ANGD'),0,CURDATE(),CURDATE()),
(26,6,'30000',0,1,0,0,(select t.id from achievements t where t.code = 'EXPERT'),(select t.id from achievement_types t where t.code = 'ADNG'),0,CURDATE(),CURDATE()),
(27,7,'43200',0,1,0,0,(select t.id from achievements t where t.code = 'EXPERT'),(select t.id from achievement_types t where t.code = 'ATNG'),0,CURDATE(),CURDATE()),
(28,8,'10',0,1,0,1,(select t.id from achievements t where t.code = 'EXPERT'),(select t.id from achievement_types t where t.code = 'ASTA'),0,CURDATE(),CURDATE()),
(29,1,'150',0,0,0,0,(select t.id from achievements t where t.code = 'VETERAN'),(select t.id from achievement_types t where t.code = 'ANGD'),0,CURDATE(),CURDATE()),
(30,2,'750',0,0,0,0,(select t.id from achievements t where t.code = 'VETERAN'),(select t.id from achievement_types t where t.code = 'AMPF'),0,CURDATE(),CURDATE()),
(31,3,'2',0,0,0,0,(select t.id from achievements t where t.code = 'VETERAN'),(select t.id from achievement_types t where t.code = 'SIRN'),0,CURDATE(),CURDATE()),
(32,4,'800',1,0,0,0,(select t.id from achievements t where t.code = 'VETERAN'),(select t.id from achievement_types t where t.code = 'AMPF'),0,CURDATE(),CURDATE()),
(33,5,'750',0,1,0,0,(select t.id from achievements t where t.code = 'VETERAN'),(select t.id from achievement_types t where t.code = 'SKMA'),0,CURDATE(),CURDATE()),
(34,6,'200',0,1,0,0,(select t.id from achievements t where t.code = 'VETERAN'),(select t.id from achievement_types t where t.code = 'ANGD'),0,CURDATE(),CURDATE()),
(35,7,'50000',0,1,0,0,(select t.id from achievements t where t.code = 'VETERAN'),(select t.id from achievement_types t where t.code = 'ADNG'),0,CURDATE(),CURDATE()),
(36,8,'72000',0,1,0,0,(select t.id from achievements t where t.code = 'VETERAN'),(select t.id from achievement_types t where t.code = 'ATNG'),0,CURDATE(),CURDATE()),
(37,9,'15',0,1,0,1,(select t.id from achievements t where t.code = 'VETERAN'),(select t.id from achievement_types t where t.code = 'ASTA'),0,CURDATE(),CURDATE()),
(38,1,'850',0,0,0,0,(select t.id from achievements t where t.code = 'SENIOR'),(select t.id from achievement_types t where t.code = 'AMPF'),0,CURDATE(),CURDATE()),
(39,2,'800',0,1,0,0,(select t.id from achievements t where t.code = 'SENIOR'),(select t.id from achievement_types t where t.code = 'SMDF'),0,CURDATE(),CURDATE()),
(40,1,'850',1,0,0,0,(select t.id from achievements t where t.code = 'SENVET'),(select t.id from achievement_types t where t.code = 'AMPF'),0,CURDATE(),CURDATE()),
(41,2,'800',0,1,0,1,(select t.id from achievements t where t.code = 'SENVET'),(select t.id from achievement_types t where t.code = 'SMDF'),0,CURDATE(),CURDATE()),
(42,3,'2',0,0,0,0,(select t.id from achievements t where t.code = 'SENVET'),(select t.id from achievement_types t where t.code = 'SIRN'),0,CURDATE(),CURDATE()),
(43,4,'15',0,0,0,0,(select t.id from achievements t where t.code = 'SENVET'),(select t.id from achievement_types t where t.code = 'ASTA'),0,CURDATE(),CURDATE()),
(44,5,'150',0,0,0,0,(select t.id from achievements t where t.code = 'SENVET'),(select t.id from achievement_types t where t.code = 'ANGD'),0,CURDATE(),CURDATE()),
(45,1,'900',0,0,0,0,(select t.id from achievements t where t.code = 'ELITE'),(select t.id from achievement_types t where t.code = 'AMPF'),0,CURDATE(),CURDATE()),
(46,2,'850',0,1,0,0,(select t.id from achievements t where t.code = 'ELITE'),(select t.id from achievement_types t where t.code = 'SMDF'),0,CURDATE(),CURDATE()),
(47,1,'900',1,0,0,0,(select t.id from achievements t where t.code = 'ELIVET'),(select t.id from achievement_types t where t.code = 'AMPF'),0,CURDATE(),CURDATE()),
(48,2,'850',0,1,0,1,(select t.id from achievements t where t.code = 'ELIVET'),(select t.id from achievement_types t where t.code = 'SMDF'),0,CURDATE(),CURDATE()),
(49,3,'2',0,0,0,0,(select t.id from achievements t where t.code = 'ELIVET'),(select t.id from achievement_types t where t.code = 'SIRN'),0,CURDATE(),CURDATE()),
(50,4,'15',0,0,0,0,(select t.id from achievements t where t.code = 'ELIVET'),(select t.id from achievement_types t where t.code = 'ASTA'),0,CURDATE(),CURDATE()),
(51,5,'150',0,0,0,0,(select t.id from achievements t where t.code = 'ELIVET'),(select t.id from achievement_types t where t.code = 'ANGD'),0,CURDATE(),CURDATE()),
(52,1,'1000',0,0,0,0,(select t.id from achievements t where t.code = 'TOP'),(select t.id from achievement_types t where t.code = 'AMPF'),0,CURDATE(),CURDATE()),
(53,1,'1000',0,0,0,0,(select t.id from achievements t where t.code = 'TOPVET'),(select t.id from achievement_types t where t.code = 'AMPF'),0,CURDATE(),CURDATE()),
(54,2,'2',0,0,0,0,(select t.id from achievements t where t.code = 'TOPVET'),(select t.id from achievement_types t where t.code = 'SIRN'),0,CURDATE(),CURDATE()),
(55,3,'15',0,0,0,0,(select t.id from achievements t where t.code = 'TOPVET'),(select t.id from achievement_types t where t.code = 'ASTA'),0,CURDATE(),CURDATE()),
(56,4,'150',0,0,0,0,(select t.id from achievements t where t.code = 'TOPVET'),(select t.id from achievement_types t where t.code = 'ANGD'),0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella swimmer_level_types
-- 
INSERT INTO swimmer_level_types (id,code,level,achievement_id,lock_version,created_at,updated_at) VALUES 
(1,'PR',10,(select t.id from achievements t where t.code = ''),0,CURDATE(),CURDATE()),
(2,'IN',20,(select t.id from achievements t where t.code = ''),0,CURDATE(),CURDATE()),
(3,'AV',30,(select t.id from achievements t where t.code = ''),0,CURDATE(),CURDATE()),
(4,'ES',50,(select t.id from achievements t where t.code = ''),0,CURDATE(),CURDATE()),
(5,'M0',100,(select t.id from achievements t where t.code = ''),0,CURDATE(),CURDATE()),
(6,'MN',110,(select t.id from achievements t where t.code = 'NEWENTRY'),0,CURDATE(),CURDATE()),
(7,'MY',120,(select t.id from achievements t where t.code = 'YUPPIES'),0,CURDATE(),CURDATE()),
(8,'MR',130,(select t.id from achievements t where t.code = 'SECURE'),0,CURDATE(),CURDATE()),
(9,'MA',140,(select t.id from achievements t where t.code = 'ADVANCED'),0,CURDATE(),CURDATE()),
(10,'MX',150,(select t.id from achievements t where t.code = 'EXPERT'),0,CURDATE(),CURDATE()),
(11,'MV',160,(select t.id from achievements t where t.code = 'VETERAN'),0,CURDATE(),CURDATE()),
(12,'MS',200,(select t.id from achievements t where t.code = 'SENIOR'),0,CURDATE(),CURDATE()),
(13,'SV',250,(select t.id from achievements t where t.code = 'SENVET'),0,CURDATE(),CURDATE()),
(14,'ME',300,(select t.id from achievements t where t.code = 'ELITE'),0,CURDATE(),CURDATE()),
(15,'EV',350,(select t.id from achievements t where t.code = 'ELIVET'),0,CURDATE(),CURDATE()),
(16,'MT',400,(select t.id from achievements t where t.code = 'TOP'),0,CURDATE(),CURDATE()),
(17,'TV',450,(select t.id from achievements t where t.code = 'TOPVET'),0,CURDATE(),CURDATE()),
(18,'AG',500,(select t.id from achievements t where t.code = ''),0,CURDATE(),CURDATE()),
(19,'AA',550,(select t.id from achievements t where t.code = ''),0,CURDATE(),CURDATE());

COMMIT;