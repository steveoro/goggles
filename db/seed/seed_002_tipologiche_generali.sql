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
INSERT INTO stroke_types (id,code,lock_version,created_at,updated_at) VALUES 
(1,'SL',0,CURDATE(),CURDATE()),
(2,'FA',0,CURDATE(),CURDATE()),
(3,'DO',0,CURDATE(),CURDATE()),
(4,'RA',0,CURDATE(),CURDATE()),
(5,'MI',0,CURDATE(),CURDATE());

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
(5,'P0150',150,0,CURDATE(),CURDATE()),
(6,'P0200',200,0,CURDATE(),CURDATE()),
(7,'P0300',300,0,CURDATE(),CURDATE()),
(8,'P0400',400,0,CURDATE(),CURDATE()),
(9,'P0500',500,0,CURDATE(),CURDATE()),
(10,'P0600',600,0,CURDATE(),CURDATE()),
(11,'P0700',700,0,CURDATE(),CURDATE()),
(12,'P0800',800,0,CURDATE(),CURDATE()),
(13,'P0900',900,0,CURDATE(),CURDATE()),
(14,'P1000',1000,0,CURDATE(),CURDATE()),
(15,'P1100',1100,0,CURDATE(),CURDATE()),
(16,'P1200',1200,0,CURDATE(),CURDATE()),
(17,'P1300',1300,0,CURDATE(),CURDATE()),
(18,'P1400',1400,0,CURDATE(),CURDATE()),
(19,'P1500',1500,0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella pool_types
-- 
INSERT INTO pool_types (id,code,length_in_meters,lock_version,created_at,updated_at) VALUES 
(1,'25',25,0,CURDATE(),CURDATE()),
(2,'50',50,0,CURDATE(),CURDATE()),
(3,'33',33,0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella swimmer_level_types
-- 
INSERT INTO swimmer_level_types (id,code,level,lock_version,created_at,updated_at) VALUES 
(1,'PR',10,0,CURDATE(),CURDATE()),
(2,'IN',20,0,CURDATE(),CURDATE()),
(3,'AV',30,0,CURDATE(),CURDATE()),
(4,'ES',40,0,CURDATE(),CURDATE()),
(5,'MA',50,0,CURDATE(),CURDATE()),
(6,'AG',60,0,CURDATE(),CURDATE()),
(7,'IS1',70,0,CURDATE(),CURDATE()),
(8,'IS2',80,0,CURDATE(),CURDATE()),
(9,'AL1',90,0,CURDATE(),CURDATE()),
(10,'AL2',100,0,CURDATE(),CURDATE()),
(11,'CA',110,0,CURDATE(),CURDATE());

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
INSERT INTO training_step_types (id,code,lock_version,created_at,updated_at) VALUES 
(1,'R',0,CURDATE(),CURDATE()),
(2,'T',0,CURDATE(),CURDATE()),
(3,'A',0,CURDATE(),CURDATE()),
(4,'C',0,CURDATE(),CURDATE()),
(5,'D',0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella movement_types
-- 
INSERT INTO movement_types (id,code,lock_version,created_at,updated_at) VALUES 
(1,'C',0,CURDATE(),CURDATE()),
(2,'G',0,CURDATE(),CURDATE()),
(3,'B',0,CURDATE(),CURDATE());

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
(5,'T',0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella event_types
-- 
INSERT INTO event_types (id,code,length_in_meters,style_order,is_a_relay,is_mixed_gender,partecipants,phases,phase_length_in_meters,stroke_type_id,lock_version,created_at,updated_at) VALUES 
(1,'50SL',50,1,0,0,1,1,50,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(2,'100SL',100,2,0,0,1,1,100,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(3,'200SL',200,3,0,0,1,1,200,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(4,'400SL',400,4,0,0,1,1,400,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(5,'800SL',800,5,0,0,1,1,800,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(6,'1500SL',1500,6,0,0,1,1,1500,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(7,'3000SL',3000,7,0,0,1,1,3000,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(8,'5000SL',5000,8,0,0,1,1,5000,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(9,'50FA',50,9,0,0,1,1,50,(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
(10,'100FA',100,10,0,0,1,1,100,(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
(11,'200FA',200,11,0,0,1,1,200,(select t.id from stroke_types t where t.code = 'FA'),0,CURDATE(),CURDATE()),
(12,'50DO',50,12,0,0,1,1,50,(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
(13,'100DO',100,13,0,0,1,1,100,(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
(14,'200DO',200,14,0,0,1,1,200,(select t.id from stroke_types t where t.code = 'DO'),0,CURDATE(),CURDATE()),
(15,'50RA',50,15,0,0,1,1,50,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
(16,'100RA',100,16,0,0,1,1,100,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
(17,'200RA',200,17,0,0,1,1,200,(select t.id from stroke_types t where t.code = 'RA'),0,CURDATE(),CURDATE()),
(18,'100MI',100,18,0,0,1,1,100,(select t.id from stroke_types t where t.code = 'MI'),0,CURDATE(),CURDATE()),
(19,'200MI',200,19,0,0,1,1,200,(select t.id from stroke_types t where t.code = 'MI'),0,CURDATE(),CURDATE()),
(20,'400MI',400,20,0,0,1,1,400,(select t.id from stroke_types t where t.code = 'MI'),0,CURDATE(),CURDATE()),
(21,'S4X50SL',200,21,1,0,4,4,50,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(22,'S4X50MI',200,22,1,0,4,4,50,(select t.id from stroke_types t where t.code = 'MI'),0,CURDATE(),CURDATE()),
(23,'S4X100SL',400,23,1,0,4,4,100,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(24,'S4X100MI',400,24,1,0,4,4,100,(select t.id from stroke_types t where t.code = 'MI'),0,CURDATE(),CURDATE()),
(25,'S4X200SL',800,25,1,0,4,4,200,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(26,'S8X25SL',200,26,1,0,4,8,25,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(27,'S8X25MI',200,27,1,0,4,8,25,(select t.id from stroke_types t where t.code = 'MI'),0,CURDATE(),CURDATE()),
(28,'M4X50SL',200,28,1,1,4,4,50,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(29,'M4X50MI',200,29,1,1,4,4,50,(select t.id from stroke_types t where t.code = 'MI'),0,CURDATE(),CURDATE()),
(30,'M4X100SL',400,30,1,1,4,4,100,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(31,'M4X100MI',400,31,1,1,4,4,100,(select t.id from stroke_types t where t.code = 'MI'),0,CURDATE(),CURDATE()),
(32,'M4X200SL',800,32,1,1,4,4,200,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(33,'M8X25SL',200,33,1,1,4,8,25,(select t.id from stroke_types t where t.code = 'SL'),0,CURDATE(),CURDATE()),
(34,'M8X25MI',200,34,1,1,4,8,25,(select t.id from stroke_types t where t.code = 'MI'),0,CURDATE(),CURDATE());

--
-- Dump dei dati per la tabella events_by_pool_types
-- 
INSERT INTO events_by_pool_types (id,event_type_id,pool_type_id,lock_version,created_at,updated_at) VALUES 
(1,(select t.id from event_types t where t.code = '50SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(2,(select t.id from event_types t where t.code = '100SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(3,(select t.id from event_types t where t.code = '200SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(4,(select t.id from event_types t where t.code = '400SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(5,(select t.id from event_types t where t.code = '800SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(6,(select t.id from event_types t where t.code = '1500SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(7,(select t.id from event_types t where t.code = '3000SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(8,(select t.id from event_types t where t.code = '5000SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(9,(select t.id from event_types t where t.code = '50FA'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(10,(select t.id from event_types t where t.code = '100FA'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(11,(select t.id from event_types t where t.code = '200FA'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(12,(select t.id from event_types t where t.code = '50DO'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(13,(select t.id from event_types t where t.code = '100DO'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(14,(select t.id from event_types t where t.code = '200DO'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(15,(select t.id from event_types t where t.code = '50RA'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(16,(select t.id from event_types t where t.code = '100RA'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(17,(select t.id from event_types t where t.code = '200RA'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(18,(select t.id from event_types t where t.code = '100MI'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(19,(select t.id from event_types t where t.code = '200MI'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(20,(select t.id from event_types t where t.code = '400MI'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(21,(select t.id from event_types t where t.code = 'S4X50SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(22,(select t.id from event_types t where t.code = 'S4X50MI'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(23,(select t.id from event_types t where t.code = 'S4X100SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(24,(select t.id from event_types t where t.code = 'S4X100MI'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(25,(select t.id from event_types t where t.code = 'S4X200SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(26,(select t.id from event_types t where t.code = 'S8X25SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(27,(select t.id from event_types t where t.code = 'S8X25MI'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(28,(select t.id from event_types t where t.code = 'M4X50SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(29,(select t.id from event_types t where t.code = 'M4X50MI'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(30,(select t.id from event_types t where t.code = 'M4X100SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(31,(select t.id from event_types t where t.code = 'M4X100MI'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(32,(select t.id from event_types t where t.code = 'M4X200SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(33,(select t.id from event_types t where t.code = 'M8X25SL'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(34,(select t.id from event_types t where t.code = 'M8X25MI'),(select t.id from pool_types t where t.code = '25'),0,CURDATE(),CURDATE()),
(35,(select t.id from event_types t where t.code = '50SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(36,(select t.id from event_types t where t.code = '100SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(37,(select t.id from event_types t where t.code = '200SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(38,(select t.id from event_types t where t.code = '400SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(39,(select t.id from event_types t where t.code = '800SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(40,(select t.id from event_types t where t.code = '1500SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(41,(select t.id from event_types t where t.code = '3000SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(42,(select t.id from event_types t where t.code = '5000SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(43,(select t.id from event_types t where t.code = '50FA'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(44,(select t.id from event_types t where t.code = '100FA'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(45,(select t.id from event_types t where t.code = '200FA'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(46,(select t.id from event_types t where t.code = '50DO'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(47,(select t.id from event_types t where t.code = '100DO'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(48,(select t.id from event_types t where t.code = '200DO'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(49,(select t.id from event_types t where t.code = '50RA'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(50,(select t.id from event_types t where t.code = '100RA'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(51,(select t.id from event_types t where t.code = '200RA'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(52,(select t.id from event_types t where t.code = '200MI'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(53,(select t.id from event_types t where t.code = '400MI'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(54,(select t.id from event_types t where t.code = 'S4X50SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(55,(select t.id from event_types t where t.code = 'S4X50MI'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(56,(select t.id from event_types t where t.code = 'S4X100SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(57,(select t.id from event_types t where t.code = 'S4X100MI'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(58,(select t.id from event_types t where t.code = 'S4X200SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(59,(select t.id from event_types t where t.code = 'M4X50SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(60,(select t.id from event_types t where t.code = 'M4X50MI'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(61,(select t.id from event_types t where t.code = 'M4X100SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(62,(select t.id from event_types t where t.code = 'M4X100MI'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE()),
(63,(select t.id from event_types t where t.code = 'M4X200SL'),(select t.id from pool_types t where t.code = '50'),0,CURDATE(),CURDATE());
